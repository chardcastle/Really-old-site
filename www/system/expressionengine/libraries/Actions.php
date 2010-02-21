<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * ExpressionEngine - by EllisLab
 *
 * @package		ExpressionEngine
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2003 - 2009, EllisLab, Inc.
 * @license		http://expressionengine.com/docs/license.html
 * @link		http://expressionengine.com
 * @since		Version 2.0
 * @filesource
 */
 
// ------------------------------------------------------------------------

/**
 * ExpressionEngine Action Handler Class
 *
 * Actions are events that require processing. Normally when you use ExpressionEngine, 
 * either a web page (template), or the control panel is displayed. There are times, 
 * however, when we need to process user-submitted data. Examples of these include:
 * 
 * - Logging in
 * - Logging out
 * - New member registration
 *	etc...
 * 
 * In these examples, information submitted from a user needs to be received and processed.  Since
 * ExpressionEngine uses only one execution file (index.php) we need a way to know that an
 * action is being requested.
 * 
 * The way actions work is this: 
 * 
 * Anytime a GET or POST request contains the ACT variable, ExpressionEngine will run the Actions class and 
 * process the requested action.
 * 
 * Note: The database contains a table called "exp_actions".  This table contains a list
 * of every available action (and the associated class and method).  When an action is requested,
 * the database is queried to get the information needed to process the action.
 * 
 * When a new module is installed, ExpressionEngine will update the action table.  When a module
 * is de-installed, the actions are deleted. 
 *
 * @package		ExpressionEngine
 * @subpackage	Core
 * @category	Core
 * @author		ExpressionEngine Dev Team
 * @link		http://expressionengine.com
 */
class EE_Actions {

	/**
	 * Constructor
	 *
	 * Loads the class and calls the method associated with 
	 * a particular action request
	 *
	 */	
	function EE_Actions()
	{  
		// Set the EE super object to a local variable
		$EE =& get_instance();
  
		// Define special actions
		// These are actions that are triggered manually
		// rather than doing a lookup in the actions table.
		$specials = array(
							'jquery'			=> array('Jquery', 'output_javascript')
						 );
		
		// Make sure the ACT variable is set		
		if ( ! $action_id = $EE->input->get_post('ACT'))
		{
			return false;
		}

		// Fetch the class and method name (checks to make sure module is installed too)
		// If the ID is numeric we need to do an SQL lookup
		if (is_numeric($action_id))
		{					
			$query = $EE->db->query("SELECT class, method FROM exp_actions WHERE action_id = '".$EE->db->escape_str($action_id)."'");
			
			if ($query->num_rows() == 0)
			{
				if ($EE->config->item('debug') >= 1)
				{
					$EE->output->fatal_error($EE->lang->line('invalid_action'));
				}
				else
					return FALSE;
			}
			
			$class  = ucfirst($query->row('class') );
			$method = strtolower($query->row('method') );
		}
		else
		{
			// If the ID is not numeric we'll invoke the class/method manually	
			if ( ! isset($specials[$action_id]))
			{
				return FALSE;
			}
		
			$class  = $specials[$action_id]['0'];
			$method = $specials[$action_id]['1'];
			
			// Double check that the module is actually installed
			$query = $EE->db->query("SELECT module_version FROM exp_modules 
									 WHERE module_name = '".$EE->db->escape_str(ucfirst($class))."'");
			
			if ($query->num_rows() == 0)
			{
				if ($EE->config->item('debug') >= 1)
				{
					$EE->output->fatal_error($EE->lang->line('invalid_action'));
				}
				else
					return false;
			}
		}

		// What type of module is being requested?
		if (substr($class, -3) == '_mcp')
		{
			$type = 'mcp'; 
			
			$base_class = strtolower(substr($class, 0, -3));
		}
		else
		{
			$type = 'mod';
		
			$base_class = strtolower($class);
		}
		
		// Assign the path
		
		if (in_array($base_class, $EE->core->native_modules))
		{
			$path = PATH_MOD.$base_class.'/'.$type.'.'.$base_class.EXT;
		}
		else
		{
			// set path for local libraries, models, etc.
			$EE->load->add_package_path(PATH_THIRD.$base_class.'/');		
			$path = PATH_THIRD.$base_class.'/'.$type.'.'.$base_class.EXT;
		}
	
		// Does the path exist?		
		if ( ! file_exists($path))
		{
			if ($EE->config->item('debug') >= 1)
			{						
				$EE->output->fatal_error($EE->lang->line('invalid_action'));
			}
			else
				return FALSE;
		}
		
		// Require the class file
		if ( ! class_exists($class))
		{
			require $path;
		}
		
		// Instantiate the class/method		
		$ACT = new $class(0);
		
		if ($method != '')
		{
			if ( ! method_exists($ACT, $method))
			{
				if ($EE->config->item('debug') >= 1)
				{						
					$EE->output->fatal_error($EE->lang->line('invalid_action'));
				}
				else
					return FALSE;
			}
		
			$ACT->$method();
		}
		
		// if it's a third party add-on, remove the temporarily added path for local libraries, models, etc.
		if ( ! in_array($base_class, $EE->core->native_modules))
		{
			$EE->load->remove_package_path();
		}
	}

}
// END CLASS

/* End of file Actions.php */
/* Location: ./system/expressionengine/libraries/Actions.php */