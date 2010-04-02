<?php defined('SYSPATH') or die('No direct script access.');
 
class Video_Model extends Model {
	 	
 	public $caption = ""; 	
 	public $player = "";
 	public $source = "";
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();		
	}

 
}