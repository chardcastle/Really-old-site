<?php
//This is a full width template item
?>
<div class="git fullItem">
	<div class="commitTime">This is everyting<?php echo date("H:m",$commit->dateTime); ?></div>
	<p><strong><?php echo $commit->repoName; ?></strong><?php echo $commit->message; ?></p>
</div>