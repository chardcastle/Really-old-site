<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
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
 * ExpressionEngine Channel Model
 *
 * @package		ExpressionEngine
 * @subpackage	Core
 * @category	Model
 * @author		ExpressionEngine Dev Team
 * @link		http://expressionengine.com
 */
class Channel_model extends CI_Model {

	function Channel_model()
	{
		parent::CI_Model();
	}

	// --------------------------------------------------------------------

	/**
	 * Get Channels
	 *
	 * @access	public
	 * @param	int
	 * @return	mixed
	 */
	function get_channels($site_id = NULL, $fields = array(), $additional_where = array())
	{
		if ($site_id === NULL OR ! is_numeric($site_id))
		{
			$site_id = $this->config->item('site_id');
		}
		
		// If the user is restricted to specific channels, add that to the query
		if ($this->session->userdata('group_id') != 1)
		{
			$allowed_channels = $this->session->userdata('assigned_channels');

			if ( ! count($allowed_channels))
			{
				return FALSE;
			}
			
			$this->db->where_in('channel_title', $allowed_channels);
		}
		
		if (count($fields) > 0)
		{
			$this->db->select(implode(',', $fields));
		}
		else
		{
			$this->db->select('channel_title, channel_name, channel_id, cat_group, status_group, field_group');
		}
		
		foreach ($additional_where as $where)
		{
			foreach ($where as $field => $value)
			{
				if (is_array($value))
				{
					$this->db->where_in($field, $value);
				}
				else
				{
					$this->db->where($field, $value);
				}
			}
		}

		$this->db->where('site_id', $site_id);
		$this->db->order_by('channel_title');
		
		return $this->db->get('channels'); 
	}

	// --------------------------------------------------------------------

	/**
	 * Get Channel Menu
	 *
	 * @access	public
	 * @param	int
	 * @return	mixed
	 */
	function get_channel_menu($status_group, $cat_group, $field_group)
	{
		$this->db->select('channel_id, channel_title');
		$this->db->from('channels');
		$this->db->where('status_group', $status_group);
		$this->db->where('cat_group', $cat_group);
		$this->db->where('field_group', $field_group);
		$this->db->where('site_id', $this->config->item('site_id'));
		$this->db->order_by('channel_title');

		return $this->db->get();
	}

	// --------------------------------------------------------------------

	/**
	 * Get Channel Info
	 *
	 * Gets all metadata for a given Channel
	 *
	 * @access	public
	 * @param	int
	 * @return	mixed
	 */
	function get_channel_info($channel_id = '', $fields = array())
	{
		if (count($fields) > 0)
		{
			$this->db->select(implode(',', $fields));
		}

		$this->db->where('channel_id', $channel_id);
		return $this->db->get('channels');
	}

	// --------------------------------------------------------------------
	
	/**
	 * Get Channel Statuses
	 *
	 * Returns all information for a status
	 *
	 * @access	public
	 * @param	int
	 * @return	mixed
	 */
	function get_channel_statuses($status_group)
	{
		$this->db->where('group_id', $status_group);
		return $this->db->get('statuses');
	}

	// --------------------------------------------------------------------
	
	/**
	 * Get Channel Fields
	 *
	 * Returns field information
	 *
	 * @access	public
	 * @param	int
	 * @return	mixed
	 */
	function get_channel_fields($field_group)
	{
		$this->db->from('channel_fields');
		$this->db->where('group_id', $field_group);
		$this->db->order_by('field_order');
		return $this->db->get();
	}

	// --------------------------------------------------------------------

