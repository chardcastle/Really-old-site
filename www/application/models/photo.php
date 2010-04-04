<?php defined('SYSPATH') or die('No direct script access.');
 
class Photo_Model extends App_Model {
	 	
 	public $urls = array();
 	public $title = "";
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
		$this->urls = array(
			"small" => "",
			"medium" => "",
			"large" => ""
		);
	}
	public function loadFromLocalSource($content){		
		$this->urls["small"] = (isset($content["small"])?$content["small"]:false);
		$this->urls["medium"] = (isset($content["medium"])?$content["small"]:false);
		$this->urls["large"] = (isset($content["large"])?$content["large"]:false);
		$this->title = (isset($content["photo-caption"])?$content["photo-caption"]:false);
		$view = new View("item_summary/photo");
		$view->set("photo",$this);
		return $view->render();		
	}

 
}