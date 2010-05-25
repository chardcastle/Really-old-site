<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Hardcastle pagination style
 * 
 * @preview  < 1 2 3 >
 */
?>

<p class="pagination">


	<?php if ($previous_page): ?>
		<a href="<?php echo str_replace('{page}', $previous_page, $url) ?>">&lt;</a>
	<?php endif ?>


	<?php for ($i = 1; $i <= $total_pages; $i++): ?>

		<?php if ($i == $current_page): ?>
			<strong><?php echo $i ?></strong>
		<?php else: ?>
			<a href="<?php echo str_replace('{page}', $i, $url) ?>"><?php echo $i ?></a>
		<?php endif ?>

	<?php endfor ?>


	<?php if ($next_page): ?>
		<a href="<?php echo str_replace('{page}', $next_page, $url) ?>">&gt;</a>
	<?php endif ?>


</p>
