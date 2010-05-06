<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
	<title><?php echo html::specialchars($title) ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel='stylesheet' type='text/css' media='all' href='/ui/css/custom-theme/jquery-ui-1.8rc3.custom.css' />
    <script src="http://platform.twitter.com/anywhere.js?id=yDrjhJ7gJHtyPb7JAMklA&v=1" type="text/javascript"></script>
	<script type="text/javascript" src="/ui/js/jquery-1.4.2.min.js"></script>
	<!--script type="text/javascript" src="/ui/js/jquery-ui-1.8rc3.custom.min.js"></script -->
	<script type="text/javascript" src="/ui/js/site.js"></script>
    <link rel='stylesheet' href='/ui/css/screen.css' type='text/css' media='Screen' />
    <link rel='stylesheet' href='/ui/css/handheld.css' type='text/css' media='handheld' />
    <link rel='shortcut icon' href='/ui/images/favicon.ico'></link>
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
                <li class="first">About</li>
                <li>Contact</li>
            </ul>            
        </div>
		<br/>
	</div>

    <script type="text/javascript">

      twttr.anywhere(function (T) {
        // show hover cards
        T.hovercards();
        T("#follow-placeholder").followButton('hardcastle');
      });

    </script>
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
</body>
</html>
