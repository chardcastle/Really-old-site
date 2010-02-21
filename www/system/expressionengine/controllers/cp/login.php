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
 * ExpressionEngine Login Class
 *
 * @package		ExpressionEngine
 * @subpackage	Control Panel
 * @category	Control Panel
 * @author		ExpressionEngine Dev Team
 * @link		http://expressionengine.com
 */ 
class Login extends Controller {
	
	var $username = '';		// stores username on login failure

	function Login()
	{
		// Call the Controller constructor.  
		// Without this, the world as we know it will end!
		parent::Controller();	

		// Does the "core" class exist?  Normally it's initialized
		// automatically via the autoload.php file.  If it doesn't
		// exist it means there's a problem.
		if ( ! isset($this->core) OR ! is_object($this->core))
		{
			show_error('The ExpressionEngine Core was not initialized.  Please make sure your autoloader is correctly set up.');
		}

		$this->lang->loadfile('login');
	}
	
	// --------------------------------------------------------------------

	/**
	 * Index function
	 * 
	 * Every controller must have an index function, which gets called
	 * automatically by CodeIgniter when the URI does not contain a call to
	 * a specific method call
	 *
	 * @access	public
	 * @return	mixed
	 */	
	function index()
	{
		$this->login_form();
	}
	
	// --------------------------------------------------------------------

	/**
	 * Login Form
	 *
	 * @access	public
	 * @param	string
	 * @return	null
	 */	
	function login_form()
	{
		// If an ajax request ends up here the user is probably logged out
		if ($this->input->server('HTTP_X_REQUESTED_WITH') && ($this->input->server('HTTP_X_REQUESTED_WITH') == 'XMLHttpRequest'))
		{
			$this->output->set_status_header(401);
			die('C=login');
		}
		
		
		$this->load->helper('form');
		
		$message = $this->session->flashdata('message');
		
		$this->cp->set_variable('return_path',		SELF);
		$this->cp->set_variable('message',			$message);
		$this->cp->set_variable('cp_page_title',	$this->lang->line('login'));
		$this->cp->set_variable('cp_page_onload',	"document.forms[0].username.focus();");
		
		$vars['username'] = ($this->username) ? form_prep($this->username) : '';
		
		// @confirm there is no way this works - silly bookmarklet
		if ($this->input->get('BK'))
		{
			if ( ! isset($_SERVER['QUERY_STRING']))
			{
				$qstr = (isset($_SERVER['REQUEST_URI'])) ? $_SERVER['REQUEST_URI'] : '';
			}
			else
			{
				$qstr = $_SERVER['QUERY_STRING'];
			}
		}
							
		if ($this->input->get('BK') AND $qstr != '')
		{
			$qstr = preg_replace("#.*?C=publish(.*?)#", "C=publish\\1", $qstr);
		
			// @todo remove all dsp from this file - starting with this one
			$r .= $this->dsp->input_hidden('bm_qstr', $qstr);
		}

		$this->load->view('account/login', $vars);
	}  
	
	// --------------------------------------------------------------------

