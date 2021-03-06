<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title><?php echo $error ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="keywords" content="<?php echo kohana::config('config.keywords');?>"/>
	<meta name="description" content="<?php echo kohana::config('config.description');?>"/>
    <link rel='stylesheet' href='/ui/css/screen.css' type='text/css' media='Screen' />
    <link rel='stylesheet' href='/ui/css/handheld.css' type='text/css' media='handheld' />
    <link rel='shortcut icon' href='/ui/images/favicon.ico' />
</head>
<body>
	<div id="globalOuter">
		<div id="header">                        
            <a href="/"><img src="/ui/images/title.jpg" alt="Chris Hardcastle"/></a>
        </div>
		<h3 id="app-error"><?php echo strtoupper(html::specialchars($error)) ?></h3>
		<p><?php echo $description; ?></p>
		<?php if($error == "Page Not Found"){ ?>
		<p>Why don't you try some place else? Perhaps the <a href="/">homepage</a> or search the internet using <a href="http://bing.com">Bing</a>?</p>
		<?php } ?>
	</div>
</body>
</html>

