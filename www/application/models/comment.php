<?php defined('SYSPATH') or die('No direct script access.');

class Comment_Model extends App_Model {

   	public $author = "";
 	public $body = "";
    public $timeLineRef = "";
    
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
	}
	public function create(){
        $status = $this->db->insert("kh_comments",array(
            "author" => $commentObj->author,
            "body" => $commentObj->body,
            "time_line_ref" => $commentObj->timeLineRef));
        // count how many rows were inserted
        return count($status);
	}

}