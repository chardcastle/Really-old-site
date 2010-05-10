<?php defined('SYSPATH') or die('No direct script access.');
 
class App_Model extends Model {
	 	
	public $result = array();
	protected $db;	 	
	protected $environment;
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
		$this->environment = Kohana::config("config.environment");
		$this->db = new Database($this->environment);
	}
	/*
	 * return the array result for preg matches 
	 * */
	public function getResult(){
		return (isset($this->result[1]))?$this->result[1]:false;
		
	}
	public function getPostIdFromSlug($urlSlug){
		$data =	$this->db->select("id")
			->from("kh_timeline")		
			->where(array("slug"=>$urlSlug))
			->get()
			->result_array(true);
		if(isset($data[0])){
			return $data[0]->id;
		}else{
			return false;
		}
	}
 
}
