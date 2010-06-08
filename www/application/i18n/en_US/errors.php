<?php defined('SYSPATH') OR die('No direct access allowed.');

$lang = array
(
	E_KOHANA             => array( 1, 'Framework Error',   'I\'m sorry about this, but the PHP framework I wrote this in is experiencing a problem.'),
	E_PAGE_NOT_FOUND     => array( 1, 'Page Not Found',    'I was unable to find that page for you. Please check the address and try again.'),
	E_DATABASE_ERROR     => array( 1, 'Database Error',    'A database error occurred while performing the requested procedure.'),
	E_RECOVERABLE_ERROR  => array( 1, 'Recoverable Error', 'An error was detected which prevented the loading of this page. It\'s likely to be a configuration issue, or I\'m doing some maintenance. Please come back and try again later.'),
	E_ERROR              => array( 1, 'Fatal Error',       'Wow, there was a big problem. I\'m stopping right there.'),
	E_USER_ERROR         => array( 1, 'Fatal Error',       'There was a serious problem. I cannot do that for you. Sorry :('),
	E_PARSE              => array( 1, 'Syntax Error',      ''),
	E_WARNING            => array( 1, 'Warning Message',   ''),
	E_USER_WARNING       => array( 1, 'Warning Message',   ''),
	E_STRICT             => array( 2, 'Strict Mode Error', ''),
	E_NOTICE             => array( 2, 'Runtime Message',   'There\'s been a problem, please try again later.'),
);
