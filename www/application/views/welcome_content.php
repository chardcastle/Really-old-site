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
	foreach($posts as $date => $post){
		echo "<div style='border:3px solid #fff;marign:6px'><h4>".$date."</h4>";
			foreach($post as $p){				
				if(is_a($p,"Photo_Model")){
					echo "detected model";//"<img src='".$p->urls["small"]."' alt='' />";
				}else{
					//echo "<p>".var_dump($p)."</p>";
					echo $p."<br/>";					
				}
			}	
		echo "</div>\n";
	}
/* */
?>
</div>