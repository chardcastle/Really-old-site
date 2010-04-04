<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
	<title><?php echo html::specialchars($title) ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel='stylesheet' type='text/css' media='all' href='/ui/css/all.css' />
	<link rel='stylesheet' type='text/css' media='all' href='/ui/css/custom-theme/jquery-ui-1.8rc3.custom.css' />	
	<script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="/ui/js/jquery-ui-1.8rc3.custom.min.js"></script>
	<script type="text/javascript" src="/ui/js/posts.js"></script>
</head>
<body>
	<div id="globalOuter">
		<h1><a href="/">Chris Hardcastle</a></h1>
		<div id="nav">
			<p>
				<a href="#clearup" id="clearUp">Clear up</a>
				<a href="#clearup" id="scrambel">Scrambel</a>
				<a href="#clearup" id="washAndGo">Go and return</a>
			</p>
	
			<ul id="jsnav">
		
			</ul>
		</div>
		<h2><?php echo html::specialchars($title) ?></h2>
		
			<?php echo $content ?>
		
	</div>
</body>
</html>