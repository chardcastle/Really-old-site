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
	public function loadFromLocalSource($content){
                $tweet = $content["tweet"];
                //preg_replace("#\[(([a-zA-Z]+://)([a-zA-Z0-9?&%.;:/=+_-]*))\]#e", "'<a href=\"$1\" target=\"_blank\">$3</a>'", $content);
                //$tweet = preg_replace("/#[a-zA-Z]+/i", "<a href='http://twitter.com/search?q=urlencode($1)' target='_blank'>$1</a>", $content["tweet"]);
                $this->tweet = $tweet;
                $this->author = "@hardcastle";
                $this->time = $content["time"];
		$view = new View("item_summary/tweet");
		$view->set("tweet",$this);
		return $view->render();		
	}
	public function captureFeed($feedUrl,$mostRecentPost){
		$numberOfNewPosts = 0;
		$myTweets = file_get_contents($feedUrl);

		$tweets = json_decode($myTweets,true);
		foreach($tweets["query"]["results"]["entry"] as $tweet){
				foreach($tweet["link"] as $link){
					if($link["rel"] == "image"){						
						$profilePic = $link["href"];
					}
				}
				// transform links TODO
				$tweetText = $tweet["title"];			
				preg_replace('/\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|](?![^<>]*(?:>|<\/a>))/i', "<a href=\"#\" onclick=\"open_url('\\0')\";return false;>\\0</a>", $tweetText);
				
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