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
	public $template = 'template';
    public $siteDesc = "";
	public $pagination = "";	
	public $links = array();
	protected $db;	
	protected $siteObj;
	public function __construct(){		
		parent::__construct(); // This must be included	
		$env = Kohana::config("config.environment");	
		$this->db = new Database($env);
		$this->itemsPerPage = Kohana::config("config.number_of_items");
		$this->pagination = new Pagination(array(
		    'base_url'    => '/welcome/page/', // base_url will default to current uri
		    'uri_segment'    => 'page', // pass a string as uri_segment to trigger former 'label' functionality
		    'total_items'    => $this->db->count_records("kh_timeline"), // use db count query here of course
		    'items_per_page' => $this->itemsPerPage, // it may be handy to set defaults for stuff like this in config/pagination.php
		    'style'          => 'classic' // pick one from: classic (default), digg, extended, punbb, or add your own!		
		));
        $this->siteObj = new Post_Model();
        $this->siteDesc = $this->siteObj->getSiteDescription();
	}
	
	public function index()
	{
		/*
		 * Useful snippets
		 * 	$this->template->content->test .= Kohana::debug($xml);
		 *  kohana::log("debug",Kohana::debug($post));	
		 */
	
		// Load template
		$this->template->content = new View('welcome_content');		
				
		$this->template->title = 'Chris Hardcastle ('.Kohana::config("config.environment").')';
        $this->template->description = $this->siteObj->getSiteDescription();
		$this->template->content->hotlinks = $this->pagination->render("digg");
		// Post timeline data
		$mostRecentPosts = $this->db->select("*")
		->from("kh_timeline")		
		->limit($this->itemsPerPage)
		->orderby("id","asc")
		->get()
		->result_array(true);
		
		$this->template->content->posts = $mostRecentPosts;
		
	}
	/*
	 * Provide data to static pages
	 * */
	public function page($pageId,$ajax=false){
		if($ajax){
			echo $this->pageAsJson($pageId);
			exit;			
		}else{
			$this->template->content = new View('welcome_content');
			
			$this->template->content->hotlinks = $this->pagination->render();
			$end = $this->getPageSqlEnd($pageId);
			$this->template->content->posts = $this->db->select("*")
			->from("kh_timeline")		
			->limit($this->itemsPerPage,$end)
			->orderby("id","asc")
			->get()
			->result_array(true);
			
			$this->template->title = "Chris";//var_dump($this->pagination);
            $this->template->description = $this->siteDesc;
		}
	}
	private function getPageSqlEnd($pageId){
		return ($pageId * $this->itemsPerPage)-$this->itemsPerPage;		
	}
	/*
	 * Provide data as JSON
	 * */
	public function pageAsJson($pageId){				
		$end = $this->getPageSqlEnd($pageId);
		$data = $this->db->select("*")
		->from("kh_timeline")		
		->limit($this->itemsPerPage,$end)
		->orderby("id","asc")
		->get()
		->result_array(true);		
		$x = 0;
		$returned = array();
		foreach($data as $key => $value){
			$x++;		
			$contents = unserialize($value->content);
			
			$returned[$key] = array(
				"index"=>"box{$x}",
				"body"=>$contents,
				"title"=>$value->date);			 			
		}
		return json_encode($returned);		
		
	}	

	public function saveNewPosts(){		
		if (PHP_SAPI === 'cgi-fcgi' || PHP_SAPI !== 'cli'){
			throw new Kohana_User_Exception('Cannot call over the web', 'This is a function that can only be called via the command line.');
		}else{
			$postObj = new Post_Model;		
			$postObj->searchForNewPosts();
			kohana::log("debug","The function 'saveNewPosts' has run.");
		}		
	}

	public function digestNewPosts(){
		if (PHP_SAPI !== 'cgi-fcgi' || PHP_SAPI !== 'cli'){
			throw new Kohana_User_Exception('Cannot call over the web', 'This is a function that can only be called via the command line.');
		}else{
			$postObj = new Post_Model;
			$postObj->digestNewPosts();
			kohana::log("debug","The system has digested the posts tabel. HTML is now refreshed.");
		}
	}
	/*
	 * To be called by cron
	 * */
    public function runCron(){
     //   $this->digestNewPosts();
     //   $this->saveNewPosts();
        kohana::log("debug","Cron ran ok.");
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