	/**
	 * Authenticate user
	 *
	 * @access	public
	 * @return	mixed
	 */	
	function authenticate()
	{
		/** ----------------------------------------
		/**  No username/password?  Bounce them...
		/** ----------------------------------------*/
	
		if ( ! $this->input->post('username'))
		{
			$this->session->set_flashdata('message', $this->lang->line('no_username'));
			$this->functions->redirect(BASE.AMP.'C=login');
		}
		
		$this->username = $this->input->post('username');
		
		if ( ! $this->input->get_post('password'))
		{
			$this->session->set_flashdata('message', $this->lang->line('no_password'));
			$this->functions->redirect(BASE.AMP.'C=login');
		}

		/* -------------------------------------------
		/* 'login_authenticate_start' hook.
		/*  - Take control of CP authentication routine
		/*  - Added EE 1.4.2
		*/
			$edata = $this->extensions->call('login_authenticate_start');
			if ($this->extensions->end_script === TRUE) return;
		/*
		/* -------------------------------------------*/
		
		/** ----------------------------------------
		/**  Is IP and User Agent required for login?
		/** ----------------------------------------*/
	
		if ($this->config->item('require_ip_for_login') == 'y')
		{
			if ($this->session->userdata['ip_address'] == '' OR $this->session->userdata['user_agent'] == '')
			{
				$this->session->set_flashdata('message', $this->lang->line('unauthorized_request'));
				$this->functions->redirect(BASE.AMP.'C=login');
			}
		}
		
		/** ----------------------------------------
		/**  Check password lockout status
		/** ----------------------------------------*/
		
		if ($this->session->check_password_lockout() === TRUE)
		{
			$line = $this->lang->line('password_lockout_in_effect');
		
			$line = str_replace("%x", $this->config->item('password_lockout_interval'), $line);
		
			$this->session->set_flashdata('message', $line);
			$this->functions->redirect(BASE.AMP.'C=login');
		}
				
		/** ----------------------------------------
		/**  Fetch member data
		/** ----------------------------------------*/
		
		// @todo: move to model... in fact, there are a few in this file to move
		$this->db->select('members.password, members.unique_id, members.member_id, members.group_id, member_groups.can_access_cp');
		$this->db->where('username', $this->input->post('username'));
		$this->db->where('member_groups.site_id', $this->config->item('site_id'));
		$this->db->where('members.group_id = '.$this->db->dbprefix('member_groups.group_id'));
		
		$query = $this->db->get(array('members', 'member_groups'));
		
		/** ----------------------------------------
		/**  Invalid Username
		/** ----------------------------------------*/
		if ($query->num_rows() == 0)
		{
			$this->session->save_password_lockout();
			
			$this->session->set_flashdata('message', $this->lang->line('credential_missmatch'));
			$this->functions->redirect(BASE.AMP.'C=login');
		}
		
		/** ----------------------------------------
		/**  Check password
		/** ----------------------------------------*/
		$this->load->helper('security');

		$password = do_hash($this->input->post('password'));
		
		if ($query->row('password') != $password)
		{
			// To enable backward compatibility with pMachine we'll test to see 
			// if the password was encrypted with MD5.  If so, we will encrypt the
			// password using SHA1 and update the member's info.
			
			$password = do_hash($this->input->post('password'), 'md5');

			if ($query->row('password') == $password)
			{
				$password = do_hash($this->input->post('password'));
				
				$this->db->set('password', $password);
				$this->db->where('member_id', $query->row('member_id'));
				$this->db->update('members');
			}
			else
			{
				/** ----------------------------------------
				/**  Invalid password
				/** ----------------------------------------*/
					
				$this->session->save_password_lockout();

				$this->session->set_flashdata('message', $this->lang->line('credential_missmatch'));
				$this->functions->redirect(BASE.AMP.'C=login');
			}
		}
		
		
		/** ----------------------------------------
		/**  Is the user banned?
		/** ----------------------------------------*/
		
		// Super Admins can't be banned
		
		if ($query->row('group_id') != 1)
		{
			if ($this->session->ban_check())
			{
				return $this->output->fatal_error($this->lang->line('not_authorized'));
			}
		}
		
		/** ----------------------------------------
		/**  Is user allowed to access the CP?
		/** ----------------------------------------*/
		
		if ($query->row('can_access_cp') != 'y')
		{
			$this->session->set_flashdata('message', $this->lang->line('not_authorized'));
			$this->functions->redirect(BASE.AMP.'C=login');
		}
		
		/** --------------------------------------------------
		/**  Do we allow multiple logins on the same account?
		/** --------------------------------------------------*/
		
		if ($this->config->item('allow_multi_logins') == 'n')
		{
			// Kill old sessions first
		
			$this->session->gc_probability = 100;
			
			$this->session->delete_old_sessions();
		
			$expire = time() - $this->session->session_length;
			
			// See if there is a current session

			$this->db->select('ip_address, user_agent');
			$this->db->where('member_id', $query->row('member_id'));
			$this->db->where('last_activity >', $expire);
			$result = $this->db->get('sessions');

			// If a session exists, trigger the error message
								
			if ($result->num_rows() == 1)
			{
				if ($this->session->userdata['ip_address'] != $result->row('ip_address')  OR 
					$this->session->userdata['user_agent'] != $result->row('user_agent')  )
				{
					$this->session->set_flashdata('message', $this->lang->line('multi_login_warning'));
					$this->functions->redirect(BASE.AMP.'C=login');
				}				
			} 
		}  
		
		/** ----------------------------------------
		/**  Is the UN/PW the correct length?
		/** ----------------------------------------*/
		
		// If the admin has specfified a minimum username or password length that
		// is longer than the current users's data we'll have them update their info.
		// This will only be an issue if the admin has changed the un/password requiremements
		// after member accounts already exist.
		
		$uml = $this->config->item('un_min_len');
		$pml = $this->config->item('pw_min_len');
		
		$ulen = strlen($this->input->post('username'));
		$plen = strlen($this->input->post('password'));
		
		if ($ulen < $uml OR $plen < $pml)
		{
			return $this->_un_pw_update_form();
		}
		
		/** ----------------------------------------
		/**  Set cookies
		/** ----------------------------------------*/
		
		// Set cookie expiration to one year if the "remember me" button is clicked
		$expire = ( ! isset($_POST['remember_me'])) ? '0' : 60*60*24*365;
		
		if ($this->config->item('admin_session_type') != 's')
		{
			$this->functions->set_cookie($this->session->c_expire , time()+$expire, $expire);
			$this->functions->set_cookie($this->session->c_uniqueid , $query->row('unique_id') , $expire);		
			$this->functions->set_cookie($this->session->c_password , $password,  $expire);	
			$this->functions->set_cookie($this->session->c_anon , 1,  $expire);
		}
		
		if ( isset($_POST['site_id']) && is_numeric($_POST['site_id']))
		{
			$this->functions->set_cookie('cp_last_site_id', $this->input->post('site_id'), 0);
		}
		
		/** ----------------------------------------
		/**  Create a new session
		/** ----------------------------------------*/
		$session_id = $this->session->create_new_session($query->row('member_id') , TRUE);

		/* -------------------------------------------
		/* 'cp_member_login' hook.
		/*  - Additional processing when a member is logging into CP
		*/
			$edata = $this->extensions->call('cp_member_login', $query->row());
			if ($this->extensions->end_script === TRUE) return;
		/*
		/* -------------------------------------------*/
			
		/** ----------------------------------------
		/**  Log the login
		/** ----------------------------------------*/
		
		// We'll manually add the username to the Session array so
		// the LOG class can use it.
		$this->session->userdata['username']  = $this->input->post('username');
		
		$this->logger->log_action($this->lang->line('member_logged_in'));
		
		/** ----------------------------------------
		/**  Delete old password lockouts
		/** ----------------------------------------*/
		
		$this->session->delete_password_lockout();

		/** ----------------------------------------
		/**  Redirect the user to the CP home page
		/** ----------------------------------------*/
		
		$return_path = $this->input->post('return_path').'?S='.$session_id;
		
		$return_path = str_replace(array('&#46;','&#63;','&amp;'), array('.','?','&'), $return_path);
		
		if ($this->input->post('bm_qstr'))
		{
			$return_path .= AMP.$this->input->post('bm_qstr');
		}

		$this->functions->redirect($return_path);
	}
	
