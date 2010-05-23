<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>

	<?php
		// pagination 
		echo $hotlinks;
	?>
<div id="container">
	<span style="display:none" id="linkItems">
		<?php echo $this->pagination->total_items/$this->pagination->items_per_page; ?>
	</span>
	<!-- 
		PREVIOUS CONTENT
	-->
	<?php $i = 0; do{$i++; ?>
		<div id="prev<?php echo $i; ?>" class="outer">
			<div class="inner">
				<a href="/day/view/">Close</a>
				<div class="pubDate"></div>
				<div class="body"></div>
			</div>
		</div>
	<?php }while($i < kohana::config("config.number_of_items")); ?>
	<!-- 
		MAIN CONTENT 
	-->
	<?php foreach($posts as $key => $post){				 
		$features = unserialize($post->teaser);
		if($post->id > 1){
		?>
		<div id="box<?php echo $key+1; ?>" class="outer">
			<div class="inner">
				<a href="/day/view/<?php echo $post->id; ?>" class="close ui-icon ui-icon-search" style="float:right">Close</a>
				<div class="pubDate"><?php echo $post->date; ?></div>			
				<div class="body">
					<?php 
				        foreach($features as $f){
						 echo stripslashes($f);
					 } ?>
				</div>
			</div>
			<div class="boxFooter"></div>
		</div>
		<?php 	
		}else{
		?>
		<div id="boxHome" class="outer">
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
	<!-- 
		PREVIOUS CONTENT 
	-->
	<?php $i = 0; do{$i++; ?>
		<div id="next<?php echo $i; ?>" class="outer">
			<div class="inner">
				<a href="/day/view/">Close</a>
				<div class="pubDate"></div>
				<div class="body"></div>
			</div>
		</div>
	<?php }while($i < kohana::config("config.number_of_items")); ?>
</div>
