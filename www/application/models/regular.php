<?php defined('SYSPATH') or die('No direct script access.');
 
class Regular_Model extends Model {
	 	
 	public $title = "";
 	public $teaser = "";
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
		$this->title = "";
		$this->teaser = "";
	}

 
}