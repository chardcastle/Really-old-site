<?php defined('SYSPATH') or die('No direct script access.');
 
class Tweet_Model extends App_Model {
	 	
 	public $tweet = "";
 	public $author = "";
 	public $profilePic = ""; 	
 	public $time = 0;
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();		
	}
	public function loadFromLocalSource($content,$size){
        $tweet = $content["tweet"];
        // TODO: test autolink (its core, should be ok)
        $this->tweet = text::auto_link_urls($tweet);
        $this->author = "@hardcastle";
        $this->time = $content["time"];
		$view = new View("item_{$size}/tweet");
		$view->set("tweet",$this);
		return $view->render();		
	}
	public function captureFeed($feedUrl,$mostRecentPost){
		$numberOfNewPosts = 0;
		if(!$myTweets = file_get_contents($feedUrl)){
			kohana::log("error","Could not reach twitter url ".$feedUrl);
            return 0;
        }
		$tweets = json_decode($myTweets,true);
		if(isset($tweets["query"]["results"]["statuses"])){
			foreach($tweets["query"]["results"]["statuses"]["status"] as $tweet){
				if(is_array($tweet)){								
					$content = array(
						"tweet" => $tweet["text"],
						"author "=> $tweet["user"]["name"],
						"time" => strtotime($tweet["created_at"])
					);
					$content = serialize($content);
					$created = strtotime($tweet["created_at"]);
						
					$this->db->insert("kh_posts",array(
						"title"=>"tweet",
						"content"=>"{$content}",
						"created_dt"=>"{$created}",					
						"modified_dt"=>time(),
						"type" => "tweet"
					));
					$numberOfNewPosts++;
					kohana::log("debug",Kohana::debug("Found a new Tweet ... saved"));
				}else{
					kohana::log("error","Tweet var is not an array".print_r($tweet,true));
				}
			}			
		}else{
			kohana::log("error","Primary twitter array key ".print_r($tweets,true));
		}		
		return $numberOfNewPosts;
	}
 
}
