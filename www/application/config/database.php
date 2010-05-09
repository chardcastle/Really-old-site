<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * @package  Database
 *
 * Database connection settings, defined as arrays, or "groups". If no group
 * name is used when loading the database library, the group named "default"
 * will be used.
 *
 * Each group can be connected to independently, and multiple groups can be
 * connected at once.
 *
 * Group Options:
 *  benchmark     - Enable or disable database benchmarking
 *  persistent    - Enable or disable a persistent connection
 *  connection    - Array of connection specific parameters; alternatively,
 *                  you can use a DSN though it is not as fast and certain
 *                  characters could create problems (like an '@' character
 *                  in a password):
 *                  'connection'    => 'mysql://dbuser:secret@localhost/kohana'
 *  character_set - Database character set
 *  table_prefix  - Database table prefix
 *  object        - Enable or disable object results
 *  cache         - Enable or disable query caching
 *	escape        - Enable automatic query builder escaping
 */
$config['local'] = array
(
	'benchmark'     => TRUE,
	'persistent'    => FALSE,
	'connection'    => array
	(
		'type'     => 'mysql',
		'user'     => 'chris',
		'pass'     => 'chris1982',
		'host'     => 'localhost',
		'port'     => FALSE,
		'socket'   => FALSE,
		'database' => 'ch'
	),
	'character_set' => 'utf8',
	'table_prefix'  => '',
	'object'        => TRUE,
	'cache'         => FALSE,
	'escape'        => TRUE
);
$config['development'] = array
(
	'benchmark'     => TRUE,
	'persistent'    => FALSE,
	'connection'    => array
	(
		'type'     => 'mysql',
<<<<<<< HEAD:www/application/config/database.php
		'user'     => 'x',
		'pass'     => 'x',
		'host'     => 'localhost',
		'port'     => FALSE,
		'socket'   => FALSE,
		'database' => 'x'
=======
		'user'     => 'chrishar_wpuser',
		'pass'     => 'Tyhn98zz',
		'host'     => 'localhost',
		'port'     => FALSE,
		'socket'   => FALSE,
		'database' => 'chrishar_khstg'
>>>>>>> 7a8900055177936cc0ab92d7a2cbaa470cfd0a67:www/application/config/database.php
	),
	'character_set' => 'utf8',
	'table_prefix'  => '',
	'object'        => TRUE,
	'cache'         => FALSE,
	'escape'        => TRUE
);
$config['production'] = array
(
	'benchmark'     => TRUE,
	'persistent'    => FALSE,
	'connection'    => array
	(
		'type'     => 'mysql',
<<<<<<< HEAD:www/application/config/database.php
		'user'     => 'x',
		'pass'     => 'x',
		'host'     => 'localhost',
		'port'     => FALSE,
		'socket'   => FALSE,
		'database' => 'x'
=======
		'user'     => 'chrishar_wpuser',
		'pass'     => 'Tyhn98zz',
		'host'     => 'localhost',
		'port'     => FALSE,
		'socket'   => FALSE,
		'database' => 'chrishar_kh'
>>>>>>> 7a8900055177936cc0ab92d7a2cbaa470cfd0a67:www/application/config/database.php
	),
	'character_set' => 'utf8',
	'table_prefix'  => '',
	'object'        => TRUE,
	'cache'         => FALSE,
	'escape'        => TRUE
);
