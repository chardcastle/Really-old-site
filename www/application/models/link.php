<?php defined('SYSPATH') or die('No direct script access.');
 
class Link_Model extends Model {
	 	
 	public $title = ""; 	
 	public $destination = "";
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();		
	}

 
}