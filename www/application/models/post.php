<?php defined('SYSPATH') or die('No direct script access.');
 
class Post_Model extends App_Model {
	 	
 	private $urls = array();
 	protected $db; // database instance
 	public $posts = array();
	public $byDayFormat;
    public $totalTimeLineItems = 0;
	
	public function __construct()
	{
		parent::__construct();		
		// Get the date format for items shown in grid
		$this->byDayFormat = Kohana::config("config.by_day_format");
		// Declare usr		
		$this->urls = Kohana::config("config.data_source_urls");
        $this->totalTimeLineItems = $this->db->count_records('kh_timeline');

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
		$info .= (isset($tumNo)?$tumNo:"Didn't request any")." new Tumblr items";		
		
		$obj = new Tweet_Model;
		$tweNo = $obj->captureFeed($this->urls["tweets"],$mostRecentPost);
		$info .= (isset($tweNo)?$tweNo:"Didn't request any")." new Tweet items";
		
		$obj = new Git_Model;
		$gitNo = $obj->captureFeed($this->urls["github"]["jquery"],$mostRecentPost);
		$info .= (isset($gitNo)?$gitNo:"Didn't request any")." new Git items";		
		// update website description
		kohana::log("debug",$info);
        $this->updateHomeDescription();

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
        // Make homepage snippet which will always be the first item
        // ... the most recent date
        $today = date($this->byDayFormat,(time()+86400));
        $this->posts[$today] = $this->getHomeSnippet();
        // traverse the sql result to populate timeline
		foreach($posts as $key => $value){			
            $serialData = unserialize($value->content);
            $content = array(
                "teaser" =>  $this->load($serialData,$value,"summary"),
                "content" => $this->load($serialData,$value,"full_width")
            );
            //$content =  $this->load($serialData,$value,"summary");
			// load into result array			
			$key = date($this->byDayFormat,$value->created_dt);
			if(!array_key_exists($key,$this->posts)){
				$this->posts[$key] = array($content);				
			}else{
				$this->posts[$key][] = $content;				
			}	
		}	
		// always make first entry the home page blurb		
		//$this->makeHomeSnippet();
		// traverse and stick into table

		foreach($this->posts as $key => $value){
            $teaser = array();
            $content = array();
            foreach($value as $post){
                 $teaser[] = $post["teaser"];
                 $content[] = $post["content"];
            }
            $teaser = (count($teaser)>0)?serialize($teaser):serialize(array());
            $content = (count($content)>0)?serialize($content):serialize(array());
            $this->db->insert("kh_timeline", array(
                "date" => $key,
                "teaser" => "{$teaser}",
                "content" => "{$content}"
            ));
            
		}
	}

	public function getPosts($page){
		$this->db->select("*")
		->from("kh_posts")
		->limit();	
	}

    private function getHomeSnippet(){
        $view = new View('home_snippet');
        return array(array(
                "teaser"=>$view->render(),
                "content"=> "home")
        );
    }
    /*
     * Get the website description from the 
     * Tumblr account description
     */
    private function updateHomeDescription(){
        $data = file_get_contents($this->urls["homedesc"]);
        $data = json_decode($data,true);
        $desc = $data["query"]["results"]["tumblelog"]["content"];
        if(!$desc){
           $desc = "A blog by";
        }
        $this->db->update("kh_stash",array("value"=>"{$desc}"),array("key"=>"home_desc"));
    }
    
	public function getDataSourceUrls(){
		return $this->urls;	
	}
    /*
     * Use the data to find its type
     * use its object to return its requested HTML style.
     */
    private function load($serialData,$value,$size){
        $html = "";
        if($value->type == "tumblr"){
            /* */
            if(!$serialData){
                kohana::log("debug","failed to decode");
            }else{
                kohana::log("debug","Found json");
                if(is_array($serialData) && isset($serialData["type"])){
                    switch($serialData["type"]){
                        case "photo":
                            $obj = new Photo_Model;
                            $html = $obj->loadFromLocalSource($serialData,$size);
                            break;
                        case "regular":
                            $obj = new Regular_Model;
                            $html = $obj->loadFromLocalSource($serialData,$size);
                            break;
                        case "link":
                            $obj = new Link_Model;
                            // no size alternative required
                            $html = $obj->loadFromLocalSource($serialData);
                            break;
                        case "video":
                            $obj = new Video_Model;
                            // no size alternative required
                            $html = $obj->loadFromLocalSource($serialData);
                            break;
                        case "conversation":
                            $obj = new Quote_Model;
                            // no size alternative required
                            $html = $obj->loadFromLocalSource($serialData);
                            break;
                    }
                }
            }
        }else if($value->type == "gitcommit"){
            $obj = new Git_Model;
            // slight difference in parameter for this object
            $html = $obj->loadFromLocalSource($serialData,$value,$size);
        }else if($value->type == "tweet"){
            $obj = new Tweet_Model;
            // slight difference in parameter for this object
            $html =  $obj->loadFromLocalSource($serialData,$size);
        }
        return $html;
    }
	/*
	 * Get part of the data, for fun
	 */
	public function getDataSourceDataSchemea($key){		
		return (Kohana::config("config.pop"))?"Pop is on":"Pop is off";
				
	}
    public function getSiteDescription(){
        $data = $this->db->select("value")
                ->from("kh_stash")
                ->where("key=","home_desc")
                ->get()
                ->result_array(true);
        return $data[0]->value;

    }
    public function getPost($postId){
        return $this->db->select("*")
                ->from("kh_timeline")
                ->where("id = ",$postId)
                ->get()
                ->result_array(false);
    }
/* */ 
}
