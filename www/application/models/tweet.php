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
            return 0;
        }
		$tweets = json_decode($myTweets,true);
		foreach($tweets["query"]["results"]["entry"] as $tweet){
				foreach($tweet["link"] as $link){
					if($link["rel"] == "image"){						
						$profilePic = $link["href"];
					}
				}
			
				$content = array(
					"tweet" => str_ireplace("hardcastle:","",$tweet["title"]),
					"author "=> $tweet["author"]["name"],
					"profilePic" => $profilePic, 
					"time" => strtotime($tweet["published"])
				);

				$content = serialize($content);
				$created = strtotime($tweet["published"]);
						
				$this->db->insert("kh_posts",array(
					"title"=>"tweet",
					"content"=>"{$content}",
					"created_dt"=>"{$created}",					
					"modified_dt"=>time(),
					"type" => "tweet"
				));
				$numberOfNewPosts++;
				kohana::log("debug",Kohana::debug("Found a new Tweet ... saved"));
			//}			
		}		
		return $numberOfNewPosts;
	}
 
}