	// --------------------------------------------------------------------

	/**
	 * Username/password update form
	 *
	 * This form gets shown if a user tries to log-in after the admin has
	 * changed the length requirements for a username or password.  It
	 * permits the user to update their un/pw so it conforms to the new
	 * requirements
	 *
	 * @access	private
	 * @param	string
	 * @return	mixed
	 */
	function _un_pw_update_form($message = '')
	{
		$this->lang->loadfile('member');
		
		$uml = $this->config->item('un_min_len');
		$pml = $this->config->item('pw_min_len');
		
		$ulen = strlen($this->input->post('username'));
		$plen = strlen($this->input->post('password'));
		
		$r  = $this->dsp->form_open(array('action' => 'C=login'.AMP.'M=update_un_pw'));
		
		$r .= $this->dsp->div('loginInnerBox');		
		$r .= $this->dsp->qdiv('alert', $this->lang->line('access_notice'));
		
		if ($ulen < $uml)
		{
			$r .= $this->dsp->qdiv('itemWrapperTop', $this->dsp->qdiv('highlight_alt', str_replace('%x', $uml, $this->lang->line('un_len'))));
			$r .= $this->dsp->qdiv('itemWrapper', $this->dsp->qdiv('highlight', str_replace('%x', $ulen, $this->lang->line('yun_len'))));
		}
	
		if ($plen < $pml)
		{
			$r .= $this->dsp->qdiv('itemWrapperTop', $this->dsp->qdiv('highlight_alt', str_replace('%x', $pml, $this->lang->line('pw_len'))));
			$r .= $this->dsp->qdiv('itemWrapper', $this->dsp->qdiv('highlight', str_replace('%x', $plen, $this->lang->line('ypw_len'))));
		}
		
		$r .= $this->dsp->qdiv('padBotBorder', NBS);
		
		if ($message != '')
		{
			$r .= $this->dsp->qdiv('alert', BR.$message);
		}
		
		if ($ulen < $uml)
		{
			$new_username = ($this->input->get_post('new_username') !== FALSE) ? $this->input->get_post('new_username') : '';
		
			$r .=	$this->dsp->qdiv('default', BR.$this->lang->line('choose_new_un', 'new_username')).
					$this->dsp->qdiv('itemWrapper', $this->dsp->input_text('new_username', $new_username, '20', '32', 'input', '150px'));
		}		

		if ($plen < $pml)
		{				
			$r .=	$this->dsp->qdiv('default', BR.$this->lang->line('choose_new_pw', 'new_password')).
					$this->dsp->qdiv('itemWrapper', $this->dsp->input_pass('new_password', '', '20', '32', 'input', '150px'));
					
			$r .=	$this->dsp->qdiv('itmeWrapper', $this->lang->line('confirm_new_pw', 'new_password_confirm')).
					$this->dsp->qdiv('itemWrapper', $this->dsp->input_pass('new_password_confirm', '', '20', '32', 'input', '150px'));
		}				
				
				
		$r .= $this->dsp->qdiv('padBotBorder', NBS);
				
				
		$r .=
			$this->dsp->qdiv('default', BR.$this->lang->line('existing_username', 'username')).
			$this->dsp->qdiv('itemWrapper', $this->dsp->input_text('username', $this->input->post('username'), '20', '32', 'input', '150px')).
			$this->dsp->qdiv('default', BR.$this->lang->line('existing_password', 'password')).
			$this->dsp->qdiv('itemWrapper', $this->dsp->input_pass('password', '', '20', '32', 'input', '150px'));
		

		$r .= $this->dsp->qdiv('itemWrapperTop', $this->dsp->input_submit($this->lang->line('submit')));
			
		  
		$r .= $this->dsp->div_c();	
		$r .= $this->dsp->form_close();

				
		$this->dsp->body = $this->dsp->qdiv('loginBox', $r);
		$this->dsp->title = $this->lang->line('login');				
	}
	
