<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>

	<?php
		// pagination 
		echo $hotlinks;
	?>
<div id="container">
	<?php foreach($posts as $key => $post){ ?>
		<div id="box<?php echo $key+1; ?>" class="outer">
			<a href="#" class="close ui-icon ui-icon-close" style="float:right">Close</a>		
			<div class="pubDate"><?php echo $post->date; ?></div>
			<?php 
			$features = json_decode($post->content); 
			foreach($features as $f){
			?>
				<div><?php echo stripslashes($f); ?></div>
			<?php } ?>				
		</div>
	<?php } ?>
</div>