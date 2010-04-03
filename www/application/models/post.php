<?php defined('SYSPATH') or die('No direct script access.');
 
class Post_Model extends Model {
	 	
 	private $urls = array();
 	protected $db; // database instance
 	public $posts = array();
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
		$this->db = new Database('local');
		$this->urls = array(
			"tweets" => 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20twitter.user.timeline%20where%20id%3D%22hardcastle%22&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys',
			"tumblr" => "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20tumblr.posts%20where%20username%3D'hardcastle'&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys",
			"github" => array("jquery"=>"http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20github.repo.commits%20where%20id%3D'jquery'%20and%20repo%3D'jquery'&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
		);
	}
	
	/*
	 * Look for posts newer than those we already have 
	 */	
	public function searchForNewPosts(){
		/* */
		kohana::log("debug","Request for new posts detected");
		//$this->db = new Database('local');
		//Get the most recent post
		$mostRecentPost = $this->db->select("*")
		->from("kh_posts")		
		->limit(1)
		->orderby("created_dt","desc")
		->get()
		->result_array(true);				
		
		$mostRecentPost = (isset($mostRecentPost[0]))?$mostRecentPost[0]->created_dt:false;
		kohana::log("debug","Looking for posts newer than ".date("d-m-y",$mostRecentPost));		

		// Parse an external atom feed		
		$myTummy = file_get_contents($this->urls["tumblr"]);
		$myTweets = file_get_contents($this->urls["tweets"]);		
		$jQueryfeed = file_get_contents($this->urls["github"]["jquery"]);
		$numberOfNewPosts = 0;
		
		$xml = new SimpleXMLElement($jQueryfeed);		
		// jQuery github activity	
		foreach($xml->results->commits as $post){			
			foreach($post as $commit){				
				$created = strtotime($commit->{"committed-date"});
				// Unless override is on, only include if new				
				if($created > $mostRecentPost || !$mostRecentPost){					
					// Yay, a new post, save it!				
					$this->db->insert("kh_posts",array(
						"title"=>"jQuery",
						"content"=>"{$commit->message}",
						"created_dt"=>"{$created}",					
						"modified_dt"=>time(),
						"type" => "gitcommit"
					));
					$numberOfNewPosts++;
					kohana::log("debug",Kohana::debug("Found a new jquery commit ... saved"));
				}
			}						
		}
		// Tweets
		$xml = new SimpleXMLElement($myTweets);		
		foreach($xml->results->entry as $post){			
			$created = strtotime($post->published);
			// Unless override is on, only include if new	
			if($created > $mostRecentPost || !$mostRecentPost){
				// Yay, a new post, save it!
				$this->db->insert("kh_posts",array(
					"title"=>"tweet",
					"content"=>"{$post->content}",
					"created_dt"=>"{$created}",					
					"modified_dt"=>time(),
					"type" => "tweet"
				));
				$numberOfNewPosts++;
				kohana::log("debug",Kohana::debug("Found a new Tweet ... saved"));
			}
			
		}		
		// Tumblr		
		$xml = new SimpleXMLElement($myTummy);	
		foreach($xml->results->posts->post as $post){			
			$created = strtotime($post["date"]);
			kohana::log("debug","Tumblr post detected of type ".$post["type"]." on:".$post["date"] );
			// Unless override is on, only include if new			
			if($created > $mostRecentPost || !$mostRecentPost){
				// Yay, a new post, save it!
				$title = $post["type"];				
				if($title == "photo"){
					foreach($post->{"photo-url"} as $photo){
						if(strpos($photo,"500") !== false){
							$post["large"] = $photo;						
						}else if(strpos($photo,"250") !== false){
							$post["small"] = $photo;							
						}else if(strpos($photo,"75") !== false){
							$post["tiny"] = $photo;							
						}					
					}
				}
				$content = json_encode($post);
								
				if($content && $title){
					$query = $this->db->insert("kh_posts",array(
						"title"=>"{$title}",
						"content"=>"{$content}",
						"created_dt"=>"{$created}",										
						"modified_dt"=>time(),
						"type" => "tumblr"
					));
					kohana::log("debug","Tumblr last query was ".$this->db->last_query());
					// Now make a teaser
					$breakStart = strpos($content,"<!-- more -->");
					$breakEnd = strlen($content);
					$insertId = $query->insert_id();
					if($breakStart !== false){					
						$teaser = substr($content,$breakStart,$breakEnd);
						$this->db->from('kh_posts')
						->set(array("teaser" => "{$teaser}"))
						->where(array('post_id' => $insertId))
						->update();
					}
					$numberOfNewPosts++;
					kohana::log("debug","Found a new Tumblr post ... saved");
				}
			}
		}
		return $numberOfNewPosts;
		/**/		
	}
	
	/*
	 * Remove all records from timeline
	 * create new ones based on post source table 
	 * */
	public function digestNewPosts(){
		$this->posts = array();
		// remove old records
		$this->db->query("TRUNCATE TABLE kh_timeline");
		//$this->db->update("kh_timeline",array("id"=>0));	
		$sql = <<<SQL
			SELECT posts.type,
				from_unixtime(posts.created_dt,'%d-%m-%y') AS dateKey,
				posts.content, 
				posts.* 
				FROM (select * from kh_posts) AS posts 
				INNER JOIN kh_posts AS dates ON posts.created_dt = dates.created_dt 
				GROUP BY posts.content ORDER BY posts.created_dt DESC
SQL;

		$posts = $this->db->query($sql)->result_array(true);		
		foreach($posts as $key => $value){
			$content = $value->content;
			if($value->type == "tumblr"){				
				$contentJson = json_decode($content);				
				/* */
				if(!$contentJson){					
					kohana::log("debug","failed to decode");				
				}else{					
					kohana::log("debug","Found json");
					$json = $contentJson->{"@attributes"};
					if(is_object($json) && isset($json->type)){
						switch($json->type){
							case "photo":
								$photoObj = new Photo_Model;
								$content = $photoObj->loadFromLocalSource($json);
								break;						
							case "regular":		
								$regObj = new Regular_Model;				
								$content = $regObj->loadFromLocalSource($content);
								break;
							case "link":	
								$linkObj = new Link_Model;					
								$content = $linkObj->loadFromLocalSource($content);
								break;
							case "video":		
								$vidObj = new Video_Model;													
								$content = $vidObj->loadFromLocalSource($content);	
								break;							
						}
					}
				}
			}	
			// load into result array			
			$key = date("dS M y",$value->created_dt);
			if(!array_key_exists($key,$this->posts)){
				$this->posts[$key] = array($content);				
			}else{
				$this->posts[$key][] = $content;				
			}	
		}	
		// traverse and stick into table
		kohana::log("debug",print_r($this->posts,true));
		$x=0;
		foreach($this->posts as $key => $value){
			$x++;
			$content = json_encode($value);
			$this->db->insert("kh_timeline", array(
				"date" => $key,
				"content" => "{$content}",
				"squence_id" => $x
			));				
		}
	}
	public function getPosts($page){
		$this->db->select("*")
		->from("kh_posts")
		->limit();
	
	}
	public function getDataSourceUrls(){
		return $this->urls;	
	}
	/*
	 * Get part of the data, for fun
	 
	public function getDataSourceDataSchemea($key){		
		$data = file_get_contents($this->urls[$key]);
		return substr($data,0,500);		
	}
	/*
	 * Get part of the data, for fun
	 */
	public function getDataSourceDataSchemea($key){		
		return (Kohana::config("config.pop"))?"Pop is on":"Pop is off";
				
	}	
 
}