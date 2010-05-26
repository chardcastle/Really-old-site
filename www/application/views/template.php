<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
	<title>Chris Hardcastle | <?php echo html::specialchars($title) ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="keywords" content="<?php echo kohana::config('config.keywords');?>"/>
	<meta name="description" content="<?php echo kohana::config('config.description');?>"/>
	<link rel='stylesheet' type='text/css' media='all' href='/ui/css/custom-theme/jquery-ui-1.8rc3.custom.css' />
	<?php if(kohana::config('config.anywhere_key')){ ?>
    <script src="http://platform.twitter.com/anywhere.js?id=<?php echo kohana::config('config.anywhere_key'); ?>&amp;v=1" type="text/javascript"></script>
	<?php } ?>
	<script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script>
	<!--script type="text/javascript" src="/ui/js/jquery-ui-1.8.1.custom.min.js"></script -->

    <link rel='stylesheet' href='/ui/css/screen.css' type='text/css' media='Screen' />
    <link rel='stylesheet' href='/ui/css/handheld.css' type='text/css' media='handheld' />
    <link rel='shortcut icon' href='/ui/images/favicon.ico' />
</head>
<body>	
	<div id="globalOuter">
		<div id="header">            
            <p><?php echo $description; ?></p>
            <a href="/"><img src="/ui/images/title.jpg" alt="Chris Hardcastle"/></a>
        </div>
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
        <div id="footer">
            <ul>
                <li class="first"><a href="/page/about">About</a></li>
                <li><a href="/page/contact">Contact</a></li>
                <li><a href="/page/disclaimer">Disclaimer</a></li>
            </ul>            
        </div>
		<br/>
	</div>
	<?php if(kohana::config('config.anywhere_key')){ ?>
    <script type="text/javascript">
      twttr.anywhere(function (T) {
        // show hover cards
        T.hovercards();
        T("#follow-placeholder").followButton('hardcastle');
      });
    </script>
	<?php } ?>

    <?php if(Kohana::config("config.environment") == "production"){ ?>
        <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        try {
        var pageTracker = _gat._getTracker("UA-5641247-2");
        pageTracker._trackPageview();
        } catch(err) {}</script>
    <?php } ?>
	<script type="text/javascript" src="/ui/js/site.js"></script>
</body>
</html>
