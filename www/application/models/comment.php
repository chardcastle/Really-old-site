<?php defined('SYSPATH') or die('No direct script access.');

class Comment_Model extends App_Model {

   	public $author = "";
 	public $body = "";
    public $timeLineRef = "";
    public $collection = array();
	public function __construct($postId=0)
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();

        $this->author = "";
        $this->body = "";
        $this->timeLineRef = 0;
        $this->collection = array();
        
		if($postId>0){
             kohana::log("debug", "Deteched postId:".$postId);
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
		$data = $this->db->select("*")
			->from("kh_comments")
			->where(array("time_line_ref"=>$postId))
			->get()
			->result_array(true);
        kohana::log("debug", "Query ran and returned".count($data)." records");
        $this->collection = $data;
	
	}
	public function loadComment($commentObj){
		$this->author = "x";//$commentObj["author"];
		$this->body = "y";//$commentObj["body"];
	}
}
