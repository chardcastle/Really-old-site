<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>

	<?php
		// pagination 
		echo $hotlinks;
	?>
<div id="container">
	<?php foreach($posts as $key => $post){				 
		$features = unserialize($post->teaser);
		if($post->id > 1){
		?>
		<div id="box<?php echo $key+1; ?>" class="outer">
			<div class="inner">
				<a href="/day/view/<?php echo $post->id; ?>" class="close ui-icon ui-icon-search" style="float:right">Close</a>
				<div class="pubDate"><?php echo $post->date; ?></div>
			</div>
			<?php 
                foreach($features as $f){
                ?>			
				<div class="body"><?php echo stripslashes($f); ?></div>
			<?php } ?>
			<div class="boxFooter"></div>
		</div>
		<?php 	
		}else{
		?>
		<div id="home" class="outer">
			<div class="inner">
			<?php 	
				// Probably homepage blurb, spit out welcome html
				 foreach($features as $f){
                     echo $f;
                 }
                ?>
			</div>
		</div>	
		<?php }
	} ?>		
	
</div>