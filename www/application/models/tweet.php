<?php defined('SYSPATH') or die('No direct script access.');
 
class Tweet_Model extends App_Model {
	 	
 	public $tweet = "";
 	public $author = "";
 	public $tweetWithLinks = ""; 	
 	public $pubDateTime = 0;
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();		
	}
	public function loadFromLocalSource($self){		
		// view
		$view = new View("item_summary/tweet");
		$view->set("tweet",$self);
		return $view->render();		
	}
	public function captureFeed($feedUrl,$mostRecentPost){
		$numberOfNewPosts = 0;
		$myTweets = file_get_contents($feedUrl);
		// Tweets
		$xml = new SimpleXMLElement($myTweets);		
		foreach($xml->results->entry as $post){			
			$created = strtotime($post->published);
			// Unless override is on, only include if new	
			if($created > $mostRecentPost || !$mostRecentPost){
				// Yay, a new post, save it!				
				$attributes = array();
				Kohana::debug("Attributes data:".$post->{"@attributes"});				
				foreach($post->{"@attributes"} as $key => $value){
					kohana::log("debug",Kohana::debug("Attributes serial: key:".$key." val:".$value));					
					$attributes[$key] = $value;						
				}				
				$content = serialize($attributes);
				
				$this->db->insert("kh_posts",array(
					"title"=>"tweet",
					"content"=>"{$content}",
					"created_dt"=>"{$created}",					
					"modified_dt"=>time(),
					"type" => "tweet"
				));
				$numberOfNewPosts++;
				kohana::log("debug",Kohana::debug("Found a new Tweet ... saved"));
			}			
		}		
		return $numberOfNewPosts;
	}
 
}