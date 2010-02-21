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
 * ExpressionEngine EE_Fieldtype Class
 *
 * @package		ExpressionEngine
 * @subpackage	Fieldtypes
 * @category	Fieldtypes
 * @author		ExpressionEngine Dev Team
 * @link		http://expressionengine.com
 */
class EE_Fieldtype {

	var $EE;
	var $field_id;
	var $field_name;
	var $settings = array();

	/**
	 * Constructor
	 *
	 * @access	public
	 */
	function EE_Fieldtype()
	{
		$this->EE =& get_instance();
	}
	
	// --------------------------------------------------------------------

	function _init($config = array())
	{
		foreach($config as $key => $val)
		{
			$this->$key = $val;
		}
	}
	
	// --------------------------------------------------------------------
	
	function replace_tag($data, $params = array(), $tagdata = FALSE)
	{
		if ($tagdata)
		{
			return $tagdata;
		}
		
		return $data;
	}

	// --------------------------------------------------------------------
	
	function pre_process($data)
	{
		return $data;
	}
	
	// --------------------------------------------------------------------
	
	function validate()
	{
		return TRUE;
	}

	// --------------------------------------------------------------------
	
	function display_publish_field($data)
	{
		$vars['glossary_items'] = $this->EE->load->view('content/_assets/glossary_items', '', TRUE);
		$this->EE->load->vars($vars);
	
		return $this->display_field($data);
	}
	
	// --------------------------------------------------------------------
	
	function field_formatting_row($data, $prefix = FALSE)
	{
		// @todo
		$edit_format_link = $data['edit_format_link'];
		$prefix = ($prefix) ? $prefix.'_' : '';
		
		$extra = '';
		
		if ($data['field_id'] != '')
		{
			$extra .= '<div class="notice update_formatting js_hide">';
			$extra .= '<p>'.lang('fmt_has_changed').'</p><p>';
			$extra .= form_checkbox($prefix.'update_formatting', 'y', FALSE, 'id="'.$prefix.'update_formatting"');
			$extra .= NBS.lang('update_existing_fields', $prefix.'update_formatting');
			$extra .= '</p></div>';
		}

		$this->EE->table->add_row(
			lang('deft_field_formatting', $prefix.'field_fmt'),
			form_dropdown($prefix.'field_fmt', $data['field_fmt_options'], $data['field_fmt'], 'id="'.$prefix.'field_fmt"').
				NBS.$data['edit_format_link'].BR.BR.
				'<strong>'.lang('show_formatting_buttons').'</strong>'.BR.
				form_radio($prefix.'field_show_fmt', 'y', $data['field_show_fmt_y'], 'id="'.$prefix.'field_show_fmt_y"').NBS.
				lang('yes', 'field_show_fmt_y').NBS.NBS.NBS.NBS.NBS.
				form_radio($prefix.'field_show_fmt', 'n', $data['field_show_fmt_n'], 'id="'.$prefix.'field_show_fmt_n"').NBS.
				lang('no', 'field_show_fmt_n').
				$extra
		);
		
		$this->EE->javascript->output('
		$("#'.$prefix.'field_fmt").change(function() {
			$(this).nextAll(".update_formatting").show();
		});
		');
	}
	
	// --------------------------------------------------------------------
	
	function text_direction_row($data, $prefix = FALSE)
	{
		$prefix = ($prefix) ? $prefix.'_' : '';

		$this->EE->table->add_row(
			'<strong>'.lang('text_direction').'</strong>',
			form_radio($prefix.'field_text_direction', 'ltr', $data['field_text_direction_ltr'], 'id="field_text_direction_ltr"').NBS.
				lang('ltr', 'field_text_direction_ltr').NBS.NBS.NBS.NBS.NBS.
				form_radio($prefix.'field_text_direction', 'rtl', $data['field_text_direction_rtl'], 'id="field_text_direction_rtl"').NBS.
				lang('rtl', 'field_text_direction_rtl')
		);		
	}
	
	// --------------------------------------------------------------------
	
	function field_content_type_row($data, $prefix = FALSE)
	{
		$suf = $prefix;
		$prefix = ($prefix) ? $prefix.'_' : '';
		
		$this->EE->table->add_row(
			lang('field_content_'.$suf, 'field_content_'.$suf),
			form_dropdown($prefix.'field_content_type', $data['field_content_options_'.$suf], $data['field_content_'.$suf], 'id="'.$prefix.'field_content_type"')
		);				
	}

	// --------------------------------------------------------------------
	
	function multi_item_row($data, $prefix = FALSE)
	{
		$prefix = ($prefix) ? $prefix.'_' : '';

		$this->EE->table->add_row(
			'<p class="field_format_option select_format">'.
				form_radio($prefix.'field_pre_populate', 'n', $data['field_pre_populate_n'], 'id="'.$prefix.'field_pre_populate_n"').NBS.
				lang('field_populate_manually', $prefix.'field_pre_populate_n').BR.
				form_radio($prefix.'field_pre_populate', 'y', $data['field_pre_populate_y'], 'id="'.$prefix.'field_pre_populate_y"').NBS.
				lang('field_populate_from_channel', $prefix.'field_pre_populate_y').
			'</p>',
			'<p class="field_format_option select_format_n">'.
	//			lang('field_list_items', 'select_list_items').
				lang('multi_list_items', $prefix.'multi_select_list_items').BR.
				lang('field_list_instructions').BR.
				form_textarea(array('id'=>$prefix.'field_list_items','name'=>$prefix.'field_list_items', 'rows'=>10, 'cols'=>50, 'value'=>$data['field_list_items'])).
			'</p>
			<p class="field_format_option select_format_y">'.
				lang('select_channel_for_field', $prefix.'field_pre_populate_id').
				form_dropdown($prefix.'field_pre_populate_id', $data['field_pre_populate_id_options'], $data['field_pre_populate_id_select'], 'id="'.$prefix.'field_pre_populate_id"').
			'</p>'
		);
	
		$this->EE->javascript->click('#'.$prefix.'field_pre_populate_n', '$(".select_format_n").show();$(".select_format_y").hide();', FALSE);
		$this->EE->javascript->click('#'.$prefix.'field_pre_populate_y', '$(".select_format_y").show();$(".select_format_n").hide();', FALSE);
		
		// When this field becomes active for the first time - hit the option we need
		$this->EE->javascript->output('
			$("#ft_'.rtrim($prefix, '_').'").one("activate", function() {
				$("#'.$prefix.'field_pre_populate_'.$data['field_pre_populate'].'").trigger("click");
			});
		');
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Display Field Settings
	 *
	 * @access	public
	 * @param	array
	 * @return	string
	 */
	function display_settings($data)
	{
		return '';
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Save Field
	 *
	 * @access	public
	 * @param	string
	 * @return	string
	 */
	function save($data)
	{
		return $data;
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Save Settings
	 *
	 * @access	public
	 * @param	array
	 * @return	void
	 */
	function save_settings($data)
	{
		return array();
	}
}

// END EE_Fieldtype class


/* End of file EE_Fieldtype.php */
/* Location: ./system/expressionengine/fieldtypes/EE_Fieldtype.php */