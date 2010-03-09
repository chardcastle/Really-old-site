-- MySQL dump 10.11
--
-- Host: localhost    Database: ch
-- ------------------------------------------------------
-- Server version	5.0.75-0ubuntu10.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exp_accessories`
--

DROP TABLE IF EXISTS `exp_accessories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL auto_increment,
  `class` varchar(75) NOT NULL default '',
  `member_groups` varchar(50) NOT NULL default 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY  (`accessory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_accessories`
--

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;
INSERT INTO `exp_accessories` VALUES (1,'Expressionengine_info_acc','1|5','addons_extensions|tools|myaccount|homepage|admin_content|content_edit|addons_accessories|addons_plugins|tools_logs|design|tools_communicate|members|content|help|addons|content_files|tools_utilities|tools_data|content_publish|display|admin_system|addons_modules','1.0');
/*!40000 ALTER TABLE `exp_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_actions`
--

DROP TABLE IF EXISTS `exp_actions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL auto_increment,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY  (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_actions`
--

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;
INSERT INTO `exp_actions` VALUES (1,'Comment','insert_new_comment'),(2,'Comment_mcp','delete_comment_notification'),(3,'Email','send_email'),(4,'Search','do_search'),(5,'Channel','insert_new_entry'),(6,'Channel','filemanager_endpoint'),(7,'Channel','smiley_pop');
/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_captcha`
--

DROP TABLE IF EXISTS `exp_captcha`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL auto_increment,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY  (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_captcha`
--

LOCK TABLES `exp_captcha` WRITE;
/*!40000 ALTER TABLE `exp_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS `exp_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) default NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_categories`
--

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_field_data`
--

DROP TABLE IF EXISTS `exp_category_field_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_category_field_data`
--

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_fields`
--

DROP TABLE IF EXISTS `exp_category_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL default '',
  `field_label` varchar(50) NOT NULL default '',
  `field_type` varchar(12) NOT NULL default 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL default '128',
  `field_ta_rows` tinyint(2) NOT NULL default '8',
  `field_default_fmt` varchar(40) NOT NULL default 'none',
  `field_show_fmt` char(1) NOT NULL default 'y',
  `field_text_direction` char(3) NOT NULL default 'ltr',
  `field_required` char(1) NOT NULL default 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_category_fields`
--

LOCK TABLES `exp_category_fields` WRITE;
/*!40000 ALTER TABLE `exp_category_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_groups`
--

DROP TABLE IF EXISTS `exp_category_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL default 'a',
  `field_html_formatting` char(4) NOT NULL default 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_category_groups`
--

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_posts`
--

DROP TABLE IF EXISTS `exp_category_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_category_posts`
--

LOCK TABLES `exp_category_posts` WRITE;
/*!40000 ALTER TABLE `exp_category_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data`
--

DROP TABLE IF EXISTS `exp_channel_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channel_data`
--

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;
INSERT INTO `exp_channel_data` VALUES (1,1,1,'My total exposure to Ruby has been around 2 hours, a great time to write about it. So warnings, n00b alert, I have not even written a ruby “hello world” script! But hey, it’s important to write when you feel inspired. I have a few people to thank for the inspiration.\n\nGiven a short code demo, it looks very flexible. It can be used to build things extremely quickly. In just a few key strokes, a model, view and controller is automatically created in the file system. Another command will quickly update the database to describe the properties of your newly created entity in its own table.\n\nThis bares some similarities with the PHP framework Symfony. You can auto generate the entities of your system in a very similar way. But I am a PHP freak, why am I so interested in this? It’s always good to have another arrow to your bow. Also, I think it’s an important message to those who want to try out programming for web applications. Perhaps students or in some cases, people who have been stuck using classic VB for the past 5 years!\n\nSome may say that using the Ruby on Rails framework the auto generation of code is unwise. Unwieldy and unmanageable and I would tend to agree with them. However, perhaps it has some uses for prototyping an idea or a technical draft. If the specification or idea keeps changing, then its a perfect match. I am not sure if you can do this but, since its heavy on MVC, components of the system can be replaced (if necessary) with whatever means necessary.\n\nIt’s meant to be easier to develop with it in Linux and Mac than Windows. Saying that there’s a package for the Aptana editing suite for Windows that seems well suited to Ruby. There’s an online demo of Ruby, somewhere on the Internet, I will post it as soon as I remember where it is.\n\nPerhaps in a few years, I will read this again on a site that I built in Ruby, years from now. But for now, I don’t think I will start learning Ruby just yet. There’s plenty of other things I would like to do first, that could change.','xhtml','My total exposure to Ruby has been around 2 hours, a great time to write about it. So warnings, n00b alert, I have not even written a ruby “hello world” script! But hey, it’s important to write when you feel inspired. I have a few people to thank for the inspiration.','xhtml',NULL,'xhtml',NULL,'xhtml'),(2,1,1,'<p>I have a had file on my desktop for months now called &#8220;must-learn.txt&#8221; I thought I would share it. Every now and then I need to select form elements. I find the follwing very useful, but can never remember the conventions off the top of my head.<span id=\"more-96\"></span></p>\n\n<p>For documentation, please see the Jquery <a href=\"http://docs.jquery.com/Selectors\">documentation</a>. Using the firebug console, you can test the following javascript commands on any of your own forms.</p>\n<p><code><br />\n// find a div with an id of \"edit-taxonomy\"<br />\n$(\"div[id=edit-taxonomy]\").each(function(i,item){<br />\n	console.log(\"Found\");<br />\n})<br />\n// find a textarea with that has edit anywhere in the id<br />\n$(\"textarea[id*=\'edit\']\").each(function(i,item){<br />\n\n	console.log(\"Found\");<br />\n})<br />\n// find an input that has an id that starts with title<br />\nconsole.log($(\"input[id^=\'title\']\").length);<br />\n</code></p>\n','xhtml','I have a had file on my desktop for months now called “must-learn.txt” I thought I would share it. Every now and then I need to select form elements. I find the follwing very useful, but can never remember the conventions off the top of my head.','xhtml',NULL,'xhtml',NULL,'xhtml'),(3,1,1,'<p>I have been writing a content management system at work using <a href=\"http://codeigniter.com\">CodeIgniter</a>. Since it will be used by many people to add content, making an editor available is essential for the system. At the time, two candidates stood out for me, both of which, I want to mention in this short post. They are:</p>\n<ul>\n\n<li><a href=\"http://nicedit.com/\">NicEdit</a></li>\n<li><a href=\"http://tinymce.moxiecode.com/\">TinyMCE</a></li>\n</ul>\n<p><span id=\"more-59\"></span><br />\nWhilst a decision on which editor is the best for you&#8217;re project depends entirely on your own circumstances. I am only focusing on these two for now and don&#8217;t claim to be a master on either.</p>\n<p><strong>Downloading</strong></p>\n<p>There&#8217;s one thing that bugs me about the process of downloading NicEdit. It smells of the Mootools Javascript framework for one particular reason. There&#8217;s a range of additional extras and packages that are included in the download. The problem is that if you need to download it again for any reason. How can you be sure you include everything that you need?</p>\n<p>I much prefer the editor to arrive as a complete core package, rather than it being a combination of various features. I feel that TinyMCE make it easier for you by offering the whole lot, even with a version designed entirely for the JQuery javascript framework.</p>\n\n<p><strong>Size</strong></p>\n<p>Looking at the downloads for each editor, I was impressed with NicEdit for having on single JS file and and sprite image for the buttons. Since CodeIgniter is super trim and lightweight, it immediately felt like the right thing to use. Some say that a full blown template library like <a href=\"http://smarty.net\">smarty</a> is overkill for CodeIgniter. I use smarty all the time in CodeIgniter, as such, perhaps TinyMCE is an acceptable size. Also, the TinyMCE folder structure includes a designated plugins directory. Which brings me onto my next topic.</p>\n<p><strong>Plugins</strong></p>\n<p>It&#8217;s clear for every developer that every wysiwyg editor needs to be customisable so it can meet its technical or design requirements. So the main questions are which offers the easiest integration and which offer the most power. I am afraid to confess that I have not written a plugin for TinyMCE yet so cannot comment on how it works out for that. However, I have been able to extend NicEdit quite easily. It&#8217;s possible to override the data that&#8217;s provided to buttons. For instance I have supplied my editor with a tree of available links and a library of images to choose from. I could post the code if the interest is there.</p>\n<p><strong>Documentation</strong></p>\n<p>There&#8217;s a <a href=\"http://wiki.nicedit.com/\">wiki</a> and a small section of<a href=\"http://nicedit.com/demos.php\"> demonstrations</a> for NicEdit. The wiki includes some information about how to interact with it using plugins. But the content is limited. On the contrary, the <a href=\"http://wiki.moxiecode.com/index.php/TinyMCE:API\">TinyMCE api documentation</a> is fantastic. I think those two points were the deciding factors in which wysiwyg to use for my CodeIgniter project. I wanted to pick it up and run with it. It felt like I could get everything done quicker using NicEdit as it was easier to digest. And thankfully. it all worked straight away.</p>\n\n<p><strong>Conclusion</strong></p>\n<p>I am yet to determine if it&#8217;s possible to isolate the cursor position within the content. That would be helpful for a range of tasks, like image insertion from an alternative source. I am happy with using NicEdit for now, it suites my needs. However, I am really worried that I will need a feature that it does not support. Even worse, it does, but was not downloaded with the package included.</p>\n','xhtml','I have been writing a content management system at work using CodeIgniter. Since it will be used by many people to add content, making an editor available is essential for the system. At the time, two candidates stood out for me, both of which, I want to mention in this short post.','xhtml',NULL,'xhtml',NULL,'xhtml'),(4,1,1,'TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?','xhtml',' fsdfsdaf asdf afasd','xhtml',NULL,'xhtml',NULL,'xhtml'),(5,1,1,'TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?','xhtml','TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?','xhtml',NULL,'xhtml',NULL,'xhtml'),(6,1,1,'<p>I have just found a really helpful command that I can see myself using all the time. It&#8217;s too often that I need to take a copy of a development database file and update the absolute paths to use the live address.<br />\n<span id=\"more-53\"></span><br />\nImagine you have a .sql file that you have created by exporting a wordpress database. That can be done using the mysqldump command over the command line in Linux/Ubuntu. Now you want to replace all (global) occurrences of &#8220;local&#8221; with &#8220;live&#8221; in a file called &#8220;data.sql&#8221; and catch the results in a new file called &#8220;new.sql&#8221; the code would be as follows.</p>\n\n<p><code><br />\nsed -e \'s/local/live/g\' data.sql > new.sql</p>\n<p></code><br />\nA new file should be created called &#8220;new.sql&#8221; with the replacements made. SED is a tool available in all Linux distributions and can be accessed via the command line. The &#8220;e&#8221; command runs the function with the script that follows in quotes. The &#8217;s&#8217; command treats the arguments as separate files. The &#8216;g&#8217; means global. This makes a replacement on multiple lines.</p>\n\n<p>This is an interpretation based on guidance from this<a href=\"http://www.ibm.com/developerworks/linux/library/l-sed2.html\"> following article</a> it&#8217;s a very simple example. For my own reference really, but I hope you find useful.</p>\n','xhtml','<p>I have just found a really helpful command that I can see myself using all the time. It&#8217;s too often that I need to take a copy of a development database file and update the absolute paths to use the live address.<br />\n<span id=\"more-53\"></span></p>\n','xhtml',NULL,'xhtml',NULL,'xhtml'),(7,1,1,'body {\n	background-color: #fff;\n	margin: 40px;\n	font-family: Lucida Grande, Verdana, Sans-serif;\n	font-size: 14px;\n	color: #4F5155;\n}\n\na {\n	color: #003399;\n	background-color: transparent;\n	font-weight: normal;\n}\n\nh1 {\n	color: #444;\n	background-color: transparent;\n	border-bottom: 1px solid #D0D0D0;\n	font-size: 16px;\n	font-weight: bold;\n	margin: 24px 0 2px 0;\n	padding: 5px 0 6px 0;\n}\n\ncode {\n	font-family: Monaco, Verdana, Sans-serif;\n	font-size: 12px;\n	background-color: #f9f9f9;\n	border: 1px solid #D0D0D0;\n	color: #002166;\n	display: block;\n	margin: 14px 0 14px 0;\n	padding: 12px 10px 12px 10px;\n}\n\n#thumbs{\n	position:relative;\n	z-index:1;\n		width:130px;\n	border:1px solid #333;\n}\n#thumbs div{\n	position:relative;\n	z-index:2;\n	width:28px;\n	height:28px;	\n	float:left;\n	margin:10px 10px 10px 0;\n	border:1px solid #333;\n}\n#container{\n	position:relative;\n	border:1px solid #ff22ff;\n	width:762px;\n	height:300px;\n}\n#container div{\n	position:absolute;\n	/*top:0; left:0;*/\n	z-index:3;	\n	width:200px;\n	height:200px;\n	border:1px solid #ff33ff;\n	overflow:hidden;\n	padding:17px;\n}\n.box1,\n.box10{\n	top:20px;\n	left:20px;\n\n\n}\n.box2,\n.box11{\n	top:20px;\n	left:254px;\n\n}\n.box3,\n.box12{\n	top:20px;\n	left:508px;\n\n}\n.box4,\n.box13{\n	top:260px;\n	left:20px;\n\n}\n.box5,\n.box14{\n	top:260px;\n	left:254px;\n	\n\n}\n.box6{\n	top:260px;\n	left:508px;\n\n}\n.box7{\n	top:500px;\n	left:20px;\n\n}\n.box8{\n	top:500px;\n	left:254px;\n\n}\n.box9{\n	top:500px;\n	left:508px;\n}\n','xhtml','body {\n	background-color: #fff;\n	margin: 40px;\n	font-family: Lucida Grande, Verdana, Sans-serif;\n	font-size: 14px;\n	color: #4F5155;\n}\n','xhtml',NULL,'xhtml',NULL,'xhtml'),(8,1,1,'<p>Once you have finished building a Wordpress based website. Wouldn&#8217;t it be great to test it on the live website host, without interrupting any existing files or pages? This is just the kind of scenario that I have been asked about in the past. So, I have recently developed my own suggestion as to how this can be achieved.<br />\n<span id=\"more-48\"></span><br />\nOnce your Wordpress database has been set up and all the files for the site are in place. The next step is to replace the existing index.php / html file with the one from the root of your Wordpress build. From that moment Wordpress with be in control of all incoming requests to your site.</p>\n\n<p>Given that the existing home page has to remain the same until your ready to &#8220;activate&#8221; the new one. You can modify the .htaccess file so the Wordpress site will only respond if the homepage has been called with a particular query string. This means you can test the Wordpress build without interrupting the main index page. </p>\n<p>In order to do this, you have to modify your .htaccess file in the website root. Below is the modified .htaccess file, take a backup before testing!</p>\n<p><code><br />\n# BEGIN WordPress<br />\nRewriteEngine On<br />\nRewriteBase /<br />\nRewriteCond %{REQUEST_FILENAME} !-f<br />\nRewriteCond %{REQUEST_FILENAME} !-d<br />\n\nRewriteCond %{REQUEST_URI} !^/wp-content/<br />\nRewriteCond %{REQUEST_URI} !^/wp-includes/<br />\nRewriteRule . /$1/?test=true [L]<br />\n# END WordPress<br />\n</code></p>\n<p>Replace your existing .htaccess file with the code above and you are half way. Next modify your index.php in the wordpress site.</p>\n<p><code><br />\nif(isset($_GET[\"test\"])){<br />\n    define(\'WP_USE_THEMES\', true);<br />\n\n    /* Loads the WordPress Environment and Template */<br />\n    require(\'./wp-blog-header.php\');<br />\n}else{<br />\n    /* Your holding page HTML / include file */<br />\n}<br />\n</code></p>\n<p>You can redirect to, or include the existing index page within the else clause as described above. The links should still be intact because the .htaccess file is appending your url with the required query string.</p>\n<p>So when you visit the site your existing homepage should remain the same. When you visit http://yoursite.com<strong>/?test=true</strong> your wordpress site should wake up and run accordingly. </p>\n','xhtml','Once you have finished building a Wordpress based website. Wouldn’t it be great to test it on the live website host, without interrupting any existing files or pages? This is just the kind of scenario that I have been asked about in the past. So, I have recently developed my own suggestion as to how this can be achieved.','xhtml',NULL,'xhtml',NULL,'xhtml'),(9,1,1,'Yay, I just got my vanity url. I had to search around for it as there were no links in Facebook. Just go to www.facebook.com/username once your logged in – but hurry, all the good ones are going!','xhtml','Yay, I just got my vanity url. I had to search around for it as there were no links in Facebook. Just go to www.facebook.com/username once your logged in – but hurry, all the good ones are going!','xhtml',NULL,'xhtml',NULL,'xhtml'),(10,1,1,'hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf','xhtml','hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf','xhtml',NULL,'xhtml',NULL,'xhtml'),(11,1,1,'ExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 Beta','xhtml','ExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 Beta','xhtml',NULL,'xhtml',NULL,'xhtml'),(12,1,1,'Geek Hut posted a helpful screencast tutorial on how to work with jQuery, JSON and CodeIgniter.\n\n    I shot this screen for those who are looking for an extremely simple explanation and demonstration for sending and receiving data asynchronously via jQuery Post and JSON.  About two years ago I really struggled with this concept so I figure there are probably others who will find this information useful. I would have been extremely happy to find something like this when I was learning (and frustrated).','xhtml','Geek Hut posted a helpful screencast tutorial on how to work with jQuery, JSON and CodeIgniter.).','xhtml',NULL,'xhtml',NULL,'xhtml'),(13,1,1,'hello, great tutorial- very handy. i don’t quite understand the significance of the:\n\nwhile ($cat2->have_posts()) : $my_query2->the_post();\n\nthese lines have something to do with inner Wordpress workings? is it possible to run two separate instances of your magic code within two (or more) loops. i almost have this working using your code, but not quite and wondered if you had any ideas.\n\najaxcount doesn’t seem to produce anything other than ‘0’ for me.\n\ni’m using multiple loops based on this how-to. they work great!\n\nif you could explain the $cat code that would be a help… why doesn’t it read:\n\nwhile ($cat2->have_posts()) : $cat2->the_post();\n\nseems to make more sense to me!\n\n- Callum','xhtml','EE 2.01PB - 2.x Bug Tracker | Docs | Upgrade from 1.x to 2.x | Build Update Instructions | 1.6.x Update Info\n\nMost recent 2.x version: Build 20100215\nDon’t forget to upgrade MSM and Forum as needed! ','xhtml',NULL,'xhtml',NULL,'xhtml'),(14,1,1,'#\nand Popoon. It\'s easy to use for the enduser and has WYSIWYG editing capabilites, ...\ntutorialfeed.blogspot.com/.../list-of-xml-based-cms-for-web.html - Cached - Similar\n#\nTechnologies: PHP, DBMS, AJAX,DHTML, XML, JavaScript, JSON\nCMS Joomla! use PHP and MySQL. CMS Joomla - Open Source GNU General Public ... osCommerce is an Open Source based online shop e-commerce solution that is ...\nwww.smartsolutions.com.ua/1/technologies.htm - Cached\n#\n{Ajaxist: php ajax frameworks}\nphp ajax frameworks and php ajax frameworks products and tools. ... source php ria framework using json; AjaxCore - a prototype-based php ajax framework ... source multi-lingual (php & c#) web app framework; MODx - ajax-enabled cms php ...','xhtml','php ajax frameworks and php ajax frameworks products and tools. ... source php ria framework using json; AjaxCore - a prototype-based php ajax framework ... source multi-lingual (php & c#) web app framework; MODx - ajax-enabled cms php ...','xhtml',NULL,'xhtml',NULL,'xhtml'),(15,1,1,'Thank you for writing this tutorial. It has given me a great start on AJAXing wordpress themes.\n\nI’ve had lots of trouble though, which I thought I would share.\n\nFirst, instead of loading the the first code snippet (‘Ajax example - retrieve posts’), when I click the jQuery enabled link, the post simply fades out, and nothing replaces it. I noticed that your jQuery seems to load the ‘Ajad example - retrive posts’ document without revealing where it is on your web server. The jQuery code: .load(‘/examples/ajax-handler/). Because of this, I’m not sure where to put the document on my own wordpress installation.\n\nI managed to hardcode a url into the .load() function, like so: .load(‘wp-content/themes/uprising/ajax-handler.php?offset=’+offset). But that seems to be a problem, since the PHP document, once loaded, is outside of the wordpress system. So it chokes on query_posts(), with the error “undeclared function”.\n\nTo get around this, I added code to manually load wordpress, to the ajax-handler.php document:\ndefine(‘WP_USE_THEMES’, false);\n require(‘../../../wp-blog-header.php’);\n\nBut this only works once. So I can load a post by AJAX once, but the second time, it doesn’t work anymore (it goes to the category page, as if javascript were disabled).\n\nSo I reorganised so that the “ajax-link” button is now outside of the “ajax-content” div. Which has finally resulted in a functional system.\n\nAnyway, I just thought I would share in case I made a fundamental error earlier on that would save a lot of the trouble I’ve gone thro','xhtml','Thank you for writing this tutorial. It has given me a great start on AJAXing wordpress themes.\n\nI’ve had lots of trouble though, which I thought I would share.\n\n\nAnyway, I just thought I would share in case I made a fundamental error earlier on that would save a lot of the trouble I’ve gone thro','xhtml',NULL,'xhtml',NULL,'xhtml'),(16,1,1,'The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.','xhtml','The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.The $.each() function is not the same as .each(), which is used to iterate, exclusively, over a jQuery object. The $.each() function can be used to iterate over any collection, whether it is a map (JavaScript object) or an array. In the case of an array, the callback is passed an array index and a corresponding array value each time.','xhtml',NULL,'xhtml',NULL,'xhtml'),(17,1,3,NULL,NULL,NULL,NULL,'1267310193','none','@toririchardson give or take a few days, yes. What a fantastic day -he\'s spoilt rotten:)','xhtml'),(18,1,3,NULL,NULL,NULL,NULL,'1211468495','none','@jona_thin It\'s a long boring story that wasn\'t my fault. ttyl','xhtml');
/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_entries_autosave`
--

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL default '0',
  `pentry_id` int(10) NOT NULL default '0',
  `forum_topic_id` int(10) unsigned default NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL default 'n',
  `view_count_one` int(10) unsigned NOT NULL default '0',
  `view_count_two` int(10) unsigned NOT NULL default '0',
  `view_count_three` int(10) unsigned NOT NULL default '0',
  `view_count_four` int(10) unsigned NOT NULL default '0',
  `allow_comments` varchar(1) NOT NULL default 'y',
  `sticky` varchar(1) NOT NULL default 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL default 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL default '0',
  `comment_expiration_date` int(10) NOT NULL default '0',
  `edit_date` bigint(14) default NULL,
  `recent_comment_date` int(10) default NULL,
  `comment_total` int(4) unsigned NOT NULL default '0',
  `entry_data` text,
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channel_entries_autosave`
--

LOCK TABLES `exp_channel_entries_autosave` WRITE;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_fields`
--

DROP TABLE IF EXISTS `exp_channel_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(12) NOT NULL default 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL default 'n',
  `field_pre_channel_id` int(6) unsigned default NULL,
  `field_pre_field_id` int(6) unsigned default NULL,
  `field_related_to` varchar(12) NOT NULL default 'channel',
  `field_related_id` int(6) unsigned NOT NULL default '0',
  `field_related_orderby` varchar(12) NOT NULL default 'date',
  `field_related_sort` varchar(4) NOT NULL default 'desc',
  `field_related_max` smallint(4) NOT NULL default '0',
  `field_ta_rows` tinyint(2) default '8',
  `field_maxl` smallint(3) default NULL,
  `field_required` char(1) NOT NULL default 'n',
  `field_text_direction` char(3) NOT NULL default 'ltr',
  `field_search` char(1) NOT NULL default 'n',
  `field_is_hidden` char(1) NOT NULL default 'n',
  `field_fmt` varchar(40) NOT NULL default 'xhtml',
  `field_show_fmt` char(1) NOT NULL default 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL default 'any',
  PRIMARY KEY  (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,1,1,'body','Body','Main content','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',2,'any'),(2,1,1,'teaser','Teaser','A summary of contents inside the body','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',1,'any'),(5,1,2,'content','Content','','textarea','','0',0,0,'channel',3,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',2,'any'),(4,1,2,'timestamp','Timestamp','Stores the epcho (Number of seconds since Jan 1st 1970)','text','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','none','n',2,'any');
/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_member_groups`
--

DROP TABLE IF EXISTS `exp_channel_member_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channel_member_groups`
--

LOCK TABLES `exp_channel_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_channel_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_titles`
--

DROP TABLE IF EXISTS `exp_channel_titles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL default '0',
  `pentry_id` int(10) NOT NULL default '0',
  `forum_topic_id` int(10) unsigned default NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL default 'n',
  `view_count_one` int(10) unsigned NOT NULL default '0',
  `view_count_two` int(10) unsigned NOT NULL default '0',
  `view_count_three` int(10) unsigned NOT NULL default '0',
  `view_count_four` int(10) unsigned NOT NULL default '0',
  `allow_comments` varchar(1) NOT NULL default 'y',
  `sticky` varchar(1) NOT NULL default 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL default 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL default '0',
  `comment_expiration_date` int(10) NOT NULL default '0',
  `edit_date` bigint(14) default NULL,
  `recent_comment_date` int(10) default NULL,
  `comment_total` int(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (1,1,1,1,0,0,'127.0.1.1','Newby to ruby','newby_to_ruby','open','y',0,0,0,0,'y','n',1266789487,'n','2010','02','21',0,0,20100221220308,0,0),(2,1,1,1,0,0,'127.0.1.1','Jquery input selectors','jquery_input_selectors','open','y',0,0,0,0,'y','n',1266789787,'n','2010','02','21',0,0,20100221220508,0,0),(3,1,1,1,0,0,'127.0.1.1','TinyMCE or NicEdit for CodeIgniter?','tinymce_or_nicedit_for_codeigniter','open','y',0,0,0,0,'y','n',1266789976,'n','2010','02','21',0,0,20100221220717,0,0),(4,1,1,1,0,0,'127.0.1.1','fdsafsdfds fsd fasd fasd','fdsafsdfds_fsd_fasd_fasd','open','y',0,0,0,0,'y','n',1266790166,'n','2010','02','21',0,0,20100221220927,0,0),(5,1,1,1,0,0,'127.0.1.1','TinyMCE or NicEdit for CodeIgniter?','tinymce_or_nicedit_for_codeigniter1','open','y',0,0,0,0,'y','n',1266790184,'n','2010','02','21',0,0,20100221220946,0,0),(6,1,1,1,0,0,'127.0.1.1','Wordpress absolute path update','wordpress_absolute_path_update','open','y',0,0,0,0,'y','n',1266790196,'n','2010','02','21',0,0,20100221221058,0,0),(7,1,1,1,0,0,'127.0.1.1','cscscscscscsc','cscscscscscsc','open','y',0,0,0,0,'y','n',1266790268,'n','2010','02','21',0,0,20100221221209,0,0),(8,1,1,1,0,0,'127.0.1.1','Wordpress site preview','wordpress_site_preview','open','y',0,0,0,0,'y','n',1266792884,'n','2010','02','21',0,0,20100221225545,0,0),(9,1,1,1,0,0,'127.0.1.1','Facebook vantiy URLS','facebook_vantiy_urls','open','y',0,0,0,0,'y','n',1266792992,'n','2010','02','21',0,0,20100221225633,0,0),(10,1,1,1,0,0,'127.0.1.1','hgfhfdghdfhfg','hgfhfdghdfhfg','open','y',0,0,0,0,'y','n',1266792996,'n','2010','02','21',0,0,20100221225737,0,0),(11,1,1,1,0,0,'127.0.1.1','ExpressionEngine','expressionengine','open','y',0,0,0,0,'y','n',1266793035,'n','2010','02','21',0,0,20100221225816,0,0),(12,1,1,1,0,0,'127.0.1.1','gfgfd gfd gdsf gdsfgd','gfgfd_gfd_gdsf_gdsfgd','open','y',0,0,0,0,'y','n',1266793128,'n','2010','02','21',0,0,20100221225849,0,0),(13,1,1,1,0,0,'127.0.1.1','test test tes','test_test_tes','open','y',0,0,0,0,'y','n',1266793160,'n','2010','02','21',0,0,20100221225921,0,0),(14,1,1,1,0,0,'127.0.1.1','ph php hphp fsdf asdfsdaf','ph_php_hphp_fsdf_asdfsdaf','open','y',0,0,0,0,'y','n',1266793187,'n','2010','02','21',0,0,20100221225948,0,0),(15,1,1,1,0,0,'127.0.1.1','kfdsfsdfasd','kfdsfsdfasd','open','y',0,0,0,0,'y','n',1266793229,'n','2010','02','21',0,0,20100221230031,0,0),(16,1,1,1,0,0,'127.0.1.1','uydhghgh','uydhghgh','open','y',0,0,0,0,'y','n',1266882677,'n','2010','02','22',0,0,20100222235518,0,0),(17,1,3,1,0,0,'127.0.1.1','OTc0ODc0MjgzNA==','otc0odc0mjgzna','open','y',0,0,0,0,'y','n',1268169157,'y','2010','03','09',0,0,20100309223138,0,0),(18,1,3,1,0,0,'127.0.1.1','OTc2OTk2MDgwNw==','otc2otk2mdgwnw','open','y',0,0,0,0,'y','n',1268172787,'n','2010','03','09',0,0,20100309221608,0,0);
/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels`
--

DROP TABLE IF EXISTS `exp_channels`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) default NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL default '0',
  `total_comments` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `cat_group` varchar(255) default NULL,
  `status_group` int(4) unsigned default NULL,
  `deft_status` varchar(50) NOT NULL default 'open',
  `field_group` int(4) unsigned default NULL,
  `search_excerpt` int(4) unsigned default NULL,
  `deft_category` varchar(60) default NULL,
  `deft_comments` char(1) NOT NULL default 'y',
  `channel_require_membership` char(1) NOT NULL default 'y',
  `channel_max_chars` int(5) unsigned default NULL,
  `channel_html_formatting` char(4) NOT NULL default 'all',
  `channel_allow_img_urls` char(1) NOT NULL default 'y',
  `channel_auto_link_urls` char(1) NOT NULL default 'y',
  `channel_notify` char(1) NOT NULL default 'n',
  `channel_notify_emails` varchar(255) default NULL,
  `comment_url` varchar(80) default NULL,
  `comment_system_enabled` char(1) NOT NULL default 'y',
  `comment_require_membership` char(1) NOT NULL default 'n',
  `comment_use_captcha` char(1) NOT NULL default 'n',
  `comment_moderate` char(1) NOT NULL default 'n',
  `comment_max_chars` int(5) unsigned default '5000',
  `comment_timelock` int(5) unsigned NOT NULL default '0',
  `comment_require_email` char(1) NOT NULL default 'y',
  `comment_text_formatting` char(5) NOT NULL default 'xhtml',
  `comment_html_formatting` char(4) NOT NULL default 'safe',
  `comment_allow_img_urls` char(1) NOT NULL default 'n',
  `comment_auto_link_urls` char(1) NOT NULL default 'y',
  `comment_notify` char(1) NOT NULL default 'n',
  `comment_notify_authors` char(1) NOT NULL default 'n',
  `comment_notify_emails` varchar(255) default NULL,
  `comment_expiration` int(4) unsigned NOT NULL default '0',
  `search_results_url` varchar(80) default NULL,
  `ping_return_url` varchar(80) default NULL,
  `show_url_title` char(1) NOT NULL default 'y',
  `show_ping_cluster` char(1) NOT NULL default 'y',
  `show_options_cluster` char(1) NOT NULL default 'y',
  `show_button_cluster` char(1) NOT NULL default 'y',
  `show_forum_cluster` char(1) NOT NULL default 'y',
  `show_pages_cluster` char(1) NOT NULL default 'y',
  `show_show_all_cluster` char(1) NOT NULL default 'y',
  `show_author_menu` char(1) NOT NULL default 'y',
  `show_status_menu` char(1) NOT NULL default 'y',
  `show_categories_menu` char(1) NOT NULL default 'y',
  `show_date_menu` char(1) NOT NULL default 'y',
  `rss_url` varchar(80) default NULL,
  `enable_versioning` char(1) NOT NULL default 'n',
  `max_revisions` smallint(4) unsigned NOT NULL default '10',
  `default_entry_title` varchar(100) default NULL,
  `url_title_prefix` varchar(80) default NULL,
  `live_look_template` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'posts','Posts','http://ee.local.net:8080/index.php',NULL,'en',16,0,1266882677,0,NULL,NULL,'open',1,NULL,NULL,'y','y',NULL,'all','y','y','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y','y','y','y','y','y','y','y','y','y','y',NULL,'n',10,'','',0),(3,1,'mytweets','My Tweets','http://ee.local.net:8080/index.php',NULL,'en',2,0,1268172787,0,'',0,'open',2,NULL,NULL,'y','y',NULL,'all','y','y','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y','y','y','y','y','y','y','y','y','y','y',NULL,'n',10,'','',0);
/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_comments`
--

DROP TABLE IF EXISTS `exp_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) default '1',
  `entry_id` int(10) unsigned default '0',
  `channel_id` int(4) unsigned default '1',
  `author_id` int(10) unsigned default '0',
  `status` char(1) default '0',
  `name` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `url` varchar(75) default NULL,
  `location` varchar(50) default NULL,
  `ip_address` varchar(16) default NULL,
  `comment_date` int(10) default NULL,
  `edit_date` int(10) default NULL,
  `comment` text,
  `notify` char(1) default 'n',
  PRIMARY KEY  (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_comments`
--

LOCK TABLES `exp_comments` WRITE;
/*!40000 ALTER TABLE `exp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_log`
--

DROP TABLE IF EXISTS `exp_cp_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'chris.hardcastle','127.0.1.1',1266787872,'Logged in'),(2,1,1,'chris.hardcastle','127.0.1.1',1266788549,'Logged in'),(3,1,1,'chris.hardcastle','127.0.1.1',1266789009,'Field Group Created:&nbsp;Body'),(4,1,1,'chris.hardcastle','127.0.1.1',1266789318,'Channel Created:&nbsp;&nbsp;Posts'),(5,1,1,'chris.hardcastle','127.0.1.1',1266794300,'Logged in'),(6,1,1,'chris.hardcastle','127.0.1.1',1266876187,'Logged in'),(7,1,1,'chris.hardcastle','127.0.1.1',1267744730,'Logged in'),(8,1,1,'chris.hardcastle','127.0.1.1',1268089341,'Logged in'),(9,1,1,'chris.hardcastle','127.0.1.1',1268122140,'Logged in'),(10,1,1,'chris.hardcastle','127.0.1.1',1268166063,'Logged in'),(11,1,1,'chris.hardcastle','127.0.1.1',1268166147,'Field Group Created:&nbsp;Micro'),(12,1,1,'chris.hardcastle','127.0.1.1',1268166458,'Channel Created:&nbsp;&nbsp;My Tweets'),(13,1,1,'chris.hardcastle','127.0.1.1',1268167814,'Channel Deleted:&nbsp;&nbsp;My Tweets'),(14,1,1,'chris.hardcastle','127.0.1.1',1268167917,'Channel Created:&nbsp;&nbsp;My Tweets'),(15,1,1,'chris.hardcastle','127.0.1.1',1268167947,'Custom Field Deleted:&nbsp;Content');
/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_search_index`
--

DROP TABLE IF EXISTS `exp_cp_search_index`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL auto_increment,
  `controller` varchar(20) default NULL,
  `method` varchar(50) default NULL,
  `language` varchar(20) default NULL,
  `access` varchar(50) default NULL,
  `keywords` text,
  PRIMARY KEY  (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_cp_search_index`
--

LOCK TABLES `exp_cp_search_index` WRITE;
/*!40000 ALTER TABLE `exp_cp_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_cp_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache`
--

DROP TABLE IF EXISTS `exp_email_cache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL auto_increment,
  `cache_date` int(10) unsigned NOT NULL default '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL default 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL default 'y',
  `priority` char(1) NOT NULL default '3',
  PRIMARY KEY  (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_email_cache`
--

LOCK TABLES `exp_email_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_mg`
--

DROP TABLE IF EXISTS `exp_email_cache_mg`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY  (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_email_cache_mg`
--

LOCK TABLES `exp_email_cache_mg` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_mg` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_mg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_ml`
--

DROP TABLE IF EXISTS `exp_email_cache_ml`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY  (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_email_cache_ml`
--

LOCK TABLES `exp_email_cache_ml` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_console_cache`
--

DROP TABLE IF EXISTS `exp_email_console_cache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL auto_increment,
  `cache_date` int(10) unsigned NOT NULL default '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY  (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_email_console_cache`
--

LOCK TABLES `exp_email_console_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_console_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_console_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_tracker`
--

DROP TABLE IF EXISTS `exp_email_tracker`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL auto_increment,
  `email_date` int(10) unsigned NOT NULL default '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL default '1',
  PRIMARY KEY  (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_email_tracker`
--

LOCK TABLES `exp_email_tracker` WRITE;
/*!40000 ALTER TABLE `exp_email_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_ping_status`
--

DROP TABLE IF EXISTS `exp_entry_ping_status`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entry_id`,`ping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_entry_ping_status`
--

LOCK TABLES `exp_entry_ping_status` WRITE;
/*!40000 ALTER TABLE `exp_entry_ping_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_ping_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_versioning`
--

DROP TABLE IF EXISTS `exp_entry_versioning`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY  (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_entry_versioning`
--

LOCK TABLES `exp_entry_versioning` WRITE;
/*!40000 ALTER TABLE `exp_entry_versioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_versioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_extensions`
--

DROP TABLE IF EXISTS `exp_extensions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL auto_increment,
  `class` varchar(50) NOT NULL default '',
  `method` varchar(50) NOT NULL default '',
  `hook` varchar(50) NOT NULL default '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL default '10',
  `version` varchar(10) NOT NULL default '',
  `enabled` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_formatting`
--

DROP TABLE IF EXISTS `exp_field_formatting`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL auto_increment,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY  (`formatting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (1,1,'none'),(2,1,'br'),(3,1,'xhtml'),(4,2,'none'),(5,2,'br'),(6,2,'xhtml'),(15,5,'xhtml'),(14,5,'br'),(13,5,'none'),(10,4,'none'),(11,4,'br'),(12,4,'xhtml');
/*!40000 ALTER TABLE `exp_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_groups`
--

DROP TABLE IF EXISTS `exp_field_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,1,'Posts'),(2,1,'Micro');
/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_global_variables`
--

DROP TABLE IF EXISTS `exp_global_variables`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY  (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_global_variables`
--

LOCK TABLES `exp_global_variables` WRITE;
/*!40000 ALTER TABLE `exp_global_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_global_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_html_buttons`
--

DROP TABLE IF EXISTS `exp_html_buttons`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL default '1',
  `classname` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_html_buttons`
--

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;
INSERT INTO `exp_html_buttons` VALUES (1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');
/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_layout_publish`
--

DROP TABLE IF EXISTS `exp_layout_publish`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_group` int(4) unsigned NOT NULL default '0',
  `channel_id` int(4) unsigned NOT NULL default '0',
  `field_layout` text,
  PRIMARY KEY  (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_layout_publish`
--

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_layout_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_bulletin_board`
--

DROP TABLE IF EXISTS `exp_member_bulletin_board`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL default '',
  `bulletin_expires` int(10) unsigned NOT NULL default '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY  (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_member_bulletin_board`
--

LOCK TABLES `exp_member_bulletin_board` WRITE;
/*!40000 ALTER TABLE `exp_member_bulletin_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_bulletin_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_data`
--

DROP TABLE IF EXISTS `exp_member_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_member_data`
--

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;
INSERT INTO `exp_member_data` VALUES (1);
/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_fields`
--

DROP TABLE IF EXISTS `exp_member_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL auto_increment,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL default 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) default '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL default 'y',
  `m_field_required` char(1) NOT NULL default 'n',
  `m_field_public` char(1) NOT NULL default 'y',
  `m_field_reg` char(1) NOT NULL default 'n',
  `m_field_fmt` char(5) NOT NULL default 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_member_fields`
--

LOCK TABLES `exp_member_fields` WRITE;
/*!40000 ALTER TABLE `exp_member_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_groups`
--

DROP TABLE IF EXISTS `exp_member_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL default 'y',
  `can_view_offline_system` char(1) NOT NULL default 'n',
  `can_view_online_system` char(1) NOT NULL default 'y',
  `can_access_cp` char(1) NOT NULL default 'y',
  `can_access_content` char(1) NOT NULL default 'n',
  `can_access_publish` char(1) NOT NULL default 'n',
  `can_access_edit` char(1) NOT NULL default 'n',
  `can_access_files` char(1) NOT NULL default 'n',
  `can_access_design` char(1) NOT NULL default 'n',
  `can_access_addons` char(1) NOT NULL default 'n',
  `can_access_modules` char(1) NOT NULL default 'n',
  `can_access_extensions` char(1) NOT NULL default 'n',
  `can_access_accessories` char(1) NOT NULL default 'n',
  `can_access_plugins` char(1) NOT NULL default 'n',
  `can_access_members` char(1) NOT NULL default 'n',
  `can_access_admin` char(1) NOT NULL default 'n',
  `can_access_sys_prefs` char(1) NOT NULL default 'n',
  `can_access_content_prefs` char(1) NOT NULL default 'n',
  `can_access_tools` char(1) NOT NULL default 'n',
  `can_access_comm` char(1) NOT NULL default 'n',
  `can_access_utilities` char(1) NOT NULL default 'n',
  `can_access_data` char(1) NOT NULL default 'n',
  `can_access_logs` char(1) NOT NULL default 'n',
  `can_admin_channels` char(1) NOT NULL default 'n',
  `can_admin_design` char(1) NOT NULL default 'n',
  `can_admin_members` char(1) NOT NULL default 'n',
  `can_delete_members` char(1) NOT NULL default 'n',
  `can_admin_mbr_groups` char(1) NOT NULL default 'n',
  `can_admin_mbr_templates` char(1) NOT NULL default 'n',
  `can_ban_users` char(1) NOT NULL default 'n',
  `can_admin_modules` char(1) NOT NULL default 'n',
  `can_admin_templates` char(1) NOT NULL default 'n',
  `can_admin_accessories` char(1) NOT NULL default 'n',
  `can_edit_categories` char(1) NOT NULL default 'n',
  `can_delete_categories` char(1) NOT NULL default 'n',
  `can_view_other_entries` char(1) NOT NULL default 'n',
  `can_edit_other_entries` char(1) NOT NULL default 'n',
  `can_assign_post_authors` char(1) NOT NULL default 'n',
  `can_delete_self_entries` char(1) NOT NULL default 'n',
  `can_delete_all_entries` char(1) NOT NULL default 'n',
  `can_view_other_comments` char(1) NOT NULL default 'n',
  `can_edit_own_comments` char(1) NOT NULL default 'n',
  `can_delete_own_comments` char(1) NOT NULL default 'n',
  `can_edit_all_comments` char(1) NOT NULL default 'n',
  `can_delete_all_comments` char(1) NOT NULL default 'n',
  `can_moderate_comments` char(1) NOT NULL default 'n',
  `can_send_email` char(1) NOT NULL default 'n',
  `can_send_cached_email` char(1) NOT NULL default 'n',
  `can_email_member_groups` char(1) NOT NULL default 'n',
  `can_email_mailinglist` char(1) NOT NULL default 'n',
  `can_email_from_profile` char(1) NOT NULL default 'n',
  `can_view_profiles` char(1) NOT NULL default 'n',
  `can_delete_self` char(1) NOT NULL default 'n',
  `mbr_delete_notify_emails` varchar(255) default NULL,
  `can_post_comments` char(1) NOT NULL default 'n',
  `exclude_from_moderation` char(1) NOT NULL default 'n',
  `can_search` char(1) NOT NULL default 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL default 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL default '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL default '60',
  `can_attach_in_private_messages` char(1) NOT NULL default 'n',
  `can_send_bulletins` char(1) NOT NULL default 'n',
  `include_in_authorlist` char(1) NOT NULL default 'n',
  `include_in_memberlist` char(1) NOT NULL default 'y',
  `include_in_mailinglists` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_member_groups`
--

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;
INSERT INTO `exp_member_groups` VALUES (1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');
/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_homepage`
--

DROP TABLE IF EXISTS `exp_member_homepage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL default 'l',
  `recent_entries_order` int(3) unsigned NOT NULL default '0',
  `recent_comments` char(1) NOT NULL default 'l',
  `recent_comments_order` int(3) unsigned NOT NULL default '0',
  `recent_members` char(1) NOT NULL default 'n',
  `recent_members_order` int(3) unsigned NOT NULL default '0',
  `site_statistics` char(1) NOT NULL default 'r',
  `site_statistics_order` int(3) unsigned NOT NULL default '0',
  `member_search_form` char(1) NOT NULL default 'n',
  `member_search_form_order` int(3) unsigned NOT NULL default '0',
  `notepad` char(1) NOT NULL default 'r',
  `notepad_order` int(3) unsigned NOT NULL default '0',
  `bulletin_board` char(1) NOT NULL default 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL default '0',
  `pmachine_news_feed` char(1) NOT NULL default 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_member_homepage`
--

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;
INSERT INTO `exp_member_homepage` VALUES (1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0);
/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_search`
--

DROP TABLE IF EXISTS `exp_member_search`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_member_search`
--

LOCK TABLES `exp_member_search` WRITE;
/*!40000 ALTER TABLE `exp_member_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_members`
--

DROP TABLE IF EXISTS `exp_members`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL auto_increment,
  `group_id` smallint(4) NOT NULL default '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) default NULL,
  `authcode` varchar(10) default NULL,
  `email` varchar(50) NOT NULL,
  `url` varchar(150) default NULL,
  `location` varchar(50) default NULL,
  `occupation` varchar(80) default NULL,
  `interests` varchar(120) default NULL,
  `bday_d` int(2) default NULL,
  `bday_m` int(2) default NULL,
  `bday_y` int(4) default NULL,
  `aol_im` varchar(50) default NULL,
  `yahoo_im` varchar(50) default NULL,
  `msn_im` varchar(50) default NULL,
  `icq` varchar(50) default NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) default NULL,
  `avatar_width` int(4) unsigned default NULL,
  `avatar_height` int(4) unsigned default NULL,
  `photo_filename` varchar(120) default NULL,
  `photo_width` int(4) unsigned default NULL,
  `photo_height` int(4) unsigned default NULL,
  `sig_img_filename` varchar(120) default NULL,
  `sig_img_width` int(4) unsigned default NULL,
  `sig_img_height` int(4) unsigned default NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL default '0',
  `accept_messages` char(1) NOT NULL default 'y',
  `last_view_bulletins` int(10) NOT NULL default '0',
  `last_bulletin_date` int(10) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `join_date` int(10) unsigned NOT NULL default '0',
  `last_visit` int(10) unsigned NOT NULL default '0',
  `last_activity` int(10) unsigned NOT NULL default '0',
  `total_entries` smallint(5) unsigned NOT NULL default '0',
  `total_comments` smallint(5) unsigned NOT NULL default '0',
  `total_forum_topics` mediumint(8) NOT NULL default '0',
  `total_forum_posts` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `last_forum_post_date` int(10) unsigned NOT NULL default '0',
  `last_email_date` int(10) unsigned NOT NULL default '0',
  `in_authorlist` char(1) NOT NULL default 'n',
  `accept_admin_email` char(1) NOT NULL default 'y',
  `accept_user_email` char(1) NOT NULL default 'y',
  `notify_by_default` char(1) NOT NULL default 'y',
  `notify_of_pm` char(1) NOT NULL default 'y',
  `display_avatars` char(1) NOT NULL default 'y',
  `display_signatures` char(1) NOT NULL default 'y',
  `parse_smileys` char(1) NOT NULL default 'y',
  `smart_notifications` char(1) NOT NULL default 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL default 'n',
  `localization_is_site_default` char(1) NOT NULL default 'n',
  `time_format` char(2) NOT NULL default 'us',
  `cp_theme` varchar(32) default NULL,
  `profile_theme` varchar(32) default NULL,
  `forum_theme` varchar(32) default NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL default '20',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL default '18',
  `quick_links` text,
  `quick_tabs` text,
  `pmember_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_members`
--

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;
INSERT INTO `exp_members` VALUES (1,1,'chris.hardcastle','Chris','e6d4109799213ee32986ab70a5c25b71fc6d89ff','0850dd0289d84b3cd1c38ae5febd8443423875ad','5a27b494424f0875fbba585e4d6b16325f116740',NULL,'me@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.1.1',1266787822,1268123628,1268173781,19,0,0,0,1268172968,0,0,0,'n','y','y','y','y','y','y','y','y','english','UTC','y','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18','',NULL,0);
/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_attachments`
--

DROP TABLE IF EXISTS `exp_message_attachments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL default '0',
  `message_id` int(10) unsigned NOT NULL default '0',
  `attachment_name` varchar(50) NOT NULL default '',
  `attachment_hash` varchar(40) NOT NULL default '',
  `attachment_extension` varchar(20) NOT NULL default '',
  `attachment_location` varchar(150) NOT NULL default '',
  `attachment_date` int(10) unsigned NOT NULL default '0',
  `attachment_size` int(10) unsigned NOT NULL default '0',
  `is_temp` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_message_attachments`
--

LOCK TABLES `exp_message_attachments` WRITE;
/*!40000 ALTER TABLE `exp_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_copies`
--

DROP TABLE IF EXISTS `exp_message_copies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL auto_increment,
  `message_id` int(10) unsigned NOT NULL default '0',
  `sender_id` int(10) unsigned NOT NULL default '0',
  `recipient_id` int(10) unsigned NOT NULL default '0',
  `message_received` char(1) NOT NULL default 'n',
  `message_read` char(1) NOT NULL default 'n',
  `message_time_read` int(10) unsigned NOT NULL default '0',
  `attachment_downloaded` char(1) NOT NULL default 'n',
  `message_folder` int(10) unsigned NOT NULL default '1',
  `message_authcode` varchar(10) NOT NULL default '',
  `message_deleted` char(1) NOT NULL default 'n',
  `message_status` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_message_copies`
--

LOCK TABLES `exp_message_copies` WRITE;
/*!40000 ALTER TABLE `exp_message_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_data`
--

DROP TABLE IF EXISTS `exp_message_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL default '0',
  `message_date` int(10) unsigned NOT NULL default '0',
  `message_subject` varchar(255) NOT NULL default '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL default 'y',
  `message_attachments` char(1) NOT NULL default 'n',
  `message_recipients` varchar(200) NOT NULL default '',
  `message_cc` varchar(200) NOT NULL default '',
  `message_hide_cc` char(1) NOT NULL default 'n',
  `message_sent_copy` char(1) NOT NULL default 'n',
  `total_recipients` int(5) unsigned NOT NULL default '0',
  `message_status` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_message_data`
--

LOCK TABLES `exp_message_data` WRITE;
/*!40000 ALTER TABLE `exp_message_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_folders`
--

DROP TABLE IF EXISTS `exp_message_folders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL default '0',
  `folder1_name` varchar(50) NOT NULL default 'InBox',
  `folder2_name` varchar(50) NOT NULL default 'Sent',
  `folder3_name` varchar(50) NOT NULL default '',
  `folder4_name` varchar(50) NOT NULL default '',
  `folder5_name` varchar(50) NOT NULL default '',
  `folder6_name` varchar(50) NOT NULL default '',
  `folder7_name` varchar(50) NOT NULL default '',
  `folder8_name` varchar(50) NOT NULL default '',
  `folder9_name` varchar(50) NOT NULL default '',
  `folder10_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_message_folders`
--

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_listed`
--

DROP TABLE IF EXISTS `exp_message_listed`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL default '0',
  `listed_member` int(10) unsigned NOT NULL default '0',
  `listed_description` varchar(100) NOT NULL default '',
  `listed_type` varchar(10) NOT NULL default 'blocked',
  PRIMARY KEY  (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_message_listed`
--

LOCK TABLES `exp_message_listed` WRITE;
/*!40000 ALTER TABLE `exp_message_listed` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_listed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_module_member_groups`
--

DROP TABLE IF EXISTS `exp_module_member_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_module_member_groups`
--

LOCK TABLES `exp_module_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_module_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_module_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_modules`
--

DROP TABLE IF EXISTS `exp_modules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL auto_increment,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_modules`
--

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` VALUES (1,'Comment','2.0','n'),(2,'Email','2.0','n'),(3,'Emoticon','2.0','n'),(4,'Jquery','1.0','n'),(5,'Rss','2.0','n'),(6,'Search','2.0','n'),(7,'Channel','2.0','n'),(8,'Stats','2.0','n');
/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_online_users`
--

DROP TABLE IF EXISTS `exp_online_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `in_forum` char(1) NOT NULL default 'n',
  `name` varchar(50) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `date` int(10) unsigned NOT NULL default '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY  (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_online_users`
--

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
INSERT INTO `exp_online_users` VALUES (15,1,1,'n','Chris','127.0.1.1',1268173914,'y'),(19,1,1,'n','Chris','127.0.1.1',1268173914,'y'),(14,1,1,'n','Chris','127.0.1.1',1268173914,'y'),(18,1,0,'n','','127.0.1.1',1268174158,''),(17,1,0,'n','','127.0.1.1',1268174158,''),(16,1,1,'n','Chris','127.0.1.1',1268173914,'y'),(20,1,0,'n','','127.0.1.1',1268174158,''),(21,1,1,'n','Chris','127.0.1.1',1268173914,'y'),(22,1,0,'n','','127.0.1.1',1268174158,''),(23,1,1,'n','Chris','127.0.1.1',1268173914,'y'),(24,1,1,'n','Chris','127.0.1.1',1268173914,'y');
/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_pages_configuration`
--

DROP TABLE IF EXISTS `exp_pages_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_pages_configuration` (
  `configuration_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(8) unsigned NOT NULL default '1',
  `configuration_name` varchar(60) NOT NULL,
  `configuration_value` varchar(100) NOT NULL,
  PRIMARY KEY  (`configuration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_pages_configuration`
--

LOCK TABLES `exp_pages_configuration` WRITE;
/*!40000 ALTER TABLE `exp_pages_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_pages_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_password_lockout`
--

DROP TABLE IF EXISTS `exp_password_lockout`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL auto_increment,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(50) NOT NULL,
  PRIMARY KEY  (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_ping_servers`
--

DROP TABLE IF EXISTS `exp_ping_servers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL default '80',
  `ping_protocol` varchar(12) NOT NULL default 'xmlrpc',
  `is_default` char(1) NOT NULL default 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_ping_servers`
--

LOCK TABLES `exp_ping_servers` WRITE;
/*!40000 ALTER TABLE `exp_ping_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_ping_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_relationships`
--

DROP TABLE IF EXISTS `exp_relationships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL auto_increment,
  `rel_parent_id` int(10) NOT NULL default '0',
  `rel_child_id` int(10) NOT NULL default '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY  (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_reset_password`
--

DROP TABLE IF EXISTS `exp_reset_password`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY  (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_reset_password`
--

LOCK TABLES `exp_reset_password` WRITE;
/*!40000 ALTER TABLE `exp_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_revision_tracker`
--

DROP TABLE IF EXISTS `exp_revision_tracker`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY  (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_revision_tracker`
--

LOCK TABLES `exp_revision_tracker` WRITE;
/*!40000 ALTER TABLE `exp_revision_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_revision_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search`
--

DROP TABLE IF EXISTS `exp_search`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL default '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY  (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_search`
--

LOCK TABLES `exp_search` WRITE;
/*!40000 ALTER TABLE `exp_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search_log`
--

DROP TABLE IF EXISTS `exp_search_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_search_log`
--

LOCK TABLES `exp_search_log` WRITE;
/*!40000 ALTER TABLE `exp_search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_security_hashes`
--

DROP TABLE IF EXISTS `exp_security_hashes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL auto_increment,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY  (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=1827 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (1826,1268173898,'127.0.1.1','835386025384575684e54576c19b4c19491ecac8'),(1825,1268173898,'127.0.1.1','6453e501bf9abf300af5cb7182688b64bbf453a5'),(1824,1268173898,'127.0.1.1','1253d84c4b056ebc654d6129f8894b2f35c28979'),(1793,1268172968,'127.0.1.1','08277818d49aeb7b9e48da55179e8e2f00a4ac4e'),(1792,1268172968,'127.0.1.1','15677d89ba1d23178d1cc2cb9a5612d5111c8980'),(1791,1268172968,'127.0.1.1','27f5dd67f99da849c81f6460d29de1e7ee7a1fb5'),(1790,1268172968,'127.0.1.1','aaa26cb16a8a2cca70e25fce9ca64ac34020f6fb'),(1789,1268172968,'127.0.1.1','dce9c5c3eab146c60dbfd223a0e625e262bdbc8d'),(1788,1268172968,'127.0.1.1','c10ee72e7f723b3e573b369d9fb60b3d34bea16a'),(1787,1268172968,'127.0.1.1','c4188afffd67669ab91f292a129c01c2c8147cd1'),(1786,1268172812,'127.0.1.1','e780e41e36d8384eb404cd2109871bfb9e9ec4d2'),(1785,1268172812,'127.0.1.1','5925fc54fbf0a5c87f2d5df224fb25a2b0cc82df'),(1784,1268172812,'127.0.1.1','fe652c7740d5c2dcaa92c8e7eca3c4c10e1500b6'),(1783,1268172812,'127.0.1.1','4c01eac4785a21f392bdfcda8b3219fa0779f3e4'),(1782,1268172811,'127.0.1.1','84a0df59818621b017d0d7bc4af58da6f4b9a667'),(1781,1268172683,'127.0.1.1','82a4815b46b311cb37f30fb124b8dbd53105fdff'),(1780,1268172683,'127.0.1.1','4865f24060f2365aea99fb5781caa8a65322b5bc'),(1779,1268172683,'127.0.1.1','63ad354fee565451826fbda2d7ec9d0ef3e6cd0e'),(1778,1268172683,'127.0.1.1','4bc087d172135b12460b06517cf07639bac7b978'),(1777,1268172683,'127.0.1.1','e26270b269e03c619d21ea2a597553ad2a1af693'),(1776,1268172683,'127.0.1.1','09574ea5a1c0391df64fcab4be08ac1df5c2c952'),(1775,1268172683,'127.0.1.1','b341ac44e95f383b964c604959bfb475f1e30cc8'),(1774,1268172682,'127.0.1.1','305effcf9f673a9728a8fb96224809d3f04f1b88'),(1773,1268172665,'127.0.1.1','4431b5507114192d7d2c43af2a98a5772146e9da'),(1772,1268172665,'127.0.1.1','bd592821543aeadf471a639416eabef23a6c365d'),(1771,1268172665,'127.0.1.1','dc401d252fc30a3f83433a54f751d5915bc09b05'),(1770,1268172665,'127.0.1.1','b7ddd86a191a1829bc14f5d098d91438245cde12'),(1769,1268172665,'127.0.1.1','b5d280ee7effb1d471016281580040aa29e4747d'),(1768,1268172661,'127.0.1.1','c65a5e18ae9439ffb5a4722adce4ccdd73dc59fa'),(1767,1268172661,'127.0.1.1','98cbff6058738bbb84a7f3e341b794bfbeffaf3f'),(1766,1268172660,'127.0.1.1','9bef0ff2629749549727d63593eabc57a7667e5c'),(1765,1268172656,'127.0.1.1','3e3927fd565498c584d9b27ae86a90628e9cb00d'),(1764,1268172656,'127.0.1.1','dd36f61e696005c10bd586e501efcf4ed7b3c309'),(1763,1268172649,'127.0.1.1','071ca5c8f4fbd57519c717a7d060664f6d8f1ac0'),(1762,1268172648,'127.0.1.1','607a0ec7346c857c2bdbfaf6ee3a53b9d4c07b1d'),(1761,1268172648,'127.0.1.1','589f6d846e9ae302bd9aca459fd02cdbc0b1acf3'),(1760,1268172589,'127.0.1.1','b8fab905a64da7e1c0b1cc0de6342d6735ee491d'),(1759,1268172589,'127.0.1.1','38183c11c04446b9673fc19e17363acb7dc2b1b0'),(1758,1268172589,'127.0.1.1','13e289e69e4b414a6a7c2d44323c500a53047bb2'),(1757,1268172589,'127.0.1.1','0e5a6e9781ff5bec69a92cb5ed3ecf680743fe69'),(1756,1268172589,'127.0.1.1','a6a78364782ed138e69d8343a438f2f6cfc16e33'),(1755,1268172589,'127.0.1.1','bc25b0c8720dc050972b2a473d7bad10ea5a5561'),(1754,1268172589,'127.0.1.1','9b9a6d8eb3ac9fc2595e83f00cbf59d629ca69f8'),(1753,1268172589,'127.0.1.1','5658b4b4fa95c225c82bdc8e607acae70a9432b8'),(1752,1268172524,'127.0.1.1','e887bb5188802fbdac8c6f3b3733c1acf993704f'),(1751,1268172524,'127.0.1.1','b66c3e17a0eefcb7e1379e724fba643bf187d61c'),(1750,1268172522,'127.0.1.1','655a31540636a5dd9e8362703c6547aed4c5351a'),(1749,1268172521,'127.0.1.1','67426e3f3d66ff7ea2ebd214463e16d5c494fef8'),(1748,1268172519,'127.0.1.1','5cab22a3dc0352cb12963f56742cceb9558763f9'),(1747,1268172518,'127.0.1.1','eaf4c699fce265460252e9dfb4a6793cf074d78f'),(1746,1268168310,'127.0.1.1','24760e969fefe8e06e189bf731bb0e85e2c17547'),(1745,1268168310,'127.0.1.1','f8afb8382a267de8bb9e418c458d1055e867c4bb'),(1744,1268168310,'127.0.1.1','194dabc81fd5b8fbb16b40290ece31d3535842ec'),(1743,1268168310,'127.0.1.1','abe23d20537fcb7f3b9db6243811ee40b50804f4'),(1742,1268168310,'127.0.1.1','2afd42ccc7fca82dbb056e9989bfdd789883491d'),(1741,1268168310,'127.0.1.1','5490ba43d0d693afb06a0628a7dc4554044805ee'),(1740,1268168309,'127.0.1.1','24767991f931d31329156497ee3e914985d008ef'),(1739,1268168309,'127.0.1.1','24d7e36f044ff489d9d0f6053fd87bd50f51591b'),(1738,1268168239,'127.0.1.1','30c531832381de80edc8787547edf0214b4921cd'),(1737,1268168239,'127.0.1.1','3d2da23d0cab1583cb80f1789dace7ea24180949'),(1736,1268168239,'127.0.1.1','8a0e7615e29c83e999e1b66a65434ff0031816a9'),(1735,1268168239,'127.0.1.1','d49fb38b7bfffc6b24fe088323cce068e87c87c4'),(1734,1268168238,'127.0.1.1','5f60953ced6abf7a75e47a8e7ac52ef829fca111'),(1733,1268168073,'127.0.1.1','eef8d685c95055a100f6eb49e5cb82aa36d7233a'),(1732,1268168072,'127.0.1.1','519ad4ee2a94522bed789fd925c9c88bccd67cfe'),(1731,1268168072,'127.0.1.1','04b6e0a203e3c57c8c4ee0db2b81b4641230d64c'),(1730,1268168072,'127.0.1.1','a2746af1efb1fc4850232625b2931e8570a16fd0'),(1729,1268168072,'127.0.1.1','2d93c509f18f5ece41e5c1d0ab8f6fe85c30a110'),(1728,1268168066,'127.0.1.1','70922fc2f358b45d5273fe1cb9980ca58c6ec853'),(1727,1268168065,'127.0.1.1','24d59d2b1aeb0ac1c9fc96fc2bab004e0c8e4810'),(1724,1268168065,'127.0.1.1','6229497fd7561ae06a9b5c7d112eed9a3c96255d'),(1725,1268168065,'127.0.1.1','bd1dbc2673a37cfcc09fc9db37db009b3a50798a'),(1726,1268168065,'127.0.1.1','b15e078fec46b32fbdccaf21aae3db5d28c19520'),(1823,1268173898,'127.0.1.1','151ba32f39cc0a08a6779b6d7f88a480fbe4e5a5'),(1822,1268173849,'127.0.1.1','b5f8fa3a8520b0bad8481fab7ac253ca1f4c3930'),(1821,1268173849,'127.0.1.1','4b43640b790489fcaf11aa62880a9789ccd93e41'),(1820,1268173849,'127.0.1.1','1f1b31eb259c54c53c0d670e038a3638fdb1aa36'),(1819,1268173849,'127.0.1.1','aea6f64ff3060a1150c84ac9f627fd15ab225aca'),(1818,1268173849,'127.0.1.1','6634f8893426ef8e89cb95d7a69ad44e6585c1af'),(1817,1268173846,'127.0.1.1','9539112ef0772d93b6c69f03fcce5988ddfd91ec'),(1816,1268173833,'127.0.1.1','855d4106f9db4c922c05657a5716da334dc81585'),(1815,1268173833,'127.0.1.1','70e23b71c294124ce88975ee98a81a9a66ffec79'),(1814,1268173832,'127.0.1.1','1369af173a564341b61eb6f9fe221fa6da12e709'),(1813,1268173832,'127.0.1.1','79d9befcffb5cca6e34db11e14392f313cc5af2a'),(1812,1268173832,'127.0.1.1','fa9df4c83bc52370befa7be610a09a9cd5301aaf'),(1811,1268173817,'127.0.1.1','3a178e195af6b77823810aa158255fb54970ef4b'),(1810,1268173817,'127.0.1.1','b976cacdffb77853a1bfe3c56af6fe97f14aa537'),(1809,1268173817,'127.0.1.1','32628d606c09e7afce06c35b500048b3481cbc13'),(1808,1268173817,'127.0.1.1','cf3a7a04778f05656b60a2f4d9d0cec7fea0a62a'),(1807,1268173816,'127.0.1.1','d67b928e48fd8df122134b3d11e7c66c2e5edf97'),(1806,1268173814,'127.0.1.1','b8310b13df23d5399ef641800bb13431786cfd37'),(1805,1268173796,'127.0.1.1','ad2c628e42c87070769c96ca08f2fb658df89cdd'),(1804,1268173796,'127.0.1.1','456b4efc7d559fa6f1693e7e976d068b81f9e634'),(1803,1268173796,'127.0.1.1','0ccba82fc96266fb92581c25c3e2ef15125ec14d'),(1802,1268173796,'127.0.1.1','246bcdd2c6050f005c2589a05d4905a3aaa8087d'),(1801,1268173795,'127.0.1.1','0df76369b85650c247005d693e6c98db7f511c33'),(1800,1268173790,'127.0.1.1','7ba0a8717c4d675e14c63f8ec5c9c97f06075a97'),(1799,1268173790,'127.0.1.1','a85de0f3be0b1d4ee801b72c14f69b7c987ca23a'),(1798,1268173790,'127.0.1.1','7a98bc3f4ab153dfbb259944732711d5e108d940'),(1797,1268173783,'127.0.1.1','45710f09532e5746407125761961aa5e85ca2170'),(1796,1268173781,'127.0.1.1','6cd06d85d38a7f13ef36db24975064289c93a5c5'),(1795,1268173781,'127.0.1.1','c6a31f22ad615e05be0a32de1a308a2b3ae73329'),(1794,1268172969,'127.0.1.1','54701fbc44e5663c7e1548ef7947c8d12e0cafa2'),(1723,1268168065,'127.0.1.1','15c7f3650b0b357c7a3055bf241127a3b2eae560'),(1722,1268168065,'127.0.1.1','c78d11f99942edd83baa1c1437ca2261a1f0320d'),(1721,1268168065,'127.0.1.1','b9328fb3742d020470d4967ddf43d053fb830a51'),(1720,1268168046,'127.0.1.1','81c37d5adead910137050eb950a53c552e7aa79f'),(1719,1268168045,'127.0.1.1','c02e12510989a27364788feb7a01bf7951e3675c'),(1718,1268168041,'127.0.1.1','f9f2ca08cc027f80e8925d17936782c33cf74597'),(1717,1268168041,'127.0.1.1','23d1a7f26b8c2de6a32ad1b57a082f32d8b7181e'),(1716,1268168038,'127.0.1.1','d68938b3a5fb8c6a0dcb3ce1cbc90ddc19512755'),(1715,1268168038,'127.0.1.1','2b995773e2be5e9b227c276be25976ed722a5615'),(1714,1268167954,'127.0.1.1','b1e4e608e7019210c39c1cf6f8d02c0546e675d2'),(1713,1268167954,'127.0.1.1','a3f2c036ab38f605ffadaca6b81746de4ac35640'),(1712,1268167954,'127.0.1.1','e4cdce03239eb705eef39b6f07ac18d411fb75db'),(1711,1268167954,'127.0.1.1','129aaeb64479034688704b9add485da49e0e22f2'),(1710,1268167948,'127.0.1.1','c2a8c4f7281ca959941d5002e92b317c1a2d8bd8'),(1709,1268167948,'127.0.1.1','f88fea49478873857326edad3abb7650ea3cbc6e'),(1708,1268167948,'127.0.1.1','dde7ec47ca8550f01e499323704bdba1bac8dbb0'),(1707,1268167948,'127.0.1.1','b68f56ae49d77a4843f254a5a5d8e679ce202aac'),(1706,1268167948,'127.0.1.1','bfe96884066e6625a30cd80c8da245243f7c3e35'),(1705,1268167948,'127.0.1.1','982499f43eec4d39b5e8076d236f8b2e9029c805'),(1704,1268167948,'127.0.1.1','feef9c7df2e822a8976211fa9aa6ec0ade27b780'),(1703,1268167947,'127.0.1.1','3163605b2473462072557730925f7d53d096ed44'),(1702,1268167945,'127.0.1.1','3fa2b9e853f6e2d2c77ad92f6d5fafe4a25e671a'),(1701,1268167945,'127.0.1.1','34e1e04565a81becf8f7347ecc84d26b29e85864'),(1700,1268167941,'127.0.1.1','201bef0148b005682cdf4b713505a7f491a0751a'),(1699,1268167941,'127.0.1.1','c74b3b7acad9b7ac8407ac9f522c05f185a73c21'),(1698,1268167939,'127.0.1.1','7ef5e7ed447f66f315f216dbec48cf9062bc72d6'),(1697,1268167939,'127.0.1.1','3117033f054301a2db0cea1a1e7ff5803f245d8f'),(1696,1268167932,'127.0.1.1','39bd7367f9587bddcfa4ba2f25aa9597f7417108'),(1695,1268167932,'127.0.1.1','81c4d95bd0a94a089fc8720f6a46315574aa9450'),(1694,1268167930,'127.0.1.1','ee800b9507e8792ad65ab4ca00f0fa5b7c824f1b'),(1693,1268167930,'127.0.1.1','1e46e1c2f501774897deb32efd421de400c46548'),(1692,1268167918,'127.0.1.1','092040efe1c00d9a78ea2d14756545839bb58709'),(1691,1268167918,'127.0.1.1','8bc6ac5c45392e981b045da7d2e01427d6458f58'),(1690,1268167918,'127.0.1.1','25b67f0ae5c57f1e4cad02fd3e4e68b8457d537f'),(1689,1268167918,'127.0.1.1','ad6fa3af39b923a5255d49b41e33bab1b6d6fbab'),(1688,1268167918,'127.0.1.1','c63f6213e5add9bba6f0a843d3d5510a19723c09'),(1687,1268167918,'127.0.1.1','065ff93903a67a6cadb8479a947e1c0dc39b7ac1'),(1686,1268167917,'127.0.1.1','c984b37036ff3c350291ea15ec33a72b2a6a3dbc'),(1685,1268167917,'127.0.1.1','2ff335ae00c0af71b465350f85642824c47af0be'),(1684,1268167894,'127.0.1.1','a2a602cb9be5f31bf3b278dfbbd274ec65faf640'),(1683,1268167894,'127.0.1.1','f33685281ec56ba195a9051fb5ef5f4356be111b'),(1682,1268167891,'127.0.1.1','c53856b25f3f7e029c359763d0a720c557ea6e00'),(1681,1268167891,'127.0.1.1','dc3e1902f23cc3122c7371834d437d95754fbb5a'),(1680,1268167883,'127.0.1.1','7229b761fd5a2df4aed7280d2822cae90dde70d3'),(1679,1268167883,'127.0.1.1','9458c5e3eb054f5535a64b65591c1374fee7bb43'),(1678,1268167882,'127.0.1.1','ed74ac9aa44f3acacf33335ddfb87871f8af1070'),(1677,1268167882,'127.0.1.1','c28d0c0d3348509bab4df47fc4f7a383be7660a9'),(1676,1268167882,'127.0.1.1','17b3a799b74edf63a75a9a0c3108f5df3733f755'),(1675,1268167882,'127.0.1.1','33279c5dda6c3dc52accd045594522285b6c74c2'),(1674,1268167882,'127.0.1.1','39fbc7f36150daa2025e46a6ac624e8295e88846'),(1673,1268167882,'127.0.1.1','a7b60b9b51ec0473c0dd31976d5771666144e09c'),(1672,1268167837,'127.0.1.1','84622da1495a2b2e0e70bfd6922a6920c2f2c5f5'),(1671,1268167837,'127.0.1.1','d5b7893e4607e79fd6cbcf2b3907d66dd3ee074d'),(1670,1268167834,'127.0.1.1','20afc62dd89e82e154ab31345435dbc1996ee009'),(1669,1268167834,'127.0.1.1','27d19bda8ef69edec37d0da77676aa41a6a9bfe6'),(1668,1268167827,'127.0.1.1','67c9aec8de232c826b6f422c81b8e5eb019b46a7'),(1667,1268167827,'127.0.1.1','de43e1cba7f9c22522cd96cf7d5dce6665516282'),(1666,1268167814,'127.0.1.1','ff82104b6ff9dbb9ac3122b7b5030a5327a8a693'),(1665,1268167814,'127.0.1.1','bdbf2104b77979437f7370467044a456cbe6e757'),(1664,1268167812,'127.0.1.1','a978bb8eb8ac9c9bf4c3c18369f9730b3ac61094'),(1663,1268167811,'127.0.1.1','bf059b04bf5b9f966ae086204222ce8891627edf'),(1662,1268167807,'127.0.1.1','cff710a1645e31c91636def7d5d28c94860db8a9'),(1661,1268167806,'127.0.1.1','da2a27793b3f2d03a03e8f33e994885658bd27b8'),(1660,1268166595,'127.0.1.1','ae96c74373ebff168a99cda32d9ac76f851ae037'),(1659,1268166595,'127.0.1.1','340fe65e5f4fe918e16e7336e1d93fd8bf3dbce6'),(1658,1268166595,'127.0.1.1','55ef4fc5ec697dee2269317a7b8cb71d7aa98b01'),(1657,1268166595,'127.0.1.1','d0fdfbe9f69b4880ef9f618896bc242eab8b3c03'),(1656,1268166594,'127.0.1.1','2cae652a40ccd2a8ebac717a544e3dba73e1ddf5'),(1655,1268166594,'127.0.1.1','d21b5799924ea0780bf32fd359afea1e4b34c465'),(1654,1268166459,'127.0.1.1','1391c7a73e04e8982ee733eb242798df448b0347'),(1653,1268166459,'127.0.1.1','918e54c9a9778bffea1d4613a4ec0a67d2b22495'),(1652,1268166459,'127.0.1.1','115928c476f3d960a7990a44ebf24f78b8d27fb4'),(1651,1268166459,'127.0.1.1','3b174a2c28152d76a2620ffad1f590e57439973d'),(1650,1268166459,'127.0.1.1','54f886931af90194189836a0805f29c148cd34bb'),(1649,1268166459,'127.0.1.1','f1eee66544e246441184bc09ee3e5884bfb1a484'),(1648,1268166458,'127.0.1.1','dfe4c69fdb1ace5b1decb03bd77f3add0811ae96'),(1647,1268166458,'127.0.1.1','02b927a58d97fbfcd9f372c2a9e486aabf52fee7'),(1646,1268166410,'127.0.1.1','8b442b4f05e03f4773980634fd0371396bde3925'),(1645,1268166410,'127.0.1.1','19143a80ac3acf9c47105c525d6a697c2db8ca75'),(1644,1268166384,'127.0.1.1','78b3408746dd0f03827beec118f96f13e8ad6f0a'),(1643,1268166383,'127.0.1.1','b1e6cfa92b2e714522e9e1602bfc71b087730531'),(1642,1268166383,'127.0.1.1','859480bc8386f4a5095ac4075613cdf63009f85f'),(1641,1268166250,'127.0.1.1','5d6ab9d228074f77b732713e26d4791a1ad6f6b5'),(1640,1268166249,'127.0.1.1','6aec114335643f2c713869f55ca579223bba4218'),(1639,1268166243,'127.0.1.1','d0aa14da0fdbde59ec35cdcdf1bd098971adbd6f'),(1638,1268166243,'127.0.1.1','d8f5ea35b89262c3304ec3999780c3018215a0d8'),(1637,1268166243,'127.0.1.1','eafa3eff13841c07e37c49c5ba2c909131c823e2'),(1636,1268166243,'127.0.1.1','338dd594b8d385fd8602f08e0436c9b9c9636380'),(1635,1268166243,'127.0.1.1','690a443e6cea05ef4a3e319b33634f0f80b9df66'),(1634,1268166243,'127.0.1.1','972ec8261be03469ca10c6075d5072ebdb9eb1d7'),(1633,1268166243,'127.0.1.1','45417fd35b74b93bb942381cbadb60b526047974'),(1632,1268166242,'127.0.1.1','68f2d2ff8b7d253fb615e5a388e30ca943d150c6'),(1631,1268166222,'127.0.1.1','672768606699b19002654707c8297241acb65146'),(1630,1268166221,'127.0.1.1','7ab891b9f4feb3f8be00efc1df4504b3637bc060'),(1617,1268166134,'127.0.1.1','999cfdfbf68c373ffec2021bdaca76117a8dd941'),(1616,1268166134,'127.0.1.1','2f1d28432a91be809f456b8387d6a53deb3f236e'),(1611,1268166123,'127.0.1.1','229cf566595caab0b0e28fafa284ce1a560ba42e'),(1612,1268166126,'127.0.1.1','cd89598f25bfe00480f2a8e4140d2125f35878d4'),(1613,1268166127,'127.0.1.1','771497d17e0b969621d3ca982a74e50a39afd425'),(1614,1268166131,'127.0.1.1','80f9c6141d8649d592524805d9a01ea6e8b7e1a2'),(1615,1268166131,'127.0.1.1','1de44bdd49663a92a5c269142e4f18907d584bb6'),(1629,1268166154,'127.0.1.1','3d22eaccee51addff8d3a005f74f7fc3ee34c201'),(1628,1268166154,'127.0.1.1','ea868d1faecfae2d28bf9aa2ecc4b500020592ac'),(1627,1268166151,'127.0.1.1','61b377aa6fbf3e69806c7b51ee7a9557ce38dc0d'),(1626,1268166150,'127.0.1.1','d7579d29c8cb130bc9ece3ffeb736edd807b73ca'),(1625,1268166147,'127.0.1.1','97077149b388334f0289868e6ef04055b772c57e'),(1624,1268166147,'127.0.1.1','57ad9ec81e1c5c2154a9c62b8a975d089b8fbb61'),(1623,1268166147,'127.0.1.1','3fb9da265d5999101ddd655e4044fb53bc72c6e9'),(1622,1268166147,'127.0.1.1','02ced3b370d1ce4e26388712401a5cdbe8f6f2e3'),(1621,1268166147,'127.0.1.1','78bfa703e847bfe2f1e5f7425a9f08fe6ddf5556'),(1620,1268166147,'127.0.1.1','a95bea88aa01965c517ca5598ae4247ae7191ade'),(1619,1268166147,'127.0.1.1','f57b3a9782dff99d64545a2a3562c48104785d52'),(1618,1268166147,'127.0.1.1','04c15b0cd4c7d1567ff711f595d4e3406cf30e50'),(1594,1268166056,'127.0.1.1','3dbf6b4784eb7a5134da211afe1297ac55d252a6'),(1610,1268166123,'127.0.1.1','711beca6352da987dbd3a347b39d08f5b6992882'),(1609,1268166111,'127.0.1.1','0f52f386c1f7ea6c4f60373b2fbff99f2002c01f'),(1608,1268166111,'127.0.1.1','18090268a5229699fe29e5351bcf85f97a1f84d0'),(1607,1268166108,'127.0.1.1','84f0cde16b3388f54a8add8a655cb41fb5dab531'),(1606,1268166108,'127.0.1.1','3d27f3f81d7eda40a19d0c2d6915aef724e496e4'),(1605,1268166068,'127.0.1.1','be23b0d599d9c606cbeeeb744a080a720efde9ff'),(1604,1268166068,'127.0.1.1','7b98423f017cbc3e5c9f8df99050d4318e8ae6bd'),(1603,1268166065,'127.0.1.1','6074abab7939609518146356fc620226c76d757d'),(1602,1268166064,'127.0.1.1','4e615c0347b354bb3202418eb33424b5037c5eac'),(1601,1268166064,'127.0.1.1','dead60b8256148e8775f57aef7895da80ff8b06d'),(1600,1268166064,'127.0.1.1','329aeddbddbfb55cffc0e8585661d6c357b1812a'),(1599,1268166064,'127.0.1.1','55b4d38398841287206fcf69a64aa9c75cd1f129'),(1598,1268166064,'127.0.1.1','53ea2df011f306698440190268fb02ce6bc22f97'),(1597,1268166063,'127.0.1.1','6cfb9a4bdd97566c72df439cf99db121e9f9ae46'),(1596,1268166063,'127.0.1.1','5f744b5315ee8f41b3c95954f12566fb0d047451'),(1595,1268166063,'127.0.1.1','675ecaa73cffad71350aa73b5aab4a969e450244');
/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sessions`
--

DROP TABLE IF EXISTS `exp_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL default '0',
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `admin_sess` tinyint(1) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_sessions`
--

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;
INSERT INTO `exp_sessions` VALUES ('1149cb5aa3eafba5dba67c0b4db6c58a6d5b5b81',1,1,1,'127.0.1.1','Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKi',1268173914);
/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sites`
--

DROP TABLE IF EXISTS `exp_sites`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL auto_increment,
  `site_label` varchar(100) NOT NULL default '',
  `site_name` varchar(50) NOT NULL default '',
  `site_description` text,
  `site_system_preferences` text NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  PRIMARY KEY  (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_sites`
--

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;
INSERT INTO `exp_sites` VALUES (1,'Chris Hardcastle','default_site',NULL,'YTo5MTp7czoxMDoic2l0ZV9pbmRleCI7czo5OiJpbmRleC5waHAiO3M6ODoic2l0ZV91cmwiO3M6MjU6Imh0dHA6Ly9lZS5sb2NhbC5uZXQ6ODA4MC8iO3M6MTY6InRoZW1lX2ZvbGRlcl91cmwiO3M6MzI6Imh0dHA6Ly9lZS5sb2NhbC5uZXQ6ODA4MC90aGVtZXMvIjtzOjE1OiJ3ZWJtYXN0ZXJfZW1haWwiO3M6MTQ6Im1lQGV4YW1wbGUuY29tIjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czo0MToiaHR0cDovL2VlLmxvY2FsLm5ldDo4MDgwL2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfcGF0aCI7czozMDoiL3NpdGVzL2VlL3d3dy9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTc6ImVuYWJsZV9kYl9jYWNoaW5nIjtzOjE6InkiO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE4OiJ0ZW1wbGF0ZV9kZWJ1Z2dpbmciO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTc6InVzZXJfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTg6ImFkbWluX3Nlc3Npb25fdHlwZSI7czoyOiJjcyI7czoyMToiYWxsb3dfdXNlcm5hbWVfY2hhbmdlIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2xvZ2lucyI7czoxOiJ5IjtzOjE2OiJwYXNzd29yZF9sb2Nrb3V0IjtzOjE6InkiO3M6MjU6InBhc3N3b3JkX2xvY2tvdXRfaW50ZXJ2YWwiO3M6MToiMSI7czoyMDoicmVxdWlyZV9pcF9mb3JfbG9naW4iO3M6MToieSI7czoyMjoicmVxdWlyZV9pcF9mb3JfcG9zdGluZyI7czoxOiJ5IjtzOjE4OiJhbGxvd19tdWx0aV9lbWFpbHMiO3M6MToibiI7czoyNDoicmVxdWlyZV9zZWN1cmVfcGFzc3dvcmRzIjtzOjE6Im4iO3M6MTk6ImFsbG93X2RpY3Rpb25hcnlfcHciO3M6MToieSI7czoyMzoibmFtZV9vZl9kaWN0aW9uYXJ5X2ZpbGUiO3M6MDoiIjtzOjE3OiJ4c3NfY2xlYW5fdXBsb2FkcyI7czoxOiJ5IjtzOjE1OiJyZWRpcmVjdF9tZXRob2QiO3M6ODoicmVkaXJlY3QiO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjEzOiJsb2dfcmVmZXJyZXJzIjtzOjE6Im4iO3M6MTM6Im1heF9yZWZlcnJlcnMiO3M6MzoiNTAwIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiJ1cyI7czoxNToic2VydmVyX3RpbWV6b25lIjtzOjM6IlVUQyI7czoxMzoic2VydmVyX29mZnNldCI7czowOiIiO3M6MTY6ImRheWxpZ2h0X3NhdmluZ3MiO3M6MToieSI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjM6IlVUQyI7czoxNjoiZGVmYXVsdF9zaXRlX2RzdCI7czoxOiJ5IjtzOjE1OiJob25vcl9lbnRyeV9kc3QiO3M6MToieSI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6ODoiY3BfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoyMToiZW1haWxfbW9kdWxlX2NhcHRjaGFzIjtzOjE6Im4iO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxMjoic2VjdXJlX2Zvcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTM6ImVtb3RpY29uX3BhdGgiO3M6NDA6Imh0dHA6Ly9lZS5sb2NhbC5uZXQ6ODA4MC9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6MjE6Ii9zaXRlcy9lZS93d3cvdGhlbWVzLyI7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5Ijt9','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToieSI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NDA6Imh0dHA6Ly9lZS5sb2NhbC5uZXQ6ODA4MC9pbWFnZXMvYXZhdGFycy8iO3M6MTE6ImF2YXRhcl9wYXRoIjtzOjI5OiIvc2l0ZXMvZWUvd3d3L2ltYWdlcy9hdmF0YXJzLyI7czoxNjoiYXZhdGFyX21heF93aWR0aCI7czozOiIxMDAiO3M6MTc6ImF2YXRhcl9tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMzoiYXZhdGFyX21heF9rYiI7czoyOiI1MCI7czoxMzoiZW5hYmxlX3Bob3RvcyI7czoxOiJuIjtzOjk6InBob3RvX3VybCI7czo0NjoiaHR0cDovL2VlLmxvY2FsLm5ldDo4MDgwL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czozNToiL3NpdGVzL2VlL3d3dy9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTU6InBob3RvX21heF93aWR0aCI7czozOiIxMDAiO3M6MTY6InBob3RvX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEyOiJwaG90b19tYXhfa2IiO3M6MjoiNTAiO3M6MTY6ImFsbG93X3NpZ25hdHVyZXMiO3M6MToieSI7czoxMzoic2lnX21heGxlbmd0aCI7czozOiI1MDAiO3M6MjE6InNpZ19hbGxvd19pbWdfaG90bGluayI7czoxOiJuIjtzOjIwOiJzaWdfYWxsb3dfaW1nX3VwbG9hZCI7czoxOiJuIjtzOjExOiJzaWdfaW1nX3VybCI7czo1NDoiaHR0cDovL2VlLmxvY2FsLm5ldDo4MDgwL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6NDM6Ii9zaXRlcy9lZS93d3cvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czozNjoiL3NpdGVzL2VlL3d3dy9pbWFnZXMvcG1fYXR0YWNobWVudHMvIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJ0b3RhbF9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJuIjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6InkiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo0ODoiL3NpdGVzL2VlL3d3dy9zeXN0ZW0vZXhwcmVzc2lvbmVuZ2luZS90ZW1wbGF0ZXMvIjt9','YToxMDp7czoyMToiZW5hYmxlX2ltYWdlX3Jlc2l6aW5nIjtzOjE6InkiO3M6MjE6ImltYWdlX3Jlc2l6ZV9wcm90b2NvbCI7czozOiJnZDIiO3M6MTg6ImltYWdlX2xpYnJhcnlfcGF0aCI7czowOiIiO3M6MTY6InRodW1ibmFpbF9wcmVmaXgiO3M6NToidGh1bWIiO3M6MTQ6IndvcmRfc2VwYXJhdG9yIjtzOjEwOiJ1bmRlcnNjb3JlIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToxOntzOjIzOiIvc2l0ZXMvZWUvd3d3L2luZGV4LnBocCI7czozMjoiZWRkOTM4ZTVkNzNmZTcxYWUxMWZkZjgxYmIwNDZkYTAiO30=');
/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_snippets`
--

DROP TABLE IF EXISTS `exp_snippets`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY  (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_snippets`
--

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_specialty_templates`
--

DROP TABLE IF EXISTS `exp_specialty_templates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `enable_template` char(1) NOT NULL default 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY  (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_specialty_templates`
--

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;
INSERT INTO `exp_specialty_templates` VALUES (1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),(7,1,'y','admin_notify_gallery_comment','You have just received a comment','You have just received a comment for the following photo gallery:\n{gallery_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\n{comment}'),(8,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),(9,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),(10,1,'y','reset_password_notification','New Login Information','{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),(11,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),(12,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),(13,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),(14,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),(15,1,'y','gallery_comment_notification','Someone just responded to your comment','Someone just responded to the photo entry you subscribed to at:\n{gallery_name}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),(16,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),(17,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');
/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stats`
--

DROP TABLE IF EXISTS `exp_stats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `total_members` mediumint(7) NOT NULL default '0',
  `recent_member_id` int(10) NOT NULL default '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL default '0',
  `total_forum_topics` mediumint(8) NOT NULL default '0',
  `total_forum_posts` mediumint(8) NOT NULL default '0',
  `total_comments` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_forum_post_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `last_visitor_date` int(10) unsigned NOT NULL default '0',
  `most_visitors` mediumint(7) NOT NULL default '0',
  `most_visitor_date` int(10) unsigned NOT NULL default '0',
  `last_cache_clear` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_stats`
--

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;
INSERT INTO `exp_stats` VALUES (1,1,1,1,'Chris',18,0,0,0,1268172787,0,0,1268174158,11,1268174128,1268257240);
/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_groups`
--

DROP TABLE IF EXISTS `exp_status_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_status_groups`
--

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;
INSERT INTO `exp_status_groups` VALUES (1,1,'Statuses');
/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_no_access`
--

DROP TABLE IF EXISTS `exp_status_no_access`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_status_no_access`
--

LOCK TABLES `exp_status_no_access` WRITE;
/*!40000 ALTER TABLE `exp_status_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_status_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_statuses`
--

DROP TABLE IF EXISTS `exp_statuses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY  (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_statuses`
--

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;
INSERT INTO `exp_statuses` VALUES (1,1,1,'open',1,'009933'),(2,1,1,'closed',2,'990000');
/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_groups`
--

DROP TABLE IF EXISTS `exp_template_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_template_groups`
--

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` VALUES (1,1,'Posts',1,'y');
/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_template_member_groups`
--

LOCK TABLES `exp_template_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_no_access`
--

DROP TABLE IF EXISTS `exp_template_no_access`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_template_no_access`
--

LOCK TABLES `exp_template_no_access` WRITE;
/*!40000 ALTER TABLE `exp_template_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_templates`
--

DROP TABLE IF EXISTS `exp_templates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL default 'n',
  `template_type` varchar(16) NOT NULL default 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL default '0',
  `last_author_id` int(10) unsigned NOT NULL default '0',
  `cache` char(1) NOT NULL default 'n',
  `refresh` int(6) unsigned NOT NULL default '0',
  `no_auth_bounce` varchar(50) NOT NULL default '',
  `enable_http_auth` char(1) NOT NULL default 'n',
  `allow_php` char(1) NOT NULL default 'n',
  `php_parse_location` char(1) NOT NULL default 'o',
  `hits` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (1,1,1,'index','y','webpage','<!DOCTYPE html>\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">\n  <head>\n\n<title>{site_name}</title>\n<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\"/>\n<link rel=\'stylesheet\' type=\'text/css\' media=\'all\' href=\'{stylesheet=Posts/posts_css}\' />\n<script type=\"text/javascript\" src=\"http://google.com/jsapi\"></script>\n<script type=\"text/javascript\">\n	google.load(\"jquery\",\"1.3.2\");\n	google.load(\"jqueryui\",\"1.7.2\");\n</script>\n<script type=\"text/javascript\" src=\"/js/posts.js\"></script>\n</head>\n<body>\n<div id=\"nav\">\n	<p>\n		<a href=\"#clearup\" id=\"clearUp\">Clear up</a>\n		<a href=\"#clearup\" id=\"scrambel\">Scrambel</a>\n		<a href=\"#clearup\" id=\"washAndGo\">Go and return</a>\n	</p>\n</div>\n<div id=\"container\">\n{exp:channel:entries\norderby=\"date\" \nlimit=\"9\"\npaginate=\"top\"}\n\n<div class=\"box{absolute_count}\">\n	<a href=\"#\" class=\"close\">Close</a>\n	<h1>{title}</h1>\n	<p>{body}</p>\n</div>\n{paginate}\n<p id=\"navigation\">Page {current_page} of {total_pages} pages {pagination_links}</p>\n{/paginate}\n{/exp:channel:entries}\n\n</div>\n</body>\n</html>\n','',1266794393,1,'n',0,'','n','n','o',163),(2,1,1,'posts_css','y','css','body {\n	background-color: #fff;\n	margin: 40px;\n	font-family: Lucida Grande, Verdana, Sans-serif;\n	font-size: 14px;\n	color: #4F5155;\n}\n\na {\n	color: #003399;\n	background-color: transparent;\n	font-weight: normal;\n}\n\nh1 {\n	color: #444;\n	background-color: transparent;\n	border-bottom: 1px solid #D0D0D0;\n	font-size: 16px;\n	font-weight: bold;\n	margin: 24px 0 2px 0;\n	padding: 5px 0 6px 0;\n}\n\ncode {\n	font-family: Monaco, Verdana, Sans-serif;\n	font-size: 12px;\n	background-color: #f9f9f9;\n	border: 1px solid #D0D0D0;\n	color: #002166;\n	display: block;\n	margin: 14px 0 14px 0;\n	padding: 12px 10px 12px 10px;\n}\n\n#thumbs{\n	position:relative;\n	z-index:1;\n		width:130px;\n	border:1px solid #333;\n}\n#thumbs div{\n	position:relative;\n	z-index:2;\n	width:28px;\n	height:28px;	\n	float:left;\n	margin:10px 10px 10px 0;\n	border:1px solid #333;\n}\n#container{\n	position:relative;\n	border:1px solid #ff22ff;\n	width:762px;\n	height:300px;\n}\n#container div{\n	position:absolute;\n	/*top:0; left:0;*/\n	z-index:3;	\n	width:200px;\n	height:200px;\n	border:1px solid #ff33ff;\n	overflow:hidden;\n	padding:17px;\n}\n.box1,\n.box10{\n	top:20px;\n	left:20px;\n\n\n}\n.box2,\n.box11{\n	top:20px;\n	left:254px;\n\n}\n.box3,\n.box12{\n	top:20px;\n	left:508px;\n\n}\n.box4,\n.box13{\n	top:260px;\n	left:20px;\n\n}\n.box5,\n.box14{\n	top:260px;\n	left:254px;\n	\n\n}\n.box6{\n	top:260px;\n	left:508px;\n\n}\n.box7{\n	top:500px;\n	left:20px;\n\n}\n.box8{\n	top:500px;\n	left:254px;\n\n}\n.box9{\n	top:500px;\n	left:508px;\n}\n','',1266796766,1,'n',0,'','n','n','o',1),(3,1,1,'posts_json','y','webpage','[\n{exp:channel:entries\norderby=\"date\" \nlimit=\"9\"}\n{\n	\"index\":\"box{absolute_count}\",\n	\"title\":\"{title}\",\n	\"body\":\"{exp:whitespace}{body}{/exp:whitespace}\"\n}{if absolute_count < 9},{/if}\n{paginate}{/paginate}\n{/exp:channel:entries}\n]\n','',1266962668,1,'n',0,'','n','n','o',221);
/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_throttle`
--

DROP TABLE IF EXISTS `exp_throttle`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL auto_increment,
  `ip_address` varchar(16) NOT NULL default '0',
  `last_activity` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_throttle`
--

LOCK TABLES `exp_throttle` WRITE;
/*!40000 ALTER TABLE `exp_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_no_access`
--

DROP TABLE IF EXISTS `exp_upload_no_access`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_upload_no_access`
--

LOCK TABLES `exp_upload_no_access` WRITE;
/*!40000 ALTER TABLE `exp_upload_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_prefs`
--

DROP TABLE IF EXISTS `exp_upload_prefs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(150) NOT NULL default '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL default 'img',
  `max_size` varchar(16) default NULL,
  `max_height` varchar(6) default NULL,
  `max_width` varchar(6) default NULL,
  `properties` varchar(120) default NULL,
  `pre_format` varchar(120) default NULL,
  `post_format` varchar(120) default NULL,
  `file_properties` varchar(120) default NULL,
  `file_pre_format` varchar(120) default NULL,
  `file_post_format` varchar(120) default NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_upload_prefs`
--

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-03-09 22:36:55
