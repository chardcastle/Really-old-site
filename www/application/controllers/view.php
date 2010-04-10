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
class View_Controller extends Template_Controller {

	// Disable this controller when Kohana is set to production mode.
	// See http://docs.kohanaphp.com/installation/deployment for more details.
	const ALLOW_PRODUCTION = FALSE;

	// Set the name of the template to use
	public $template = 'template';			
	protected $db;		
	
	public function __construct(){		
		parent::__construct(); // This must be included
                $env = Kohana::config("config.environment");
		$this->db = new Database($env);
	}
	
	public function index()
	{
		/*
		 * Useful snippets
		 * 	$this->template->content->test .= Kohana::debug($xml);
		 *  kohana::log("debug",Kohana::debug($post));	
		 */


		
	}
        public function view($postId){
            if($postId>0){
                $this->template->content = new View('full_width');
                $postObj = new Post_Model;
                $this->template->title = 'Welcome to Kohana! ('.Kohana::config("config.environment").')';
                // Post timeline data
                $post = $this->db->select("*")
                ->from("kh_posts")
                //->where("post_id = ",$postId)
                ->get()
                ->result_array(true);

                $content = unserialize($post);

                $this->template->content->post = $post;
            }

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