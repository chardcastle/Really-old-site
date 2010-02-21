<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
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
 * ExpressionEngine Admin Model
 *
 * @package		ExpressionEngine
 * @subpackage	Core
 * @category	Model
 * @author		ExpressionEngine Dev Team
 * @link		http://expressionengine.com
 */
class Addons_model extends CI_Model {

	function Addons_model()
	{
		parent::CI_Model();
		$this->EE =& get_instance();
    }

	// --------------------------------------------------------------------

	/**
	 * Get Plugin Formatting
	 *
	 * Used in various locations to list formatting options
	 *
	 * @access	public
	 * @param	bool	whether or not to include a "None" option
	 * @return	array
	 */
	function get_plugin_formatting($include_none = FALSE)
	{
		$this->EE->load->helper('directory');
		
		$exclude = array('auto_xhtml');

		$filelist = array('br' => $this->lang->line('auto_br'), 'xhtml' => 'Xhtml');
		
		if ($include_none === TRUE)
		{
			$filelist = array('none' => $this->lang->line('none')) + $filelist;
		}
		
		$ext_len = strlen(EXT);

		// first party plugins
		if (($map = directory_map(PATH_PI, TRUE)) !== FALSE)
		{
			foreach ($map as $file)
			{
				if (strncasecmp($file, 'pi.', 3) == 0 && substr($file, -$ext_len) == EXT && strlen($file) > strlen('pi.'.EXT))
				{
					$file = substr($file, 3, -strlen(EXT));						
					$filelist[$file] = ucwords(str_replace('_', ' ', $file));
				}				
			}
		}

		// now third party add-ons, which are arranged in "packages"
		// only catch files that match the package name, as other files are merely assets
		if (($map = directory_map(PATH_THIRD)) !== FALSE)
		{
			foreach ($map as $pkg_name => $files)
			{
				if ( ! is_array($files))
				{
					$files = array($files);
				}
				
				foreach ($files as $file)
				{
					if (is_array($file))
					{
						// we're only interested in the top level files for the addon
						continue;
					}
					
					// how abouts a plugin?
					elseif (strncasecmp($file, 'pi.', 3) == 0 && substr($file, -$ext_len) == EXT && strlen($file) > strlen('pi.'.EXT))
					{							
						$file = substr($file, 3, -$ext_len);

						if ($file == $pkg_name)
						{
							$filelist[$pkg_name] = ucwords(str_replace('_', ' ', $pkg_name));
						}
					}					
				}
			}
		}

		ksort($filelist);
		return $filelist;
	}

	// --------------------------------------------------------------------

	/**
	 * Get Plugins
	 *
	 * @access	public
	 * @return	array
	 */
	function get_plugins()
	{
		if ( ! @include_once(APPPATH.'libraries/Pclzip.php'))
		{
			show_error('PclZip Library does not appear to be installed.  It is required.');
		}

		$plugins = array();
		$info 	= array();
		$ext_len = strlen(EXT);

		// first party plugins
		if (($map = directory_map(PATH_PI, TRUE)) !== FALSE)
		{
			foreach ($map as $file)
			{
				if (strncasecmp($file, 'pi.', 3) == 0 && substr($file, -$ext_len) == EXT && strlen($file) > strlen('pi.'.EXT))
				{
					if ( ! @include_once(PATH_PI.$file))
					{
						continue;
					}

					$name = substr($file, 3, -$ext_len);

					$plugins[] = $name;

					$info[$name] = array_unique($plugin_info);
				}				
			}
		}

		// now third party add-ons, which are arranged in "packages"
		// only catch files that match the package name, as other files are merely assets
		if (($map = directory_map(PATH_THIRD)) !== FALSE)
		{
			foreach ($map as $pkg_name => $files)
			{
				if ( ! is_array($files))
				{
					$files = array($files);
				}
				
				foreach ($files as $file)
				{
					if (is_array($file))
					{
						// we're only interested in the top level files for the addon
						continue;
					}
					
					elseif (strncasecmp($file, 'pi.', 3) == 0 && substr($file, -$ext_len) == EXT && strlen($file) > strlen('pi.'.EXT))
					{							
						if ( ! @include_once(PATH_THIRD.$pkg_name.'/'.$file))
						{
							continue;
						}

						$plugins[] = $pkg_name;

						$info[$pkg_name] = array_unique($plugin_info);
					}					
				}
			}
		}

		return $info;
	}

