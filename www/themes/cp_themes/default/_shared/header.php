<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title><?=$cp_page_title?> | ExpressionEngine</title>

	<link rel="stylesheet" href="<?=base_url()?>themes/jquery_ui/default/jquery-ui-1.7.2.custom.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<?=BASE.AMP.'C=css'.AMP.'theme=default'.AMP.'v='.$theme_css_mtime?>" type="text/css" media="screen" title="Global Styles" charset="utf-8" />
	<!--[if lte IE 7]>
	<link rel="stylesheet" href="<?=BASE.AMP.'C=css'.AMP.'M=iefix'?>" type="text/css" media="screen" charset="utf-8" />
	<![endif]-->

	<?php

	if (isset($cp_global_js))
	{
		echo $cp_global_js;
	}
	?>
	<script charset="utf-8" type="text/javascript" src="<?=BASE.AMP.'C=javascript'.AMP.'M=load'.AMP.'v='.$jquery_mtime?>"></script>
	<script charset="utf-8" type="text/javascript" src="<?=BASE.AMP.'C=javascript'.AMP.'M=load'.AMP.'plugin=corner'.AMP.'v='.$corner_mtime?>"></script>
	<script charset="utf-8" type="text/javascript" src="<?=BASE.AMP.'C=javascript'.AMP.'M=load'.AMP.'file=css'.AMP.'theme=default'.AMP.'v='.$advanced_css_mtime?>"></script>

	<?php
	if (isset($script_head))
	{
		echo $script_head;
	}

	foreach ($this->cp->its_all_in_your_head as $item)
	{
		echo $item."\n";
	}
	?>

	<script type="text/javascript" src="<?=BASE.AMP.'C=javascript'.AMP.'theme=default'.AMP.'v='.$global_js_mtime?>"></script>
</head>
<body>
<script type="text/javascript" charset="utf-8">
//<![CDATA[
	document.body.className = "js";
//]]>
</script>

<div id="branding"></div>

<?php
/* End of file header.php */
/* Location: ./themes/cp_themes/default/_shared/header.php */