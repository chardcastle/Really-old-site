<?php defined('SYSPATH') or die('No direct script access.');

class Quote_Model extends App_Model {

 	public $title = "";
 	public $body = "";

	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
	}
	public function loadFromLocalSource($content){		
		$this->title = $content["conversation-title"];
		$this->body = $content["conversation-text"];
		// view
		$view = new View("item_summary/quote");
		$view->set("quote",$this);
		return $view->render();
	}

}