<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Default Kohana controller. This controller should NOT be used in production.
 * It is for demonstration purposes only!
 *
 * @package    Core
 * @author     Kohana Team
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
class Welcome_Controller extends Template_Controller {

	// Disable this controller when Kohana is set to production mode.
	// See http://docs.kohanaphp.com/installation/deployment for more details.
	const ALLOW_PRODUCTION = FALSE;

	// Set the name of the template to use
	public $template = 'kohana/template';
	private $db;
	private $result = array();	
	public function index()
	{
		/*
		 * Useful snippets
		 * 	$this->template->content->test .= Kohana::debug($xml);
		 *  kohana::log("debug",Kohana::debug($post));	
		 */
		// Load database
		$this->db = new Database('local');
		// Load template
		$this->template->content = new View('welcome_content');
		$postObj = new Post_Model;
		$myDataSources = $postObj->getDataSourceUrls();
		// You can assign anything variable to a view by using standard OOP
		// methods. In my welcome view, the $title variable will be assigned
		// the value I give it here.
		$this->template->title = 'Welcome to Kohana!';

		// An array of links to display. Assiging variables to views is completely
		// asyncronous. Variables can be set in any order, and can be any type
		// of data, including objects.
		$this->template->content->links = array
		(
			'Home Page'     => 'http://kohanaphp.com/',
			'Documentation' => 'http://docs.kohanaphp.com/',
			'Forum'         => 'http://forum.kohanaphp.com/',
			'License'       => 'Kohana License.html',
			'Donate'        => 'http://kohanaphp.com/donate',
			'jQuery'		=> $myDataSources["github"]["jquery"]
		);

		$posts = $this->db->query("SELECT posts.type,from_unixtime(posts.created_dt,'%d-%m-%y') as dateKey,posts.content, posts.* FROM (select * from kh_posts) as posts inner join kh_posts as dates on posts.created_dt = dates.created_dt GROUP BY posts.content order by posts.created_dt desc")->result_array(true);
		$myPosts = array();
		foreach($posts as $key => $value){
			$content = $value->content;
			if($value->type == "tumblr"){				
				$contentJson = json_decode($content);				
				/* */
				if(!$contentJson){					
					kohana::log("debug","failed to decode");				
				}else{					
					kohana::log("debug","Found json");
					$json = $contentJson->{"@attributes"};					
					if(is_object($json) && $json->type =="photo"){
						$photoObj = new Photo_Model;
						$photoObj->urls["small"] = $json->tiny;
						$photoObj->title = "Test";//$json->{"photo-caption"};
						$view = new View("summary_photo");
						$view->set("photo",$photoObj);
						$content = $view->render();						
					}else if(is_object($json) && $json->type =="regular"){						
						$regObj = new Regular_Model;
						// Get title						
						preg_match('/\"regular-title\"\:\"(.*)\",/i',$content,$this->result);						
						$regObj->title = $this->getResult();
						// Get body
						preg_match('/\"regular-body\"\:\"(.*)\"/i',$content,$this->result);						
						$body = $this->getResult();
						$pos = ($body)?strpos($body,"<!-- more -->"):false;
						$pos = ($pos!==false)?$pos:$this->findTeaserLength(12,$body);									
						$regObj->teaser = ($body)?nl2br(substr(strip_tags($body),0,$pos)):"?";
						// view						
						$view = new View("summary_regular");
						$view->set("article",$regObj);
						$content = $view->render();
					}else if(is_object($json) && $json->type =="link"){						
						$linkObj = new Link_Model;
						preg_match('/\"link-text\"\:\"(.*)\",/i',$content,$this->result);
						$linkObj->title = $this->getResult();
						preg_match('/\"link-url\"\:\"(.*)\",/i',$content,$this->result);
						$linkObj->destination = $this->getResult();
						// view
						$view = new View("summary_link");
						$view->set("link",$linkObj);
						$content = $view->render();
					}
				}
			}	
			/*
			// use teaser if available
			}else if(strlen($value->teaser)>0){
				$content = $value->teaser;					
			}
			/**/
			// load into result array
			$key = date("dS M y",$value->created_dt);
			if(!array_key_exists($key,$myPosts)){
				$myPosts[$key] = array($content);				
			}else{
				$myPosts[$key][] = $content;				
			}	
			
		}
		$this->template->content->posts = $myPosts;

		$this->template->content->test = "Oh hai!";
		
	}
	/*
	 * Find the length of teaser
	 * If the word limit is greater than
	 * the number of words, just use the whole string
	 */
	private function findTeaserLength($wordLimit,$body){		
		$words = explode(' ',$body);
		$i = ($wordLimit < $words)?count($words):$wordLimit;
		$teaserText = "";
		while($i > 0)
	    {	    	
		    $i--;
		    $teaserText .= $words[$i]." ";
	    }
		return strlen($teaserText); 
	}
	private function getResult(){
		return (isset($this->result[1]))?$this->result[1]:false;
		
	}
	public function saveNewPosts(){
		
		$postObj = new Post_Model;		
		$inserts = $postObj->searchForNewPosts();
		echo Kohana::debug($inserts);
		exit;
	}

	public function __call($method, $arguments)
	{
		// Disable auto-rendering
		$this->auto_render = FALSE;

		// By defining a __call method, all pages routed to this controller
		// that result in 404 errors will be handled by this method, instead of
		// being displayed as "Page Not Found" errors.
		echo 'This text is generated by __call. If you expected the index page, you need to use: welcome/index/'.substr(Router::$current_uri, 8);
	}

} // End Welcome Controller