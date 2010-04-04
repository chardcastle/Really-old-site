<?php defined('SYSPATH') or die('No direct script access.');
 
class Link_Model extends App_Model {
	 	
 	public $title = ""; 	
 	public $destination = "";
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();		
	}
	public function loadFromLocalSource($content){		
		//preg_match('/\"link-text\"\:\"(.*)\",/i',$content,$this->result);
		$this->title = $content["link-text"];
		//preg_match('/\"link-url\"\:\"(.*)\",/i',$content,$this->result);
		$this->destination = $content["link-url"];
		// view
		$view = new View("item_summary/link");
		$view->set("link",$this);
		return $view->render();		
	}
 
}