<?php
/**
* Created by Chris Hardcastle to run cron jobs
* Based on the default kohana 2.3.4 index.php
* Note the required #! stated above
* CRON TAB USAGE (To run twice a day)
  0 0,12 * * * /usr/bin/php [root][site]/cron.php --controller --method
*
* Use the shebang --> #!/usr/bin/php (should you need it, thanks @spolster)
*/
define('IN_PRODUCTION', FALSE);

/**
 * Website application directory. This directory should contain your application
 * configuration, controllers, models, views, and other resources.
 *
 * This path can be absolute or relative to this file.
 */
$kohana_application = 'application';

/**
 * Kohana modules directory. This directory should contain all the modules used
 * by your application. Modules are enabled and disabled by the application
 * configuration file.
 *
 * This path can be absolute or relative to this file.
 */
$kohana_modules = 'modules';

/**
 * Kohana system directory. This directory should contain the core/ directory,
 * and the resources you included in your download of Kohana.
 *
 * This path can be absolute or relative to this file.
 */
$kohana_system = 'system';

/**
 * Test to make sure that Kohana is running on PHP 5.2 or newer. Once you are
 * sure that your environment is compatible with Kohana, you can comment this
 * line out. When running an application on a new server, uncomment this line
 * to check the PHP version quickly.
 */
version_compare(PHP_VERSION, '5.2', '<') and exit('Kohana requires PHP 5.2 or newer.');

/**
 * Set the error reporting level. Unless you have a special need, E_ALL is a
 * good level for error reporting.
 */
error_reporting(E_ALL & ~E_STRICT);

/**
 * Turning off display_errors will effectively disable Kohana error display
 * and logging. You can turn off Kohana errors in application/config/config.php
 */
ini_set('display_errors', TRUE);

/**
 * If you rename all of your .php files to a different extension, set the new
 * extension here. This option can left to .php, even if this file has a
 * different extension.
 */
define('EXT', '.php');

//
// DO NOT EDIT BELOW THIS LINE, UNLESS YOU FULLY UNDERSTAND THE IMPLICATIONS.
// ----------------------------------------------------------------------------
// $Id: index.php 3915 2009-01-20 20:52:20Z zombor $
//

$kohana_pathinfo = pathinfo(__FILE__);
// Define the front controller name and docroot
define('DOCROOT', $kohana_pathinfo['dirname'].DIRECTORY_SEPARATOR);
define('KOHANA',  $kohana_pathinfo['basename']);

// If the front controller is a symlink, change to the real docroot
is_link(KOHANA) and chdir(dirname(realpath(__FILE__)));

// If kohana folders are relative paths, make them absolute.
$kohana_application = file_exists($kohana_application) ? $kohana_application : DOCROOT.$kohana_application;
$kohana_modules = file_exists($kohana_modules) ? $kohana_modules : DOCROOT.$kohana_modules;
$kohana_system = file_exists($kohana_system) ? $kohana_system : DOCROOT.$kohana_system;

// Define application and system paths
define('APPPATH', str_replace('\\', '/', realpath($kohana_application)).'/');
define('MODPATH', str_replace('\\', '/', realpath($kohana_modules)).'/');
define('SYSPATH', str_replace('\\', '/', realpath($kohana_system)).'/');

// Clean up
unset($kohana_application, $kohana_modules, $kohana_system);

// Taken from ./bootstrap.php

define('KOHANA_VERSION',  '2.3.4');
define('KOHANA_CODENAME', 'buteo regalis');

// Test of Kohana is running in Windows
define('KOHANA_IS_WIN', DIRECTORY_SEPARATOR === '\\');

// Kohana benchmarks are prefixed to prevent collisions
define('SYSTEM_BENCHMARK', 'system_benchmark');

// Load benchmarking support
require SYSPATH.'core/Benchmark'.EXT;

// Start total_execution
Benchmark::start(SYSTEM_BENCHMARK.'_total_execution');

// Start kohana_loading
Benchmark::start(SYSTEM_BENCHMARK.'_kohana_loading');

// Load core files
require SYSPATH.'core/utf8'.EXT;
require SYSPATH.'core/Event'.EXT;
require SYSPATH.'core/Kohana'.EXT;

// Prepare the environment
Kohana::setup();

// End kohana_loading
Benchmark::stop(SYSTEM_BENCHMARK.'_kohana_loading');

// Start system_initialization
Benchmark::start(SYSTEM_BENCHMARK.'_system_initialization');

// Prepare the system
Event::run('system.ready');

// Determine routing
Event::run('system.routing');

// End system_initialization
Benchmark::stop(SYSTEM_BENCHMARK.'_system_initialization');

/* 
 * Set the required vars for action
*/
$controller = (isset($_SERVER["argv"][1]))?str_replace("--","",$_SERVER["argv"][1]):false;
$method = (isset($_SERVER["argv"][2]))?str_replace("--","",$_SERVER["argv"][2]):false;

$h = fopen('./application/logs/cron.txt','a+');
$str = "Running Cron using PHP SAPI value: ".PHP_SAPI." with controller:{$controller} method:{$method} date:".date('d/m/y')."\n";

/* 
 * Clear out all the data arrays because they can trigger
 * a "Disallowed key characters in global data." error
*/
$_POST = array();
$_GET = array();
$_COOKIE = array();
// Load up the action!
Router::$controller = $controller;
Router::$method = $method;
Router::$arguments = array();
$path = APPPATH."controllers/content.php";
Router::$controller_path =  $path;

// Make the magic happen!
Event::run('system.execute');
// Clean up and exit
Event::run('system.shutdown');
// Close file writer
fwrite($h, $str);
fclose($h);
/* clear out any out put and leave log message behind,
* which, in my case gets sent to me via email
*/
ob_end_clean();
echo $str;
exit;
