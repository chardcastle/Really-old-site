<?php defined('SYSPATH') or die('No direct script access.');
 
class Git_Model extends App_Model {
	 	
 	public $message = ""; 	
 	public $dateTime = 0;
 	public $repoName = "";
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();		
	}
	public function loadFromLocalSource($self){		
		// view
		$view = new View("item_summary/git");
		$view->set("commit",$self);
		return $view->render();		
	}
	public function captureFeed($feedUrl,$mostRecentPost){
		$numberOfNewPosts = 0;
		$jQueryfeed = file_get_contents($feedUrl);		
		$xml = new SimpleXMLElement($jQueryfeed);		
		// jQuery github activity	
		foreach($xml->results->commits as $post){			
			foreach($post as $commit){				
				$created = strtotime($commit->{"committed-date"});
				// Unless override is on, only include if new				
				if($created > $mostRecentPost || !$mostRecentPost){					
					// Yay, a new post, save it!
					$content = serialize((array) $commit);				
					$this->db->insert("kh_posts",array(
						"title"=>"jQuery",
						"content"=>"{$content}",
						"created_dt"=>"{$created}",					
						"modified_dt"=>time(),
						"type" => "gitcommit"
					));
					$numberOfNewPosts++;
					kohana::log("debug",Kohana::debug("Found a new jquery commit ... saved"));
				}
			}						
		}		
		return $numberOfNewPosts;
	}
 
}