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

	$twitterRequest = "http://api.twitter.com/1/statuses/user_timeline/hardcastle.json";
	/**
	  * Constructor
	  */
	function Tweetengine()
	{
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();

		$this->p_limit = $this->limit;

		$this->query_string = "";

		$tweets = file_get_contents();

		// a number tags utilize the disable= parameter, set it here
		if (isset($this->EE->TMPL) && is_object($this->EE->TMPL))
		{
			$this->_fetch_disable_param();
		}
	}

	// ------------------------------------------------------------------------

	/**
	  *  Initialize values
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
	function fetch_cache($identifier = '')
	{
		
	}

	// ------------------------------------------------------------------------

	/**
	  *  Save Cache
	  */
	function save_cache($sql, $identifier = '')
	{

	}


}
// END CLASS

/* End of file mod.channel.php */