	// --------------------------------------------------------------------

	/**
	 * Update the username/password
	 *
	 * This function performs the update once the update form is submitted
	 *
	 * @access	public
	 * @return	mixed
	 */
	function update_un_pw()
	{
		$this->lang->loadfile('member');
		
		$missing = FALSE;
		
		if ( ! isset($_POST['new_username']) AND  ! isset($_POST['new_password']))
		{
			$missing = TRUE;
		}
		
		if ((isset($_POST['new_username']) AND $_POST['new_username'] == '') OR (isset($_POST['new_password']) AND $_POST['new_password'] == ''))
		{
			$missing = TRUE;
		}
		
		if ($this->input->post('username') == '' OR $this->input->get_post('password') == '')
		{
			$missing = TRUE;
		}

		if ($missing == TRUE)
		{
			return $this->_un_pw_update_form($this->lang->line('all_fields_required'));
		}
		
		/** ----------------------------------------
		/**  Check password lockout status
		/** ----------------------------------------*/
		
		if ($this->session->check_password_lockout() === TRUE)
		{		
			$line = str_replace("%x", $this->config->item('password_lockout_interval'), $this->lang->line('password_lockout_in_effect'));		
			return $this->_un_pw_update_form($line);
		}
						
		/** ----------------------------------------
		/**  Fetch member data
		/** ----------------------------------------*/
		
		$this->db->select('member_id, group_id');
		$this->db->where('username', $this->input->post('username'));
		$this->db->where('password', $this->input->post('password'));
		$query = $this->db->get('members');

		$member_id = $query->row('member_id') ;
		
		/** ----------------------------------------
		/**  Invalid Username or Password
		/** ----------------------------------------*/
		if ($query->num_rows() == 0)
		{
			$this->session->save_password_lockout();
			return $this->_un_pw_update_form($this->lang->line('invalid_existing_un_pw'));
		}
		
		/** ----------------------------------------
		/**  Is the user banned?
		/** ----------------------------------------*/
		
		// Super Admins can't be banned
		
		if ($query->row('group_id')  != 1)
		{
			if ($this->session->ban_check())
			{
				return $this->output->fatal_error($this->lang->line('not_authorized'));
			}
		}
				
		/** -------------------------------------
		/**  Instantiate validation class
		/** -------------------------------------*/
		
		// @todo Move to form validation...
		
		if ( ! class_exists('EE_Validate'))
		{
			require APPPATH.'libraries/Validate'.EXT;
		}
		
		$new_un  = (isset($_POST['new_username'])) ? $_POST['new_username'] : '';
		$new_pw  = (isset($_POST['new_password'])) ? $_POST['new_password'] : '';
		$new_pwc = (isset($_POST['new_password_confirm'])) ? $_POST['new_password_confirm'] : '';

		$VAL = new EE_Validate(
								array( 
										'val_type'			=> 'new',
										'fetch_lang' 		=> TRUE, 
										'require_cpw' 		=> FALSE,
									 	'enable_log'		=> FALSE,
										'username'			=> $new_un,
										'password'			=> $new_pw,
									 	'password_confirm'	=> $new_pwc,
									 	'cur_password'		=> $_POST['password'],
									 )
							);
		
		$un_exists = (isset($_POST['new_username']) AND $_POST['new_username'] != '') ? TRUE : FALSE;
		$pw_exists = (isset($_POST['new_password']) AND $_POST['new_password'] != '') ? TRUE : FALSE;
				
		if ($un_exists)
			$VAL->validate_username();
		if ($pw_exists)
			$VAL->validate_password();
		
		/** -------------------------------------
		/**  Display error is there are any
		/** -------------------------------------*/
		 if (count($VAL->errors) > 0)
		 {
		 	$er = '';
		 	
		 	foreach ($VAL->errors as $val)
		 	{
		 		$er .= $val.BR;
		 	}
		 
			return $this->_un_pw_update_form($er);
		 }
		 
		 
		if ($un_exists)
		{
			$this->db->set('username', $_POST['new_username']);
			$this->db->where('member_id', $member_id);
			$this->db->update('members');
		}	
						
		if ($pw_exists)
		{
			$this->load->helper('security');
			$this->db->set('password', do_hash($_POST['new_password']));
			$this->db->where('member_id', $member_id);
			$this->db->update('members');
		}	

		$this->dsp->body  = $this->dsp->div('loginBox').BR.BR.BR;
		$this->dsp->body .= $this->dsp->qdiv('success', $this->lang->line('unpw_updated'));
		$this->dsp->body .= $this->dsp->qdiv('itemWrapper', $this->dsp->anchor('index.php', $this->lang->line('return_to_login')));
		$this->dsp->body .= $this->dsp->div_c();
	}
	
