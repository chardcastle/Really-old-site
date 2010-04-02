<?php defined('SYSPATH') or die('No direct script access.');
 
class App_Model extends Model {
	 	
	public $result = array();
	 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();

	}
	/*
	 * return the array result for preg matches 
	 * */
	public function getResult(){
		return (isset($this->result[1]))?$this->result[1]:false;
		
	}
 
}