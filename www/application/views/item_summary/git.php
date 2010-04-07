<div class="git item">
	<div class="commitTime"><?php echo date("H:m",$commit->dateTime); ?></div>
	<p><strong><?php echo $commit->repoName; ?></strong><?php echo $commit->message; ?></p>
</div>