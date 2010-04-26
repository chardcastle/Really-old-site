<?php defined('SYSPATH') or die('No direct script access.');

class Comment_Model extends App_Model {

   	public $author = "";
 	public $body = "";
    public $timeLineRef = "";
    	
	public function __construct($postId=0)
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
		if($postId>0){
			$this->loadCommentsOnPost($postId);
		}
	}
	public function create(){
        $status = $this->db->insert("kh_comments",array(
            "author" => $this->author,
            "body" => $this->body,
            "created" => time(),
            "time_line_ref" => $this->timeLineRef));
        // count how many rows were inserted
        return count($status);
	}
	private function loadCommentsOnPost($postId){
		return $this->db->select("*")
			->from("kh_comments")
			->where(array("time_line_ref"=>$postId))
			->get()
			->result_array(true);
	
	}
	public function loadComment($commentObj){
		$this->author = "x";//$commentObj["author"];
		$this->body = "y";//$commentObj["body"];
	}
}
