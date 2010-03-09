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

class Tweetengine_mcp {

	var $stats_cache	= array(); // Used by mod.stats.php

	/**
	  * Constructor
	  */
	function Tweetengine_mcp()
	{
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();
	}
}
// END CLASS

/* End of file mcp.tweetengine.php */
