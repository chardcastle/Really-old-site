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



class Tweetengine_upd {

	var $version		= '0.1';

	function Tweetengine_upd()
	{
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();
		
	}

	// --------------------------------------------------------------------

	/**
	 * Module Installer
	 *
	 * @access	public
	 * @return	bool
	 */
	function install()
	{
	log_message("debug","Tweet engine install");
		$data = array(
					'module_name' => 'Tweet Engine',
					'module_version' => $this->version,
					'has_cp_backend' => 'n'
					);

		$this->EE->db->insert('modules', $data);

		$data = array(
					'class' => 'Tweetengine',
					'method' => 'test'
					);

		$this->EE->db->insert('actions', $data);		
		/*			
		$this->EE->db->insert('actions', $data);			
					
		$data = array(
					'class' => 'Tweetengine',
					'method' => 'get_tweets'
					);
					
		$this->EE->db->insert('actions', $data);
		*/

		return TRUE;
	}

	// --------------------------------------------------------------------

	/**
	 * Module Uninstaller
	 *
	 * @access	public
	 * @return	bool
	 */
	function uninstall()
	{
		$this->EE->db->select('module_id');
		$this->EE->db->from('modules');
		$this->EE->db->where('module_name', 'Tweet Engine');
		$query = $this->EE->db->get();

		$this->EE->db->delete('module_member_groups', array('module_id' => $query->row('module_id')));
		$this->EE->db->delete('modules', array('module_name' => 'Tweet Engine'));
		$this->EE->db->delete('actions', array('class' => 'Tweetengine'));

		return TRUE;
	}

	// --------------------------------------------------------------------

	/**
	 * Module Updater
	 *
	 * @access	public
	 * @return	bool
	 */
	function update()
	{
		return TRUE;
	}

}
// END CLASS

/* End of file upd.tweetengine.php */

