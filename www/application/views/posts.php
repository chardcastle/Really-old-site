<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
	<title>Chris Hardcastle</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<link rel='stylesheet' type='text/css' media='all' href='/ui/css/all.css' />
	<link rel='stylesheet' type='text/css' media='all' href='ui/css/custom-theme/jquery-ui-1.8rc3.custom.css' />	
	<script type="text/javascript" src="ui/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="ui/js/jquery-ui-1.8rc3.custom.min.js"></script>
	<script type="text/javascript" src="ui/js/posts.js"></script>
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
	<div id="container">
	{exp:channel:entries
	channel="posts"
	orderby="date" 
	limit="8"
	paginate="top"}
		<?php
			$firstDate = "{entry_date format='%d%S %M %Y'}";		
		?>
		<div id="box{absolute_count}" class="outer">
			<a href="#" class="close ui-icon ui-icon-close" style="float:right">Close</a>
				<h1>{title}</h1>
				<div class="pubDate"></div>
				<div class="body">{body}</div>
		</div>
		

	{paginate}
		<p id="navigation">Page {current_page} of {total_pages} pages {pagination_links}</p>
	{/paginate}
	{/exp:channel:entries}
		<div id="box9" class="outer">
			<a href="#" class="close ui-icon ui-icon-close" style="float:right">Close</a>
			{embed="Posts/tweet" content="{content}" date="{<?php $firstDate?> format='%Y-%m-%d'}"}
		</div>
	</div>
</div>
</body>
</html>
