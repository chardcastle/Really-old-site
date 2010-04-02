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
		
		$mostRecentPost = $this->db->select("*")
		->from("kh_timeline")		
		->limit(9)
		->orderby("id","desc")
		->get()
		->result_array(true);
		/*  begin extraction
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
		$myPosts = array();
		foreach($posts as $key => $value){
			$content = $value->content;
			if($value->type == "tumblr"){				
				$contentJson = json_decode($content);				
				if(!$contentJson){					
					kohana::log("debug","failed to decode");				
				}else{					
					kohana::log("debug","Found json");
					$json = $contentJson->{"@attributes"};
					if(is_object($json) && isset($json->type)){
						switch($json->type){
							case "photo":
								$photoObj = new Photo_Model;
								$content = $photoObj->loadFromLocalSource($json);
								break;						
							case "regular":		
								$regObj = new Regular_Model;				
								$content = $regObj->loadFromLocalSource($content);
								break;
							case "link":	
								$linkObj = new Link_Model;					
								$content = $linkObj->loadFromLocalSource($content);
								break;
							case "video":		
								$vidObj = new Video_Model;													
								$content = $vidObj->loadFromLocalSource($content);	
								break;							
						}
					}
				}
			}	
			// load into result array
			$key = date("jS M y",$value->created_dt);
			if(!array_key_exists($key,$myPosts)){
				$myPosts[$key] = array($content);				
			}else{
				$myPosts[$key][] = $content;				
			}	
			end extraction
			 
		}
		/* */
		$this->template->content->posts = $mostRecentPost;

		$this->template->content->test = "Oh hai!";
		
	}

	public function saveNewPosts(){
		
		$postObj = new Post_Model;		
		$inserts = $postObj->searchForNewPosts();
		echo Kohana::debug($inserts);
		exit;
	}
	public function digestNewPosts(){
		$postObj = new Post_Model;
		$postObj->digestNewPosts();
		echo "Done";
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