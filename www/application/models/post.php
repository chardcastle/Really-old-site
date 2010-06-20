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

	 *	Get the most recent post,
	 *	If there wasn't one, then the table was probably truncated for dev population
		//$this->db->query("TRUNCATE TABLE kh_posts");
	 */	
	public function searchForNewPosts(){

		$info = "Request for new posts detected";

		$mostRecentPost = $this->db->select("*")
		->from("kh_posts")		
		->limit(1)
		->orderby("created_dt","desc")
		->get()
		->result_array(true);				
		//Kohana::log("debug",$this->db->last_query());
		$mostRecentPost = (isset($mostRecentPost[0]))?$mostRecentPost[0]->created_dt:false;
		if($mostRecentPost != false){
			// mark the one that was updated last
			$this->db->update('kh_posts',array('is_last_updated'=>1),array('created_dt'=>$mostRecentPost));		
			
			$whereStr = "created_dt between {$mostRecentPost} and now()";
			$numberOfNewPosts = $this->db->count_records('kh_posts',$whereStr);
			$info .= "Looking for posts newer than ".date("d-m-y",$mostRecentPost)."\n";
			$additional = "new posts {$whereStr}";
		}else{
			$additional = "there was not mostRecent value, was the table truncated?\n";
			$numberOfNewPosts = 0;
		}
		// Check to see if we likely to already have new posts
		// Check for posts older than one hour

		Kohana::log("debug","Theres ".$numberOfNewPosts." {$additional}\n");

		// $mostRecentPost might be false, but that's ok, its accepted within model code
		if($numberOfNewPosts <= 0){


			// return nothing, just capture feeds
			// Parse an external atom feed
		
			$obj = new Tumblr_Model;		
			$tumNo = $obj->captureFeed($this->urls["tumblr"],$mostRecentPost);
			$info .= (isset($tumNo)?$tumNo:"Didn't request any")." new Tumblr items\n";		
		
			$obj = new Tweet_Model;
			$tweNo = $obj->captureFeed($this->urls["tweets"],$mostRecentPost);
			$info .= (isset($tweNo)?$tweNo:"Didn't request any")." new Tweet items\n";
		
			$obj = new Git_Model;
			$gitNo = $obj->captureFeed($this->urls["github"]["jquery"],$mostRecentPost);
			$info .= (isset($gitNo)?$gitNo:"Didn't request any")." new Git items\n";		
			// update website description
			kohana::log("debug",$info);
		    $this->updateHomeDescription();

		}else{
			Kohana::log("debug","We already have posts between ".date('d-m-y')." and ".date('d-m-y',$mostRecentPost)."\n");
			// 
		}			

	}
	
	/*
	 * Remove all records from timeline
	 * create new ones based on post source table 
	 * The function befor it, saveNewPosts must always 
	 * leave is_last_update set to true as this function requires it as a pointer
	 * pointer is reset once complete
	 * */
	public function digestNewPosts(){
		$this->posts = array();
		// Useful for dev --> 
		//$this->db->query("TRUNCATE TABLE kh_timeline");
		// If table is truncated, re-generate home snippet first,
		$truncated = false;
		if($this->db->count_records('kh_timeline') <= 0){
			$truncated = true;
			$this->makeHomeSnippet();
		}
		// Get the last time the posts were updated
		$mostRecentPost = $this->db->query('SELECT created_dt FROM kh_posts where is_last_updated = 1');
		$mostRecentPost = (isset($mostRecentPost[0]))?$mostRecentPost[0]->created_dt:false;		
		if($mostRecentPost != false){
			// remove the last updated indicator as a reset for the next time save posts is run
			$this->db->query('UPDATE kh_posts SET is_last_updated = 0 where is_last_updated = 1');
			// only update timeline table with new records
			$sql = <<<SQL
				SELECT posts.type,
					from_unixtime(posts.created_dt,'%d-%m-%y') AS dateKey,
					posts.content, 
					posts.* 
				FROM 
					(select * from kh_posts) 
					AS posts 
				INNER JOIN kh_posts AS dates 
					ON posts.created_dt = dates.created_dt 
				WHERE posts.created_dt between {$mostRecentPost} and now()
					GROUP BY posts.content ORDER BY posts.created_dt DESC
SQL;
			$mostRecentPost = date('d m y',$mostRecentPost);
			Kohana::log("debug","Some new posts since {$mostRecentPost} have been detected");
		}else if($truncated){
			$sql = "SELECT * FROM kh_posts";
			Kohana::log("debug","Empty table, lets go!\n");
		}

		$posts = $this->db->query($sql)->result_array(true);

		if(count($posts) > 0){
			foreach($posts as $key => $value){			
			    $serialData = unserialize($value->content);
				/* Save month_stamp of M Y as month and year for use in selecting 
				 * post within a range		
				*/
			    $content = array(
			        "teaser" =>  $this->load($serialData,$value,"summary"),
			        "content" => $this->load($serialData,$value,"full_width"),
					"date" => date($this->byDayFormat,$value->created_dt),
					"month_stamp" => strtotime(date("M Y",$value->created_dt))
			    );
				$key = $content['date'];
				//
				if(!array_key_exists($key,$this->posts)){
					$this->posts[$key] = array($content);				
				}else{
					$this->posts[$key][] = $content;				
				}	
			}	

			// traverse and stick into table
			if(count($this->posts)>0){
				foreach($this->posts as $key => $value){
					$teaser = array();
					$content = array();  			
					kohana::log("debug",print_r($value,true));
					foreach($value as $post){
					     $teaser[] = $post["teaser"];
					     $content[] = $post["content"];				 
					     $month = $post["month_stamp"];		
					}	
					$teaser = (count($teaser)>0)?serialize($teaser):serialize(array());
					$content = (count($content)>0)?serialize($content):serialize(array());
					//$key = strtotime(date("M Y",$key));
					$this->db->insert("kh_timeline", array(
					    "date" => "{$key}",
					    "teaser" => "{$teaser}",
					    "content" => "{$content}",
						"month_stamp" => "{$month}",
					));
					
				}
			}
		}
	}
	public function getNextAndPrevUrls($postId=false,$modelName){
	
		if(!$postId){
			return false;
		}
		// where 1 is the most recent item,
		// add to the index to go back in time!
		$next = (int)($postId)-1;
		$prev = (int)($postId)+1;
				
		$slug = array();
		$url = $this->db->query("select slug from kh_timeline where id = ".$next)->result_array();
		$url = $url[0]->slug;
		//var_dump($url).die();
		$slug['next'] = ($url != NULL)?'/'.$url:"/{$modelName}/view/".$next;
		unset($url);
		//
		$url = $this->db->from('kh_timeline')->where(array('id'=> $prev))->select('slug')->get()->result_array(true);		
		$slug['prev'] = ($url[0]->slug != NULL)?'/'.$url[0]->slug:"/{$modelName}/view/".$prev;		
		return $slug;
    	
	}
	public function getPosts($page){
		$this->db->select("*")
		->from("kh_posts")
		->limit();	
	}
    private function makeHomeSnippet(){
        $view = new View('home_snippet');
        $this->db->insert("kh_timeline", array(
                "teaser"=>serialize(array($view->render())),
                "content"=> serialize(array("home")),
				"date" => time(),
				"month_stamp" => 0
			));
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
	 * ! WTH? I don't remember this
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
