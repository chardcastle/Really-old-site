<?php defined('SYSPATH') or die('No direct script access.');
 
class Post_Model extends Model {
	 	
 	private $urls = array();
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
		$this->urls = array(
			"tweets" => 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20twitter.user.timeline%20where%20id%3D%22hardcastle%22&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys',
			"tumblr" => 'http://hardcastle.tumblr.com/rss',
			"github" => array("jquery"=>"http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20github.repo.commits%20where%20id%3D'jquery'%20and%20repo%3D'jquery'&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
		);
	}
	
	/*
	 * Look for posts newer than those we already have 
	 */	
	public function searchForNewPosts(){
		/* */
		kohana::log("debug","Request for new posts detected");
		$this->db = new Database('local');
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
		$myTummy = feed::parse($this->urls["tumblr"]);
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
		$first = true;
		foreach($myTummy as $post){
			$created = strtotime($post['pubDate']);
			// Unless override is on, only include if new			
			if($created > $mostRecentPost || !$mostRecentPost){
				// Yay, a new post, save it!
				$content = $post['description'];
				$teaser = "";
				$break = strpos($post['description'],"<!-- more -->");	
				if($break !== false){					
					$teaser = substr($content,0,$break);
				}		
				$this->db->insert("kh_posts",array(
					"title"=>"tumblr",
					"content"=>"{$content}",
					"created_dt"=>"{$created}",
					"teaser" => "{$teaser}",					
					"modified_dt"=>time(),
					"type" => "tumblr"
				));
				$numberOfNewPosts++;
				kohana::log("debug",Kohana::debug("Found a new Tumblr post ... saved"));
			}
		}
		return $numberOfNewPosts;
		/**/		
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