<?php
//This is a full width template item
?>
<div class="git fullItem">
    <b class="b1frg"></b><b class="b2frg"></b><b class="b3frg"></b><b class="b4frg"></b>
        <div>
            <span class="commitTime"><?php echo date("H:m",$commit->dateTime); ?></span>
            <p><strong><?php echo $commit->repoName; ?></strong><?php echo $commit->message; ?></p>
        </div>
    <b class="b4frg"></b><b class="b3frg"></b><b class="b2frg"></b><b class="b1frg"></b>
</div>