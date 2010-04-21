<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
	<title><?php echo html::specialchars($title) ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel='stylesheet' type='text/css' media='all' href='/ui/css/all.css' />
	<link rel='stylesheet' type='text/css' media='all' href='/ui/css/custom-theme/jquery-ui-1.8rc3.custom.css' />	
	<!-- script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="/ui/js/jquery-ui-1.8rc3.custom.min.js"></script>
	<script type="text/javascript" src="/ui/js/posts.js"></script -->
    <link rel='stylesheet' href='/ui/css/screen.css' type='text/css' media='Screen' />
    <link rel='stylesheet' href='/ui/css/handheld.css' type='text/css' media='handheld' />
</head>
<body>
	<div id="globalOuter">
		<p><?php echo $description; ?><a href="/"><img src="/ui/images/title.jpg" alt="Chris Hardcastle"/></a></p>
		<div id="nav">
			<p>
				<a href="#clearup" id="clearUp">Clear up</a>
				<a href="#clearup" id="scrambel">Scrambel</a>
				<a href="#clearup" id="washAndGo">Go and return</a>
			</p>
	
			<ul id="jsnav">
		
			</ul>
		</div>
				
			<?php echo $content ?>
		
	</div>
</body>
</html>