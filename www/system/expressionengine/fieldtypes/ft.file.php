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

// --------------------------------------------------------------------

/**
 * ExpressionEngine File Fieldtype Class
 *
 * @package		ExpressionEngine
 * @subpackage	Fieldtypes
 * @category	Fieldtypes
 * @author		ExpressionEngine Dev Team
 * @link		http://expressionengine.com
 */
class File_ft extends EE_Fieldtype {

	var $info = array(
		'name'		=> 'File',
		'version'	=> '1.0'
	);

	var $has_array_data = TRUE;
	
	/**
	 * Constructor
	 *
	 * @access	public
	 */
	function File_ft()
	{
		parent::EE_Fieldtype();
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Save the correct value {fieldir_\d}filename.ext
	 *
	 * @access	public
	 */
	function save($data)
	{
		if ($data != '')
		{
			$directory = 'field_id_'.$this->field_id.'_directory';
			$directory = $this->EE->input->post($directory);
			return '{filedir_'.$directory.'}'.$data;			
		}
	}
	
	// --------------------------------------------------------------------

	/**
	 * Validate the upload
	 *
	 * @access	public
	 */
	function validate($data)
	{
		$dir_field		= $this->field_name.'_directory';
		$hidden_field	= $this->field_name.'_hidden';
		
		// Default to blank - allows us to remove files
		$_POST[$this->field_name] = '';
		
		// Default directory
		$upload_directories = $this->EE->tools_model->get_upload_preferences($this->EE->session->userdata('group_id'));
		$filedir = $upload_directories->row('id');
		
		// Directory selected - switch
		$filedir = ($this->EE->input->post($dir_field)) ? $this->EE->input->post($dir_field) : $filedir;

		// Upload or maybe just a path in the hidden field?
		if (isset($_FILES[$this->field_name]) && $_FILES[$this->field_name]['size'] > 0)
		{
			// @todo won't work for saef
			$data = $this->EE->filemanager_endpoint('upload_file', array($filedir, $this->field_name));
			
			if (array_key_exists('error', $data))
			{
				// @todo validation error
				return $data['error'];
			}
			else
			{
				$_POST[$this->field_name] = $data['name'];
			}
		}
		elseif ($this->EE->input->post($hidden_field))
		{
			$_POST[$this->field_name] = $_POST[$hidden_field];
		}

		$_POST[$dir_field] = $filedir;
		unset($_POST[$hidden_field]);
		
		if ($this->settings['field_required'] == 'y' && ! $_POST[$this->field_name])
		{
			return $this->EE->lang->line('required');
		}
		
		return TRUE;
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Show the publish field
	 *
	 * @access	public
	 */
	function display_field($data)
	{
		$filedir = '';
		$filename = '';
		$upload_dirs = array();
				
		$upload_directories = $this->EE->tools_model->get_upload_preferences($this->EE->session->userdata('group_id'));

		foreach($upload_directories->result() as $row)
		{
			$upload_dirs[$row->id] = $row->name;
		}
		
		if (preg_match('/{filedir_([0-9]+)}/', $data, $matches))
		{
			$filedir = $matches[1];
			$filename = str_replace($matches[0], '', $data);
		}

		// Get dir info
		$upload_directory_info = $this->EE->tools_model->get_upload_preferences($this->EE->session->userdata('group_id'), $filedir);
		$upload_directory_server_path = $upload_directory_info->row('server_path');
		$upload_directory_url = $upload_directory_info->row('url');

		// let's look for a thumb
		if (file_exists($upload_directory_server_path.'_thumbs/thumb_'.$filename))
		{
			$thumb = '<img src="'.$upload_directory_url.'_thumbs/thumb_'.$filename.'" />';
		}
		else
		{
			$thumb = '<img src="'.PATH_CP_GBL_IMG.'default.png" alt="default thumbnail" />';
		}


		$hidden	  = form_hidden($this->field_name.'_hidden', $filename);
		$upload   = form_upload($this->field_name, $filename);
		$dropdown = form_dropdown($this->field_name.'_directory', $upload_dirs, $filedir);

		// @todo Lang keys
		$newf = '<a href="#" class="choose_file">Add File</a>';
		$remf = '<a href="#" class="remove_file">Remove File</a>';

		$set_class = $filename ? '' : 'js_hide';		

		$r = '<div class="file_set '.$set_class.'">';
		$r .= "<p class='filename'>$thumb<br />$filename</p>";
		$r .= "<p>$remf</p>";
		$r .= "<p>$hidden</p>";
		$r .= '</div>';

		$r .= '<div class="no_file js_hide">';
		$r .= "<p>$upload</p>";
		$r .= "<p>$dropdown</p>";
		$r .= '</div>';

		$r .= '<div class="modifiers js_show">';
		$r .= "<p>$newf</p>";
		$r .= '</div>';

		return $r;
	}

	// --------------------------------------------------------------------
	
	/**
	 * Prep the publish data
	 *
	 * @access	public
	 */
	function pre_process($data)
	{
		// Parse out the file info
		$file_info['path'] = '';
		
		if (preg_match('/^{filedir_(\d+)}/', $data, $matches))
		{
			// only replace it once
			$path = substr($data, 0, 10 + strlen($matches[1]));

			$file_dirs = $this->EE->functions->fetch_file_paths();

			$file_info['path'] = str_replace($matches[0], $file_dirs[$matches[1]], $path);
			$data = str_replace($matches[0], '', $data);
		}

		$file_info['extension'] = substr(strrchr($data, '.'), 1);
		$file_info['filename'] = basename($data, '.'.$file_info['extension']);

		return $file_info;
	}
	
	// --------------------------------------------------------------------

	/**
	 * Replace frontend tag
	 *
	 * @access	public
	 */
	function replace_tag($file_info, $params = array(), $tagdata = FALSE)
	{
		if ($tagdata !== FALSE)
		{
			$tagdata = $this->EE->functions->prep_conditionals($tagdata, $file_info);
			$tagdata = $this->EE->functions->var_swap($tagdata, $file_info);
			
			// More an example than anything else - not particularly useful in this context
			if (isset($params['backspace']))
			{
				$tagdata = substr($tagdata, 0, - $params['backspace']);
			}
		
			return $tagdata;
		}
		else
		{
			$full_path = $file_info['path'].$file_info['filename'].'.'.$file_info['extension'];

			if (isset($params['wrap']))
			{
				if ($params['wrap'] == 'link')
				{
					return '<a href="'.$full_path.'">'.$file_info['filename'].'</a>';
				}
				elseif ($params['wrap'] == 'image')
				{
					return '<img src="'.$full_path.'" alt="'.$file_info['filename'].'" />';
				}
			}

			return $full_path;
		}
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Display settings screen
	 *
	 * @access	public
	 */
	function display_settings($data)
	{
		$prefix = 'file';
		$this->field_content_type_row($data, $prefix);
	}
}

// END File_ft class

/* End of file ft.file.php */
/* Location: ./system/expressionengine/fieldtypes/ft.file.php */