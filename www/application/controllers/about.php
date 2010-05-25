<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Show static about content
 */
class About_Controller extends Template_Controller {

	public $template = 'template';
	public $siteDesc = '';
	protected $siteObj;
	public $content = '';

	public function __construct(){		
		parent::__construct(); // This must be included	
		$this->siteObj = new Post_Model();
        $this->siteDesc = $this->siteObj->getSiteDescription();
		$this->content = new View('about');
		$this->template->title = "About";
		$this->template->description = $this->siteDesc;
	}
	/*
	 * return as regular html
	*/	
	public function index()
	{
		$this->template->content = $this->content->render();
	}
	/*
	 * return as json
	*/	
	public function json(){
		echo json_encode(array("html"=>$this->content->render()));
		exit;
	}

	public function __call($method, $arguments)
	{
		// Disable auto-rendering
		$this->auto_render = FALSE;

		// By defining a __call method, all pages routed to this controller
		// that result in 404 errors will be handled by this method, instead of
		// being displayed as "Page Not Found" errors.
		echo 'This text is generated by __call. ';
	}

} // End Welcome Controller
