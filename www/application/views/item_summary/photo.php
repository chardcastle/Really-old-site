<div class="photo item">
<p><?php echo $photo->title; ?></p>
<?php if(strlen($photo->urls["small"])>0){ ?>
    <img src="<?php echo $photo->urls["small"]; ?>" alt="Image"/>
<?php }else{ ?>
	<p>Sorry this photo cannot be shown.</p>
<?php} ?>
</div>
