<?php
// Overried existing page not found event
//Event::replace('system.404', array('Kohana', 'show_404'), array('permalink','find'));
class permalink{
	function find()
	{
			
			$db = new App_Model();
			$postId = $db->getPostIdFromSlug(Router::$current_uri);			
			if(!$postId){
                kohana::log("error","404 exception thrown, could not find ".Router::$current_uri);
				throw new Kohana_404_Exception("Page not found");
			}
			Router::$controller = "day";
			Router::$method = "view";
			Router::$arguments = array($postId);
			$path = APPPATH."controllers/day.php";
			Router::$controller_path =  $path;
			//Event::run('system.execute');	
			Event::run('system.post_controller_constructor');
			// Clean up and exit
			Event::run('system.shutdown');
	}
}
?>