	// --------------------------------------------------------------------

	/**
	 * Log-out
	 *
	 * @access	public
	 * @return	null
	 */
	function logout()
	{
		if ($this->session->userdata('group_id') == 3) {
			$this->functions->redirect(SELF);
		}
		
		$this->db->where('ip_address', $this->input->ip_address());
		$this->db->where('member_id', $this->session->userdata('member_id'));
		$this->db->delete('online_users');

		$this->db->where('session_id', $this->session->userdata['session_id']);
		$this->db->delete('sessions');
				
		$this->functions->set_cookie($this->session->c_uniqueid);		
		$this->functions->set_cookie($this->session->c_password);	
		$this->functions->set_cookie($this->session->c_session);	
		$this->functions->set_cookie($this->session->c_expire);	
		$this->functions->set_cookie($this->session->c_anon);	
		$this->functions->set_cookie('read_topics');  
		$this->functions->set_cookie('tracker');  

		$this->logger->log_action($this->lang->line('member_logged_out'));

		/* -------------------------------------------
		/* 'cp_member_logout' hook.
		/*  - Perform additional actions after logout
		/*  - Added EE 1.6.1
		*/
			$edata = $this->extensions->call('cp_member_logout');
			if ($this->extensions->end_script === TRUE) return;
		/*
		/* -------------------------------------------*/

		$this->functions->redirect(SELF);
	}
	
