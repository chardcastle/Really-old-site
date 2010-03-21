<?php

/*
=====================================================
 Tweet Engine - by Chris Hardcastle
-----------------------------------------------------
=====================================================
 File: mcp.channel.php
-----------------------------------------------------
 Purpose: Tweetengine class - CP
=====================================================
*/
if ( ! defined('EXT'))
{
	exit('Invalid file request');
}


class Tweetengine {

	//var $twitterRequest = "http://api.twitter.com/1/statuses/user_timeline/hardcastle.json";
	/**
	  * Constructor
	  */
	  var $return_data 	= '';
	function Tweetengine()
	{
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();

		$this->p_limit = $this->limit;
/*
		$this->EE->db->select_max("field_id_4");
		$this->EE->db->get("exp_channel_data");
		$q = $this->EE->db->limit(1);
		var_dump($q);
		echo "Oh hai";
		$tweets = file_get_contents();
*/
$this->EE->TMPL->tagdata= array();
		$this->return_data = $this->EE->TMPL->tagdata;

	}

	// ------------------------------------------------------------------------

	/**
	  *  Initialize values
	  *  Required?
	  */
	function initialize()
	{
		$this->sql 			= '';
		$this->return_data	= '';
	}

	// ------------------------------------------------------------------------

	/**
	  *  Fetch Cache
	  */
	function test()
	{
		echo "oh hai";
	}


}
// END CLASS

/* End of file mod.channel.php */
