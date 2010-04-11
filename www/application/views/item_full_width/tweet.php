<?php
/* 
 * Full width view
 */

?>
<div class="tweet item">
    <div>
        <span class="tweetTime"><?php echo date("H:m",$tweet->time); ?></span>
        <div><?php echo $tweet->tweet; ?></div>
    </div>
</div>