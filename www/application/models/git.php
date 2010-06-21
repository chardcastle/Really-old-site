<?php defined('SYSPATH') or die('No direct script access.');
 
class Git_Model extends App_Model {
	 	
 	public $message = ""; 	
 	public $dateTime = 0;
 	public $repoName = "";
 	public $committer = "";
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();		
	}
	public function loadFromLocalSource($content,$value,$size){
            // view
            $this->repoName = $value->title;
            $this->committer = (isset($content["committer"])?$content["committer"]:false);
            $this->dateTime = strtotime($content['committed-date']);
            $this->message = $content["message"];
            $view = new View("item_{$size}/git");
            $view->set("commit",$this);
            return $view->render();
	}

	public function captureFeed($feedUrl,$mostRecentPost){
		$numberOfNewPosts = 0;
		if(!$commits = file_get_contents($feedUrl)){
            return 0;
        }
		$commits = json_decode($commits,true);
			foreach($commits["query"]["results"]["commits"]["commit"] as $commit){					
				$content = array(
					"message" => $commit["message"],
					"committer "=> (isset($commit["committer"]["name"])?$commit["committer"]["name"]:"unknown"),
					"repoName" => "jquery",
					"dateTime" => strtotime($commit["committed-date"])
				);
				$created = $content["dateTime"];			
				$content = serialize($content);
						
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
							
				
		return $numberOfNewPosts;
	}
 
}