	// --------------------------------------------------------------------

	/**
	 * Forgotten password form
	 *
	 * @access	public
	 * @param	string
	 * @return	mixed
	 */
	function forgotten_password_form()
	{
		$this->load->helper('form');
		$message = $this->session->flashdata('message');
		
		$variables = array(	'email'			=> ( ! $this->input->post('email')) ? '' : $this->input->get_post('email'),
							'message' 		=> $message,
							'cp_page_title'	=> $this->lang->line('forgotten_password')
						  );
						  
		$this->load->view('account/forgot_password', $variables);
	}  
	
	// --------------------------------------------------------------------

	/**
	 * Request a forgotten password
	 *
	 * Accepts an email address as input, which gets looked up in the DB.
	 * An email is sent to the user with a confirmation link
	 *
	 * @access	public
	 * @return	mixed
	 */
	function request_new_password()
	{
		if ( ! $address = $this->input->post('email'))
		{
			$this->functions->redirect(BASE.AMP.'C=login'.AMP.'M=forgotten_password_form');
		}
		
		$address = strip_tags($address);
		
		// Fetch user data
		
		$this->db->select('member_id, username');
		$this->db->where('email', $address);
		$query = $this->db->get('members');
		
		if ($query->num_rows() == 0)
		{
			$this->session->set_flashdata('message', $this->lang->line('no_email_found'));
			$this->functions->redirect(BASE.AMP.'C=login'.AMP.'M=forgotten_password_form');
		}
		
		$member_id = $query->row('member_id') ;
		$username  = $query->row('username') ;
		
		// Kill old data from the reset_password field
		
		$time = time() - (60*60*24);
		
		$this->db->where('date <', $time);
		$this->db->or_where('member_id', $member_id);
		$this->db->delete('reset_password');
		
		// Create a new DB record with the temporary reset code
		
		$rand = $this->functions->random('alnum', 8);
				
		$data = array('member_id' => $member_id, 'resetcode' => $rand, 'date' => time());
		 
		$this->db->query($this->db->insert_string('exp_reset_password', $data));
		
		// Buid the email message
		
		$message  = $username.",".
					$this->dsp->nl(2).
					$this->lang->line('reset_link').
					$this->dsp->nl(2).
					$this->config->item('cp_url')."?D=cp&C=login&M=reset_password&id=".$rand.
					$this->dsp->nl(2).
					$this->lang->line('password_will_be_reset').
					$this->dsp->nl(2).
					$this->lang->line('ignore_password_message');
		 
		 
		// Instantiate the email class
			 
		$this->load->library('email');
		$this->email->wordwrap = true;
		$this->email->from($this->config->item('webmaster_email'), $this->config->item('webmaster_name'));	
		$this->email->to($address); 
		$this->email->subject($this->lang->line('your_new_login_info'));	
		$this->email->message($message);	

		$vars['message_success'] = '';
		$vars['message_error'] = '';

		if ( ! $this->email->send())
		{
			$vars['message_error'] = $this->lang->line('error_sending_email');
		} 
		else 
		{	
			$vars['message_success'] = $this->lang->line('forgotten_email_sent');
		}

		$this->load->view('account/request_new_password', $vars);
	}
	