	// --------------------------------------------------------------------

	/**
	 * Get Installed Modules
	 *
	 * @access	public
	 * @return	array
	 */
	function get_installed_modules($has_cp = FALSE)
	{
		$this->db->select('LOWER(module_name) AS module_name, module_version, has_cp_backend, module_id', FALSE);
		
		if ($has_cp === TRUE)
		{
			$this->db->where('has_cp_backend', 'y');
		}
		
		return $this->db->get('modules');
	}
	
	// --------------------------------------------------------------------

	/**
	 * Get Installed Extensions
	 *
	 * @access	public
	 * @return	array
	 */
	function get_installed_extensions($enabled = TRUE)
	{
		$this->db->select('class, version');
		
		if ($enabled)
		{
			$this->db->where('enabled', 'y');
		}
		else
		{
			$this->db->select('enabled');
		}

		return $this->db->get('extensions');
	}

	// --------------------------------------------------------------------

	/**
	 * Module installed
	 *
	 * Returns true if a module is installed, false if not
	 *
	 * @access	public
	 * @param	string
	 * @return	boolean
	 */
	function module_installed($module_name)
	{
		static $_installed = array();
		
		if ( ! isset($_installed[$module_name]))
		{
			$this->db->from("modules");
			$this->db->where("module_name", ucfirst(strtolower($module_name)));
			$_installed[$module_name] = ($this->db->count_all_results() > 0) ? TRUE : FALSE;
		}
		
		return $_installed[$module_name];
	}
	
	// --------------------------------------------------------------------

	/**
	 * Accessory installed
	 *
	 * Returns true if an accessory is installed, false if not
	 *
	 * @access	public
	 * @param	string
	 * @return	boolean
	 */
	function accessory_installed($acc_name)
	{
		static $_installed = array();
		
		if ( ! isset($_installed[$acc_name]))
		{
			$this->db->from("accessories");
			$this->db->where("class", ucfirst(strtolower($acc_name.'_acc')));
			$_installed[$acc_name] = ($this->db->count_all_results() > 0) ? TRUE : FALSE;
		}
		
		return $_installed[$acc_name];
	}
	
	// --------------------------------------------------------------------

	/**
	 * Extension installed
	 *
	 * Returns true if an extension is installed, false if not
	 *
	 * @access	public
	 * @param	string
	 * @return	boolean
	 */
	function extension_installed($ext_name)
	{
		static $_installed = array();
		
		if ( ! isset($_installed[$ext_name]))
		{
			$this->db->from("extensions");
			$this->db->where("class", ucfirst(strtolower($ext_name.'_ext')));
			$_installed[$ext_name] = ($this->db->count_all_results() > 0) ? TRUE : FALSE;
		}
		
		return $_installed[$ext_name];
	}
	
	// --------------------------------------------------------------------

	/**
	 * Update an Extension
	 *
	 * @access	public
	 * @return	void
	 */
	function update_extension($class, $data)
	{
		$this->db->set($data);
		$this->db->where('class', $class);
		$this->db->update('extensions');
	}

	// --------------------------------------------------------------------

	/**
	 * Update Accessory Information
	 *
	 * @access	public
	 * @return	void
	 */
	function update_accessory($class, $data)
	{
		// allow either "class", or "class_acc" to be passed
		if (substr($class, -4) != '_acc')
		{
			$class = $class.'_acc';
		}

		$this->db->where('class', $class);
		$this->db->update('accessories', $data);
	}
}

/* End of file addons_model.php */
/* Location: ./system/expressionengine/models/addons_model.php */