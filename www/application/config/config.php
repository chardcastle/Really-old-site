<?php defined('SYSPATH') OR die('No direct access allowed.conf1');
/**
 * Custom environment settings
 */
$local = array(
	"name"=>"local",
	"url"=>"ee.local.net:8080/",
	"logLevel"=>4,
	//"twitter-api-key"=>"69EJ3HAJ4R8KFJtGrfLPg",
	"twitter-api-key" => false,
	"cache-time"=>180); // no cache time

$dev = array(
	"name"=>"development",
	"url"=>"stage.chrishardcastle.co.uk/",
	"logLevel"=>2,
	"twitter-api-key"=>"69EJ3HAJ4R8KFJtGrfLPg",
	"cache-time"=>5); // 5 second cache time

$prod = array(
	"name"=>"production",
	"url"=>"chrishardcastle.co.uk/",
	"logLevel"=>0,
	"twitter-api-key"=>"yDrjhJ7gJHtyPb7JAMklA",
	"cache-time"=>120); // 2 minute cache time

$environment = $local;
/**
 * This is a key required for using twitter based resources
 * see http://developer.twitter.com for details.
 * NOTE: the twitter-api-key is a public key.
 */
$config['anywhere_key'] = $environment["twitter-api-key"];
/**
 * Base path of the web site. If this includes a domain, eg: localhost/kohana/
 * then a full URL will be used, eg: http://localhost/kohana/. If it only includes
 * the path, and a site_protocol is specified, the domain will be auto-detected.
 */
$config['site_domain'] = $environment["url"];
/**
 * Environment configuration points to different database settings
 * Choose one and add it to the current enviroment
 */
$config['environment'] = $environment["name"];
/**
 * Force a default protocol to be used by the site. If no site_protocol is
 * specified, then the current protocol is used, or when possible, only an
 * absolute path (with no protocol/domain) is used.
 */
$config['site_protocol'] = '';

/**
 * Name of the front controller for this application. Default: index.php
 *
 * This can be removed by using URL rewriting.
 */
//$config['index_page'] = 'index.php';
$config['index_page'] = '';

/**
 * Fake file extension that will be added to all generated URLs. Example: .html
 */
$config['url_suffix'] = '';

/**
 * Length of time of the internal cache in seconds. 0 or FALSE means no caching.
 * The internal cache stores file paths and config entries across requests and
 * can give significant speed improvements at the expense of delayed updating.
 */
$config['internal_cache'] = $environment["cache-time"];

/**
 * Internal cache directory.
 */
$config['internal_cache_path'] = APPPATH.'cache/';

/**
 * Enable internal cache encryption - speed/processing loss
 * is neglible when this is turned on. Can be turned off
 * if application directory is not in the webroot.
 */
$config['internal_cache_encrypt'] = FALSE;

/**
 * Encryption key for the internal cache, only used
 * if internal_cache_encrypt is TRUE.
 *
 * Make sure you specify your own key here!
 *
 * The cache is deleted when/if the key changes.
 */
$config['internal_cache_key'] = '9954577554512558';

/**
 * Enable or disable gzip output compression. This can dramatically decrease
 * server bandwidth usage, at the cost of slightly higher CPU usage. Set to
 * the compression level (1-9) that you want to use, or FALSE to disable.
 *
 * Do not enable this option if you are using output compression in php.ini!
 */
$config['output_compression'] = FALSE;

/**
 * Enable or disable global XSS filtering of GET, POST, and SERVER data. This
 * option also accepts a string to specify a specific XSS filtering tool.
 */
$config['global_xss_filtering'] = TRUE;

/**
 * Enable or disable hooks.
 */
$config['enable_hooks'] = TRUE;

/**
 * Log thresholds:
 *  0 - Disable logging
 *  1 - Errors and exceptions
 *  2 - Warnings
 *  3 - Notices
 *  4 - Debugging
 */
$config['log_threshold'] = $environment["logLevel"];;

/**
 * Message logging directory.
 */
$config['log_directory'] = APPPATH.'logs';

/**
 * Enable or disable displaying of Kohana error pages. This will not affect
 * logging. Turning this off will disable ALL error pages.
 */
$config['display_errors'] = TRUE;

/**
 * Enable or disable statistics in the final output. Stats are replaced via
 * specific strings, such as {execution_time}.
 *
 * @see http://docs.kohanaphp.com/general/configuration
 */
$config['render_stats'] = TRUE;

/**
 * Filename prefixed used to determine extensions. For example, an
 * extension to the Controller class would be named MY_Controller.php.
 */
$config['extension_prefix'] = 'MY_';

/**
 * Additional resource paths, or "modules". Each path can either be absolute
 * or relative to the docroot. Modules can include any resource that can exist
 * in your application directory, configuration files, controllers, views, etc.
 */
$config['modules'] = array
(
	// MODPATH.'auth',      // Authentication
	// MODPATH.'kodoc',     // Self-generating documentation
	// MODPATH.'gmaps',     // Google Maps integration
	// MODPATH.'archive',   // Archive utility
	// MODPATH.'payment',   // Online payments
	// MODPATH.'unit_test', // Unit testing
);
/**
 * Contains the number of posts on a page.
 * custom and referenced as Kohana::config("config.number_of_items")
 */
$config['number_of_items'] = 6;
/**
 * Set the date format for items shown in grid
 */
$config['by_day_format'] = "jS F";
/**
 * Set the date format for items shown in grid
 */
$config['data_source_urls'] = array(
			"tweets" => "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20twitter.user.timeline%20where%20id%3D%22hardcastle%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys",
			"tumblr" => "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20tumblr.posts%20where%20username%3D'hardcastle'&format=json&diagnostics=false&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys",
			"github" => array("jquery"=>"http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20github.repo.commits%20where%20id%3D'jquery'%20and%20repo%3D'jquery'&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"),
            "homedesc" => "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20tumblr.tumblelog%20where%20username%3D'hardcastle'&format=json&diagnostics=false&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
		);
/*
 * Meta description
*/
$config["description"] = "Personal website of Chris Hardcastle. Opensource based website developer who uses PHP MySQL, Sproutcore, AJAX, jQuery";
/*
 * Meta keywords
*/
$config["keywords"] = "PHP, MySQL, Sproutcore, AJAX, jQuery, Ubuntu";
