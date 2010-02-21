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
class Search_model extends CI_Model {

	function Search_model()
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
	function get_filtered_entries($data, $order = array(), $cp = TRUE)
	{
		$return_data = array('pageurl' => '', 'total_count' => 0, 'results' => array());
		$ids = array();
		
		$return_data['total_count'] = $this->build_main_query($data,  $order, TRUE);
	
		if ($return_data['total_count'] == 0)
		{
			return $return_data;
		}

		$base_results = $this->build_main_query($data, $order, FALSE);

		$return_data['pageurl'] = $base_results['pageurl'];

		if ($data['search_in'] == 'comments')
		{
			foreach ($base_results['result_obj']->result_array() as $row)
			{
				$ids[] = $row['comment_id'];
			}
			
			$return_data['pageurl'] = $base_results['pageurl'];
			$return_data['ids'] = $ids;

			return $return_data;			
		}
		
		foreach ($base_results['result_obj']->result_array() as $row)
		{
			$ids[] = $row['entry_id'];
		}

		// print_r($ids);

		$results = $this->get_full_cp_query($data, $ids, $order);

		$return_data['results'] = $results->result_array();

		return $return_data;
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
	function build_main_query($data, $order = array(), $do_count = FALSE, $cp = TRUE)
	{
		$where_clause = '';
		$pageurl = '';
		
		$searchable_fields = $this->get_searchable_fields($data['channel_id']);

		if ($data['search_in'] == 'comments')
		{
			$this->db->distinct();

			if ($do_count == FALSE)
			{
				$this->db->select('comments.comment_id', FALSE);
			}
		}
		else
		{
			if ($data['cat_id'] == 'none' OR $data['cat_id'] != "")
			{
				$this->db->distinct();
			
				if ($do_count == FALSE)
				{
					$this->db->select('channel_titles.entry_id', FALSE);
				}
			}
			else
			{
				if ($do_count == FALSE)
				{
					$this->db->select('channel_titles.entry_id', FALSE);
				}
			} 
		}

		$this->db->from('channel_titles');

		$this->db->join('channels', 'exp_channel_titles.channel_id = exp_channels.channel_id ', 'left');

		if ($data['keywords'] != '')
		{
			if ($data['search_in'] != 'title')
			{
				$this->db->join('channel_data', 'exp_channel_titles.entry_id = exp_channel_data.entry_id ', 'left');
			}

			if ($data['search_in'] == 'everywhere' OR $data['search_in'] == 'comments')
			{
				$this->db->join('comments', 'exp_channel_titles.entry_id = exp_comments.entry_id', 'left');
			}
		}
		elseif ($data['search_in'] == 'comments')
		{
			$this->db->join('comments', 'exp_channel_titles.entry_id = exp_comments.entry_id', 'left');
		}

		$this->db->join('members', 'exp_members.member_id = exp_channel_titles.author_id', 'left');


		if ($data['cat_id'] == 'none' OR $data['cat_id'] != "")					 
		{
			$this->db->join('category_posts', 'exp_channel_titles.entry_id = exp_category_posts.entry_id', 'left');				
			$this->db->join('categories', 'exp_category_posts.cat_id = exp_categories.cat_id', 'left');
		}

		//if (is_array($extra_sql) && isset($extra_sql['tables']))
		//{
			// Think this is extension fed- and not currently available?  @todo double check
		//}

		// Construct our where clause - this is annoying
		// Limit to channels assigned to user  

		$where_clause .= "exp_channels.site_id = '".$this->db->escape_str($this->config->item('site_id'))."'";


		if ( ! $this->cp->allowed_group('can_edit_other_entries') AND ! $this->cp->allowed_group('can_view_other_entries'))
		{
			$where_clause .= " AND exp_channel_titles.author_id = ".$this->session->userdata('member_id'); 
		}

		if ($data['keywords'] != '')
		{
			$pageurl .= AMP.'keywords='.base64_encode($data['keywords']);

			if ($data['search_in'] == 'comments')
			{
				// When searching in comments we do not want to search the entry title.
				// However, by removing this we would have to make the rest of the query creation code
				// below really messy so we simply check for an empty title, which should never happen.
				// That makes this check pointless and allows us some cleaner code. -Paul

				$where_clause .= " AND (exp_channel_titles.title = '' ";
			}
			else
			{
				if ($data['exact_match'] != 'yes')
				{			
					$where_clause .= " AND (exp_channel_titles.title LIKE '%".$this->db->escape_like_str($data['search_keywords'])."%' ";
				}
				else
				{	
					$pageurl .= AMP.'exact_match=yes';

					$where_clause .= " AND (exp_channel_titles.title = '".$this->db->escape_str($data['search_keywords'])."' OR exp_channel_titles.title LIKE '".$this->db->escape_like_str($data['search_keywords'])." %' OR exp_channel_titles.title LIKE '% ".$this->db->escape_like_str($data['search_keywords'])." %' ";
				}
			}

			$pageurl .= AMP.'search_in='.$data['search_in'];

			if ($data['search_in'] == 'body' OR $data['search_in'] == 'everywhere')
			{
				foreach ($searchable_fields as $val)
				{					
					if ($data['exact_match'] != 'yes')
					{
						$where_clause .= " OR exp_channel_data.field_id_".$val." LIKE '%".$this->db->escape_like_str($data['search_keywords'])."%' ";				
					}
					else
					{
						$where_clause .= "  OR (exp_channel_data.field_id_".$val." LIKE '".$this->db->escape_like_str($data['search_keywords'])." %' OR exp_channel_data.field_id_".$val." LIKE '% ".$this->db->escape_like_str($data['search_keywords'])." %' OR exp_channel_data.field_id_".$val." = '".$this->db->escape_str($data['search_keywords'])."') ";
					}
				}
			}

			if ($data['search_in'] == 'everywhere' OR $data['search_in'] == 'comments')
			{
				if ($data['search_in'] == 'comments' && (substr(strtolower($data['search_keywords']), 0, 3) == 'ip:' OR substr(strtolower($data['search_keywords']), 0, 4) == 'mid:'))
				{
					if (substr(strtolower($data['search_keywords']), 0, 3) == 'ip:')
					{
						$where_clause .= " OR (exp_comments.ip_address = '".$this->db->escape_str(str_replace('_','.',substr($data['search_keywords'], 3)))."') ";
					}
					elseif(substr(strtolower($data['search_keywords']), 0, 4) == 'mid:')
					{
						$where_clause .= " OR (exp_comments.author_id = '".$this->db->escape_str(substr($data['search_keywords'], 4))."') ";
					}
				}
				else
				{
					$where_clause .= " OR (exp_comments.comment LIKE '%".$this->db->escape_like_str($data['keywords'])."%') "; // No ASCII conversion here!
				}
			}

			$where_clause .= ")";
		}

		if ($data['channel_id'] != '')
		{
			$pageurl .= AMP.'channel_id='.$data['channel_id'];
			$where_clause .= " AND exp_channel_titles.channel_id = ".$data['channel_id'];
		}

		if ($data['date_range'])
		{
			$pageurl .= AMP.'date_range='.$data['date_range'];
			$date_range = time() - ($data['date_range'] * 60 * 60 * 24);
			$where_clause .= " AND exp_channel_titles.entry_date > $date_range";
		}

		if (is_numeric($data['cat_id']))
		{
			$pageurl .= AMP.'cat_id='.$data['cat_id'];
			$where_clause .= " AND exp_category_posts.cat_id = '".$data['cat_id']."'	 
					  AND exp_category_posts.entry_id = exp_channel_titles.entry_id ";
		}

		if ($data['cat_id'] == 'none')
		{
			$pageurl .= AMP.'cat_id='.$data['cat_id'];
			$where_clause .= " AND exp_category_posts.entry_id IS NULL ";
		}		

		if ($data['status'] && $data['status'] != 'all')
		{
			$pageurl .= AMP.'status='.$data['status'];

			$where_clause .= " AND exp_channel_titles.status = '".$data['status']."'";
		}

		$this->db->where($where_clause, NULL, FALSE);


		if (is_array($order) && count($order) > 0)
		{
			foreach ($order as $key => $val)
			{
				$this->db->order_by($key, $val);
			}
		}
		else
		{
			$this->db->order_by('entry_date', 'desc');
		}
		
		if ($do_count == FALSE)
		{
			$this->db->limit($data['perpage'], $data['rownum']);
		}

/*
@todo: deal w/this later

		if ($order)
		{
			$pageurl .= AMP.'order='.$order;

			switch ($order)
			{
				case 'asc'	: $end .= "entry_date asc";
					break;
				case 'desc'	 : $end .= "entry_date desc";
					break;
				case 'alpha' : $end .= "title asc";
					break;
				default	  : $end .= "entry_date desc";
			}
		}
*/

		// ------------------------------
		//	 Are there results?
		// ------------------------------

		//$query = $this->db->query($sql_a.$sql_b.$sql);

		if ($do_count == TRUE)
		{
			return $this->db->count_all_results();
		}

		return array('pageurl' => $pageurl, 'result_obj' => $this->db->get());
	}

	function get_full_cp_query($data, $ids = array(), $order = array())
	{
		$select = ($data['cat_id'] == 'none' OR $data['cat_id'] != "") ? "DISTINCT(exp_channel_titles.entry_id), " : "exp_channel_titles.entry_id, ";

		$select .= "exp_channel_titles.channel_id,		 
				exp_channel_titles.title, 
				exp_channel_titles.author_id, 
				exp_channel_titles.status, 
				exp_channel_titles.entry_date, 
				exp_channel_titles.dst_enabled,
				exp_channel_titles.comment_total, 
				exp_channels.live_look_template,
				exp_members.username,
				exp_members.email,
				exp_members.screen_name";
				
				
		$this->db->select($select, FALSE);
		$this->db->from('channel_titles');
		$this->db->join('channels', 'exp_channel_titles.channel_id = exp_channels.channel_id', 'left');
		$this->db->join('members', 'exp_members.member_id = exp_channel_titles.author_id', 'left');


		// left instead of inner
		// inner would mean we exclude entries that don't belong to a category, which
		// seems undesirable.
		if ($data['cat_id'] != 'none' AND $data['cat_id'] != "")
		{
			$this->db->join('category_posts', 'exp_channel_titles.entry_id = exp_category_posts.entry_id', 'left');
			$this->db->join('categories', 'exp_category_posts.cat_id = exp_categories.cat_id', 'left');
		}

		$where_clause = "exp_channel_titles.entry_id IN (";

		foreach ($ids as $id)
		{
			$where_clause .= $id.',';
		}

		$where_clause = substr($where_clause, 0, -1).")";
		
		$this->db->where($where_clause, NULL, FALSE);
		
		if (is_array($order) && count($order) > 0)
		{
			foreach ($order as $key => $val)
			{
				$this->db->order_by($key, $val);
			}
		}
		else
		{
			$this->db->order_by('entry_date', 'desc');
		}

		//$this->db->limit($data['perpage'], $data['rownum']);

		return $this->db->get();
	}

	function get_searchable_fields($channel_id = '')
	{
				// ---------------------------------------
				//	 Fetch the searchable field names
				// ---------------------------------------

				$fields = array();

				$this->db->distinct();
				$this->db->select('field_group');

				if ($channel_id != '')
				{
					$this->db->where('channel_id', $channel_id);
				}

				$query = $this->db->get('channels');

				if ($query->num_rows() > 0)
				{
					foreach ($query->result_array() as $row)
					{
						$fql[] = $row['field_group'];	
					}
					
					$this->db->select('field_id');
					$this->db->where_in('group_id', $fql);

					$query =  $this->db->get('channel_fields');

					if ($query->num_rows() > 0)
					{
						foreach ($query->result_array() as $row)
						{
							$fields[] = $row['field_id'];
						}
					}
				}
	
		return $fields;
	}
	
	function comment_search($channel_id = '', $entry_id = '', $id_array = '', $total_rows = '', $validate = '', $order = array())
	{
		$return_data['error'] = FALSE;
		$return_data['results'] = array();
		$return_data['total_comments'] = $total_rows;

		if ($validate OR is_array($id_array))
		{
			if ( ! $this->cp->allowed_group('can_moderate_comments'))
			{
				$results['error'] = $this->lang->line('unauthorized_access');
				return $results['error'];
			}

			if (is_array($id_array))
			{
				$validate = TRUE;

				$this->db->select('comments.*, channels.channel_name, channel_titles.title AS entry_title');
				$this->db->from(array('comments', 'channels', 'channel_titles'));
				$this->db->where_in('comments.comment_id', $id_array);
				$this->db->where('comments.entry_id = '.$this->db->dbprefix('channel_titles.entry_id'));
				$this->db->where('comments.channel_id = '.$this->db->dbprefix('channels.channel_id'));
			}
			else
			{
				$this->db->select('comments.*, channels.channel_name, channel_titles.title AS entry_title');
				$this->db->from(array('comments', 'channels', 'channel_titles'));
				$this->db->where('comments.status', 'c');
				$this->db->where('comments.entry_id = '.$this->db->dbprefix('channel_titles.entry_id'));
				$this->db->where('comments.channel_id = '.$this->db->dbprefix('channels.channel_id'));
			}

			
			if (is_array($order) && count($order) > 0)
			{
				foreach ($order as $key => $val)
				{
					$this->db->order_by($key, $val);
				}
			}
			else
			{
				$this->db->order_by('comment_date', 'desc');
			}			
			
			$query = $this->db->get();

			$return_data['results'] = $query->result_array();
			
			return $return_data;
		}
		else
		{
			// @confirm can this be removed / reduced - similar check at the beginning
			if ($entry_id == '')
			{
				if ( ! $entry_id = $this->input->get('entry_id'))
				{
					$results['error'] = $this->lang->line('unauthorized_access');
					return $results['error'];
				}
			}

			if ($channel_id == '')
			{
				if ( ! $channel_id = $this->input->get('channel_id'))
				{
					$results['error'] = $this->lang->line('unauthorized_access');
					return $results['error'];
				}
			}

			if ( ! is_numeric($entry_id) OR ! is_numeric($channel_id))
			{
				$results['error'] = $this->lang->line('unauthorized_access');
				return $results['error'];
			}


			/** ---------------------------------------
			/**	 Fetch Author ID and verify privs
			/** ---------------------------------------*/

			$this->db->select('author_id, title');
			$query = $this->db->get_where('channel_titles', array('entry_id' => $entry_id));

			if ($query->num_rows() == 0)
			{
				$results['error'] = $this->lang->line('no_channel_exists');
				return $results['error'];
			}

			if ($query->row('author_id')  != $this->session->userdata('member_id'))
			{
				if ( ! $this->cp->allowed_group('can_view_other_comments'))
				{
					$results['error'] = $this->lang->line('unauthorized_access');
					return $results['error'];
				}
			}

			$et = $query->row('title') ;

			// Fetch comment ID numbers

			$this->db->select('comment_date, comment_id');

			if (is_array($order) && count($order) > 0)
			{
				foreach ($order as $key => $val)
				{
					$this->db->order_by($key, $val);
				}
			}
			else
			{
				$this->db->order_by('comment_date', 'desc');
			}

			$id_query = $this->db->get_where('comments', array('entry_id' => $entry_id));

			// No results?  No reason to continue...
			
			$return_data['total_comments'] = $id_query->num_rows();

			if ($id_query->num_rows() == 0)
			{
				//$message = $this->lang->line('no_comments');
				$return_data['results'] = $id_query->result_array();
				return $return_data;
			}
			
			foreach($id_query->result_array() as $row)
			{
				$c_ids[] = $row['comment_id'];
			}


			// Fetch Comments if necessary

			$this->db->select('comment_id, entry_id, status, channel_id, author_id, name, email, url, location, ip_address, comment_date, comment');
			$this->db->where_in('comment_id', $c_ids);
			$query = $this->db->get('comments');

			$return_data['results'] = $query->result_array();
			
			return $return_data;
		}
	}
}

/* End of file search_model.php */
/* Location: ./system/expressionengine/models/search_model.php */