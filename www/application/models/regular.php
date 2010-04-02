<?php defined('SYSPATH') or die('No direct script access.');
 
class Regular_Model extends App_Model {
	 	
 	public $title = "";
 	public $teaser = "";
 	
	public function __construct()
	{
		// load database library into $this->db (can be omitted if not required)
		parent::__construct();
		$this->title = "";
		$this->teaser = "";
	}
	public function loadFromLocalSource($content){		
		// Get title						
		preg_match('/\"regular-title\"\:\"(.*)\",/i',$content,$this->result);						
		$this->title = $this->getResult();
		// Get body
		preg_match('/\"regular-body\"\:\"(.*)\"/i',$content,$this->result);						
		$body = $this->getResult();
		$pos = ($body)?strpos($body,"<!-- more -->"):false;
		$pos = ($pos!==false)?$pos:$this->findTeaserLength(12,$body);									
		$this->teaser = ($body)?nl2br(substr(strip_tags($body),0,$pos)):"?";
		// view						
		$view = new View("item_summary/regular");
		$view->set("article",$this);
		return $view->render();
	}
	/*
	 * Find the length of teaser
	 * If the word limit is greater than
	 * the number of words, just use the whole string
	 */
	private function findTeaserLength($wordLimit,$body){		
		$words = explode(' ',$body);
		$i = ($wordLimit < $words)?count($words):$wordLimit;
		$teaserText = "";
		while($i > 0)
	    {	    	
		    $i--;
		    $teaserText .= $words[$i]." ";
	    }
		return strlen($teaserText); 
	}	
}