	// --------------------------------------------------------------------

	/**
	 * Rest the password
	 *
	 * This function is called when a user clicks the confirmation link
	 * in the email they are sent when they request a new password
	 *
	 * @access	public
	 * @param	string
	 * @return	mixed
	 */
	function reset_password()
	{
		if ( ! $id = $this->input->get('id'))
		{
			$this->functions->redirect(BASE.AMP.'C=login');
		}
		
		$time = time() - (60*60*24);
					
		// Get the member ID from the reset_password field	
		
		$this->db->select('member_id');
		$this->db->where('resetcode', $id);
		$this->db->where('date >', $time);
		$query = $this->db->get('reset_password');
		
		if ($query->num_rows() == 0)
		{
			$this->functions->redirect(BASE.AMP.'C=login');
		}
		
		$member_id = $query->row('member_id') ;
				
		// Fetch the user data
		
		$this->db->select('username, email');
		$this->db->where('member_id', $member_id);
		$query = $this->db->get('members');
		
		if ($query->num_rows() == 0)
		{
			$this->functions->redirect(BASE.AMP.'C=login');
		}
		
		$address	= $query->row('email') ;
		$username  = $query->row('username') ;
				
		$rand = $this->functions->random('alnum', 8);
		
		// Update member's password
		$this->load->helper('security');
		$this->db->set('password', do_hash($rand));
		$this->db->where('member_id', $member_id);
		$this->db->update('members');
		
		// Kill old data from the reset_password field
		
		$this->db->where('date <', $time);
		$this->db->or_where('member_id', $member_id);
		$this->db->delete('reset_password');
				
		// Buid the email message
		
		$message  = $username.",".
					$this->dsp->nl(2).
					$this->lang->line('new_login_info').
					$this->dsp->nl(2).
					$this->lang->line('username').': '.$username.
					$this->dsp->nl(1).
					$this->lang->line('password').': '.$rand;
		 
		 
		// Instantiate the email class
			 
		$this->load->library('email');
		$this->email->wordwrap = true;
		$this->email->from($this->config->item('webmaster_email'), $this->config->item('webmaster_name'));
		$this->email->to($address); 
		$this->email->subject($this->lang->line('your_new_login_info'));	
		$this->email->message($message);	
		
		if ( ! $this->email->send())
		{
			$res = $this->lang->line('error_sending_email');
		} 
		else
		{	
			$res = $this->lang->line('password_has_been_reset');
		}
		
		$this->session->set_flashdata('message', $res);
		$this->functions->redirect(BASE.AMP.'C=login');
	}
}
// END CLASS

/* End of file login.php */
/* Location: ./system/expressionengine/controllers/cp/login.php */