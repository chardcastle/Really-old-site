<?php defined('SYSPATH') or die('No direct script access.');
 
class Post_Model extends App_Model {
	 	
 	private $urls = array();
 	protected $db; // database instance
 	public $posts = array();
	public $byDayFormat; 	
	
	public function __construct()
	{
		parent::__construct();		
		// Get the date format for items shown in grid
		$this->byDayFormat = Kohana::config("config.by_day_format");
		// Declare usr		
		$this->urls = Kohana::config("config.data_source_urls");
	}
	
	/*
	 * Look for posts newer than those we already have 
	 */	
	public function searchForNewPosts(){
		/* */
		kohana::log("debug","Request for new posts detected");
		//$this->db = new Database('local');
		//Get the most recent post
		//$this->db->query("TRUNCATE TABLE kh_posts");
		$mostRecentPost = $this->db->select("*")
		->from("kh_posts")		
		->limit(1)
		->orderby("created_dt","desc")
		->get()
		->result_array(true);				
		
		$mostRecentPost = (isset($mostRecentPost[0]))?$mostRecentPost[0]->created_dt:false;
				
		$info = "Looking for posts newer than ".date("d-m-y",$mostRecentPost);
		// return nothing, just capture feeds
		// Parse an external atom feed
		
		$obj = new Tumblr_Model;		
		$tumNo = $obj->captureFeed($this->urls["tumblr"],$mostRecentPost);
		$info .= "<p>".(isset($tumNo)?$tumNo:"Didn't request any")." new Tumblr items</p>";
		
		$obj = new Tweet_Model;
		$tweNo = $obj->captureFeed($this->urls["tweets"],$mostRecentPost);
		$info .= "<p>".(isset($tweNo)?$tweNo:"Didn't request any")." new Tweet items</p>";
		
		$obj = new Git_Model;
		$gitNo = $obj->captureFeed($this->urls["github"]["jquery"],$mostRecentPost);
		$info .= "<p>".(isset($gitNo)?$gitNo:"Didn't request any")." new Git items</p>";
		echo $info;
		/* */		
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
				$serialData = unserialize($content);				
				/* */
				if(!$serialData){					
					kohana::log("debug","failed to decode");				
				}else{					
					kohana::log("debug","Found json");					
					if(is_array($serialData) && isset($serialData["type"])){
						switch($serialData["type"]){
							case "photo":
								$obj = new Photo_Model;
								$content = $obj->loadFromLocalSource($serialData);
								break;						
							case "regular":																				
								$obj = new Regular_Model;				
								$content = $obj->loadFromLocalSource($serialData);
								break;
							case "link":	
								$obj = new Link_Model;					
								$content = $obj->loadFromLocalSource($serialData);
								break;
							case "video":		
								$obj = new Video_Model;													
								$content = $obj->loadFromLocalSource($serialData);	
								break;							
						}
					}
				}
			}else if($value->type == "gitcommit"){
				$obj = new Git_Model;
				$content = unserialize($value->content);
				$obj->repoName = $value->title;
				$obj->committer = (isset($content["committer"])?$content["committer"]:false);
				$obj->dateTime = $value->created_dt;
				$obj->message = $content["message"];
				// slight difference in parameter for this object 
				$content = $obj->loadFromLocalSource($obj);			
			}else if($value->type == "tweet"){
				
				$content = unserialize($value->content);
				//preg_replace("#\[(([a-zA-Z]+://)([a-zA-Z0-9?&%.;:/=+_-]*))\]#e", "'<a href=\"$1\" target=\"_blank\">$3</a>'", $content);			
				//$tweet = preg_replace("/#[a-zA-Z]+/i", "<a href='http://twitter.com/search?q=urlencode($1)' target='_blank'>$1</a>", $content["tweet"]);
				$tweet = $content["tweet"];
				$obj = new Tweet_Model;
				$obj->tweet = $tweet; 
				$obj->author = "@hardcastle";				
				$obj->time = $content["time"];
				// slight difference in parameter for this object 
				$content = $obj->loadFromLocalSource($obj);				
			}				
			// load into result array			
			$key = date($this->byDayFormat,$value->created_dt);
			if(!array_key_exists($key,$this->posts)){
				$this->posts[$key] = array($content);				
			}else{
				$this->posts[$key][] = $content;				
			}	
		}	
		// always make first entry the home page blurb		
		$content = $this->makeHomeSnippet();
		// traverse and stick into table		
		$x=0;		
		foreach($this->posts as $key => $value){
			$x++;
			$content = serialize($value);
			$this->db->insert("kh_timeline", array(
				"date" => $key,
				"content" => "{$content}"
			));				
		}
	}
	public function getPosts($page){
		$this->db->select("*")
		->from("kh_posts")
		->limit();
	
	}
	/*
	 * Saves home page content as the very first post
	 * */
	public function makeHomeSnippet(){
		// get html
		$view = new View('home_snippet');
		// whack into db
		$content = serialize($view->render());
		$this->db->insert("kh_timeline", array(
			"date" => date($this->byDayFormat), // todays date
			"content" => "{$content}"
		));	
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
/*

 * */ 
}