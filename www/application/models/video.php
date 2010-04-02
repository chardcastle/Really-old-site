<?php defined('SYSPATH') or die('No direct script access.');
 
class Video_Model extends App_Model {
	 	
 	public $caption = ""; 	
 	public $player = "";
 	public $source = "";
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();		
	}
	public function loadFromLocalSource($content){				
		// this preg statements use case insensitive and ungreedy match
		preg_match('/\"video-caption\"\:\"(.*)\"/iU',$content,$this->result);
		$this->caption = strip_tags($this->getResult());
		preg_match('/\"video-player\"\:\"(.*)\"/i',$content,$this->result);
		$this->player = stripslashes($this->getResult());
		preg_match('/\"video-source\"\:\"(.*)\",/i',$content,$this->result);
		$this->source = $this->getResult();							
		// view
		$view = new View("item_summary/video");
		$view->set("video",$this);
		$content = $view->render();	
	}
 
}