<?php
/* 
 * Full width view
 */

?>
<div class="tweet fullItem">
    <b class="b1ftw"></b><b class="b2ftw"></b><b class="b3ftw"></b><b class="b4ftw"></b>
    <div>
        <span class="tweetTime"><?php echo date("H:m",$tweet->time); ?></span>
        <div><?php echo $tweet->tweet; ?></div>
    </div>
    <b class="b4ftw"></b><b class="b3ftw"></b><b class="b2ftw"></b><b class="b1ftw"></b>
</div>