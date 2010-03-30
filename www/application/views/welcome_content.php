<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>
<div class="box">
	<p>This is the default Kohana index page. You may also access this page as <code><?php echo html::anchor('welcome/index', 'welcome/index') ?></code>.</p>

	<p>
		To change what gets displayed for this page, edit <code>application/controllers/welcome.php</code>.<br />
		To change this text, edit <code>application/views/welcome_content.php</code>.
	</p>
</div>

<ul>
<?php foreach ($links as $title => $url): ?>
	<li><?php echo ($title === 'License') ? html::file_anchor($url, html::specialchars($title)) : html::anchor($url, html::specialchars($title)) ?></li>
<?php endforeach ?>
</ul>

<div>
My test <?php echo $test; ?>
</div>

<div>
These are my posts
<?php
//var_dump($posts);
/* */ 

	//echo $post->title."<br/>";	 


	foreach($posts as $post){
		echo "<div style='border:3px solid #fff;marign:6px'>";
			foreach($post as $p){				
				/*  	
					if(isset($p["tiny"])){
						echo "<img src='".stripslashes($p["image"])."' alt='' />";
					}else{
						echo $p."<br/>";
						
					}
					/* */				
					if(is_a($p,"Photo_Model")){
						echo "<img src='".$p->urls["small"]."' alt='' />";
						
					}else{
						echo "<p>".var_dump($p)."</p>";
						
					}
					
					
				
			}	
		echo "</div>\n";
	}
				
	
	
	

/* */
?>
</div>