<?php
/*
=====================================================
 ExpressionEngine
=====================================================
 File: pi.whitespace.php
-----------------------------------------------------
 Purpose: Strip out excess whitespace
=====================================================
*/

$plugin_info = array(
						'pi_name'			=> 'Whitespace',
						'pi_version'		=> '1.0',
						'pi_author'			=> 'Chris Hardcastle',
						'pi_author_url'		=> 'http://www.chrishardcastle.co.uk/',
						'pi_description'	=> 'Strips out excess whitespace',
						'pi_usage'			=> Whitespace::usage()
					);


Class Whitespace
{
    var $return_data = '';
    
    // ------------------------
	// Constructor
	// ------------------------
	
	function Whitespace($str = '')
	{
    	$this->EE =& get_instance(); 

	    
	    if ($str == '')
        	$str = $this->EE->TMPL->tagdata;
        	
        // strip white space
	    $str = preg_replace('/\s\s+/', ' ', $str);
	    $str = preg_replace('/\\n/', '', $str);
	    $str = preg_replace('/\\t/', '', $str);
	    $str = preg_replace('/\\r/', '', $str);
	    $str = preg_replace('/"/', '\'', $str);
	    //$str = addslashes($str);
	    $this->return_data = trim($str);
	}
    
    // ------------------------
	// Plugin Usage
	// ------------------------
    
    function usage()
    {
        ob_start(); 
        ?>
This plugin removes excess whitespace.

To use this plugin, wrap anything you want to be processed by it between these tag pairs:

{exp:whitespace}

text you want processed

{/exp:whitespace}
        <?php
        $buffer = ob_get_contents();
            
        ob_end_clean(); 
        
        return $buffer;
    } // END
}
?>
