<?php
// Overried existing page not found event
Event::replace('system.404', array('Kohana', 'show_404'), array('permalink','find'));
class permalink{
	function find()
	{
		// TODO use the uri to look it up in the database
		echo "I don't have that address";
		die();
	}
}
?>
