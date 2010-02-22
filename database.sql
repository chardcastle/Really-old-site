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
INSERT INTO `exp_channel_data` VALUES (1,1,1,'My total exposure to Ruby has been around 2 hours, a great time to write about it. So warnings, n00b alert, I have not even written a ruby “hello world” script! But hey, it’s important to write when you feel inspired. I have a few people to thank for the inspiration.\n\nGiven a short code demo, it looks very flexible. It can be used to build things extremely quickly. In just a few key strokes, a model, view and controller is automatically created in the file system. Another command will quickly update the database to describe the properties of your newly created entity in its own table.\n\nThis bares some similarities with the PHP framework Symfony. You can auto generate the entities of your system in a very similar way. But I am a PHP freak, why am I so interested in this? It’s always good to have another arrow to your bow. Also, I think it’s an important message to those who want to try out programming for web applications. Perhaps students or in some cases, people who have been stuck using classic VB for the past 5 years!\n\nSome may say that using the Ruby on Rails framework the auto generation of code is unwise. Unwieldy and unmanageable and I would tend to agree with them. However, perhaps it has some uses for prototyping an idea or a technical draft. If the specification or idea keeps changing, then its a perfect match. I am not sure if you can do this but, since its heavy on MVC, components of the system can be replaced (if necessary) with whatever means necessary.\n\nIt’s meant to be easier to develop with it in Linux and Mac than Windows. Saying that there’s a package for the Aptana editing suite for Windows that seems well suited to Ruby. There’s an online demo of Ruby, somewhere on the Internet, I will post it as soon as I remember where it is.\n\nPerhaps in a few years, I will read this again on a site that I built in Ruby, years from now. But for now, I don’t think I will start learning Ruby just yet. There’s plenty of other things I would like to do first, that could change.','xhtml','My total exposure to Ruby has been around 2 hours, a great time to write about it. So warnings, n00b alert, I have not even written a ruby “hello world” script! But hey, it’s important to write when you feel inspired. I have a few people to thank for the inspiration.','xhtml'),(2,1,1,'<p>I have a had file on my desktop for months now called &#8220;must-learn.txt&#8221; I thought I would share it. Every now and then I need to select form elements. I find the follwing very useful, but can never remember the conventions off the top of my head.<span id=\"more-96\"></span></p>\n\n<p>For documentation, please see the Jquery <a href=\"http://docs.jquery.com/Selectors\">documentation</a>. Using the firebug console, you can test the following javascript commands on any of your own forms.</p>\n<p><code><br />\n// find a div with an id of \"edit-taxonomy\"<br />\n$(\"div[id=edit-taxonomy]\").each(function(i,item){<br />\n	console.log(\"Found\");<br />\n})<br />\n// find a textarea with that has edit anywhere in the id<br />\n$(\"textarea[id*=\'edit\']\").each(function(i,item){<br />\n\n	console.log(\"Found\");<br />\n})<br />\n// find an input that has an id that starts with title<br />\nconsole.log($(\"input[id^=\'title\']\").length);<br />\n</code></p>\n','xhtml','I have a had file on my desktop for months now called “must-learn.txt” I thought I would share it. Every now and then I need to select form elements. I find the follwing very useful, but can never remember the conventions off the top of my head.','xhtml'),(3,1,1,'<p>I have been writing a content management system at work using <a href=\"http://codeigniter.com\">CodeIgniter</a>. Since it will be used by many people to add content, making an editor available is essential for the system. At the time, two candidates stood out for me, both of which, I want to mention in this short post. They are:</p>\n<ul>\n\n<li><a href=\"http://nicedit.com/\">NicEdit</a></li>\n<li><a href=\"http://tinymce.moxiecode.com/\">TinyMCE</a></li>\n</ul>\n<p><span id=\"more-59\"></span><br />\nWhilst a decision on which editor is the best for you&#8217;re project depends entirely on your own circumstances. I am only focusing on these two for now and don&#8217;t claim to be a master on either.</p>\n<p><strong>Downloading</strong></p>\n<p>There&#8217;s one thing that bugs me about the process of downloading NicEdit. It smells of the Mootools Javascript framework for one particular reason. There&#8217;s a range of additional extras and packages that are included in the download. The problem is that if you need to download it again for any reason. How can you be sure you include everything that you need?</p>\n<p>I much prefer the editor to arrive as a complete core package, rather than it being a combination of various features. I feel that TinyMCE make it easier for you by offering the whole lot, even with a version designed entirely for the JQuery javascript framework.</p>\n\n<p><strong>Size</strong></p>\n<p>Looking at the downloads for each editor, I was impressed with NicEdit for having on single JS file and and sprite image for the buttons. Since CodeIgniter is super trim and lightweight, it immediately felt like the right thing to use. Some say that a full blown template library like <a href=\"http://smarty.net\">smarty</a> is overkill for CodeIgniter. I use smarty all the time in CodeIgniter, as such, perhaps TinyMCE is an acceptable size. Also, the TinyMCE folder structure includes a designated plugins directory. Which brings me onto my next topic.</p>\n<p><strong>Plugins</strong></p>\n<p>It&#8217;s clear for every developer that every wysiwyg editor needs to be customisable so it can meet its technical or design requirements. So the main questions are which offers the easiest integration and which offer the most power. I am afraid to confess that I have not written a plugin for TinyMCE yet so cannot comment on how it works out for that. However, I have been able to extend NicEdit quite easily. It&#8217;s possible to override the data that&#8217;s provided to buttons. For instance I have supplied my editor with a tree of available links and a library of images to choose from. I could post the code if the interest is there.</p>\n<p><strong>Documentation</strong></p>\n<p>There&#8217;s a <a href=\"http://wiki.nicedit.com/\">wiki</a> and a small section of<a href=\"http://nicedit.com/demos.php\"> demonstrations</a> for NicEdit. The wiki includes some information about how to interact with it using plugins. But the content is limited. On the contrary, the <a href=\"http://wiki.moxiecode.com/index.php/TinyMCE:API\">TinyMCE api documentation</a> is fantastic. I think those two points were the deciding factors in which wysiwyg to use for my CodeIgniter project. I wanted to pick it up and run with it. It felt like I could get everything done quicker using NicEdit as it was easier to digest. And thankfully. it all worked straight away.</p>\n\n<p><strong>Conclusion</strong></p>\n<p>I am yet to determine if it&#8217;s possible to isolate the cursor position within the content. That would be helpful for a range of tasks, like image insertion from an alternative source. I am happy with using NicEdit for now, it suites my needs. However, I am really worried that I will need a feature that it does not support. Even worse, it does, but was not downloaded with the package included.</p>\n','xhtml','I have been writing a content management system at work using CodeIgniter. Since it will be used by many people to add content, making an editor available is essential for the system. At the time, two candidates stood out for me, both of which, I want to mention in this short post.','xhtml'),(4,1,1,'TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?','xhtml',' fsdfsdaf asdf afasd','xhtml'),(5,1,1,'TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?','xhtml','TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?TinyMCE or NicEdit for CodeIgniter?','xhtml'),(6,1,1,'<p>I have just found a really helpful command that I can see myself using all the time. It&#8217;s too often that I need to take a copy of a development database file and update the absolute paths to use the live address.<br />\n<span id=\"more-53\"></span><br />\nImagine you have a .sql file that you have created by exporting a wordpress database. That can be done using the mysqldump command over the command line in Linux/Ubuntu. Now you want to replace all (global) occurrences of &#8220;local&#8221; with &#8220;live&#8221; in a file called &#8220;data.sql&#8221; and catch the results in a new file called &#8220;new.sql&#8221; the code would be as follows.</p>\n\n<p><code><br />\nsed -e \'s/local/live/g\' data.sql > new.sql</p>\n<p></code><br />\nA new file should be created called &#8220;new.sql&#8221; with the replacements made. SED is a tool available in all Linux distributions and can be accessed via the command line. The &#8220;e&#8221; command runs the function with the script that follows in quotes. The &#8217;s&#8217; command treats the arguments as separate files. The &#8216;g&#8217; means global. This makes a replacement on multiple lines.</p>\n\n<p>This is an interpretation based on guidance from this<a href=\"http://www.ibm.com/developerworks/linux/library/l-sed2.html\"> following article</a> it&#8217;s a very simple example. For my own reference really, but I hope you find useful.</p>\n','xhtml','<p>I have just found a really helpful command that I can see myself using all the time. It&#8217;s too often that I need to take a copy of a development database file and update the absolute paths to use the live address.<br />\n<span id=\"more-53\"></span></p>\n','xhtml'),(7,1,1,'body {\n	background-color: #fff;\n	margin: 40px;\n	font-family: Lucida Grande, Verdana, Sans-serif;\n	font-size: 14px;\n	color: #4F5155;\n}\n\na {\n	color: #003399;\n	background-color: transparent;\n	font-weight: normal;\n}\n\nh1 {\n	color: #444;\n	background-color: transparent;\n	border-bottom: 1px solid #D0D0D0;\n	font-size: 16px;\n	font-weight: bold;\n	margin: 24px 0 2px 0;\n	padding: 5px 0 6px 0;\n}\n\ncode {\n	font-family: Monaco, Verdana, Sans-serif;\n	font-size: 12px;\n	background-color: #f9f9f9;\n	border: 1px solid #D0D0D0;\n	color: #002166;\n	display: block;\n	margin: 14px 0 14px 0;\n	padding: 12px 10px 12px 10px;\n}\n\n#thumbs{\n	position:relative;\n	z-index:1;\n		width:130px;\n	border:1px solid #333;\n}\n#thumbs div{\n	position:relative;\n	z-index:2;\n	width:28px;\n	height:28px;	\n	float:left;\n	margin:10px 10px 10px 0;\n	border:1px solid #333;\n}\n#container{\n	position:relative;\n	border:1px solid #ff22ff;\n	width:762px;\n	height:300px;\n}\n#container div{\n	position:absolute;\n	/*top:0; left:0;*/\n	z-index:3;	\n	width:200px;\n	height:200px;\n	border:1px solid #ff33ff;\n	overflow:hidden;\n	padding:17px;\n}\n.box1,\n.box10{\n	top:20px;\n	left:20px;\n\n\n}\n.box2,\n.box11{\n	top:20px;\n	left:254px;\n\n}\n.box3,\n.box12{\n	top:20px;\n	left:508px;\n\n}\n.box4,\n.box13{\n	top:260px;\n	left:20px;\n\n}\n.box5,\n.box14{\n	top:260px;\n	left:254px;\n	\n\n}\n.box6{\n	top:260px;\n	left:508px;\n\n}\n.box7{\n	top:500px;\n	left:20px;\n\n}\n.box8{\n	top:500px;\n	left:254px;\n\n}\n.box9{\n	top:500px;\n	left:508px;\n}\n','xhtml','body {\n	background-color: #fff;\n	margin: 40px;\n	font-family: Lucida Grande, Verdana, Sans-serif;\n	font-size: 14px;\n	color: #4F5155;\n}\n','xhtml'),(8,1,1,'<p>Once you have finished building a Wordpress based website. Wouldn&#8217;t it be great to test it on the live website host, without interrupting any existing files or pages? This is just the kind of scenario that I have been asked about in the past. So, I have recently developed my own suggestion as to how this can be achieved.<br />\n<span id=\"more-48\"></span><br />\nOnce your Wordpress database has been set up and all the files for the site are in place. The next step is to replace the existing index.php / html file with the one from the root of your Wordpress build. From that moment Wordpress with be in control of all incoming requests to your site.</p>\n\n<p>Given that the existing home page has to remain the same until your ready to &#8220;activate&#8221; the new one. You can modify the .htaccess file so the Wordpress site will only respond if the homepage has been called with a particular query string. This means you can test the Wordpress build without interrupting the main index page. </p>\n<p>In order to do this, you have to modify your .htaccess file in the website root. Below is the modified .htaccess file, take a backup before testing!</p>\n<p><code><br />\n# BEGIN WordPress<br />\nRewriteEngine On<br />\nRewriteBase /<br />\nRewriteCond %{REQUEST_FILENAME} !-f<br />\nRewriteCond %{REQUEST_FILENAME} !-d<br />\n\nRewriteCond %{REQUEST_URI} !^/wp-content/<br />\nRewriteCond %{REQUEST_URI} !^/wp-includes/<br />\nRewriteRule . /$1/?test=true [L]<br />\n# END WordPress<br />\n</code></p>\n<p>Replace your existing .htaccess file with the code above and you are half way. Next modify your index.php in the wordpress site.</p>\n<p><code><br />\nif(isset($_GET[\"test\"])){<br />\n    define(\'WP_USE_THEMES\', true);<br />\n\n    /* Loads the WordPress Environment and Template */<br />\n    require(\'./wp-blog-header.php\');<br />\n}else{<br />\n    /* Your holding page HTML / include file */<br />\n}<br />\n</code></p>\n<p>You can redirect to, or include the existing index page within the else clause as described above. The links should still be intact because the .htaccess file is appending your url with the required query string.</p>\n<p>So when you visit the site your existing homepage should remain the same. When you visit http://yoursite.com<strong>/?test=true</strong> your wordpress site should wake up and run accordingly. </p>\n','xhtml','Once you have finished building a Wordpress based website. Wouldn’t it be great to test it on the live website host, without interrupting any existing files or pages? This is just the kind of scenario that I have been asked about in the past. So, I have recently developed my own suggestion as to how this can be achieved.','xhtml'),(9,1,1,'Yay, I just got my vanity url. I had to search around for it as there were no links in Facebook. Just go to www.facebook.com/username once your logged in – but hurry, all the good ones are going!','xhtml','Yay, I just got my vanity url. I had to search around for it as there were no links in Facebook. Just go to www.facebook.com/username once your logged in – but hurry, all the good ones are going!','xhtml'),(10,1,1,'hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf','xhtml','hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf hgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdfhgfhdfg hg dhfhd fgdh dfghfg dhfgdhfgdhfdhdf','xhtml'),(11,1,1,'ExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 BetaExpressionEngine Core\nCurrent Version: 1.6.8 - Build: 20100121 (Change Log)\nDownload\nExpressionEngine 2.0 Beta 30 Day Trial\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 Beta','xhtml','ExpressionEngine 2.0 Beta Control Panel Themes\nCurrent Version: 2.0.1 Beta - Build: 20100215 (Change Log)\nDownload\nExpressionEngine 2.0 Documentation\nCurrent Version: 2.0.1 Beta','xhtml'),(12,1,1,'Geek Hut posted a helpful screencast tutorial on how to work with jQuery, JSON and CodeIgniter.\n\n    I shot this screen for those who are looking for an extremely simple explanation and demonstration for sending and receiving data asynchronously via jQuery Post and JSON.  About two years ago I really struggled with this concept so I figure there are probably others who will find this information useful. I would have been extremely happy to find something like this when I was learning (and frustrated).','xhtml','Geek Hut posted a helpful screencast tutorial on how to work with jQuery, JSON and CodeIgniter.).','xhtml'),(13,1,1,'hello, great tutorial- very handy. i don’t quite understand the significance of the:\n\nwhile ($cat2->have_posts()) : $my_query2->the_post();\n\nthese lines have something to do with inner Wordpress workings? is it possible to run two separate instances of your magic code within two (or more) loops. i almost have this working using your code, but not quite and wondered if you had any ideas.\n\najaxcount doesn’t seem to produce anything other than ‘0’ for me.\n\ni’m using multiple loops based on this how-to. they work great!\n\nif you could explain the $cat code that would be a help… why doesn’t it read:\n\nwhile ($cat2->have_posts()) : $cat2->the_post();\n\nseems to make more sense to me!\n\n- Callum','xhtml','EE 2.01PB - 2.x Bug Tracker | Docs | Upgrade from 1.x to 2.x | Build Update Instructions | 1.6.x Update Info\n\nMost recent 2.x version: Build 20100215\nDon’t forget to upgrade MSM and Forum as needed! ','xhtml'),(14,1,1,'#\nand Popoon. It\'s easy to use for the enduser and has WYSIWYG editing capabilites, ...\ntutorialfeed.blogspot.com/.../list-of-xml-based-cms-for-web.html - Cached - Similar\n#\nTechnologies: PHP, DBMS, AJAX,DHTML, XML, JavaScript, JSON\nCMS Joomla! use PHP and MySQL. CMS Joomla - Open Source GNU General Public ... osCommerce is an Open Source based online shop e-commerce solution that is ...\nwww.smartsolutions.com.ua/1/technologies.htm - Cached\n#\n{Ajaxist: php ajax frameworks}\nphp ajax frameworks and php ajax frameworks products and tools. ... source php ria framework using json; AjaxCore - a prototype-based php ajax framework ... source multi-lingual (php & c#) web app framework; MODx - ajax-enabled cms php ...','xhtml','php ajax frameworks and php ajax frameworks products and tools. ... source php ria framework using json; AjaxCore - a prototype-based php ajax framework ... source multi-lingual (php & c#) web app framework; MODx - ajax-enabled cms php ...','xhtml'),(15,1,1,'Thank you for writing this tutorial. It has given me a great start on AJAXing wordpress themes.\n\nI’ve had lots of trouble though, which I thought I would share.\n\nFirst, instead of loading the the first code snippet (‘Ajax example - retrieve posts’), when I click the jQuery enabled link, the post simply fades out, and nothing replaces it. I noticed that your jQuery seems to load the ‘Ajad example - retrive posts’ document without revealing where it is on your web server. The jQuery code: .load(‘/examples/ajax-handler/). Because of this, I’m not sure where to put the document on my own wordpress installation.\n\nI managed to hardcode a url into the .load() function, like so: .load(‘wp-content/themes/uprising/ajax-handler.php?offset=’+offset). But that seems to be a problem, since the PHP document, once loaded, is outside of the wordpress system. So it chokes on query_posts(), with the error “undeclared function”.\n\nTo get around this, I added code to manually load wordpress, to the ajax-handler.php document:\ndefine(‘WP_USE_THEMES’, false);\n require(‘../../../wp-blog-header.php’);\n\nBut this only works once. So I can load a post by AJAX once, but the second time, it doesn’t work anymore (it goes to the category page, as if javascript were disabled).\n\nSo I reorganised so that the “ajax-link” button is now outside of the “ajax-content” div. Which has finally resulted in a functional system.\n\nAnyway, I just thought I would share in case I made a fundamental error earlier on that would save a lot of the trouble I’ve gone thro','xhtml','Thank you for writing this tutorial. It has given me a great start on AJAXing wordpress themes.\n\nI’ve had lots of trouble though, which I thought I would share.\n\n\nAnyway, I just thought I would share in case I made a fundamental error earlier on that would save a lot of the trouble I’ve gone thro','xhtml');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,1,1,'body','Body','Main content','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',2,'any'),(2,1,1,'teaser','Teaser','A summary of contents inside the body','textarea','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','xhtml','n',1,'any');
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (1,1,1,1,0,0,'127.0.1.1','Newby to ruby','newby_to_ruby','open','y',0,0,0,0,'y','n',1266789487,'n','2010','02','21',0,0,20100221220308,0,0),(2,1,1,1,0,0,'127.0.1.1','Jquery input selectors','jquery_input_selectors','open','y',0,0,0,0,'y','n',1266789787,'n','2010','02','21',0,0,20100221220508,0,0),(3,1,1,1,0,0,'127.0.1.1','TinyMCE or NicEdit for CodeIgniter?','tinymce_or_nicedit_for_codeigniter','open','y',0,0,0,0,'y','n',1266789976,'n','2010','02','21',0,0,20100221220717,0,0),(4,1,1,1,0,0,'127.0.1.1','fdsafsdfds fsd fasd fasd','fdsafsdfds_fsd_fasd_fasd','open','y',0,0,0,0,'y','n',1266790166,'n','2010','02','21',0,0,20100221220927,0,0),(5,1,1,1,0,0,'127.0.1.1','TinyMCE or NicEdit for CodeIgniter?','tinymce_or_nicedit_for_codeigniter1','open','y',0,0,0,0,'y','n',1266790184,'n','2010','02','21',0,0,20100221220946,0,0),(6,1,1,1,0,0,'127.0.1.1','Wordpress absolute path update','wordpress_absolute_path_update','open','y',0,0,0,0,'y','n',1266790196,'n','2010','02','21',0,0,20100221221058,0,0),(7,1,1,1,0,0,'127.0.1.1','cscscscscscsc','cscscscscscsc','open','y',0,0,0,0,'y','n',1266790268,'n','2010','02','21',0,0,20100221221209,0,0),(8,1,1,1,0,0,'127.0.1.1','Wordpress site preview','wordpress_site_preview','open','y',0,0,0,0,'y','n',1266792884,'n','2010','02','21',0,0,20100221225545,0,0),(9,1,1,1,0,0,'127.0.1.1','Facebook vantiy URLS','facebook_vantiy_urls','open','y',0,0,0,0,'y','n',1266792992,'n','2010','02','21',0,0,20100221225633,0,0),(10,1,1,1,0,0,'127.0.1.1','hgfhfdghdfhfg','hgfhfdghdfhfg','open','y',0,0,0,0,'y','n',1266792996,'n','2010','02','21',0,0,20100221225737,0,0),(11,1,1,1,0,0,'127.0.1.1','ExpressionEngine','expressionengine','open','y',0,0,0,0,'y','n',1266793035,'n','2010','02','21',0,0,20100221225816,0,0),(12,1,1,1,0,0,'127.0.1.1','gfgfd gfd gdsf gdsfgd','gfgfd_gfd_gdsf_gdsfgd','open','y',0,0,0,0,'y','n',1266793128,'n','2010','02','21',0,0,20100221225849,0,0),(13,1,1,1,0,0,'127.0.1.1','test test tes','test_test_tes','open','y',0,0,0,0,'y','n',1266793160,'n','2010','02','21',0,0,20100221225921,0,0),(14,1,1,1,0,0,'127.0.1.1','ph php hphp fsdf asdfsdaf','ph_php_hphp_fsdf_asdfsdaf','open','y',0,0,0,0,'y','n',1266793187,'n','2010','02','21',0,0,20100221225948,0,0),(15,1,1,1,0,0,'127.0.1.1','kfdsfsdfasd','kfdsfsdfasd','open','y',0,0,0,0,'y','n',1266793229,'n','2010','02','21',0,0,20100221230031,0,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'posts','Posts','http://ee.local.net:8080/index.php',NULL,'en',15,0,1266793229,0,NULL,NULL,'open',1,NULL,NULL,'y','y',NULL,'all','y','y','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y','y','y','y','y','y','y','y','y','y','y',NULL,'n',10,'','',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'chris.hardcastle','127.0.1.1',1266787872,'Logged in'),(2,1,1,'chris.hardcastle','127.0.1.1',1266788549,'Logged in'),(3,1,1,'chris.hardcastle','127.0.1.1',1266789009,'Field Group Created:&nbsp;Body'),(4,1,1,'chris.hardcastle','127.0.1.1',1266789318,'Channel Created:&nbsp;&nbsp;Posts'),(5,1,1,'chris.hardcastle','127.0.1.1',1266794300,'Logged in');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (1,1,'none'),(2,1,'br'),(3,1,'xhtml'),(4,2,'none'),(5,2,'br'),(6,2,'xhtml');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,1,'Posts');
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
INSERT INTO `exp_members` VALUES (1,1,'chris.hardcastle','Chris','e6d4109799213ee32986ab70a5c25b71fc6d89ff','0850dd0289d84b3cd1c38ae5febd8443423875ad','5a27b494424f0875fbba585e4d6b16325f116740',NULL,'me@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.1.1',1266787822,1266787872,1266796746,16,0,0,0,1266793230,0,0,0,'n','y','y','y','y','y','y','y','y','english','UTC','y','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18','',NULL,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_online_users`
--

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
INSERT INTO `exp_online_users` VALUES (1,1,1,'n','Chris','127.0.1.1',1266796439,'y'),(2,1,1,'n','Chris','127.0.1.1',1266796439,'y'),(4,1,1,'n','Chris','127.0.1.1',1266796439,'y');
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
) ENGINE=MyISAM AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (1,1266787867,'127.0.1.1','ad0b379a6e6245bd5b200a19b5096b134236b95b'),(2,1266787872,'127.0.1.1','906885dc46f8a584f36fecd7feb4d38d04a3f5c2'),(3,1266787872,'127.0.1.1','f8e73e9e6141c39715aec56226c8f49272d92906'),(4,1266787872,'127.0.1.1','7f48130abe982f4ef5e4b7d8bf564179d4c1f4e1'),(5,1266787876,'127.0.1.1','ed1914d31e44f42c62c7130ac5c5e25e595386ba'),(6,1266787876,'127.0.1.1','5fbd5cd5fac6bd587fb0136834edd41ea2fc4307'),(7,1266787876,'127.0.1.1','87b557d2a9412b94e68e1df4490148c89f83b511'),(8,1266787876,'127.0.1.1','cb2c8285f5fdf8a304308f95eb689fcf15c0d4ac'),(9,1266787876,'127.0.1.1','614c00a975686ebb1560e23663c89e0deaf574f1'),(10,1266787876,'127.0.1.1','05ef98798aa69e0c90386f54fe2b329889200e46'),(11,1266788280,'127.0.1.1','93f81d69cd523523ac83d456b3cc3f12272692bb'),(12,1266788549,'127.0.1.1','12bef4b923330dc728371e7eeffafafed0a92259'),(13,1266788549,'127.0.1.1','e87993fdb994a55bfd32d78907a7bd2dcfa1f91a'),(14,1266788549,'127.0.1.1','a154cf5cf8ae6eea85dcf7e56cf4398fa2beff84'),(15,1266788553,'127.0.1.1','fca533ea5d731f44e847d6d207581fcbba050800'),(16,1266788553,'127.0.1.1','9339e8f15d462ea26f471e0cf81f71e3860196c8'),(17,1266788553,'127.0.1.1','77aea954b343664414e832c0e2401447d6fc8dd5'),(18,1266788553,'127.0.1.1','e7dd0fd100adceb0d25cfa745a24a9f85c7c3103'),(19,1266788553,'127.0.1.1','1efe10554596d3c1421163067007ab5f0e1d07f0'),(20,1266788553,'127.0.1.1','f4924bee9c1e3e8bafad7035ae54901b3482110e'),(21,1266788560,'127.0.1.1','f2d0c0fca4fe0c85fc9124afd139fee348154734'),(22,1266788564,'127.0.1.1','63812961084b46d36072c4f8686a4ba03416a9f3'),(23,1266788564,'127.0.1.1','275db69e4eedd97a767ef4f2f2a35a7a97a6631a'),(24,1266788564,'127.0.1.1','3bffe3d676712fd6c32407333f83706ae3986842'),(25,1266788565,'127.0.1.1','ab7e8e412d7b173f2151a02b1d9e71123e60b6d3'),(26,1266788565,'127.0.1.1','378a25e2c82dddd73dc966cb6ecb58ca08760743'),(27,1266788565,'127.0.1.1','5239eeebdd4510d9b1788eaa43f89f7d4ef4632b'),(28,1266788565,'127.0.1.1','f2f42c239f529b1c5a7b3f4e93501ab4c112219d'),(29,1266788572,'127.0.1.1','92ee0f5dc7b76f235bcff9473b593be9eaae8be4'),(30,1266788572,'127.0.1.1','4789136107defd14d9cdb54c0dc8c3d2906b7dd5'),(31,1266788573,'127.0.1.1','4bbf024f1c40b082f534b7644e9cb873f4ac709a'),(32,1266788573,'127.0.1.1','91ac33b60b995c05f8d74b3dcf6acfcac364461d'),(33,1266788573,'127.0.1.1','2c279cdbf137cafae0da35007e6ea2d1982f3088'),(34,1266788573,'127.0.1.1','4c5e587723785aabb3c3bfac1629999319d553b2'),(35,1266788573,'127.0.1.1','a3e51b542c5e7e7d357602071d4932e6905723f2'),(36,1266788573,'127.0.1.1','fbeee50e0312be5970debf57d110ffc0a6ea6202'),(37,1266788574,'127.0.1.1','4e39c4a6e170ecc45fc6f73741f2a4c8a8e6f5aa'),(38,1266788582,'127.0.1.1','4fdfae3cc55547ab042132ee318bebe62be66c62'),(39,1266788582,'127.0.1.1','e51d48451dceaa84456c74338762a55095eacf96'),(40,1266788583,'127.0.1.1','bb30db1e33a6fdc2ae3594233f75d9ccd5c3867c'),(41,1266788583,'127.0.1.1','6658c26ea512e3df1fb6aa4b5ec31cd881564786'),(42,1266788583,'127.0.1.1','229ab41b11e8696c2af49a1f4484dbfeb2cf5ed4'),(43,1266788583,'127.0.1.1','04228e80aed1d807175f41a5ef65aba803803c38'),(44,1266788583,'127.0.1.1','ab6259713fbcfdf2f6f46b77628cd0b63c2519c0'),(45,1266788584,'127.0.1.1','af0343041e1d64b64e63c50a901b0fbc784ea8ef'),(46,1266788584,'127.0.1.1','ea5d4268dfc63c5eadd89da860de37efae9023d9'),(47,1266788584,'127.0.1.1','da5f2484067579a37f5b00b32bea9c11b7633f02'),(48,1266788932,'127.0.1.1','5698fa3edf5ff05ac33d25738c631be2f7d257b8'),(49,1266788933,'127.0.1.1','caa0d2b1bff41ea8ebcf7aa88f1c1005433f92e2'),(50,1266788933,'127.0.1.1','46777bcb9c70b4d07f5cc03e441d0ac3f39f36d4'),(51,1266788933,'127.0.1.1','2a3b3c1f2188db92ea12e8089fcc0dc680852a59'),(52,1266788933,'127.0.1.1','dfeb0e6e59fe9b7d50888d758972faba0a06bab2'),(53,1266788933,'127.0.1.1','ee4e71b0a2a3ec542a9a3500dca473c753b3256d'),(54,1266788934,'127.0.1.1','7792eac6e9e99ab669b1e815f5e1089f66eb2d67'),(55,1266788934,'127.0.1.1','15a599c1473970e182c8884081f5f97f43700313'),(56,1266788934,'127.0.1.1','c8d4ba8a26036d6098785305f51da88cc744437b'),(57,1266788940,'127.0.1.1','f202f7114b12b28d708d7d83c7884d0dcc0ca49d'),(58,1266788940,'127.0.1.1','34f65c5763b154c6180905a6418caf63ca490cc8'),(59,1266788940,'127.0.1.1','dd5f9a5aab78494f0514c3cd4c9800d4f2f31c87'),(60,1266788940,'127.0.1.1','88d37ea6104b836ad6c15affc091ef8507159cc5'),(61,1266788941,'127.0.1.1','904dffc9f4aad249696d442db9ca65aa1e1b81dd'),(62,1266788941,'127.0.1.1','a43872e0ea29f126036de4cc83d16849e891ace3'),(63,1266788941,'127.0.1.1','3a8a4d1376c5001b20314d77a8bf653887394f34'),(64,1266788946,'127.0.1.1','47f6c4cc68238e0b578c69fff64137198f9eda54'),(65,1266788946,'127.0.1.1','1808920bfc73b5e0d1cf92e37d8a7652335ee645'),(66,1266788947,'127.0.1.1','76dec355c75b36512df4521600ef4aeea6f216d8'),(67,1266788947,'127.0.1.1','78237e2bcdf740ef5639827ad9ef8d487a493b09'),(68,1266788947,'127.0.1.1','76bba5f858a02012d2fce766ba4cae1ccc00cc5c'),(69,1266788947,'127.0.1.1','b7f2dba06c0ad51a237db217ab392636ac5ef4d0'),(70,1266788947,'127.0.1.1','8d409e7ff8f3ac19f427f0d2c35a99356e0cecf6'),(71,1266788948,'127.0.1.1','867273e22d87347f2e5ce5eacef9f9ade2e6dd67'),(72,1266788964,'127.0.1.1','5fa724f87965b18a3de89b5c2d79df78bd8ba295'),(73,1266788964,'127.0.1.1','c926bc07f52bc8de08bfb44e75f5d0cf96f71ffe'),(74,1266788964,'127.0.1.1','24ab2cee1c3e235f5e649c70ba67244082c7b138'),(75,1266788965,'127.0.1.1','6a34e79421e119e3fe8188445d488dbaf2437196'),(76,1266788965,'127.0.1.1','65b3383470f1f2f6a788c8116d4fc714c3e01dab'),(77,1266788965,'127.0.1.1','be1321852d1f53e6f2bfc8543b356387d7fc242b'),(78,1266788965,'127.0.1.1','712d0738ac127f4f2bccb91b30061a2c747320e8'),(79,1266788975,'127.0.1.1','54950a12d3866083cf0e24954d17edd993082f61'),(80,1266788976,'127.0.1.1','ae4bf34f88b7c07efa6580f83f8b9af13c17e7b1'),(81,1266788976,'127.0.1.1','c867f6f69105c52d8d317a6b64f3016041e075b2'),(82,1266788976,'127.0.1.1','486434404df214dbead1bb29a86f965021e34d90'),(83,1266788976,'127.0.1.1','80e361bcfca5ce59f89052e19331e16c2d0b25ad'),(84,1266788976,'127.0.1.1','56ce56eb94e19f6a9e1469d0f6af2a0abef6e1db'),(85,1266788977,'127.0.1.1','e7299459ba20107cdb309bb6d259b77206f638a7'),(86,1266788977,'127.0.1.1','261aba54ddc0b68d17a41f142681b6952f082c12'),(87,1266788994,'127.0.1.1','d312f969287bcaf79de3c63b31407cb38129f23a'),(88,1266788994,'127.0.1.1','ea3a85335bb005f7a34e345665abff640c53f169'),(89,1266788995,'127.0.1.1','dba0fccb331370f9a16894a3578463a5add37117'),(90,1266788995,'127.0.1.1','d3cef4add7b6b02ff0d15f7102f358d63688461d'),(91,1266788995,'127.0.1.1','b27247e4bafa01862b6773e4d43ef7db76063659'),(92,1266788995,'127.0.1.1','0729108f7e2a528f9b4f5ad1dfa7f26d85a799b6'),(93,1266788995,'127.0.1.1','0ac905ab3b96e83678c1979437e8cedbc0408e7a'),(94,1266789002,'127.0.1.1','dafd0d7200ccfc7edd43506c60d99c2bf9c8cb45'),(95,1266789002,'127.0.1.1','ebc8d504f867c81456ad329a3b3990377c2299a6'),(96,1266789003,'127.0.1.1','f9cf352cc993e06cc2f73702da9fa4dd4169220c'),(97,1266789003,'127.0.1.1','c8c55bd33d3619dac711b31d7e7fbda8fa904690'),(98,1266789003,'127.0.1.1','fda3946b513e777b5ee16c0ebac20884c7bb1239'),(99,1266789003,'127.0.1.1','c008a239e68e30cc0e2f846f9198f00438e30d2d'),(100,1266789003,'127.0.1.1','4ff4d1e9135d62188f5dbd6075e130b5d120a793'),(101,1266789009,'127.0.1.1','43ed2d1b03d37ae5c5f499a1b8c170c5e42633c3'),(102,1266789009,'127.0.1.1','e227e6ccd8904ab7dbab5c8658727b6bac0c241b'),(103,1266789009,'127.0.1.1','d4060121690f19a1a2d277efc36183b07ffda6c1'),(104,1266789009,'127.0.1.1','2aa810c9c406f058df5d9a75d2af51b3aee1d7c3'),(105,1266789009,'127.0.1.1','e675696a165821dc3fe1995d77e63c9a6fdaf747'),(106,1266789010,'127.0.1.1','ca1e6499434c30a302fa7c3f00c6aeb551fed613'),(107,1266789010,'127.0.1.1','de455b039bde93e7fd6f28a33ee602ee711e27e8'),(108,1266789010,'127.0.1.1','e9bb079512d5adf72c25e542d115493dd7183f2e'),(109,1266789016,'127.0.1.1','70e31d81aa093ad47f7ff6a0f5fbaf036bbe3b5e'),(110,1266789017,'127.0.1.1','956ce0f301bb7c5cd875cb92da1cc09adffe4ffd'),(111,1266789017,'127.0.1.1','0db6dbd7606f88ef729b4a7127e2174a13cd87ed'),(112,1266789017,'127.0.1.1','ca37cc0c0712dd23951ee5088a830f28341d3442'),(113,1266789017,'127.0.1.1','628d04be8a3689586febcc4d5eae2a97de3c3f7c'),(114,1266789017,'127.0.1.1','73dc9fbc0b0dc935b236c1b8fd57343e46e46146'),(115,1266789017,'127.0.1.1','b1cfb1d5a0782f9c9dfce9f9982a4469b8eddcfa'),(116,1266789023,'127.0.1.1','79208a031747a9836dc56557fd8d14ed064adbc1'),(117,1266789023,'127.0.1.1','1498d91d7bc804adce4b12e79f73be477768bb7e'),(118,1266789024,'127.0.1.1','57cd4047868aded17ca22555d3d4eae19412456f'),(119,1266789024,'127.0.1.1','085e219d043848ce59ee49824207f4f821d66aac'),(120,1266789024,'127.0.1.1','dd23328ddc3c600eb8bb0be62685327740f65d99'),(121,1266789024,'127.0.1.1','5e6a1f4f43f8dae84a22dc0f6d765aaa13038803'),(122,1266789024,'127.0.1.1','3d9a3909fb9a8f93ce1ba5c348a8ccdd8566b2fd'),(123,1266789114,'127.0.1.1','4aee6bfb7fe2821624a607cd8e6d2502ec5aed51'),(124,1266789114,'127.0.1.1','2f64daa19ebeadfc87501a6c0e73dc46f166f81a'),(125,1266789114,'127.0.1.1','ee193f44a66ab0ce8d3f5ef5c34ea03dda966cdd'),(126,1266789114,'127.0.1.1','d93ace0c085bfd1cc23a1b0472052530a8908492'),(127,1266789115,'127.0.1.1','bf6ecfbcc180c6226fcd1525a0968f3904e3ab85'),(128,1266789115,'127.0.1.1','9bcc481e8f30d2d4c7504582ec0d33970dd20c4e'),(129,1266789115,'127.0.1.1','a8e724de3d05b55e32e335e7c9e2099853905e00'),(130,1266789115,'127.0.1.1','cae4fb1484e16780a61a71d1f423a060e98f387d'),(131,1266789123,'127.0.1.1','3188055d00a2d530a51199976ecd01b2e123d278'),(132,1266789123,'127.0.1.1','427e0a1ad777171d4747a89bb1f1fe50f14dabca'),(133,1266789124,'127.0.1.1','0013b3d60b1ffb57407267af303e682ac0fb43d8'),(134,1266789124,'127.0.1.1','7f31373895b938e95b30296efda123cd487e59d5'),(135,1266789124,'127.0.1.1','a19d3adebc08c7d749025129a669d9d449b751f2'),(136,1266789124,'127.0.1.1','fecd034e376dbb2da51dc6ed992a445f44c174f9'),(137,1266789124,'127.0.1.1','2e7c0019081e4f02586911e83ec25b2ab3db8ce4'),(138,1266789176,'127.0.1.1','a028784a01bc95d25827e90e7b399d055980d238'),(139,1266789176,'127.0.1.1','eff712b926c8716ff44a277a4c68b009a5288873'),(140,1266789177,'127.0.1.1','369da956a854d01806b46e6d8e1992db1eeb7925'),(141,1266789177,'127.0.1.1','648185d42641df36b41f13853025625ea37f20ab'),(142,1266789177,'127.0.1.1','d0b26c1ea7bc9fc50a60f1953efc7021201b61d0'),(143,1266789177,'127.0.1.1','eba56446bdf0546fc3e205e28bb349637ea86aa6'),(144,1266789177,'127.0.1.1','9257c5ce5324db09bc80b956f2fe8ee567a832e9'),(145,1266789178,'127.0.1.1','0a3092008ff82ae6f05a8a41f7d3783d415bda74'),(146,1266789183,'127.0.1.1','dff9279933f191dfb2e040d332004c73868a9ecf'),(147,1266789183,'127.0.1.1','b91cba9da9f00a6e575e36c7a8cbe9e2633d7286'),(148,1266789183,'127.0.1.1','85a0ab37017283c4cfa757db0d876a658ebf33bd'),(149,1266789184,'127.0.1.1','1ba6e9380e5669410e120bb8122c3534bbb9271a'),(150,1266789184,'127.0.1.1','d998a3d45691442a41ce4d23464f04e601fbeb76'),(151,1266789184,'127.0.1.1','0753551f9bf772be14b986ecf3206943768006a0'),(152,1266789184,'127.0.1.1','ba4518ce3bb36778d92fa14a425797adc8152eca'),(153,1266789221,'127.0.1.1','54d00fb0b1f8eefa6cc1d4ecdfd8aea7fe64f9bd'),(154,1266789221,'127.0.1.1','8b709e73eb8a5707a3d5ab5ce3ffae0e2dd11fdc'),(155,1266789222,'127.0.1.1','078c58187d6397c6786f10ad38c44092aacead4c'),(156,1266789222,'127.0.1.1','4d0d594147fad2bcaa5ce590ab5690c8489a352b'),(157,1266789222,'127.0.1.1','31356a37b37ac165945563b482f2880d344ecf27'),(158,1266789222,'127.0.1.1','58ed0420999377c9fd3d8aace658c5ffe198947c'),(159,1266789222,'127.0.1.1','9d31f20df0206a28bf14b00fab60b92808eed7e5'),(160,1266789226,'127.0.1.1','de70f4d145c8e1b19a3c28021ba6ba206ab7279c'),(161,1266789226,'127.0.1.1','c164e4c98942c286f9bd158eae08631301f2bb0b'),(162,1266789226,'127.0.1.1','ab175a4fde22066158ff33c453300e8dcff64d2d'),(163,1266789227,'127.0.1.1','e24fded12e9dd583b03e0587cfcb7b0349355e41'),(164,1266789227,'127.0.1.1','3b03652e7094787032b874edf8b3bce79ac22ce5'),(165,1266789227,'127.0.1.1','2a1c28418df258699c60b8f56477082f01ddee8c'),(166,1266789227,'127.0.1.1','79452d7e0ce2cda36eac1d6bb7d5ce285bc50890'),(167,1266789233,'127.0.1.1','82f318034ecad92e44ef663cb0314d9abdbbff79'),(168,1266789233,'127.0.1.1','7294021216fbfceca28659c4e7d2ceca5230b152'),(169,1266789234,'127.0.1.1','dcb78585bc3a8705c2be83f04ff8615ca6ff8185'),(170,1266789234,'127.0.1.1','bb907f7871426cd6c57e0c6a3cd837e888a115a0'),(171,1266789234,'127.0.1.1','f0dc6439626ee752d29742349dec950b9891c422'),(172,1266789234,'127.0.1.1','aa571920715e748baab98fdad3c9b44178fa5d74'),(173,1266789234,'127.0.1.1','75d991d79eb3ba7a36a926a07f8b5d205cb601c4'),(174,1266789234,'127.0.1.1','d70968a6c13f7674a846fb1379cbc3af3b09651a'),(175,1266789255,'127.0.1.1','04330e5521e2aa545575295acd575030700f4094'),(176,1266789255,'127.0.1.1','1a4a8dce7d7229650fb60711aeda690367b5a925'),(177,1266789255,'127.0.1.1','d23f417b43a28009fe2de6233208800071a19dd4'),(178,1266789255,'127.0.1.1','ccf34721ba55d7cd88d0d69db5e8f36e62b28b0c'),(179,1266789256,'127.0.1.1','b9a99a141d711c26a943810a132d11af09f90910'),(180,1266789256,'127.0.1.1','5abafe6156a7321a23903e672c7ee9e6a4f45fb0'),(181,1266789256,'127.0.1.1','266319abac2f4657610d33bcc2ed267e33bdbdee'),(182,1266789256,'127.0.1.1','1553df7d702710020f45c7e1ce58c10ee0f43ea1'),(183,1266789268,'127.0.1.1','1523550dfe997df438a1ca57dfb4d44272557499'),(184,1266789268,'127.0.1.1','fe606c2e30a677c80e030042afe0219c94483530'),(185,1266789270,'127.0.1.1','9f7f37436587be82b72b219f4732abc3c6b70e0f'),(186,1266789270,'127.0.1.1','ab09e3b93ab88e6c08fd8db2c02379a4cbb7d574'),(187,1266789270,'127.0.1.1','ce48d209403459e45a6be5b105b8e3d4cb5d9ced'),(188,1266789270,'127.0.1.1','1b6a77bb5f1eed36ec9c7e00bafc6395b5cc9fe1'),(189,1266789271,'127.0.1.1','d242d62b7108f9f75f331658ae50cca737339931'),(190,1266789271,'127.0.1.1','ce18eeca33eea1ff3bbef25f79f7486d70f63439'),(191,1266789277,'127.0.1.1','33d79b1c4e44e72d57f64bc67782c2f91f493376'),(192,1266789278,'127.0.1.1','580d7e104b16da0f34da6a3b9870e4c1e7ce5d38'),(193,1266789278,'127.0.1.1','b706bbbf8ec761eb4875621775f0d5a769761983'),(194,1266789278,'127.0.1.1','005811646f12e405bacaf2409a8a79908d63d662'),(195,1266789278,'127.0.1.1','db1c1aa48dda3146bf0131ffd34007b73e805eae'),(196,1266789278,'127.0.1.1','e3f0960d8e041accfd3b1d3d7198b8eae4a6180d'),(197,1266789278,'127.0.1.1','034ab392aa7372d74f6337d60e77f24ccc9d41d0'),(198,1266789318,'127.0.1.1','05c6c704a8d863cd5ee874c168cc9641d2443285'),(199,1266789318,'127.0.1.1','afdbbb1348c77f22be05f1087ec47a43eaf67749'),(200,1266789318,'127.0.1.1','19b34312e61a323d5cd7d366af2d30922518e72b'),(201,1266789319,'127.0.1.1','7486c794d81ae7b71fcfee6b6bce2f9a13c0882b'),(202,1266789319,'127.0.1.1','156321020e9dbe59f96f2eba0acc06efa470ca5e'),(203,1266789319,'127.0.1.1','f73836d24fbb6e841ee81d5ece738742868d5177'),(204,1266789319,'127.0.1.1','570c7adbd1019fb8d5f886e0cbcbff72c7c1c2d7'),(205,1266789319,'127.0.1.1','3796124d0e428044a434ccabad266272115ffe57'),(206,1266789326,'127.0.1.1','585e8a0ce1727f25a233dc9111925d037cf26d85'),(207,1266789326,'127.0.1.1','d73be69b824b8443cf7860401d4bc2eb24bb4076'),(208,1266789326,'127.0.1.1','7e798390989e42b376e86610cbfb337859d401ee'),(209,1266789326,'127.0.1.1','1d5ec962c44e4432e2cfc36c97998a8e0dfbce4e'),(210,1266789326,'127.0.1.1','25398abce42b6e19de586b6b24400288e5cacf84'),(211,1266789327,'127.0.1.1','1b6ed5011e9d89303e12b73533b1606cf6f338ed'),(212,1266789327,'127.0.1.1','32628596d7f9f69beb17894d14d5648d5af625da'),(213,1266789327,'127.0.1.1','5ffcf6773a0438a5cce02dd4f7258472e671b0b9'),(214,1266789327,'127.0.1.1','8093b04bf414af43ea962efc23eaadd21ce7cf8a'),(215,1266789328,'127.0.1.1','9938756f4dc78c677c68487dbc8137b6b30923e0'),(216,1266789328,'127.0.1.1','9a62a9dac20a11c4b67ee22bbe43475fe0a9de1c'),(217,1266789329,'127.0.1.1','ee8b1188cf470562df3b7121f9d4c3d1d42f43e5'),(218,1266789329,'127.0.1.1','449d5373ee96c7d8b00457a7646d3532c5aefd47'),(219,1266789372,'127.0.1.1','94583b257c95d9a96b2a04e33f43f4a01e915ced'),(220,1266789373,'127.0.1.1','27b74d34360409f3f350449b7af0f7b132ab7159'),(221,1266789373,'127.0.1.1','af546dc6ece5928f84ac31ffc5350e7448f02b31'),(222,1266789373,'127.0.1.1','a72bb90a1014a18ed23bdd95012cdb57fad8a8e0'),(223,1266789373,'127.0.1.1','aa54dfea97a61b31666bb8c228ade3e743c9e215'),(224,1266789373,'127.0.1.1','08d9213e2ac2b2083f9e4c6ffc9a4daa4c001cec'),(225,1266789374,'127.0.1.1','340ff2ce4dd5e65abd2648de10ff08bc07f8d139'),(226,1266789378,'127.0.1.1','c749965774a317483668e4eb4b9b56ec3c5b43a1'),(227,1266789378,'127.0.1.1','21e93abf53c4f062863095e37917d08d777afcff'),(228,1266789379,'127.0.1.1','f844f94b9496054d52efc9ebbee83007fb0d99a3'),(229,1266789379,'127.0.1.1','e54398f8eb6104e2ee033e26a9ee2efb0429af38'),(230,1266789379,'127.0.1.1','ecfa98cd018bcd5ff0ff747d1df5b72591038c59'),(231,1266789379,'127.0.1.1','719b53cc133edc1078d4f59c663d4287c27146a5'),(232,1266789379,'127.0.1.1','5000ef0d4741f30810aea124783a8af53475278c'),(233,1266789385,'127.0.1.1','e0e46082235c237e8c7dd97947bc048aa3116c0f'),(234,1266789386,'127.0.1.1','7eda799bde4403511e521382c3794fdadea815c9'),(235,1266789386,'127.0.1.1','691290caffa4cbc7270331a46f42460c25f98a3a'),(236,1266789386,'127.0.1.1','7ec2d56dcc9a6b09d55ee79edc4bc995840dff77'),(237,1266789386,'127.0.1.1','38908e791246f677e6d53652536df6f48818b3bf'),(238,1266789387,'127.0.1.1','81ced1b77bc74a3d6ad469694a0b20e6afae15ae'),(239,1266789387,'127.0.1.1','7cc81633bea34fc5dd2cf1e7b464ce5fab18595b'),(240,1266789395,'127.0.1.1','15247623f810badb056b73afe0082d701dfa8a66'),(241,1266789395,'127.0.1.1','23c8bbbb098d8656633aadcadfe329836a4c693e'),(242,1266789395,'127.0.1.1','2f80f05abedea3c88735e06f3082ff3430250101'),(243,1266789396,'127.0.1.1','17f62465b5b8f16960e0756ac4cd70736f94e7c0'),(244,1266789396,'127.0.1.1','ad4cdc3407afc07e2c9d276ccf8f30b42d4416f5'),(245,1266789396,'127.0.1.1','7e6c0bc07c6c3a91a2cd72df0226837fb8dadbf6'),(246,1266789396,'127.0.1.1','ccb135fa02a92cc153203f5696c34dfe28d602fd'),(247,1266789396,'127.0.1.1','23d171dc8c06b7d85684c8885dfd267e766330e0'),(248,1266789400,'127.0.1.1','80221f12030b741cb44761fa55efefcd44e26b40'),(249,1266789400,'127.0.1.1','95e175ac67dd053933eca0c534b9fb01b8544918'),(250,1266789400,'127.0.1.1','07117e1bdef49491ae458fb0c954fb17ef36f133'),(251,1266789400,'127.0.1.1','25799ddba96a56fb0c04ee9f320e3503d1448afc'),(252,1266789400,'127.0.1.1','80858283f3965d036916dca10dcb26794d55969e'),(253,1266789401,'127.0.1.1','e25733d15b141063970dde68e2dfc9345eda5ba7'),(254,1266789401,'127.0.1.1','da4c6b468e867b00d8ad2769492055bf9282d8de'),(255,1266789410,'127.0.1.1','3244955988607206aa18009be88589108604588b'),(256,1266789411,'127.0.1.1','89d7999bf45c1ccbe1e4c8cea613092ee28dd63c'),(257,1266789411,'127.0.1.1','41bd398d48ccb2e6275b591903e4745c6fc0fa2a'),(258,1266789411,'127.0.1.1','87951d068ae8fbadd1c5e5bc0b49348fbbe4fb8d'),(259,1266789411,'127.0.1.1','1362c2a846728e000bf8cdf05d692d16f97fe645'),(260,1266789411,'127.0.1.1','ed02dbcf2799a38e38decc16b9c56e21210bdda0'),(261,1266789411,'127.0.1.1','f24ce41b90f9d0915685eff45cd98337b3e39fde'),(262,1266789414,'127.0.1.1','2f11a8feb76849df26cee7179f00f918c754c122'),(263,1266789415,'127.0.1.1','e2d23008b33a9058a17d78078e80d3f98e72c4f2'),(264,1266789415,'127.0.1.1','472089592804b66a717d38c5f5cf68804ba1837c'),(265,1266789415,'127.0.1.1','e73154db0c20fb7ce2d35e159e7bfb3e605c05f2'),(266,1266789415,'127.0.1.1','8d869de8530bac2235de1450ac14c0df82e3b9b5'),(267,1266789415,'127.0.1.1','f7c45e3684c613f930989ff4396600c2bf110c95'),(268,1266789415,'127.0.1.1','2bc1a4e310560f094728db6d81de95cf5b9ec5f7'),(269,1266789419,'127.0.1.1','32d5579832c46c068dab334f72bad1da5bdf61dd'),(270,1266789419,'127.0.1.1','e43d5a64a0b95a4c18ce09ae686f192c43a36ac5'),(271,1266789419,'127.0.1.1','06e729f2487c5bc87fd33ca4a9567fafba5b013c'),(272,1266789419,'127.0.1.1','5881e6de3e725ac34ec4faf131febaa1b06e4e7e'),(273,1266789420,'127.0.1.1','2b35ec92872a9444602b413ad9392503c0d4c252'),(274,1266789420,'127.0.1.1','a50ed2fb3d3a978a1c2c184c1d98ad60a55033a0'),(275,1266789420,'127.0.1.1','c01dfb70356864dfaeb48284b0497c2fd7aa5676'),(276,1266789427,'127.0.1.1','afeaa4ed6ac3fe9fc625368783af5b9da98b6fec'),(277,1266789428,'127.0.1.1','45d9a0344d8489e8eae336fd1fa9db61ddcc83f4'),(278,1266789428,'127.0.1.1','d7e1f6ffd8a7374f0c391d5433dc4459ed2cfe36'),(279,1266789428,'127.0.1.1','a512ae44b0bab60e6675db111c5c11b9a8793096'),(280,1266789428,'127.0.1.1','103262fe6d37afeefe0a8d05e72041f827ad3369'),(281,1266789428,'127.0.1.1','c476dd4054c5e313796a111f3177233d1a5e3e0b'),(282,1266789428,'127.0.1.1','a1c50f7c5e238be50db129f2fc976c8667905203'),(283,1266789429,'127.0.1.1','0c974814899ab0c5932ec1122f34416791157b61'),(284,1266789433,'127.0.1.1','cc883928c8b7d6712acfe32c2d2403bbcf16176d'),(285,1266789433,'127.0.1.1','ee87a34bef81240f99682ee66c7a740f01d6bf00'),(286,1266789433,'127.0.1.1','8a81c06a7a697c1112b72c9a3d4835a6c57147d4'),(287,1266789434,'127.0.1.1','f00b3ed36b81321a1bb9340784a5c1d56291910f'),(288,1266789434,'127.0.1.1','d33915f9f1227b410a271d6287a06e8e7c2f85b5'),(289,1266789434,'127.0.1.1','d71d9be6a2ea6fc5efcb85946292324c9d817bc4'),(290,1266789434,'127.0.1.1','38cbf2b4e43b6d0d88c052856582ec64083f8a5a'),(291,1266789444,'127.0.1.1','20ad8ea2e3e2d7d8cc0bc3e25c615ca87fa74d44'),(292,1266789444,'127.0.1.1','1ba734dccd42240aa8c72464069374c511f85735'),(293,1266789444,'127.0.1.1','138780f322dc492bdb7eb739375c0f12e0e12826'),(294,1266789444,'127.0.1.1','32091dde2103afc6e10d777c6e93fa647c433443'),(295,1266789444,'127.0.1.1','0d1846725f70df48d957834d29a9f46455eee1f8'),(296,1266789445,'127.0.1.1','0598f9fa61f2f7f57dee49f2a2516dcb3f950674'),(297,1266789445,'127.0.1.1','de510d1f368113cf491e907e904891aafb9fc493'),(298,1266789445,'127.0.1.1','9b9212410d7126671783531369b1deee6644bd46'),(299,1266789488,'127.0.1.1','5f9a384cf4e91c5bd49098cc1092bbf620b25060'),(300,1266789489,'127.0.1.1','c9cf2d60ea5f33598b793d7247ac91c3c1315ad0'),(301,1266789489,'127.0.1.1','a7bfcb8348141ddac59163a0b730b365618c77d1'),(302,1266789489,'127.0.1.1','8035c4f20a4ea12bbc44610a54bc9d75938ab347'),(303,1266789489,'127.0.1.1','80dc3ed5f2a61346afcd6e2a52767e293f778c8f'),(304,1266789490,'127.0.1.1','3f5817f45993b36b641739546bd09fa94c2f1161'),(305,1266789490,'127.0.1.1','93455d895bca68735635bb4f4c9b5a552ff11428'),(306,1266789490,'127.0.1.1','7ee9056bd37e080a40f32ba593300ad6dfa1f851'),(307,1266789490,'127.0.1.1','34b0f4b7a0673a89c7de6033c6e260d7cb425fcf'),(308,1266789491,'127.0.1.1','1de87ae1cc6d8d1e154999493213471f46e048dd'),(309,1266789491,'127.0.1.1','a2de0bb988f76e76d19010f67e0ccc67a2261f67'),(310,1266789492,'127.0.1.1','3230880ce61eb8b2e955d40d28e491e7de7c5395'),(311,1266789492,'127.0.1.1','4ce1985a578403394faa1b3c771e5459bfbdc270'),(312,1266789788,'127.0.1.1','4a8e459d9e28a7a9ec5c48d8fa1677a9730ba2be'),(313,1266789788,'127.0.1.1','84e7fe29e659d90c655beb092b7cf89ebbc940c6'),(314,1266789788,'127.0.1.1','344183b7b412d247bfe868e1f56858428bb12f0c'),(315,1266789788,'127.0.1.1','3806549b5f23893bdccf29693862edc7b0223c94'),(316,1266789789,'127.0.1.1','498b3b8e93bb072352bed0c704e9988a68d9c1f8'),(317,1266789789,'127.0.1.1','9ddcf95ced63d4b665ddf169c94f2ef15d4dfa7c'),(318,1266789789,'127.0.1.1','9cb5e28b56231123ce22817db30e93b11c9be7f9'),(319,1266789789,'127.0.1.1','9ea27d46281ca8519e76048fd3c7aab03c506e3d'),(320,1266789797,'127.0.1.1','6016c5c93e11d2b04fe6f0ce815eeddc58f347df'),(321,1266789797,'127.0.1.1','506196d583301a60089451c0d9fe0008806e60d3'),(322,1266789797,'127.0.1.1','6239d4c753af3f5be0ec655f5cae7590cfab07f6'),(323,1266789798,'127.0.1.1','554d621214b26731e5b03d46be1218d9e036580b'),(324,1266789798,'127.0.1.1','87d8abe2abdbb759a5a2a10a5d8cc6a037896e8a'),(325,1266789798,'127.0.1.1','e7e806a3118ae2f31468e8af8057bfcd3718b8f8'),(326,1266789798,'127.0.1.1','11a0a292dde5bf5f6edbdceec6b6f5e99629e633'),(327,1266789798,'127.0.1.1','7a57de5cef446f996e9c3dd8353a42aeddd7951f'),(328,1266789798,'127.0.1.1','616908da78ad82e2ba878c407dfcc0d91e5f8f2b'),(329,1266789799,'127.0.1.1','b0fefc8f567df15f77d87132617ed1a481cd531b'),(330,1266789799,'127.0.1.1','371c35b3ff9fa950bc86654137c9ce8df83806b5'),(331,1266789799,'127.0.1.1','c58d8f411700d3dfa9db3ae9e9e358a3d4a1b4bc'),(332,1266789800,'127.0.1.1','d3c1d677fc07a27c76465cb147077c54accb9c79'),(333,1266789800,'127.0.1.1','8e458f761f3b4d157b405e9411f3685c33726fee'),(334,1266789908,'127.0.1.1','299d5a80c1f70527c5eb351df31391d1ab517ea2'),(335,1266789908,'127.0.1.1','edc107dd90b84fc7d700f01e0740c2c91493394f'),(336,1266789908,'127.0.1.1','f6f6b026b9716e67ffcdbb1366227fbd3f44b58c'),(337,1266789908,'127.0.1.1','ad83113954344848d7bbcabd4657f8546b232706'),(338,1266789909,'127.0.1.1','b419f8a2145fe26d8b6f3ccb1c25059392b43f78'),(339,1266789909,'127.0.1.1','ec9cd0cdb08e0e732dc1105082f74f2fde1679a0'),(340,1266789909,'127.0.1.1','91baa082f8fbfbbd13b1c3aab52ba8ba311f9fb7'),(341,1266789909,'127.0.1.1','2b7a83d7d14134763a1114913733f80854f479d6'),(342,1266789978,'127.0.1.1','13474c3aaadab4cdfb3dea2d3716f304760b086b'),(343,1266789978,'127.0.1.1','9a62037d7b9c00632abd9ccee148e4d653350f93'),(344,1266789978,'127.0.1.1','1e3389ed98433b01543865f59745ae2151fab340'),(345,1266789979,'127.0.1.1','1a29b4199740aeb7db3fb2cba94f8341413828b1'),(346,1266789979,'127.0.1.1','1735b999be01f49f7e713531ec1b327cf84463d8'),(347,1266789979,'127.0.1.1','041fd93ecbdcbf437fdf4ce19af35fda3efdb030'),(348,1266789979,'127.0.1.1','0336e203ca7b435ea3b594b21e0f9a4c625e436c'),(349,1266789979,'127.0.1.1','6a5537c174a1bc606cd19fdd4d05ad88f06e8073'),(350,1266789979,'127.0.1.1','a245b2ecae2cbaf5aa4833e256ca8ed532ac06bd'),(351,1266789980,'127.0.1.1','c7024564934a479b353484f4d108a518148889e8'),(352,1266789980,'127.0.1.1','66e8ada9964e7bd3b7325e6a5e319372a9a1f04a'),(353,1266789981,'127.0.1.1','8a0a2868bb16f40355452cd7620698a2c705d2a1'),(354,1266789981,'127.0.1.1','c94c3bc1c63d457175b64b52db286bf6e353f4fc'),(355,1266790037,'127.0.1.1','eb6ad31dfc3a0b9665db6519d06ea0c781689a4b'),(356,1266790037,'127.0.1.1','96c24e7f9e8f95d99469bcef02d7c29a0c1ae808'),(357,1266790037,'127.0.1.1','23279852fadad15805d81c14249d294debfb5347'),(358,1266790037,'127.0.1.1','7c2e72bef2dfff6c3f34db64ce7a21e6619f0ea3'),(359,1266790038,'127.0.1.1','10f7333d017e01d5b6607645d79bf454d04f0d56'),(360,1266790038,'127.0.1.1','7f3fd4c9c7a4a585643fdff09a54832184220c3d'),(361,1266790038,'127.0.1.1','bbc2d9ee8858a6929fe868c621ecf92273455dd2'),(362,1266790038,'127.0.1.1','78c495025ed756870d995401a792d55458cd898d'),(363,1266790153,'127.0.1.1','a38fd6e67879c145927fee6b093f3c6aecb2d1ea'),(364,1266790153,'127.0.1.1','2c610bcea663f093eda32088203c7f83f684f393'),(365,1266790154,'127.0.1.1','8ed0fe68948ff0f5b11d484bc653731f5b0f0a4b'),(366,1266790154,'127.0.1.1','3009d6075d3a7e1c258acd96fc1ff06ae4b8ecef'),(367,1266790154,'127.0.1.1','0d829a1f098fffb2b9da819d5cb4e61bc53be9ce'),(368,1266790154,'127.0.1.1','7401730f2b0563613fbe27752b1820bfac1864ae'),(369,1266790154,'127.0.1.1','148c3bc767f14ef033d44187e9f0396b91fc5c2b'),(370,1266790155,'127.0.1.1','da0c12dbc53545e46ecfcf9b8ee99cb9b0307993'),(371,1266790155,'127.0.1.1','b7d5e48b6b2ffc2ec41b02075bcb90e61cd808e7'),(372,1266790155,'127.0.1.1','2820c5b3cbe73b8cf534f7ca15f1a382fec936d6'),(373,1266790155,'127.0.1.1','29152a251e6087d442a00354529add796aed64b0'),(374,1266790155,'127.0.1.1','b171a5f3ca65c4fb7cd4bb5d627a994071e7ecb5'),(375,1266790156,'127.0.1.1','93012e76f71d45e0348f8090376e247a6d29eb2e'),(376,1266790156,'127.0.1.1','ed60cc33f967421ce6b9ff6315ab318ce3959c6e'),(377,1266790167,'127.0.1.1','e981a84de0d620d85d85684802cc908af8a76cb1'),(378,1266790167,'127.0.1.1','d1f29d516310543a1956ceebb9f337c21a9e0229'),(379,1266790168,'127.0.1.1','373e06a3784d7b1e40689e6a1966f83b83d4c8d7'),(380,1266790168,'127.0.1.1','9ba623dd4623ec9a50b4ec360b1fabc52652c801'),(381,1266790168,'127.0.1.1','07e99a813752a1e6277698c1f06e24d54df87a7f'),(382,1266790168,'127.0.1.1','c68b06d88145639dd9cb13bf5d40f9e67bc0ccfc'),(383,1266790169,'127.0.1.1','652199d3afde849d0a9a3d9889e0b58220b1799a'),(384,1266790169,'127.0.1.1','c5f130d7003bcce9bab7c6f7453639c2532e32c9'),(385,1266790172,'127.0.1.1','0bb36984e62896a1759e34efe20b3cece45465f5'),(386,1266790172,'127.0.1.1','7e379dc45ed9e2c1d19216941218f8a63dc54966'),(387,1266790172,'127.0.1.1','33fdb76e36982e4f8d5a740c19d0678ea4bb682b'),(388,1266790172,'127.0.1.1','72beeee9d6b4c54442a0ef76b6cc22b6684e3440'),(389,1266790172,'127.0.1.1','598ebeef56d4fab396f017375d97a0722ddb1cf6'),(390,1266790173,'127.0.1.1','5d73b16521aa126dca76aace8d8c1fd821a96fe0'),(391,1266790173,'127.0.1.1','39b1c7ffed6192126ea9a0644663c919cd34481f'),(392,1266790173,'127.0.1.1','5158fcc2034524a9d2638e1459358f62e13a53fe'),(393,1266790173,'127.0.1.1','93a4129c09025e75e8f2b0dcf8556bef5b8ea996'),(394,1266790173,'127.0.1.1','c33e1c846c08467781910325112058641ce93df7'),(395,1266790174,'127.0.1.1','2b86099e9ddcb743e8762968aaa1688ecaccb586'),(396,1266790174,'127.0.1.1','ecc20333e8efd0d65fcfd2083098716bf85a6565'),(397,1266790175,'127.0.1.1','075199df6602ecbf7e887504350158e9649a5b6e'),(398,1266790175,'127.0.1.1','6d8025c3d4578a45607d2002cbe01c173a2c8957'),(399,1266790185,'127.0.1.1','9518b657ac5747007d237b3b1d0ab2701748c6a1'),(400,1266790186,'127.0.1.1','f3b481be2cb926ae948be51fa543458888529e15'),(401,1266790186,'127.0.1.1','d6f60291266b5adb9f77de0319822527a571fc60'),(402,1266790186,'127.0.1.1','a27eb8c24a7d547c6c81ab5433143e7dc03093d1'),(403,1266790187,'127.0.1.1','0f6950a0ec25f5248744ba4799ae1fce0768bd5b'),(404,1266790187,'127.0.1.1','7ffbed162df302c92454f6439eda4c2281f21a31'),(405,1266790187,'127.0.1.1','abc1fc86516a1e51c4b8321f685d9707356e8452'),(406,1266790187,'127.0.1.1','a5b7eb8c0664be91f4f199e9cb3c2039dbc41dfd'),(407,1266790197,'127.0.1.1','82f64d3d506d7efc92db4d3298a8b1972aee65c7'),(408,1266790197,'127.0.1.1','ff7f1b30934761a363763dc742848baeaf3ff2bf'),(409,1266790197,'127.0.1.1','89989ba8ddba18330cf662265cab17fc23af173d'),(410,1266790198,'127.0.1.1','564b395c7c374f43248fe5a9c41f96e6addc8305'),(411,1266790198,'127.0.1.1','805e36f09d508d3e4dcb7003302568ba13ec486a'),(412,1266790198,'127.0.1.1','7c0fae96df2757f3f391e0810a433715332c5a15'),(413,1266790198,'127.0.1.1','b285557e9eb99e56d0bc807d3e0e0f17368f5d2b'),(414,1266790198,'127.0.1.1','e8adb6e45d6eddab411321e4bbadd6007c012dee'),(415,1266790199,'127.0.1.1','c16ff7e7d32fbd26dc3947d1e07b46d04824576d'),(416,1266790199,'127.0.1.1','4a3998c84d05b781d71cb8eeadb397a596b09cb1'),(417,1266790199,'127.0.1.1','4683b4225c0351030caf592e0b72a4fb7a33882e'),(418,1266790199,'127.0.1.1','4923a1b192569506a1811796b9f9bdf6c5a543e3'),(419,1266790200,'127.0.1.1','05a0bce638977852307ba708bf0e0becd7383f0c'),(420,1266790200,'127.0.1.1','54ef014b28f58ccd52dd24f4a2beb8dfb8ae6f47'),(421,1266790257,'127.0.1.1','20a1ff13efa59d9d06af592ed5d8a7850c605f2a'),(422,1266790258,'127.0.1.1','7f3556d4086b112d888089de462f215bf8083808'),(423,1266790258,'127.0.1.1','4fe716a10b961194ca279c45cd48fea8aee1008e'),(424,1266790258,'127.0.1.1','e0b9110b74fd070c39a8bf5ddd09e3059950e480'),(425,1266790258,'127.0.1.1','5280973b97f36eb6fc772b8c5edc821bddb90f30'),(426,1266790259,'127.0.1.1','daf1f71f2ee45cf06b2a8c7b26a8e0de7542679f'),(427,1266790259,'127.0.1.1','9ba913b5afa7769459c5d3ccffcc73fb7fc22b6e'),(428,1266790259,'127.0.1.1','512f4f9abafe5df7135fe6fdc83faff6746aa86e'),(429,1266790262,'127.0.1.1','adc7e622a4de05fdf4a8a366ed828deb34320586'),(430,1266790262,'127.0.1.1','94a7d2d2a343e873f9561ef44eca26af9e8d01a1'),(431,1266790262,'127.0.1.1','8cc983d72728f13dcedf783cd83a4ded87a8cfd6'),(432,1266790263,'127.0.1.1','04f247af6d6fa5f1e205d77d9b1f1e78245d7258'),(433,1266790263,'127.0.1.1','39c84e29254eeaa9a768b684e8cfd5985512f27e'),(434,1266790263,'127.0.1.1','e9bd3d72a3e0fc5e55d29ae05e9291bae60d8dfc'),(435,1266790263,'127.0.1.1','35dd8974b9ae173c9337f4929913463a9ccee74d'),(436,1266790263,'127.0.1.1','234e88d522bb299d408afea2ef843764e432825b'),(437,1266790263,'127.0.1.1','2488b05fc26b948b9d4a54863274949db7e98be9'),(438,1266790263,'127.0.1.1','253b40a595872f16c142b564159aed5405485ce1'),(439,1266790264,'127.0.1.1','25a92c5ac0e08962f9e977d0fcd75aecc88417ca'),(440,1266790264,'127.0.1.1','0f1c29d1c53868ebb79da0a532cab1e421d2db3c'),(441,1266790265,'127.0.1.1','e9e638a3874e7a3f46c797dd388c01277053f7c6'),(442,1266790265,'127.0.1.1','d5a0c8c42ada63a36480cfcbf70d63b35cf7f59c'),(443,1266790329,'127.0.1.1','e0e986094fb850b64f35caed6e4f7550b75c5052'),(444,1266790330,'127.0.1.1','18e8f4f96c19addd65eb947feb5ef070719cb7fd'),(445,1266790330,'127.0.1.1','2166ca8b00d4b2b09673ceafa57f3446b5e23117'),(446,1266790330,'127.0.1.1','59bb12f6c24db2815b835ac4749979eef935d4fb'),(447,1266790331,'127.0.1.1','3af793419ce73b5adad837e397ba5202f97782a9'),(448,1266790331,'127.0.1.1','a03e6676db968999e9331f4e5e0244bf51cc8d8a'),(449,1266790331,'127.0.1.1','760037e834773628472a0bf43c04118560d11a60'),(450,1266790331,'127.0.1.1','aab980fb71883edaf9aeba06478c67920313a63c'),(451,1266790356,'127.0.1.1','e10f7849aec2c24d5355a6d0deb5d643443c0df0'),(452,1266790356,'127.0.1.1','9cd59ef193d75f14ef53bd35ed8fb68ee2ef11ec'),(453,1266790357,'127.0.1.1','c7799fa01dfa3b0c7ff3d36715bb885e692496fb'),(454,1266790357,'127.0.1.1','5f073b7d3146271a4b1479c0e121814d3ae03cdd'),(455,1266790357,'127.0.1.1','eee735318ffbbd8c7eabf94b24ea62883add1127'),(456,1266790358,'127.0.1.1','e75578e53ff46e48f05ec5b0bb5b83ef9b14c13d'),(457,1266790358,'127.0.1.1','538dee613883febf72bd796c1387ae7983916a96'),(458,1266790358,'127.0.1.1','afc05a5a44077f1678916cfe58f40ccd2ef7332a'),(459,1266790358,'127.0.1.1','8f52c5029f6fabf81ce1491677b0703347c23743'),(460,1266790358,'127.0.1.1','cceae7b24cc8f310507b91fb02a672bf7a41c30c'),(461,1266790358,'127.0.1.1','abfcf0fc5cf00c281bc1837579c8a7bac133ed43'),(462,1266790359,'127.0.1.1','eb6ac0a7aeb1fb063e42c3c5c897577fadcf0f93'),(463,1266790360,'127.0.1.1','b124a2befd9c3f676e9559d095da8dd9d3fa6b68'),(464,1266790360,'127.0.1.1','7a82dc63c4d4c0be54bdb9b3c2d94b4da2e3cb5c'),(465,1266790369,'127.0.1.1','865294ffe803007a40320869b52ff1470230b1ab'),(466,1266790369,'127.0.1.1','42903d54440a2844865184ba1ab4c3ef75fb5ce0'),(467,1266790369,'127.0.1.1','fb79fe189f68a9b3047576447f811d979c4b8d9d'),(468,1266790370,'127.0.1.1','7a419bfdab4702e945bee196a9c547ff95e7d1e9'),(469,1266790370,'127.0.1.1','9c290fa4d61bb98ea8379f4f164f24921c816c7b'),(470,1266790370,'127.0.1.1','17afc20bb258aa84ecfab63932523915e83c8159'),(471,1266790370,'127.0.1.1','153a8eb0fd187e62335422d904cf2a36358321cc'),(472,1266790370,'127.0.1.1','d98f84f9a0f3ef3a9745759b151ed3dd4ec73a15'),(473,1266790375,'127.0.1.1','2498328084f35792bff305a00b8be24ee18eaed0'),(474,1266790375,'127.0.1.1','e5e25dc360ecc37fc939cde6d9c5f8723e897d16'),(475,1266790376,'127.0.1.1','0f7b930589faeff684eccb9ba28830a178740793'),(476,1266790376,'127.0.1.1','aebcc08bede08a03139e71ced8ec482256202112'),(477,1266790376,'127.0.1.1','a4f6d08d41dbc487e8278491df79fc60be43f0c4'),(478,1266790376,'127.0.1.1','3466830acd2c17403ccad444908fecd7eb712435'),(479,1266790376,'127.0.1.1','b4297f4bb406d68d7879f214d9e46e3fce25dd4c'),(480,1266790389,'127.0.1.1','3980f9321af78c08caa16773228bc8e88a2b0dd3'),(481,1266790389,'127.0.1.1','cc408523b6339ef31ac3fb2a6cf4a2dbfa9d2a33'),(482,1266790390,'127.0.1.1','21477456dba09575170bd01cc0f1a579cf7c0622'),(483,1266790390,'127.0.1.1','44f32b70f523bbe722ec1234c16896cfc71337e9'),(484,1266790390,'127.0.1.1','18a6f3170f84c10dd82d6635e57176d06ad25830'),(485,1266790390,'127.0.1.1','00beac24455d177256bab581f4315c215fc77e7a'),(486,1266790390,'127.0.1.1','65121808d0c64bc3965a56ab2f302f9c31fa2d9b'),(487,1266790391,'127.0.1.1','f18d82a0d15df8e3f948a1675ab59e1e7a736645'),(488,1266790391,'127.0.1.1','e70445b8115d86c663c6079c6dbe54cfc9d289aa'),(489,1266790391,'127.0.1.1','f6b8f296c149415ea6c884d5818c3d73142b2e40'),(490,1266790407,'127.0.1.1','7a3130052ed51e7dd5b60b4ddfcf528bf1d5f76a'),(491,1266790407,'127.0.1.1','a6e0ca35123a99506225ee19415221fbb874f908'),(492,1266790407,'127.0.1.1','48d85f8fa16cdfcaaf676ac1140652d3d2ceac19'),(493,1266790407,'127.0.1.1','ccc409e10ba3b9c5cb085b39240ec92079d5482f'),(494,1266790408,'127.0.1.1','cf15b8e25c676a41dd080153918936b8e30e9a95'),(495,1266790408,'127.0.1.1','7d4b977b4196a18af6f04326c1f38d460c0bac79'),(496,1266790408,'127.0.1.1','e201bf534a415128890ac41191069b93068c2bb9'),(497,1266790408,'127.0.1.1','1c7e9b7add613eaa3eed9e4ad63b4d589afbd328'),(498,1266790408,'127.0.1.1','37c6468e930477d26d816a01d9b7419c51146926'),(499,1266790414,'127.0.1.1','f5574071fddd23c358dcf337e6191a54583609ed'),(500,1266790414,'127.0.1.1','e06bb47f971ab41b367d98c2c05707f157804adc'),(501,1266790415,'127.0.1.1','0081a8ec732bcdb0da9ddb3168610305defae31a'),(502,1266790415,'127.0.1.1','db92386cfef54a5f88b747686ec2832b37aa69d5'),(503,1266790415,'127.0.1.1','9478a7173bc2bd1c7a58a61647fb1c8f6fcfbcf4'),(504,1266790415,'127.0.1.1','de05ec8ca35a660d3fef5a45ea311284344015ec'),(505,1266790415,'127.0.1.1','a3e57350faec2084bf54816a0c26dca19787c6cf'),(506,1266790423,'127.0.1.1','34a11484163d7aaa03dad73dd3772c5dbceaa6a6'),(507,1266790423,'127.0.1.1','355ee789f3b1b8883f12447aba5a9da3f9fd3752'),(508,1266790424,'127.0.1.1','90b1af64696982d0f97b227f9846f54c71f0423a'),(509,1266790424,'127.0.1.1','f136414853b44b3152faa1889685ff89e2d47cdd'),(510,1266790424,'127.0.1.1','e87ad00cd49b744d9e243ac3dff8245819c57fb7'),(511,1266790424,'127.0.1.1','ec517ee0933b650e6df605d7c937877c3313ada9'),(512,1266790424,'127.0.1.1','6b1fc7f51fe319e8a1c0ac712379486553a21e56'),(513,1266790425,'127.0.1.1','1beb69d5cd60a71c3bcb6252d2784a81b470f3da'),(514,1266790428,'127.0.1.1','3186738066f551b9a67bd1eb3022d7d6f5d89475'),(515,1266790428,'127.0.1.1','a3c94251568ea909b930ddc56da1dbb7c5761e0e'),(516,1266790428,'127.0.1.1','f7eeae23f7355e4573a7f92c9003047aaae4829c'),(517,1266790429,'127.0.1.1','2b1b5284e2bac02c2da08bfdb547ad06733fe23c'),(518,1266790429,'127.0.1.1','c69fc6d2b06f462bbb41a27c09c1f6f2f1c75797'),(519,1266790429,'127.0.1.1','9fd5f5db8d159eb9fdfe0f4749ca973993574481'),(520,1266790429,'127.0.1.1','9a4b2df9244d7f0f5a3410a31b6723de0994e5b2'),(521,1266790429,'127.0.1.1','701a2f4b1e5d0a9215f2a195e59ff0f58791cd6f'),(522,1266790431,'127.0.1.1','d9c2445f99b491d36e40b288191236d924fc75cb'),(523,1266790431,'127.0.1.1','23ed75b50fb47cfb7657b938231df0faa3be1418'),(524,1266790432,'127.0.1.1','4cbd5f27e4d0cf555dddbe3246bb1e76ddac58b5'),(525,1266790432,'127.0.1.1','c19fbfd54fa60f058e6112c42672c83ad6c65f30'),(526,1266790432,'127.0.1.1','a66b98ce74ea08974b908f9247f46e0b69c1beb0'),(527,1266790432,'127.0.1.1','b49d584ecbf272396c84647b4d219f62e94cc378'),(528,1266790432,'127.0.1.1','1c2dd5df8cb85b3ad7c10b70f998bf3f9cee2e99'),(529,1266790438,'127.0.1.1','3bee7512aa89b4beefeb378cc637a63c97abd484'),(530,1266790438,'127.0.1.1','3224ce0b27fd054b94481bf9d8957e22e5b2cf64'),(531,1266790438,'127.0.1.1','1326e64b67a521522ebfee461918b3a83c025b45'),(532,1266790438,'127.0.1.1','7deac240b61e04159086ed7348e6d703dc718ac2'),(533,1266790439,'127.0.1.1','3624047d77d54a67164eff5e5bfbc53865cffb1c'),(534,1266790439,'127.0.1.1','982a6adbb698cefbc80f4887af890fc83de013fd'),(535,1266790439,'127.0.1.1','f3cd4c3478e9669bbcfbbdf53dbc0824dde52959'),(536,1266790439,'127.0.1.1','2b756e115441d07bb497d4ce65fe253dd0bc7b9b'),(537,1266790441,'127.0.1.1','b7f2c8eb80c249ce9d2e9b5db0494ddd6de408bf'),(538,1266790442,'127.0.1.1','ac06448ce50cf1e4544d1852ace4333644016347'),(539,1266790442,'127.0.1.1','26a9099aa4cce3bba0c2a91112704436b9fca5d0'),(540,1266790442,'127.0.1.1','163aefc8f66e3047af63614806c60c616b83a357'),(541,1266790442,'127.0.1.1','6df85416987dc19405d9d46eef7c3266152e171f'),(542,1266790442,'127.0.1.1','e2a4a749cd99895b46b538a3b5289193b2aa8ab4'),(543,1266790442,'127.0.1.1','0ce5718419094f0b13ed9a83fa176c715114cd68'),(544,1266790443,'127.0.1.1','74b36e90c1cc4926c85ad62a1302e427722ab1b4'),(545,1266790443,'127.0.1.1','6a5d12adb3676078963539acfc902cb8447cd529'),(546,1266790443,'127.0.1.1','e5b109232cd177dec08aefa90676b6e133d2d1a7'),(547,1266790447,'127.0.1.1','590ce7195a5f5378f9f8c5443f3e5f7a9fb70223'),(548,1266790447,'127.0.1.1','20167e2582c57d7be0cf4e80cb8c0f6f919a0be3'),(549,1266790448,'127.0.1.1','bcc64f84b5fa45992705739ea5293121c80328cc'),(550,1266790448,'127.0.1.1','8b5be47a37ea87431ad704974b13f683ca241326'),(551,1266790448,'127.0.1.1','a0f886b568715cc04a4ab3d674c303732667526b'),(552,1266790448,'127.0.1.1','b541c5475451f107cea16de7d41e1be4e5f1b244'),(553,1266790448,'127.0.1.1','de3d05145411eb4e86f8594f92422553fcfc039e'),(554,1266790449,'127.0.1.1','f9fd9b688252983b8b064b42140dadf70daa60b4'),(555,1266790449,'127.0.1.1','397357bc0275f26c5bfe694fb46ac54b54b385f2'),(556,1266790451,'127.0.1.1','ae0b6479b1e80ce167bf8aee3fc62b6d0e4a9e8f'),(557,1266790451,'127.0.1.1','a618e93f0064a5d46be7155cc7ca6a1b4de8392f'),(558,1266790451,'127.0.1.1','b72235f96003a14e1ce0206c1a0707e9ab4c6250'),(559,1266790451,'127.0.1.1','6d49327681f1c14ff6d0ab55d2cb491b1050a91b'),(560,1266790452,'127.0.1.1','55bd0adf4df08a382e7ead29c77d4d01adbce841'),(561,1266790452,'127.0.1.1','13defb1a4086fa7b37c1cd3a8cffe2657066e580'),(562,1266790452,'127.0.1.1','e6b00e6505804fcd28cf992ef0a124b9ba2cfe7e'),(563,1266790452,'127.0.1.1','c946cb7f59dd23e60532f527f2d9befbd4cb2edb'),(564,1266790452,'127.0.1.1','49da51a0d25d3025858c02cf1c6561cfbd2ae99c'),(565,1266790452,'127.0.1.1','97577f6f35544e17ff9d2a78a6aeecca83cf7777'),(566,1266790456,'127.0.1.1','15a83c67acdb04999f8be051cabb6d094bd2c027'),(567,1266790456,'127.0.1.1','19da21ad07bf5d3b47123f5e76b5848914d22187'),(568,1266790456,'127.0.1.1','121d3beeb05488de8f1d35f1c389f851d6083a01'),(569,1266790456,'127.0.1.1','5f1eb989ca90d4d718a0380dab4fd36e0c7b0fa3'),(570,1266790457,'127.0.1.1','64aad2e1494aecee4f0e8b36784bf2986b5d95af'),(571,1266790457,'127.0.1.1','d33d05496db653c8de9f789f88c0c71205427f00'),(572,1266790457,'127.0.1.1','8e6738b2786cb80096035607c1641acab8236763'),(573,1266790457,'127.0.1.1','d406aec8ea71666ba9b56f11ef97e0dcbc9b8a1f'),(574,1266790457,'127.0.1.1','b4a6918fec2f78ab2b99b9193dc0961a2ccd2ccd'),(575,1266790457,'127.0.1.1','6290bb4f98deca85f5467fbdf7f3efd9ba42e425'),(576,1266790458,'127.0.1.1','5e160cb492bd109122813a29529e24776e15955b'),(577,1266790473,'127.0.1.1','17fe3843a9f6811ae5ab759c82ecfb17a18c91c3'),(578,1266790473,'127.0.1.1','935f97f6e3ae9bd1c34a372b4fdd311514822ca0'),(579,1266790475,'127.0.1.1','2860b27475b91040bee4573d643e8fc73eeff7fd'),(580,1266790475,'127.0.1.1','b1ab6e7fdfb8acb82ae186f8634d3d281517d414'),(581,1266790475,'127.0.1.1','8c15f51959efe9c139e2d95fe12341fd3c6245a4'),(582,1266790476,'127.0.1.1','108e10deeae42c53c3b52cbc480b3424895a01ae'),(583,1266790476,'127.0.1.1','832067f50f4d91b4cac6f357794a389ed800185c'),(584,1266790476,'127.0.1.1','669567b92eea0b2746db0a573aa9f3bc12d1575f'),(585,1266790486,'127.0.1.1','ba54ebdb7801d5e3e948eb2b7e640468acee85bb'),(586,1266790486,'127.0.1.1','1783c72d0cbd91edd30a5a088a1d8c3a8ffd9235'),(587,1266790487,'127.0.1.1','1596aabba5dd0ab79ea199d6461248a20d1b05c8'),(588,1266790487,'127.0.1.1','6b8804604ad6a07bcae32b9ae13e989682fe0235'),(589,1266790487,'127.0.1.1','4646f43b0b7b77f0cfa5abb3cd1f2bee62a56b80'),(590,1266790488,'127.0.1.1','b8efc00458c6074a10d31657d5b4ef149207adb2'),(591,1266790488,'127.0.1.1','d8977950fbfd275d5844a53f40235669efe6a694'),(592,1266790488,'127.0.1.1','8fb686955e99e8f936174654f44d0f8047b510bc'),(593,1266790495,'127.0.1.1','207b68a15e828aa39d07598a018ad7c409351ba9'),(594,1266790495,'127.0.1.1','8844690213531148ffe0fcddcc93d920e6f03f4f'),(595,1266790496,'127.0.1.1','7f008753204da981d39ea103efd177c4746762f6'),(596,1266790496,'127.0.1.1','9121fbcdb3cb1cf501f87af85b0f89a765400522'),(597,1266790496,'127.0.1.1','986aa84a9bc5f6060c7d297f8a1d6e67afcc95ae'),(598,1266790497,'127.0.1.1','a35473ef710662e1ce90e7f0d259ea7dd381f1df'),(599,1266790497,'127.0.1.1','bd2f92a5a37af5adea58fdcaf5ab7714cf56139c'),(600,1266790497,'127.0.1.1','19801861e3086f2571e84c103e8159de41224409'),(601,1266790588,'127.0.1.1','dfd87944186857a1db0a1c7493f43a5ca98017a0'),(602,1266790589,'127.0.1.1','49471aab71880b968f64a148565cd844f846e67a'),(603,1266790590,'127.0.1.1','0b9c83b35490cf0f118a0d808a9449c8904e6ca5'),(604,1266790590,'127.0.1.1','0b815efb47ba3e8c8310814b29b0846eab07ea1b'),(605,1266790590,'127.0.1.1','0137ec9db692f0a16f5a7abff2bcbba275c84638'),(606,1266790590,'127.0.1.1','2decf80e99985d0eb74077eb1a84841073c2477f'),(607,1266790590,'127.0.1.1','b170abd443f91345d9517e3a45c6b3baedaa1714'),(608,1266790591,'127.0.1.1','720d8e35d1df249a1749498f4b66d0fb80010aed'),(609,1266790598,'127.0.1.1','39436ffb3809b02adbabbe71a4d76cb5deb2b3ce'),(610,1266790601,'127.0.1.1','d453fb10cb0db201fed6338c6de26fdd3d5f85d1'),(611,1266790601,'127.0.1.1','adcdd94395d4f27dd0f1588394a160f01bd8db57'),(612,1266790601,'127.0.1.1','618470113d014cfb127a60ed3eb32cc1575717a5'),(613,1266790601,'127.0.1.1','9031efa39214d9f62567862386fa71d945efe05d'),(614,1266790602,'127.0.1.1','06bbc692403674ab11f577609c69f8ab9c47f81e'),(615,1266790602,'127.0.1.1','47153621ee7b141e1f94e80445a79f606b9a6ab0'),(616,1266790602,'127.0.1.1','14d60d4ec693fe85b2b942c6897268e879feca2a'),(617,1266790606,'127.0.1.1','7663619cdbcce8e6f5d02d968df3a1bd17e1f237'),(618,1266790607,'127.0.1.1','55c9eebd4984260d0dab7c2842641a6df850ddf2'),(619,1266790607,'127.0.1.1','e39ef4d1204ae93f21ddb523537f58b439dedcb9'),(620,1266790607,'127.0.1.1','649edbbcd470b4fc6285a332397f501aef3455e5'),(621,1266790607,'127.0.1.1','e5cac63b52c97e604e9d0126cf7eb4e169901000'),(622,1266790607,'127.0.1.1','978b2b046318e916492e846501d3a5c17e0d15b9'),(623,1266790607,'127.0.1.1','11d26745e364185e13d3d472c44fd82825bd81a2'),(624,1266790607,'127.0.1.1','8b86aa6f1f3308672c166d8e70c12d8c98c8c708'),(625,1266791124,'127.0.1.1','5accdc887a0b5e2c15650305dfac34472e3318e0'),(626,1266791124,'127.0.1.1','f64f60343501775d1e73999c1493d101ed433eb0'),(627,1266791124,'127.0.1.1','174628362839d163c28607d8bc1968ac62e257a4'),(628,1266791125,'127.0.1.1','1ffde77a85d05df5fff87978551e5b454a81a2a3'),(629,1266791125,'127.0.1.1','d2ca5284f71b2b05bc1e1e0f65168e2508cb3a6f'),(630,1266791125,'127.0.1.1','8d0174630dae0141df7aa04336718d502f613259'),(631,1266791125,'127.0.1.1','9ae97ed7c7388f7f03183e160ed77f18d7586ca6'),(632,1266791125,'127.0.1.1','41f704051e6e50ee613036ca0afb3683026e7d20'),(633,1266791125,'127.0.1.1','e9791afd58f804a44f1e2dc1d9616919f9e4347e'),(634,1266791126,'127.0.1.1','85245b2a528768c0755bb05dadd9e80ab72eed0b'),(635,1266791133,'127.0.1.1','3291c19e326481e85b0e613b9b63cc5bcdcdbbb1'),(636,1266791133,'127.0.1.1','9dca8611bc93c1153adc73dec0720211bd174fd8'),(637,1266791133,'127.0.1.1','5bca3217127f489e3478880ad6d0f3868ded8ede'),(638,1266791134,'127.0.1.1','cf283e129906c47e003433d38191b47aaff148a0'),(639,1266791134,'127.0.1.1','b2dfb114a990439203992e58542db066e9b11f6c'),(640,1266791134,'127.0.1.1','75cacc749cee706445823ad8f06b0dd4ed708edd'),(641,1266791134,'127.0.1.1','1ab61574b73699510f81e1385633c19cda8d68cf'),(642,1266791134,'127.0.1.1','b05697753ae85e1144396f352cf8ca48016921c9'),(643,1266791150,'127.0.1.1','e9f14c021a4062cce292b1974851fb865a142be5'),(644,1266791158,'127.0.1.1','93f4b974dfe4c8480103056769af1352eb28e531'),(645,1266791159,'127.0.1.1','4b8dadaf474973ef09bdf6ff96bb2f0cc8a798a7'),(646,1266791159,'127.0.1.1','f89793e45d6d865ce573a5256d7f326e80f51891'),(647,1266791159,'127.0.1.1','f0d391a5a6e7944f7f54cb45f0a56374793800ae'),(648,1266791159,'127.0.1.1','361751d9153a669be6486d34ee57f4915d3c26cc'),(649,1266791159,'127.0.1.1','494dbe15af2523d04db0d0295326f8e6c86535cd'),(650,1266791159,'127.0.1.1','51e2628a85ecfc95f01b1cf4ad8f9b4cb077e2d5'),(651,1266791163,'127.0.1.1','820671089354d5d0bc6b0264e17c5991b0ab0f1d'),(652,1266791163,'127.0.1.1','4eb2233ce3f77fd1ecb7476d5c95e9d20464ab3a'),(653,1266791163,'127.0.1.1','82417178cbec264b30ea1e130ae4ff51aeb9f803'),(654,1266791164,'127.0.1.1','2a1c5ab2cb994fab6b4619ad08c17a7ba73c7d2f'),(655,1266791164,'127.0.1.1','22cc543969fc3446d0b3ee924fa5b1a61c849616'),(656,1266791164,'127.0.1.1','3d6f44cb9d1a6af7ac28098e81aca1c494c2e82a'),(657,1266791164,'127.0.1.1','83193b73ebe11125724ec821b2b1795124e204d0'),(658,1266791164,'127.0.1.1','0f6d68fa192c9d63d00de641222f86875fbbf85b'),(659,1266791307,'127.0.1.1','2a10e49d8c058321cc2aca2115fd696dedaa6a23'),(660,1266791307,'127.0.1.1','df0e72a7415e0b04636f98d5e8d9a6c27791d8f1'),(661,1266791308,'127.0.1.1','8b124e92b092c209dd78e5d2b6220d732a72ff4c'),(662,1266791308,'127.0.1.1','04c00b855db5459600389d4f40d2ed425e170df1'),(663,1266791308,'127.0.1.1','95fb11a2bcfde8b27130e6d271d76763e76f71e1'),(664,1266791308,'127.0.1.1','2195ae53d876d315000ffd219cfe48495a7495df'),(665,1266791308,'127.0.1.1','49a79b2e32f43a0ca9654a52e8148d68c39a40be'),(666,1266791308,'127.0.1.1','071873082fb2a1405ad42596e65bfb2e66d4e3e1'),(667,1266791357,'127.0.1.1','628da887259c0d120c6452b474b59d0c43c7a849'),(668,1266791359,'127.0.1.1','5e1fe009ae387b9870152ed3bce66cbc1a82b5a6'),(669,1266791360,'127.0.1.1','3bc0c3f129804e8c3c99b747f5c5d6aa2151cba4'),(670,1266791360,'127.0.1.1','4732b944b1dab52d723cfab4c585f47b21ed7ae1'),(671,1266791360,'127.0.1.1','da54b27055b0462990fbd00662f383b88365db25'),(672,1266791360,'127.0.1.1','5345087291074c43633c4ddbbf111c2649708d85'),(673,1266791360,'127.0.1.1','054277a57bce0019e630ad21b756bf8928fe7f93'),(674,1266791360,'127.0.1.1','77267c840303528814f6befaf7f4b21430d70d22'),(675,1266791363,'127.0.1.1','8dde271d54dd94be177bdc8e123d418950b21d19'),(676,1266791363,'127.0.1.1','b2e2930ff34c58e84e9413446611808a5252b45f'),(677,1266791363,'127.0.1.1','ce8e62afd29e1da09daabfa95b32f0d2dda77697'),(678,1266791363,'127.0.1.1','fa172ea3734fae0106f2576c268421c7d985e792'),(679,1266791364,'127.0.1.1','712ca92e404cbce081c08657a4f7083997ffa6be'),(680,1266791364,'127.0.1.1','1da605076c84f21ca0008a3e4dffb705a6db1ef4'),(681,1266791364,'127.0.1.1','6f1e9cfcb9affb16322a7d4a2f06c2b495831816'),(682,1266791364,'127.0.1.1','2ff8fd29ed34d809f8c3c78a99353bb4473188f7'),(683,1266791366,'127.0.1.1','243b907336baf3559b5fcc8a169ada2b8c7e2db6'),(684,1266791366,'127.0.1.1','1481e657cb2f9e138bd252e726017da87a3376ef'),(685,1266791366,'127.0.1.1','1808a46184cb0b32071bec11c682b64699d8971c'),(686,1266791367,'127.0.1.1','39774d7c4c20b1e55a2a0e70286a5a06badc2821'),(687,1266791367,'127.0.1.1','a7eec2a4bfbf5a93455242d81cd2717e8300c5ec'),(688,1266791367,'127.0.1.1','8bcaaf7237b79f1d6aa0ffd845c9472bb75e96d8'),(689,1266791367,'127.0.1.1','e2483128e2a538df2f8209d760a56f7be6d918a9'),(690,1266791367,'127.0.1.1','0536e6676ae45767791647832455e1c12c07e95b'),(691,1266791367,'127.0.1.1','3048bd478799c131251ab57f946a6d3bb03053dc'),(692,1266791367,'127.0.1.1','337a9975c464778cec29e77f4ed6e55976fb6f69'),(693,1266791401,'127.0.1.1','49b7e912db38f1fb301bf3c1e606c57bcdf21b1e'),(694,1266791402,'127.0.1.1','b8084bf4893b6b3ecf32638f033d074253ec18b2'),(695,1266791402,'127.0.1.1','eb068e893ee152dcc4881457d35e67bbde3c9c39'),(696,1266791402,'127.0.1.1','8cc3382ccc4633d98ea194e6d451a2a8605e4207'),(697,1266791402,'127.0.1.1','7065f7d7f457aba4946b22d425a7c102e415fde1'),(698,1266791402,'127.0.1.1','2390826030e34dcdb0d4a3e34b8fa47eece659ce'),(699,1266791402,'127.0.1.1','35525be5c3b848d7f9388dd4db056446cf1a2339'),(700,1266791403,'127.0.1.1','994723dc3822a5b7a49aa2a62364d85e3a10e54b'),(701,1266791404,'127.0.1.1','591120a313687a8590442ca55f84650b9a27bcbb'),(702,1266791405,'127.0.1.1','85b29949cb81f7691d49287e13326316fa95089d'),(703,1266791405,'127.0.1.1','51e92d64d5abc752e5bba19b311f7cfffd764f1c'),(704,1266791405,'127.0.1.1','34b1d9c38df59c12ede07cf05b66136d5d33e78e'),(705,1266791405,'127.0.1.1','1466bf05a8ba0050f744c85acf6928aa634d21fa'),(706,1266791405,'127.0.1.1','c84126cb50a028e6f77f20c1773db71b99275934'),(707,1266791406,'127.0.1.1','fb6f912256ce6f76edaec931fba3b19937d365a1'),(708,1266791420,'127.0.1.1','af631a845ba03311bd3a4b5e43588e708d128119'),(709,1266791420,'127.0.1.1','146961ab2d69bce5e7048af736c4386086a0ffad'),(710,1266791420,'127.0.1.1','7ba707742ebfc9fd48896871ce26d199d58e49aa'),(711,1266791420,'127.0.1.1','08adde246c3e016bff46750cbbb1d36e5c4cce52'),(712,1266791421,'127.0.1.1','77b6bdec6ee0d39c7fe7b2d6ffa4dee16375ff87'),(713,1266791421,'127.0.1.1','4d69dc5b22a6d8d214030c7f86104ce0f814505b'),(714,1266791421,'127.0.1.1','70565e68ff243c9132736433a6401cac1fbaaf93'),(715,1266791421,'127.0.1.1','e3216685d909eb7ad8975f0c96bfc41359eb3e46'),(716,1266791421,'127.0.1.1','fe915adc5ecbf555dd4193f6325e8b3519b122d4'),(717,1266791421,'127.0.1.1','fd792ee9e116d9b8a7028852ed18d6f5b9b981cd'),(718,1266792104,'127.0.1.1','858e61042e0c48950390bfed5e619f816d0d2f92'),(719,1266792104,'127.0.1.1','1ece80cbd85319f2bef21c8becc9f90a174293da'),(720,1266792105,'127.0.1.1','b5d89c9f2ec5ee062017e6b829bacfb98e909630'),(721,1266792105,'127.0.1.1','5b77e55ddc6c77812900ef7f25f3a11657f8d5cf'),(722,1266792105,'127.0.1.1','a5052a7e5f705da42e906d877b61a13366738d64'),(723,1266792105,'127.0.1.1','0ce30c421a0789c8ba9815c585e1fb0ca0e4d37b'),(724,1266792105,'127.0.1.1','0a7cbead1e615b2fb00d6bf92e0d41e278df4991'),(725,1266792105,'127.0.1.1','2073d4c30664638471c4166dd34c12bb481d14ef'),(726,1266792108,'127.0.1.1','59233a4c511f06a4857c74499051200354f91ddb'),(727,1266792108,'127.0.1.1','02115aa2cb8a04d4c6d35cd8d817660c1bf41abb'),(728,1266792108,'127.0.1.1','014a752bb8d42d49a62712e0e9aa466d7d9a912d'),(729,1266792108,'127.0.1.1','8554dbfdcd1f953a6c610d54f635101eacc41ea5'),(730,1266792108,'127.0.1.1','174c4819430c7666fd1cbb4f116c9c4601440371'),(731,1266792108,'127.0.1.1','c96d4d9a9307785dd6e01f1d1797129445b99fde'),(732,1266792109,'127.0.1.1','a7198d1ebc339a1beb66298f602eca43c23d3e79'),(733,1266792109,'127.0.1.1','b002d84f2a46020296a0fb7147bc4c7f5a433b69'),(734,1266792109,'127.0.1.1','7a3c5617f6d09333925b6ce624cc489d69e04c9b'),(735,1266792109,'127.0.1.1','20a113cf04a81b5a776624709afc8f62acbf9592'),(736,1266792131,'127.0.1.1','7e1805ab495c263c9a982f79532cac09449859ef'),(737,1266792131,'127.0.1.1','3be9fa934ad48220a69335fda14c338cfa1326cc'),(738,1266792131,'127.0.1.1','910efcf730b6832dc2e16b0c501dc725ac1e9e04'),(739,1266792131,'127.0.1.1','adcd472c26c545aad4b29593cdf9ef544f3ffbca'),(740,1266792131,'127.0.1.1','c01e38c06cb22edccd2a60edf63055e890a95714'),(741,1266792131,'127.0.1.1','c53f91aded44e6d4f0f3a54eae8c46d663e62d89'),(742,1266792131,'127.0.1.1','1873cca917f0c5f1f444d631422d397556fa4cf4'),(743,1266792132,'127.0.1.1','e5143bf7a487ea09f8563deffb5e0fba39938b68'),(744,1266792134,'127.0.1.1','6bfaa226abdc5fc67f99a9404e1834e2299f9a5a'),(745,1266792135,'127.0.1.1','35c102e6f46e348bf7623025ac5dddf72037f046'),(746,1266792135,'127.0.1.1','b00645d27870fbebf0b2b29d0b32e44825669aa0'),(747,1266792135,'127.0.1.1','74f2d2f05d4d72979f1afbd0f2af40760975e0af'),(748,1266792135,'127.0.1.1','008460d8aae6e05bcea0bad9fcd50f9882f521ed'),(749,1266792135,'127.0.1.1','7c21e6646a126b680efb45d7846cf30e2dd177aa'),(750,1266792135,'127.0.1.1','ff737e92aa4f81a368ee5a3eff71f32232c9986b'),(751,1266792136,'127.0.1.1','81c6e3aeba411c36590748203ee7c91429c66535'),(752,1266792136,'127.0.1.1','0830ea5536ff792596ade073121e24c0b73c0113'),(753,1266792136,'127.0.1.1','515d9b1990c4bc9c27a274a2d8992f4105c65f7a'),(754,1266792150,'127.0.1.1','b20a33f0c1015505623482414074255985a29c51'),(755,1266792150,'127.0.1.1','9d7cd535d7b2a0f71450ce2869f3facdc18e139c'),(756,1266792150,'127.0.1.1','6a41f7eb8df0fd7b605a5dabed7ff9d2c8d7db22'),(757,1266792150,'127.0.1.1','1b13332b64f2b4f85e0039304bac413e6d389e01'),(758,1266792150,'127.0.1.1','4393e22d21f6b658df1eec0a17c83d3ff84ff3ef'),(759,1266792150,'127.0.1.1','d993a4fd384af525dd0487da7c7797f9fd7ea872'),(760,1266792151,'127.0.1.1','b83c602f798fab0aae43c1b779cf355dcc77321c'),(761,1266792151,'127.0.1.1','9bfe16c2f85596caa9d75a08bec951c9415ce8f8'),(762,1266792153,'127.0.1.1','713539d70f56b08bbbfb0dd65bb2dc946658e20a'),(763,1266792153,'127.0.1.1','789d911fecbd7b874bb28a501ae67a1f50ba3905'),(764,1266792154,'127.0.1.1','fcf5ce7f3db087a575858fa3f434f1d019cff082'),(765,1266792154,'127.0.1.1','6fd8c96237579f481afb303e32bb4cae29a6296c'),(766,1266792154,'127.0.1.1','41475eab05e1b7c6eaa85b126fef14a71b333e32'),(767,1266792154,'127.0.1.1','7f1707a9708f43f7b39e3553639b0be64858abff'),(768,1266792154,'127.0.1.1','466446ac08f862e272757e513a4a6275836a34e4'),(769,1266792154,'127.0.1.1','7021f9a630482ad2254465f273a47c67933d3910'),(770,1266792154,'127.0.1.1','b60ceaae3fdeabb20d2e01e980f2be02875b2c0d'),(771,1266792155,'127.0.1.1','8e02ee5e0764fb08cb22bf4e94d7a3fc9bab6296'),(772,1266792164,'127.0.1.1','dbe1a82ddb1d666e4346ae5fe8345f849bf8b1ff'),(773,1266792165,'127.0.1.1','a907270bb330ca931664a3c6cc50213e1cf1d311'),(774,1266792165,'127.0.1.1','6aa1a8c75ad9292c08eeeba3025dca9f3017cd79'),(775,1266792165,'127.0.1.1','97bbc4d04dc853b84d5c44e7bf9a867bf5f53ba0'),(776,1266792165,'127.0.1.1','50ba344b12af859b5be370d47edf25a1ff390eea'),(777,1266792165,'127.0.1.1','ce888678bd2a19d05f8cd8c2ef588cdad793d133'),(778,1266792165,'127.0.1.1','8e426e99c80923309da4a252295ed9e6f5862eec'),(779,1266792165,'127.0.1.1','cb07ce4516256a4ff1586aceaf139dfeb87025df'),(780,1266792166,'127.0.1.1','bf5fe0820760d4ae236cd8d092457dc65861e2a3'),(781,1266792166,'127.0.1.1','d419f2ad5ca5fd143d47f45c2aca8b94fc29b6c7'),(782,1266792166,'127.0.1.1','469c9af9e11af37930630f162dae7c45f81f32ee'),(783,1266792571,'127.0.1.1','6fdb638eb5fb688ccdbd2f3d8a5ef557b8731404'),(784,1266792571,'127.0.1.1','9bf52202a5f356e41fb6c7060ad0764613629995'),(785,1266792571,'127.0.1.1','6206b13864a51ae92ec49be059e41e6b3d61b64f'),(786,1266792572,'127.0.1.1','3cfc23d547b764600077038fd2ab5ea7c1667419'),(787,1266792572,'127.0.1.1','a977721c446ce6f271579120adc31e1c91ec7fdc'),(788,1266792572,'127.0.1.1','2a71c9e0aacd5180e4056a6f0d66ff12ac77e8ad'),(789,1266792572,'127.0.1.1','ce57b15a5780f8465217b93ffe3f539d367910bb'),(790,1266792572,'127.0.1.1','c42dd10a9552a5693e37d3fdd27342bdb8bd3eaf'),(791,1266792572,'127.0.1.1','3a63606dc8ed81ca8125c4da4b2a1b12975ae822'),(792,1266792573,'127.0.1.1','a6e949669c91649a064d9f32143ca95667dc0bd4'),(793,1266792573,'127.0.1.1','7c701570aed8d0bc8a11f94ec6edb8ca5687287b'),(794,1266792600,'127.0.1.1','8a9bfd772cc049c146a09e41f9a6429cc92b418c'),(795,1266792600,'127.0.1.1','d6f431f1b8826ca929490282d437171bfd02a37b'),(796,1266792600,'127.0.1.1','b09b108d44a8c70709724a20faf3faa61a6f18f5'),(797,1266792600,'127.0.1.1','aaac83ba9c65ef4f2ea42d68bb0397e791d92e98'),(798,1266792601,'127.0.1.1','ce9d97715a240beed1249d8a631b3e451f3ff9f9'),(799,1266792601,'127.0.1.1','e001a9cf0cda51660f479eab1ecf5fbdf69deb7f'),(800,1266792601,'127.0.1.1','06f8e7d80ddb900c1b666e0ba6e2794b5ef72725'),(801,1266792601,'127.0.1.1','18901172f986cd56986c24265d7d46c094e308fb'),(802,1266792602,'127.0.1.1','ce7f669e6ab59452d6261694d7519831bcf96bca'),(803,1266792602,'127.0.1.1','1705977b0f798eea411402a7c23713d994bc2523'),(804,1266792602,'127.0.1.1','bf69525a46a099b8c3a0d268a5dea1af1dbd74fc'),(805,1266792831,'127.0.1.1','5efd179de23dd6e17e3256fd8fc5597005b9d012'),(806,1266792831,'127.0.1.1','698d2a661f85d9a11d8889e2d697be6906bb4e63'),(807,1266792831,'127.0.1.1','8933e20210b37230cc28649dd464d4c596415e41'),(808,1266792832,'127.0.1.1','b94cb800dd91c7e907258b42dd35ae43be48427c'),(809,1266792832,'127.0.1.1','47645e50b32c3277417cd319a38fd46b5f87d376'),(810,1266792832,'127.0.1.1','2af694ac37def61e42fa7029b822521d339c8b03'),(811,1266792832,'127.0.1.1','dc22aa3beaeb15f532a22dc165865dbab746ca8a'),(812,1266792832,'127.0.1.1','21eeaca00c9556042ad55c8914fec5eade5c60bb'),(813,1266792835,'127.0.1.1','3912ec4d98969169a3677ddadc76dd7bce9a3973'),(814,1266792835,'127.0.1.1','0d65489bde6f4f96867eefaa0cb6b47e9df9abbf'),(815,1266792836,'127.0.1.1','095ae320fad072d59204570e68faad049d5cf7db'),(816,1266792836,'127.0.1.1','05785a64175efe40d99cf3f58b31ae0fe354a3c2'),(817,1266792836,'127.0.1.1','231720ec2c32e10b9c0ccf70e7460c88b13e04be'),(818,1266792836,'127.0.1.1','4b81e200cd437ec2baffa7961b4476bfd67c0ecb'),(819,1266792836,'127.0.1.1','91099161bc64c14c83951d0dd316aceabcb4b7af'),(820,1266792836,'127.0.1.1','1994db3a6b82efaefd2c8a781ba11d6800bfdc85'),(821,1266792837,'127.0.1.1','5dc2aef6b1280b064b14f7ae6385776b35181b28'),(822,1266792837,'127.0.1.1','e4935dab22a5f9b212a6a3c7e03cd54398174ab0'),(823,1266792873,'127.0.1.1','b19295c0398cef5cb564e3206dd6edfc42ce09aa'),(824,1266792873,'127.0.1.1','14cd773cdd92056da5ae6c5f8fe25fb1fddbc414'),(825,1266792874,'127.0.1.1','08d0a320a0133d6d467ba629bc42ec4cc89ae424'),(826,1266792874,'127.0.1.1','202009bec50363000fe69d7fb61ff3c57df63467'),(827,1266792874,'127.0.1.1','cad551ed739bd86b235fe1a7fbf20d3e65de29d6'),(828,1266792874,'127.0.1.1','5df543e5f32775ac07faf6ff0e1c571b2a28239c'),(829,1266792874,'127.0.1.1','aafc725d7072f3b5c79c62d69d236a1f6cadf21b'),(830,1266792874,'127.0.1.1','cce2f8d8ea21ecf6d383f92ef74fce41cf3e5f3c'),(831,1266792875,'127.0.1.1','dccb46b4ba9a8fb8a5b2fd101194a800a67008d5'),(832,1266792875,'127.0.1.1','16385418eee34a46559b701b5fd1beb1bc1446b2'),(833,1266792875,'127.0.1.1','9a40a8fe52992887fecea414eeb5961aec58019e'),(834,1266792877,'127.0.1.1','fcfbbfad43f283d478e66194c79e59bc3f269fe1'),(835,1266792877,'127.0.1.1','36b7125e29ffa356f59b32d7c8cba932dd0268d1'),(836,1266792945,'127.0.1.1','90052e03ba74ca0a6ff62fc41ae2d8264d9ade85'),(837,1266792945,'127.0.1.1','1c955a4c490ecbf20304495a4aaf159e12fe509c'),(838,1266792946,'127.0.1.1','5ba901ead64f9347a1ddd49a645011938d3ef6f3'),(839,1266792946,'127.0.1.1','0685d4cddd952a9439eec276a30415ee7b3c3bc3'),(840,1266792946,'127.0.1.1','5351128fb67ec2e54c0678fd2e0a404dbb5b7746'),(841,1266792946,'127.0.1.1','58d56e2f0438ef5e7653fe12d061af7abe646ff2'),(842,1266792946,'127.0.1.1','bedbec282570d56a5139e060f4ffc64e575cda06'),(843,1266792946,'127.0.1.1','2b6396509abd85b824826dd9bc4c170b92361b28'),(844,1266792967,'127.0.1.1','718a3abae4c64f01493b9527318042a5c36c11e8'),(845,1266792968,'127.0.1.1','b33aea01751807731486df84492f77be191ebbbe'),(846,1266792968,'127.0.1.1','98517d26393554741990c2f445d467ddbd165430'),(847,1266792968,'127.0.1.1','82f580b0de7880d675e111cb0c66d4e0dd2ec03a'),(848,1266792968,'127.0.1.1','a5566880b25686866b6dd76dccf9415761eaa272'),(849,1266792968,'127.0.1.1','4fea531e9bf56f1a2a6badd141f814ae6eab6e48'),(850,1266792968,'127.0.1.1','eb3aa1e38e51002d2ab33b71ed63bdad026ae0db'),(851,1266792969,'127.0.1.1','c1d659d80cce94f091e9e64fdbbeaa085c1a1d42'),(852,1266792969,'127.0.1.1','076e8ac6f515e50ba1f200fd4d526fa226389485'),(853,1266792969,'127.0.1.1','e63bc0f38a369664fbd33f42e46482e23af21740'),(854,1266792969,'127.0.1.1','a97dcb1da2d3a1d33d7d8d32f4fe29514d5d171b'),(855,1266792970,'127.0.1.1','34a8f63d2cd81a6a7edaf11e6a2da0efaf7dbce2'),(856,1266792970,'127.0.1.1','41f161b4b8364b20a09ecd7ae08a8e92764ca2ee'),(857,1266792993,'127.0.1.1','22b73baf5e4373344b4126524674ca6a5ad7fdaa'),(858,1266792993,'127.0.1.1','1b77df9e31ce8f91db8bb4bf270648a1a911c14b'),(859,1266792993,'127.0.1.1','1cd17af2d245472fa4eed811ed2b67378b0198dc'),(860,1266792993,'127.0.1.1','0cb55eb27d8bf6b4229c9f9f849815fab94eb5fb'),(861,1266792994,'127.0.1.1','fd4a21936ce8db265c7a99747c350b5649307427'),(862,1266792994,'127.0.1.1','a405fe818364da3463361ced52075bdba578131e'),(863,1266792994,'127.0.1.1','560906fc5d2adc5bc0323e2f78edd621ac1441b8'),(864,1266792994,'127.0.1.1','2c143f6adcd99c851896a714285129cd024699fb'),(865,1266793017,'127.0.1.1','515674ac92b97a5b58a7a1b87ce7cc1263ba50f3'),(866,1266793017,'127.0.1.1','b35b4c567e49fef226a045dac6f423e0ff1869eb'),(867,1266793017,'127.0.1.1','fefc9de7ea508bb86a31e91483509406d658cf49'),(868,1266793017,'127.0.1.1','c08262b7e049b6c577ff2e7e12529fb8744d5d07'),(869,1266793018,'127.0.1.1','ecf2b51c310d54f17f6f02307ab4346c3ae83d95'),(870,1266793018,'127.0.1.1','58fb9a7aa30ed5b8e3a1606f257632e6da8f2e29'),(871,1266793018,'127.0.1.1','54eb688f2ff4268c4367ea26c66f267c2df430f3'),(872,1266793018,'127.0.1.1','2a66a6b3682ff7db51ce518ec44d6946d1fd61f7'),(873,1266793018,'127.0.1.1','cb94bcb51a8fc4aca9d93e26edc9f71f91ea4550'),(874,1266793018,'127.0.1.1','e72d99e999bf1a587242bdecafcf97fbc2ac96e8'),(875,1266793019,'127.0.1.1','7cc150315ac3fc8e3699c4b62a3305c2c5fb60c0'),(876,1266793019,'127.0.1.1','a406f9fc02df5e33ff9592ca21ae885027e19300'),(877,1266793019,'127.0.1.1','64ee606e9e45fcc380b032aef50d7fb3a0fa4dbc'),(878,1266793019,'127.0.1.1','c54ec0964d062e9a127f9ef6508f7c159f8bcd09'),(879,1266793057,'127.0.1.1','48f9739022c560383317ed554345b894735e3e67'),(880,1266793057,'127.0.1.1','da621f5a0b057fe9f652f1224c70ae5a32f6afb4'),(881,1266793058,'127.0.1.1','9fe8628d3e3c47b87a8778ef44f1eaa1d04e8e01'),(882,1266793058,'127.0.1.1','76ff3a78b6745f63ad308822dd5984c4a09402cb'),(883,1266793058,'127.0.1.1','7a197e783c2dc77eaed6ea9455b9328df0ac1166'),(884,1266793058,'127.0.1.1','bb5d8f01bbf9c010c8fdc502eaa7c2aa9eb3b929'),(885,1266793058,'127.0.1.1','e87f37b080c271f96a167ff72fd94b8d24b8a589'),(886,1266793058,'127.0.1.1','f45509c2c26089eaa9ede230fd157b148817fdba'),(887,1266793066,'127.0.1.1','1b2deea3da1f3c02d180ce97836c4d3a247862b2'),(888,1266793066,'127.0.1.1','2c820a933dc19177594552008ab55792fa540b0d'),(889,1266793066,'127.0.1.1','8deb44be98482a786c72a7182073e2ece8e557a6'),(890,1266793066,'127.0.1.1','a779638d26d9eb65857bba1221b38ae7424d662e'),(891,1266793066,'127.0.1.1','748e84a9481b1d41fb3f8cd6b0ed911c552d3a2d'),(892,1266793067,'127.0.1.1','6805dbf446d19dcbfa3d39385fd397d6f5af0b09'),(893,1266793067,'127.0.1.1','2b234e4840d460421048dcfbd2bbf87dd3efef48'),(894,1266793067,'127.0.1.1','cc8c7d0649486818b748d661879e74108b335711'),(895,1266793067,'127.0.1.1','a01685ffcb05d86593f02450fc6a103e30ea1d7a'),(896,1266793067,'127.0.1.1','7a1670096eb840fe311087ca8b2bb873f086ac7e'),(897,1266793068,'127.0.1.1','0318260744d4105d46e05518c7b07c5ee2866866'),(898,1266793068,'127.0.1.1','4804ad70951f36bdf783746f6d2c6204c6c77b1d'),(899,1266793068,'127.0.1.1','ff04842442dfb7fc0c87e04a501bfbf35671245b'),(900,1266793068,'127.0.1.1','5a9377e6e3b217afdbb2a4c5d4e2846e3713bfea'),(901,1266793096,'127.0.1.1','2143ce97badae30c0035b89fed21ccf65df63fdb'),(902,1266793096,'127.0.1.1','b5a4237f2866826531feba6f8c97d577b14b072a'),(903,1266793097,'127.0.1.1','13c15d0bfb90bdbf012dd9c2729009a816661232'),(904,1266793097,'127.0.1.1','b9714f7fcafff8746585606625ab1853a184470b'),(905,1266793097,'127.0.1.1','b4b2be64826567d0071e70a092dbce62a5020938'),(906,1266793097,'127.0.1.1','2af95f7ca42732a86560a29d28d85031c4ce510d'),(907,1266793097,'127.0.1.1','2f53949c720d550792a90d5f65ccb986ed31db5b'),(908,1266793097,'127.0.1.1','ea1cda50f43a3cc25d724334ea160059237ef1f4'),(909,1266793104,'127.0.1.1','e07c25f3a617c9ef772245d23b1a65496afa1f5d'),(910,1266793104,'127.0.1.1','2cac47ff798a3e3e6392dc319428b4ebf04dd6f0'),(911,1266793104,'127.0.1.1','1bba216888f981d3a8b3d31308392323b88fd3cc'),(912,1266793104,'127.0.1.1','67a466f4bcbe5b212080bbab2614aef8f462c096'),(913,1266793104,'127.0.1.1','f4e4fcd653a4479594b0ba5a58600227f82581e3'),(914,1266793104,'127.0.1.1','5623abfc82c78c87b6259f6777abed6f21c25cd7'),(915,1266793105,'127.0.1.1','94dc4e35dd225f57e8df838f21b5fa7b82b5ae8c'),(916,1266793105,'127.0.1.1','bf34d1fe8e81c548e7328c593616fc52a3171de9'),(917,1266793105,'127.0.1.1','2003c6d499260bb9238538832467ba056679f567'),(918,1266793105,'127.0.1.1','abd74ee481491dbf8078acf48a195642fefe3f00'),(919,1266793105,'127.0.1.1','6a7097fb3eecde4115b2cbc97368a792d19000ca'),(920,1266793106,'127.0.1.1','e240495adaa3252ab3c6a2be0060efc13b62205c'),(921,1266793106,'127.0.1.1','18d3bb9228d3b2fe422c365fb50f13186d47d6e9'),(922,1266793129,'127.0.1.1','6bcd34608b3c4ecd48e8d1d29bb2b8fe0996b1f3'),(923,1266793129,'127.0.1.1','c8affc817e9e9a4c5c4f3a91ced911c1081d3d9d'),(924,1266793129,'127.0.1.1','bfacaad4ac4b331dd44b21209fb6816beb87c9e5'),(925,1266793129,'127.0.1.1','5311a5365dcb16a758fc5f579a785fae5902616b'),(926,1266793130,'127.0.1.1','20b16079930bfe5fb33901979a97de1566902971'),(927,1266793130,'127.0.1.1','952446043da15f4af1d4e2a77b585de8d0986f44'),(928,1266793130,'127.0.1.1','fa270186785bdc4870cafc544d1e9c76604ab2b3'),(929,1266793130,'127.0.1.1','6c76644fc7d4be36a600db655004b58c3bef6ba9'),(930,1266793140,'127.0.1.1','61ffdfe7ed959c78246ba9d8dcb836b37997b7a5'),(931,1266793141,'127.0.1.1','dfb46c22dc1c6431ee9685944c4941ee1ce5bed5'),(932,1266793141,'127.0.1.1','76adf5981867389567f84238e08929068a1910e4'),(933,1266793141,'127.0.1.1','efaaf6c42825d1cbcb7a09a34f9af8c4a3df003c'),(934,1266793141,'127.0.1.1','45d4e5598a1993eb4c8b814cbb8e33cc49952183'),(935,1266793141,'127.0.1.1','17ab1bc115ac60688580d3625c09501d090797e9'),(936,1266793141,'127.0.1.1','6c14aeba5d7f8f3a14dbb075bbaa2e1e8a04f33c'),(937,1266793142,'127.0.1.1','70cecc26ab3400347946b94da41af9992fcee526'),(938,1266793142,'127.0.1.1','0397e1998b20fa596fa216c4bcdc8b712e459e74'),(939,1266793142,'127.0.1.1','61852f3f410d459d497e5eeec1d7338b41700836'),(940,1266793142,'127.0.1.1','aa152dcc8dbc3d159b17656941ac6b0c80cd3535'),(941,1266793142,'127.0.1.1','35ffbdc0c8e412e776801e94ecbc58d93722c24d'),(942,1266793143,'127.0.1.1','65034a54c915f37e7f3f92d38c24f86b3f386d6d'),(943,1266793143,'127.0.1.1','3929a17bd9d7b212b7546698258f4701ff6e90be'),(944,1266793161,'127.0.1.1','3744f16e0eaed17762484c7335976f374448ddc0'),(945,1266793161,'127.0.1.1','1d199abce76a2030120cb4479c171e590fe8f27a'),(946,1266793161,'127.0.1.1','2d866c89f6dc264fb806eaeddf89ac7f1208d78e'),(947,1266793162,'127.0.1.1','f30d505c95a25781dd59d05a2bc35d5f3d49af3d'),(948,1266793162,'127.0.1.1','7583ca39f4e1004058fef75549d8d322b1b20f6b'),(949,1266793162,'127.0.1.1','22de7975b42251be4f7d21952ecade941843f17c'),(950,1266793162,'127.0.1.1','f6093d1d167d1413a3f7728629b345f6cd3adbee'),(951,1266793162,'127.0.1.1','cdb1a4af5f6d29426d93336848fe7001ceedc9fb'),(952,1266793167,'127.0.1.1','31d0c88b654115fd312a607dcd0300e922fefb03'),(953,1266793167,'127.0.1.1','921cb95e240a60e4cc841f53697715d99cf1fdba'),(954,1266793167,'127.0.1.1','e817da40b8134a2b0173823566a435fdf2c901b2'),(955,1266793167,'127.0.1.1','d967734fb81ed90bb454e5038442e7b2ccfb718a'),(956,1266793168,'127.0.1.1','2fc2db917623f5ffae90ddf85336c5b4e66f5339'),(957,1266793168,'127.0.1.1','8ecad9900f251ad067997cb9e326c67518f5ec49'),(958,1266793168,'127.0.1.1','b7725a0da6dbd33e37cae0a7fc854aeee7a94a26'),(959,1266793168,'127.0.1.1','00d23d795d3a3fcba8ea44a884aa0774bbc3fe7f'),(960,1266793168,'127.0.1.1','a8273039daf3fc5acd0e1db60c44c3f917aa466a'),(961,1266793168,'127.0.1.1','037b05e22d59a638f030ce387291ba1e171140ed'),(962,1266793169,'127.0.1.1','27c3bbc82bcdee208fa2ea17f6c92b74e7fd9038'),(963,1266793169,'127.0.1.1','cc71645ec88b44c6e7699a5db617367bc0294f7c'),(964,1266793170,'127.0.1.1','c4d1f77b4bcb0f4909faf7b193e9f5920955f47e'),(965,1266793170,'127.0.1.1','2c831f0940670ec3ed6ba39a61bfc5f437888604'),(966,1266793188,'127.0.1.1','b911aca2925d42a2956faa160e7e74228a0f5c88'),(967,1266793189,'127.0.1.1','69b205c296fe826c1952b651f176ba14cd50cfc5'),(968,1266793189,'127.0.1.1','d866a51d10d107422c058c57e1de465d047377fd'),(969,1266793189,'127.0.1.1','b512b5f89ca86055ae7c9ee4fa1d1edc6ab4858f'),(970,1266793189,'127.0.1.1','7e19111467003abaf659d1affedfdb0d1aed2f93'),(971,1266793189,'127.0.1.1','5559c166e4444afcd99d39badb5234e0c4de9ef3'),(972,1266793189,'127.0.1.1','a9a8b40631d349ce72404326a7e616e652046aa7'),(973,1266793190,'127.0.1.1','b6f5189bb35a3920df36a9045e975521510f4d27'),(974,1266793214,'127.0.1.1','67fbb6ec1c37c5ed8189067d54968e799f0348c5'),(975,1266793214,'127.0.1.1','9d930ef9ddaf9d9d5ce18830ed914fb4dcd16193'),(976,1266793214,'127.0.1.1','95d8f6fc113aa9b60688247e71944fe9dbd75511'),(977,1266793214,'127.0.1.1','2ebaec6e94a85ec2bd8310a11316cd0809ceaffb'),(978,1266793215,'127.0.1.1','e90cbe6fb78ed65975f51367a77b4fe629c0b05d'),(979,1266793215,'127.0.1.1','4fabe123698558d1614456a41e2486b4c2864979'),(980,1266793215,'127.0.1.1','ea184e4355463379ae3a691cadde4381131e0287'),(981,1266793215,'127.0.1.1','1b67cd9e2f009c20d77fd29ed8027849b9582682'),(982,1266793215,'127.0.1.1','4bdf470d6e4f9246d6a57d58012741cb208915be'),(983,1266793215,'127.0.1.1','6041dfbc1edd3ee51e64013c96d6f3f8cd261086'),(984,1266793216,'127.0.1.1','a949d578a6f4b6536bd5b233496edba09d7d90a9'),(985,1266793216,'127.0.1.1','1e2d8d07b59c10a868e8213717f808905e4a91f8'),(986,1266793216,'127.0.1.1','89c65489030adfbf36b819424b68d75b1e09c5bd'),(987,1266793217,'127.0.1.1','0adef20eab5ea01466b559292af73ed76eae111d'),(988,1266793230,'127.0.1.1','2901f5f9637a0a66c8103d6aa6fd77cbf5cdcef2'),(989,1266793231,'127.0.1.1','46ae9ba894d40764631a037dd09a7f48ae29eab0'),(990,1266793231,'127.0.1.1','51827358df02857588d460335731883418b0239f'),(991,1266793231,'127.0.1.1','f75426e631d9a544e52214f389212769ed646dd1'),(992,1266793231,'127.0.1.1','2b89ee9832bc9ab07c51f7d3f98c616f2708a70f'),(993,1266793232,'127.0.1.1','14c9101fb53bb07a4bbef7b4b646314993eade65'),(994,1266793232,'127.0.1.1','51f1d5e375a66441256c198803e1d812ccc90cb5'),(995,1266793232,'127.0.1.1','f597ada6542197d4da00f4225b7996342c9879ff'),(996,1266794295,'127.0.1.1','682bb16161741be360d61ff27aec55286104352e'),(997,1266794300,'127.0.1.1','a2b6343abafad8d27f81c2eb286ab021b02c55dc'),(998,1266794300,'127.0.1.1','f381783ea25e36382cb9e210064b3326a704841f'),(999,1266794300,'127.0.1.1','f545119f9e2a42a354fe101773801f83c848d032'),(1000,1266794303,'127.0.1.1','969f08c2e72daf3eef98622aed3fec2b2bd4b881'),(1001,1266794303,'127.0.1.1','621240b2596d92561bbde0754aee10a50a27af75'),(1002,1266794303,'127.0.1.1','df88c799b1319f725d0343420390151216b9d547'),(1003,1266794303,'127.0.1.1','042157881504515eae6665f674039b90afc062d6'),(1004,1266794303,'127.0.1.1','98a6834f6fc4120145f1475688728261726ea7b4'),(1005,1266794304,'127.0.1.1','3a2315beb25db3cf589c03cedcf77f2dfc49e612'),(1006,1266794314,'127.0.1.1','e2e8eea866394f3f664ff0c155f913f7afec8494'),(1007,1266794315,'127.0.1.1','06d791b38da70ed4702152475b6957d7d4b2580a'),(1008,1266794316,'127.0.1.1','b2ba2821bf9ccbaed0249870a822291ed9ae67b8'),(1009,1266794316,'127.0.1.1','218cb57c92cfe52ecaade5ca118ab20a9aef193b'),(1010,1266794316,'127.0.1.1','4047835d65f2a6b2cd0a86e5e19f0032598145e3'),(1011,1266794316,'127.0.1.1','cfa42a918fee875fc89be4a1e1c0f5f52434dd4b'),(1012,1266794316,'127.0.1.1','b0f3b52bad8df053c9a0ad53be5ba7a8a3a64593'),(1013,1266794316,'127.0.1.1','d13897a4cb7a065e157c1e271b4177e8db762622'),(1014,1266794317,'127.0.1.1','7df260998f109ff8f9f47e6e72eb8da99a938278'),(1015,1266794317,'127.0.1.1','6c729045148f9d28e0ddc295a28f17c27392cebc'),(1016,1266794334,'127.0.1.1','ddad61474e58fdaf59c173c0b5eb15db4551e759'),(1017,1266794334,'127.0.1.1','4978c6c146a2a2c0f4c9e3165a3c3812293f40b0'),(1018,1266794334,'127.0.1.1','4c9df6d90b3f1c2854072c2d8aa6021825559a45'),(1019,1266794334,'127.0.1.1','7f73828b94614d38b1e969cfb1856f63f2e20340'),(1020,1266794334,'127.0.1.1','54f7ad2263d8464dda4711e07d6d321c8970d6d0'),(1021,1266794335,'127.0.1.1','c606ae3dc69ced274a5b21e43e728e6346c231f6'),(1022,1266794335,'127.0.1.1','c16f114a66c3c06fe4ff93576f1eae84c6994d43'),(1023,1266794335,'127.0.1.1','f7ed8e5dd0c02cc1ef0e2f41d588c1be9a07647a'),(1024,1266794363,'127.0.1.1','0441c9292f9825c04f35cabd41f65aa0be8106a6'),(1025,1266794363,'127.0.1.1','1ef8367ecf79bff3fc11024db567d63298576d97'),(1026,1266794363,'127.0.1.1','7a25d45bb3a860c939d86b04f43d31db385a6ec0'),(1027,1266794363,'127.0.1.1','7118749d7c7643647255e6d3d700608b11f3bf3c'),(1028,1266794363,'127.0.1.1','94cf92e564e7f57544f8f5957b3c0bd7c10a229e'),(1029,1266794364,'127.0.1.1','3dff9f9a45fdc478d7d01f2b40f3628d40055d63'),(1030,1266794364,'127.0.1.1','c229e7eb20e5d8b36068b1bd570ba59ed3b0ddd9'),(1031,1266794364,'127.0.1.1','34864d9cf973a94df77a783806d9be6b54e20f2a'),(1032,1266794364,'127.0.1.1','4beed88d6d9a9f28f9bec933a0d57427419381e8'),(1033,1266794364,'127.0.1.1','b42070e1e51c071acfde08004e2efb9e801ef5a1'),(1034,1266794392,'127.0.1.1','f1671c3fa165f8a2608e428453a480db9cefe7c5'),(1035,1266794392,'127.0.1.1','c8105bb27e9425ebc20a421c1f1aec83c09de929'),(1036,1266794392,'127.0.1.1','35a8d258176c7c14c56cd360c9097b5b034e1b2e'),(1037,1266794393,'127.0.1.1','46968fa760ad759fef4bba902791a646b4cd1c77'),(1038,1266794393,'127.0.1.1','e5c32485a3797de849579feb0ad67cbfb924b4e4'),(1039,1266794393,'127.0.1.1','1d77358d3d5f2bb418a37810c8bf4e1d480f8e01'),(1040,1266794393,'127.0.1.1','6606c758812f8536664b1466c29445612f341a61'),(1041,1266794393,'127.0.1.1','490ee89375c695dc7e73eff084dac2e626e43896'),(1042,1266794393,'127.0.1.1','f3f893fcc683e37772fbb49da4a76fffb371aefe'),(1043,1266794394,'127.0.1.1','f5c3b8c490fcdb566eb05bc1f5757ed356102bf7'),(1044,1266794394,'127.0.1.1','60efce85f3f18da8f5c9d2b6f6f5215dc581e425'),(1045,1266794394,'127.0.1.1','731b048470c1b345f21813b85b0c13ef9286f2c1'),(1046,1266794394,'127.0.1.1','19c11dea52085b09950da834fe8213b523c0dcca'),(1047,1266794394,'127.0.1.1','e78da563a1719a7e7c1d07c52357c54986aea604'),(1048,1266794610,'127.0.1.1','6b2fcae120d67d49a3ef31ef0f8e2e79eef6dc50'),(1049,1266794610,'127.0.1.1','0519f0664762cb1db789f053f55c0d583d0e9a56'),(1050,1266794610,'127.0.1.1','b1332edfb5b83b5528000bccf98c189bff85a3ff'),(1051,1266794610,'127.0.1.1','494dc825148c1704ec1866aa20ffc87116d82c95'),(1052,1266794611,'127.0.1.1','d8c7322e4342b16e5be9a9732e5d9f83820f9be1'),(1053,1266794611,'127.0.1.1','8b8d26237e34c535f8d59b36cd3c6afc6e528635'),(1054,1266794611,'127.0.1.1','715f29156cbd78a0d07db02951faab5339e64c28'),(1055,1266794611,'127.0.1.1','8269cabeeb46295d4907c8170845951f2b801e5c'),(1056,1266794611,'127.0.1.1','c9ea395ac19b9bd0bb3e9276af06f4ce02d5bdd6'),(1057,1266794611,'127.0.1.1','b80a86576b47240f3a2a4d36bd226555cb46e37a'),(1058,1266794616,'127.0.1.1','a4c461cd02237d4452bbbda158a8df0a72418c01'),(1059,1266794617,'127.0.1.1','215e2424aa6d536c8f0813ec0672bfe99bca0d40'),(1060,1266794617,'127.0.1.1','119fec110f776409830294e2723733d8b3697414'),(1061,1266794617,'127.0.1.1','ce26a31b3c70ce40d501b3296e37436ff404a061'),(1062,1266794617,'127.0.1.1','2027eb84615fd00cea468cc186f0b32c0d94faab'),(1063,1266794617,'127.0.1.1','8ac2b3a14272e3c41ecd2a5404eb0db9e4ffd5d9'),(1064,1266794617,'127.0.1.1','a780ee0c1a7fe4ed305106643180a0f46c9dfc56'),(1065,1266794618,'127.0.1.1','75d670bfd73a3ddeacbf134a02cd0d5de920ced7'),(1066,1266794630,'127.0.1.1','ea0747678386faa89b68f02842314f4a30e2ce0a'),(1067,1266794647,'127.0.1.1','1780552c33d24694a13e84d437543188518edaa6'),(1068,1266795663,'127.0.1.1','2052463082b40aa06e1123b0b946b822876d6968'),(1069,1266795664,'127.0.1.1','769d4421842454b130a0a46e9dba365a4588410c'),(1070,1266795664,'127.0.1.1','681b7aa14b46aa28173b9efb6f4ad4c639866534'),(1071,1266795664,'127.0.1.1','b772f99e5372ed1ac4ce6f6d19165d480858274a'),(1072,1266795664,'127.0.1.1','97881952b1655a78f70a658aab1e2d7d72f0acc4'),(1073,1266795664,'127.0.1.1','577de0cf9807cacf55e7189d154615b8407eda73'),(1074,1266795665,'127.0.1.1','5d5cfac945fc7f71236c48a977ad1f745854c9f8'),(1075,1266795665,'127.0.1.1','5a2dfc0ba57253f589a9f85b59921658097c24ca'),(1076,1266795665,'127.0.1.1','7fcf9f3297ce67ab0781cd72da46a125e78729eb'),(1077,1266795665,'127.0.1.1','d6bd9ab184f27e7441f8e21a0ebc56f1ab013491'),(1078,1266795688,'127.0.1.1','d14a026a2519b3fce35f7d6ec29a0d72fe45d391'),(1079,1266795688,'127.0.1.1','58ccf99df73a64888bc6fda1d3588df4ca67c2f1'),(1080,1266795689,'127.0.1.1','2547adf147df09e1a05c040202c711c1d57b13b4'),(1081,1266795689,'127.0.1.1','bc6004613f934e2c7341bd13cba42adc970edb54'),(1082,1266795689,'127.0.1.1','3607b51b7faf1f9655b843f7f76d1a3f5a003c35'),(1083,1266795689,'127.0.1.1','956027a89da6783e456d7203023c19376e94d094'),(1084,1266795689,'127.0.1.1','97e1187ced203db472a5f0ea3c3c893afbd3a589'),(1085,1266795689,'127.0.1.1','406acdfbe699322244c7164e08dc90129914ea47'),(1086,1266795690,'127.0.1.1','b07d883dc45d870b9f941b4135203f4c6804318d'),(1087,1266795690,'127.0.1.1','6f712175e4a6f545f8da24e723c707b08bf7c209'),(1088,1266795690,'127.0.1.1','a6339a0dfd03f535f722c314768dccf230b6dfd0'),(1089,1266795801,'127.0.1.1','a67c9b107e3af1bf62b2730085a2c1a363f533a2'),(1090,1266795801,'127.0.1.1','2fdbe5a924cd73fb8294d1b8b3d5b5306507f396'),(1091,1266795801,'127.0.1.1','5779c858553da59c611961f466a3207eafb617a2'),(1092,1266795802,'127.0.1.1','352dacde7be28bf5ec78b38ab1386809b5144443'),(1093,1266795802,'127.0.1.1','cab9a4816655940fd7f2e2f71b621978a5b1de93'),(1094,1266795802,'127.0.1.1','2d6b7ef125c70ec5ac31e9d5ac474f392018440e'),(1095,1266795802,'127.0.1.1','d2e96263b62803068599ecb1d6b3002999b70dfc'),(1096,1266795802,'127.0.1.1','3f880f52b4a44d909286d2297ac3a0d1634ba4e3'),(1097,1266795803,'127.0.1.1','423866cddb1756fa78b2ab45e24d2396de1a4ac0'),(1098,1266795803,'127.0.1.1','06274ed038cc14da715d0ff6bcc2d85f4578a268'),(1099,1266795803,'127.0.1.1','3acb52fad2d0f4801ad7f3ac4ecb504e86a3cdb6'),(1100,1266795855,'127.0.1.1','7d40f85fea28121e65fb143c497f2a35593fa0f6'),(1101,1266795856,'127.0.1.1','0441a0198b339810c56e3218a18a0b58b17f7fae'),(1102,1266795856,'127.0.1.1','23e0ecae3afd741012261e16819f3e9c2ce72d4f'),(1103,1266795856,'127.0.1.1','975d993a49f4b3648b25d29a9ad791fad410459f'),(1104,1266795856,'127.0.1.1','c80d51dbfcb524afb5087f4df32fede5dac5c5ef'),(1105,1266795856,'127.0.1.1','4997e56c709b5c4895bc2e5b18d6af533edba9f4'),(1106,1266795857,'127.0.1.1','e6221c036ac941ef26d44963ee9e97f55e06b37e'),(1107,1266795857,'127.0.1.1','05a0cb008a935e2d1fcd670be142d50ffd9a5c32'),(1108,1266795857,'127.0.1.1','8e34aa873141b7e1ccf6241fc6c6341f67da76fa'),(1109,1266795857,'127.0.1.1','d8f8f1429ee077b8e67644342a83246cc4ea9448'),(1110,1266795857,'127.0.1.1','e58c96a7943d69f5ae64377f8342a9c9cd345d23'),(1111,1266795922,'127.0.1.1','9a27b4e18a2569adf901e233d877dfe227807bac'),(1112,1266795922,'127.0.1.1','4513ccf566beb5b591930e5432cc6d746c9a9fd1'),(1113,1266795923,'127.0.1.1','6d8ba643e67bd48a668b54f568ba2b9d0738de3d'),(1114,1266795923,'127.0.1.1','bf10aa366e28d018954366c4e401cb554009a749'),(1115,1266795923,'127.0.1.1','5deb9f8968b082315197268a2addefe5abe8796f'),(1116,1266795923,'127.0.1.1','34fe8cc56d39096b6e67ceac474e6e5bb62ea5da'),(1117,1266795923,'127.0.1.1','f2692ab343da901246c3393340b50d59112b04f6'),(1118,1266795924,'127.0.1.1','1a72aa27d9fb4ee7fd72c9fe95f35df930283f16'),(1119,1266795924,'127.0.1.1','b9183efe4309731b8258feafd8a59bb5c10a3b57'),(1120,1266795924,'127.0.1.1','390e8dfa89ea50b3ce445698549b25861bec3407'),(1121,1266795924,'127.0.1.1','f1ddf84b8d7d99f5908584b3ea87e46fb61dd610'),(1122,1266796747,'127.0.1.1','0b68f76f2072ba632d179f5bfe894aa7460f8463'),(1123,1266796747,'127.0.1.1','77531bfe1993b36e617c19fda5d93c31f9464cec'),(1124,1266796747,'127.0.1.1','214fbdf6b5dd9d73a1693a48eceb7a02be9d0316'),(1125,1266796747,'127.0.1.1','a772e28a6ad0f373fe29946dddaf30cd8676799f'),(1126,1266796747,'127.0.1.1','976ea258050979840b15b7cb85f00b84c5d8d291'),(1127,1266796747,'127.0.1.1','258741396e68e0d02d41de8e9551bd6e5cb61bd6'),(1128,1266796748,'127.0.1.1','fb762067f71faf464a56f83a5adb620c9ebf4302'),(1129,1266796748,'127.0.1.1','5be5890c427d39a584590c8c6ddd883a2c28cbff'),(1130,1266796752,'127.0.1.1','73591bcd912358bcbd04734344bb9c0cbeef4765'),(1131,1266796753,'127.0.1.1','72745078bd13c4be53c3eaf71f1402f951f0c5fa'),(1132,1266796753,'127.0.1.1','a68c6d24e8c4df310ca6ab3599dafb21e8feaeda'),(1133,1266796753,'127.0.1.1','6d937ec305a52833f3ba9e0e8601ab79ad39f6d6'),(1134,1266796753,'127.0.1.1','6e065451a1b3d6465d9659fca777393d8b050057'),(1135,1266796753,'127.0.1.1','b3030a5d50c04f001be31726aeedb928271c777a'),(1136,1266796753,'127.0.1.1','18c0013b052f16775914cdac6d6325bb6e50a269'),(1137,1266796766,'127.0.1.1','5c492321ff8113b3517f13c88abfdcaac3f3b297'),(1138,1266796767,'127.0.1.1','f1b5541a641539faa17acf606a8dc39f9552aa85'),(1139,1266796767,'127.0.1.1','c6c151fd608475c9558635e8e5f5bc7fd2f58e0d'),(1140,1266796767,'127.0.1.1','b6f6698f6fa5bcc921d44825065e430e888c4626'),(1141,1266796767,'127.0.1.1','74b656bd8b073af7d79917cece0eed688f3358e5'),(1142,1266796767,'127.0.1.1','aecc5d98c8468f4f0fbb3112d7c0bed6187e0355'),(1143,1266796767,'127.0.1.1','cb307d7d382346e724bded29182de9251e28b6fa'),(1144,1266796768,'127.0.1.1','b4139a9bc9ffd3f60109e50e9d4dcac7e3070c8e'),(1145,1266796772,'127.0.1.1','df57298bf89a08bb20df13dee1115f60d9c9e98f'),(1146,1266796772,'127.0.1.1','032a81c49dd649fbacd3da12eb6c241a8a2f783f'),(1147,1266796773,'127.0.1.1','94293ccc4c8833b8870587860254284ef70b1dda'),(1148,1266796773,'127.0.1.1','ee6d944f840fc72c03e9f524c2c291f9248317c4'),(1149,1266796773,'127.0.1.1','a82cfe207640b260af9293b14168aa1acaf7a28b'),(1150,1266796773,'127.0.1.1','fb9467b45a7fef0766699c6cbbd956fd332e3b7e'),(1151,1266796773,'127.0.1.1','cf515e11d727dc7558765746a58a9f1839b06f65'),(1152,1266796774,'127.0.1.1','12ed0fbf6c60374f14ca00306c4d5ccf1e101b24'),(1153,1266796780,'127.0.1.1','2c57a10802b1896149b60ad57bc869db8502e47e'),(1154,1266796780,'127.0.1.1','83713fc556f5beca51a01298ca469d9ee7d0f209'),(1155,1266796783,'127.0.1.1','f00356f88b3234fc177d850a41699f00d6d75d16'),(1156,1266796783,'127.0.1.1','d1e9820ae41ed060d43fc8bce201adbb38d59127'),(1157,1266796783,'127.0.1.1','23999184bb92ccaca649463a025a5c5c6fc18f9e'),(1158,1266796784,'127.0.1.1','44961d7fb87b5a4799e5f991f48b28a146bb2569'),(1159,1266796784,'127.0.1.1','b27b7b4ff97db233f8d429edd5191eb1f0ccb753'),(1160,1266796784,'127.0.1.1','06ba7bd980cd0e7df825c08a57f3f4278a7b6eea');
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
INSERT INTO `exp_sessions` VALUES ('971ac77c886b64c46e4415fa0a987a6fb29c77be',1,1,1,'127.0.1.1','Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.0.1',1266796784),('f7ddd5fd7896d4cf712ae061df773a9922660c1e',1,1,1,'127.0.1.1','Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.0.1',1266793241);
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
INSERT INTO `exp_stats` VALUES (1,1,1,1,'Chris',15,0,0,0,1266793229,0,0,1266796439,4,1266794590,1267395300);
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (1,1,1,'index','y','webpage','<!DOCTYPE html>\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">\n  <head>\n\n<title>{site_name}</title>\n<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\"/>\n<link rel=\'stylesheet\' type=\'text/css\' media=\'all\' href=\'{stylesheet=Posts/posts_css}\' />\n<script type=\"text/javascript\" src=\"http://google.com/jsapi\"></script>\n<script type=\"text/javascript\">\n	google.load(\"jquery\",\"1.3.2\");\n	google.load(\"jqueryui\",\"1.7.2\");\n</script>\n<script type=\"text/javascript\" src=\"/js/posts.js\"></script>\n</head>\n<body>\n<div id=\"nav\">\n	<p>\n		<a href=\"#clearup\" id=\"clearUp\">Clear up</a>\n		<a href=\"#clearup\" id=\"scrambel\">Scrambel</a>\n		<a href=\"#clearup\" id=\"washAndGo\">Go and return</a>\n	</p>\n</div>\n<div id=\"container\">\n{exp:channel:entries\norderby=\"date\" \nlimit=\"9\"\npaginate=\"top\"}\n\n<div class=\"box{absolute_count}\">\n	<a href=\"#\" class=\"close\">Close</a>\n	<h1>{title}</h1>\n	<p>{body}</p>\n</div>\n{paginate}\n<p id=\"navigation\">Page {current_page} of {total_pages} pages {pagination_links}</p>\n{/paginate}\n{/exp:channel:entries}\n\n</div>\n</body>\n</html>\n','',1266794393,1,'n',0,'','n','n','o',42),(2,1,1,'posts_css','y','css','body {\n	background-color: #fff;\n	margin: 40px;\n	font-family: Lucida Grande, Verdana, Sans-serif;\n	font-size: 14px;\n	color: #4F5155;\n}\n\na {\n	color: #003399;\n	background-color: transparent;\n	font-weight: normal;\n}\n\nh1 {\n	color: #444;\n	background-color: transparent;\n	border-bottom: 1px solid #D0D0D0;\n	font-size: 16px;\n	font-weight: bold;\n	margin: 24px 0 2px 0;\n	padding: 5px 0 6px 0;\n}\n\ncode {\n	font-family: Monaco, Verdana, Sans-serif;\n	font-size: 12px;\n	background-color: #f9f9f9;\n	border: 1px solid #D0D0D0;\n	color: #002166;\n	display: block;\n	margin: 14px 0 14px 0;\n	padding: 12px 10px 12px 10px;\n}\n\n#thumbs{\n	position:relative;\n	z-index:1;\n		width:130px;\n	border:1px solid #333;\n}\n#thumbs div{\n	position:relative;\n	z-index:2;\n	width:28px;\n	height:28px;	\n	float:left;\n	margin:10px 10px 10px 0;\n	border:1px solid #333;\n}\n#container{\n	position:relative;\n	border:1px solid #ff22ff;\n	width:762px;\n	height:300px;\n}\n#container div{\n	position:absolute;\n	/*top:0; left:0;*/\n	z-index:3;	\n	width:200px;\n	height:200px;\n	border:1px solid #ff33ff;\n	overflow:hidden;\n	padding:17px;\n}\n.box1,\n.box10{\n	top:20px;\n	left:20px;\n\n\n}\n.box2,\n.box11{\n	top:20px;\n	left:254px;\n\n}\n.box3,\n.box12{\n	top:20px;\n	left:508px;\n\n}\n.box4,\n.box13{\n	top:260px;\n	left:20px;\n\n}\n.box5,\n.box14{\n	top:260px;\n	left:254px;\n	\n\n}\n.box6{\n	top:260px;\n	left:508px;\n\n}\n.box7{\n	top:500px;\n	left:20px;\n\n}\n.box8{\n	top:500px;\n	left:254px;\n\n}\n.box9{\n	top:500px;\n	left:508px;\n}\n','',1266796766,1,'n',0,'','n','n','o',1),(3,1,1,'posts_json','y','webpage','[\n{exp:channel:entries\norderby=\"date\" \nlimit=\"9\"\npaginate=\"top\"}\n{\n	\"index\":\"{absolute_count}\",\n	\"title\":\"{title}\",\n	\"body\":\"{body}\"\n}{if absolute_count < 9},{/if}\n{/exp:channel:entries}\n]\n','',1266795922,1,'n',0,'','n','n','o',11);
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

-- Dump completed on 2010-02-22  0:02:15
