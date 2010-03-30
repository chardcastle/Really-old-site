<?php defined('SYSPATH') or die('No direct script access.');
 
class Photo_Model extends Model {
	 	
 	public $urls = array();
 	public $title = "";
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
		$this->urls = array(
			"large" => "",
			"small" => ""
		);
	}
 
}