<div class="photo item">
<p><?php echo $photo->title; ?></p>
<?php if(strlen($photo->urls["medium"])>0){ ?>
    <img src="<?php echo $photo->urls["medium"]; ?>" alt="Image"/>
<?php } ?>
</div>