	/**
	 * Get Channel Categories
	 *
	 * Gets category information for a given category group, by default only fetches cat_id and cat_name
	 *
	 * @access	public
	 * @param	int
	 * @return	mixed
	 */
	function get_channel_categories($cat_group, $additional_fields = array(), $additional_where = array())
	{
		if ( ! is_array($additional_fields))
		{
			$additional_fields = array($additional_fields);
		}

		if ( ! isset($additional_where[0]))
		{
			$additional_where = array($additional_where);
		}

		if (count($additional_fields) > 0)
		{
			$this->db->select(implode(',', $additional_fields));
		}


		$this->db->select("cat_id, cat_name");
		$this->db->from("categories");
		$this->db->where("group_id", $cat_group);

		foreach ($additional_where as $where)
		{
			foreach ($where as $field => $value)
			{
				if (is_array($value))
				{
					$this->db->where_in($field, $value);
				}
				else
				{
					$this->db->where($field, $value);
				}
			}
		}

		$this->db->order_by('cat_name, group_title');

		return $this->db->get();		
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Get most recent entry/comment id
	 *
	 * @access	public
	 * @param	string
	 * @return	int
	 */
	function get_most_recent_id($type = 'entry')
	{
		// By default we only grab the primary id
		$fields = array($type.'_id');
		$sort = $type.'_date';
		
		switch($type)
		{
			case 'comment': $table = 'comments';
				break;
			case 'entry':
			default:
				$table = 'channel_titles';
				$fields[] = 'channel_id';
		}
		
		$this->db->select($fields);
		$this->db->order_by($sort, 'DESC');
		$this->db->where('site_id', $this->config->item('site_id'));
		
		if ($this->session->userdata['can_edit_other_entries'] != 'y')
		{
			$this->db->where('author_id', $this->session->userdata['member_id']);
		}

		$q = $this->db->get($table, 1);

		// Return the result if we found anything
		if ($q->num_rows() > 0)
		{
			return (count($fields) > 1) ? $q->row_array() : $q->row(current($fields));
		}
		
		return FALSE;
	}

	// --------------------------------------------------------------------
	
	/**
	 * Create Channel
	 *
	 * Inserts a new channel into the database
	 *
	 * @access	public
	 * @param	array
	 * @return	int
	 */
	function create_channel($data)
	{
		$this->db->insert('channels', $data);
		return $this->db->insert_id();
	}

	// --------------------------------------------------------------------

	/**
	 * Update Channel
	 *
	 * Updated an existing channel in the database
	 *
	 * @access	public
	 * @param	array
	 * @return	int
	 */
	function update_channel($data, $channel_id)
	{
		$this->db->where('channel_id', $channel_id);
		$this->db->update('channels', $data);
		return $this->db->affected_rows();
	}

	// --------------------------------------------------------------------

	/**
	 * Delete Channel
	 *
	 * Deletes a Channel and associated data
	 *
	 * @access	public
	 * @param	int		// channel id
	 * @param	array	// affected entry id's
	 * @param	array	// affected member id's
	 * @return	void
	 */
	function delete_channel($channel_id, $entries = array(), $authors = array())
	{
		$this->db->delete('channel_data', array('channel_id' => $channel_id));
		$this->db->delete('channel_titles', array('channel_id' => $channel_id));
		$this->db->delete('channels', array('channel_id' => $channel_id));

		if ($this->db->table_exists('comments'))
		{
			$this->db->delete('comments', array('channel_id' => $channel_id));
		}

		// delete Pages URIs for this Channel
		if (count($entries) > 0 && $this->config->item('site_pages') !== FALSE)
		{
			$pages = $this->config->item('site_pages');
			
			if (count($pages) > 0)
			{
				foreach($entries as $entry_id)
				{
					unset($pages['uris'][$entry_id]);
					unset($pages['templates'][$entry_id]);
				}
				
				$this->config->core_ini['site_pages'] = $pages;
				
				$this->db->where('site_id', $this->config->item('site_id'));
				$this->db->update('sites', array('site_pages' => base64_encode(serialize($pages))));
			}
		}
		
		// Just like a gossipy so-and-so, we will now destroy relationships! Category is also toast.
		if (count($entries) > 0)
		{
			// delete leftovers in category_posts
			$this->db->where_in('entry_id', $entries);
			$this->db->delete('category_posts');

			// delete parents
			$this->db->where_in('rel_parent_id', $entries);
			$this->db->delete('relationships');
			
			// are there children?
			$this->db->select('rel_id');
			$this->db->where_in('rel_child_id', $entries);
			$child_results = $this->db->get('relationships');

			if ($child_results->num_rows() > 0)
			{
				// We have children, so we need to do a bit of housekeeping
				// so parent entries don't continue to try to reference them
				$cids = array();

				foreach ($child_results->result_array() as $row)
				{
					$cids[] = $row['rel_id'];
				}

				foreach($fquery->result_array() as $row)
				{
					$this->db->where_in('field_id_'.$row['field_id'], $cids);
					$this->db->update('channel_data', array('field_id_'.$row['field_id'] => 0));
				}
			}

			// aaaand delete
			$this->db->where_in('rel_child_id', $entries);
			$this->db->delete('relationships');
		}

		// update author stats
		foreach ($authors as $author_id)
		{
			$this->db->where('author_id', $author_id);
			$total_entries = $this->db->count_all_results('channel_titles');
			
			$this->db->where('author_id', $author_id);
			$total_comments = $this->db->count_all_results('comments');

			$this->db->where('member_id', $author_id);
			$this->db->update('members', array( 'total_entries' => $total_entries,'total_comments' => $total_comments));
		}

		// I can count my stats, 1 2 3
		$this->stats->update_channel_stats();
		$this->stats->update_comment_stats('', '', TRUE);
	}

	// --------------------------------------------------------------------
	
	/**
	 * Update Comment Expiration
	 *
	 * Updates comment expiration for all entries for a channel
	 *
	 * @access	public
	 * @param	int		channel id
	 * @param	int		comment expiration
	 * @return	int		affected rows
	 */
	function update_comment_expiration($channel_id, $comment_expiration)
	{
		$this->db->where('channel_id', $channel_id);
		$this->db->set('comment_expiration_date', "(`entry_date` + {$comment_expiration})", FALSE);
		$this->db->update('channel_titles');
		return $this->db->affected_rows();
	}

	// --------------------------------------------------------------------
	
	/**
	 * Clear Versioning Data
	 *
	 * @access	public
	 * @param	int
	 * @return	int
	 */
	function clear_versioning_data($channel_id)
	{
		$this->db->where('channel_id', $channel_id);
		$this->db->delete('entry_versioning');
		return $this->db->affected_rows();
	}

	// --------------------------------------------------------------------
	
}
// END CLASS

/* End of file channel_model.php */
/* Location: ./system/expressionengine/models/channel_model.php */