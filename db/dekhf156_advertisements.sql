-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 27, 2016 at 11:01 AM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dekhf156_advertisements`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_settings`
--

CREATE TABLE IF NOT EXISTS `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';

--
-- Dumping data for table `core_settings`
--

INSERT INTO `core_settings` (`slug`, `default`, `value`) VALUES
('date_format', 'g:ia -- m/d/y', 'g:ia -- m/d/y'),
('lang_direction', 'ltr', 'ltr'),
('status_message', 'This site has been disabled by a super-administrator.', 'This site has been disabled by a super-administrator.');

-- --------------------------------------------------------

--
-- Table structure for table `core_sites`
--

CREATE TABLE IF NOT EXISTS `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_sites`
--

INSERT INTO `core_sites` (`id`, `name`, `ref`, `domain`, `active`, `created_on`, `updated_on`) VALUES
(1, 'Default Site', 'default', 'localhost', 1, 1386006787, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_users`
--

CREATE TABLE IF NOT EXISTS `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_users`
--

INSERT INTO `core_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(1, 'kumarnavinrai@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', '10582', 1, '', 1, '', 1386006787, 1386006787, 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_bills`
--

CREATE TABLE IF NOT EXISTS `default_bills` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) NOT NULL,
  `type_of_process` int(4) NOT NULL,
  `bill_no` varchar(300) NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `amount_of_bill` int(11) NOT NULL,
  `bill_send_at_address` text NOT NULL,
  `bill_send_at_date` datetime NOT NULL,
  `bill_send_or_not` int(2) NOT NULL,
  `comments` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_bills`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_blog`
--

CREATE TABLE IF NOT EXISTS `default_blog` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_blog`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_blog_categories`
--

CREATE TABLE IF NOT EXISTS `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_blog_categories`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_ci_sessions`
--

CREATE TABLE IF NOT EXISTS `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_ci_sessions`
--

INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('202ed45007137c533c72c0b7093f1f2c', '122.173.26.112', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404189128, ''),
('8cf5cf6560a0f32bde68e9c1068a4f70', '122.173.233.206', 'Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0', 1407389227, 'a:1:{s:17:"flash:old:success";s:25:"You have been logged out.";}'),
('894bc6b5c369012391ed3f79b8ebabe9', '103.18.242.129', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 1407390989, 'a:6:{s:8:"username";s:5:"admin";s:5:"email";s:25:"kumarnavinrai@hotmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('b661a35eab3850512d79f586d5b59c3e', '122.173.130.171', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 1411533664, ''),
('a22c847e0985d60029bc2f8bf5d4eca2', '122.173.130.171', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 1411609494, ''),
('4aa1d8d38dbb0aa2646d751bde8cb23d', '103.30.83.28', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36 OPR/25.0.1614.63', 1414646468, ''),
('3f0191a09feb6e1375e843132dec2a4a', '122.173.247.171', 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0', 1421372611, ''),
('abe2362c4ad5046232d05c642e2ba308', '122.173.173.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1430261793, ''),
('61fd923c5a8b38acced87e9d1358013a', '122.173.173.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1430261815, ''),
('f1a2226ea0fce01a0ffc173f6a23fd89', '122.173.173.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1430262617, ''),
('dd21f9d5d15dbb79c0d9e6502b399aab', '122.173.173.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1430263951, ''),
('abaded7c693bd99aa4df29ed09e6608b', '122.173.173.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1430264109, ''),
('202562261588d61711454e4c9bddc184', '122.173.21.90', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', 1430267786, ''),
('4066a1e3bb509ec92ab995a106cb748f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 1467024859, 'a:1:{s:17:"flash:old:success";s:25:"You have been logged out.";}');

-- --------------------------------------------------------

--
-- Table structure for table `default_comments`
--

CREATE TABLE IF NOT EXISTS `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `entry_title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_comment_blacklists`
--

CREATE TABLE IF NOT EXISTS `default_comment_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_comment_blacklists`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_contact_log`
--

CREATE TABLE IF NOT EXISTS `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_contact_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_countries`
--

CREATE TABLE IF NOT EXISTS `default_countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(4) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=114 ;

--
-- Dumping data for table `default_countries`
--

INSERT INTO `default_countries` (`country_id`, `name`, `code`) VALUES
(113, 'India', 'IN');

-- --------------------------------------------------------

--
-- Table structure for table `default_data_fields`
--

CREATE TABLE IF NOT EXISTS `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `default_data_fields`
--

INSERT INTO `default_data_fields` (`id`, `field_name`, `field_slug`, `field_namespace`, `field_type`, `field_data`, `view_options`, `is_locked`) VALUES
(1, 'lang:blog:intro_label', 'intro', 'blogs', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a363a2273696d706c65223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(2, 'lang:pages:body_label', 'body', 'pages', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a383a22616476616e636564223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(3, 'lang:user:first_name_label', 'first_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(4, 'lang:user:last_name_label', 'last_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(5, 'lang:profile_company', 'company', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3130303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(6, 'lang:profile_bio', 'bio', 'users', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(7, 'lang:user:lang', 'lang', 'users', 'pyro_lang', 0x613a313a7b733a31323a2266696c7465725f7468656d65223b733a333a22796573223b7d, NULL, 'no'),
(8, 'lang:profile_dob', 'dob', 'users', 'datetime', 0x613a353a7b733a383a227573655f74696d65223b733a323a226e6f223b733a31303a2273746172745f64617465223b733a353a222d31303059223b733a383a22656e645f64617465223b4e3b733a373a2273746f72616765223b733a343a22756e6978223b733a31303a22696e7075745f74797065223b733a383a2264726f70646f776e223b7d, NULL, 'no'),
(9, 'lang:profile_gender', 'gender', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a33343a22203a204e6f742054656c6c696e670a6d203a204d616c650a66203a2046656d616c65223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b4e3b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(10, 'lang:profile_phone', 'phone', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(11, 'lang:profile_mobile', 'mobile', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(12, 'lang:profile_address_line1', 'address_line1', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(13, 'lang:profile_address_line2', 'address_line2', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(14, 'lang:profile_address_line3', 'address_line3', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(15, 'lang:profile_address_postcode', 'postcode', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(16, 'lang:profile_website', 'website', 'users', 'url', NULL, NULL, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `default_data_field_assignments`
--

CREATE TABLE IF NOT EXISTS `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `default_data_field_assignments`
--

INSERT INTO `default_data_field_assignments` (`id`, `sort_order`, `stream_id`, `field_id`, `is_required`, `is_unique`, `instructions`, `field_name`) VALUES
(1, 1, 1, 1, 'yes', 'no', NULL, NULL),
(2, 1, 2, 2, 'no', 'no', NULL, NULL),
(3, 1, 3, 3, 'yes', 'no', NULL, NULL),
(4, 2, 3, 4, 'yes', 'no', NULL, NULL),
(5, 3, 3, 5, 'no', 'no', NULL, NULL),
(6, 4, 3, 6, 'no', 'no', NULL, NULL),
(7, 5, 3, 7, 'no', 'no', NULL, NULL),
(8, 6, 3, 8, 'no', 'no', NULL, NULL),
(9, 7, 3, 9, 'no', 'no', NULL, NULL),
(10, 8, 3, 10, 'no', 'no', NULL, NULL),
(11, 9, 3, 11, 'no', 'no', NULL, NULL),
(12, 10, 3, 12, 'no', 'no', NULL, NULL),
(13, 11, 3, 13, 'no', 'no', NULL, NULL),
(14, 12, 3, 14, 'no', 'no', NULL, NULL),
(15, 13, 3, 15, 'no', 'no', NULL, NULL),
(16, 14, 3, 16, 'no', 'no', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_data_streams`
--

CREATE TABLE IF NOT EXISTS `default_data_streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `default_data_streams`
--

INSERT INTO `default_data_streams` (`id`, `stream_name`, `stream_slug`, `stream_namespace`, `stream_prefix`, `about`, `view_options`, `title_column`, `sorting`, `permissions`, `is_hidden`, `menu_path`) VALUES
(1, 'lang:blog:blog_title', 'blog', 'blogs', NULL, NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(2, 'Default', 'def_page_fields', 'pages', NULL, 'A simple page type with a WYSIWYG editor that will get you started adding content.', 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(3, 'lang:user_profile_fields_label', 'profiles', 'users', NULL, 'Profiles for users module', 0x613a313a7b693a303b733a31323a22646973706c61795f6e616d65223b7d, 'display_name', 'title', NULL, 'no', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_def_page_fields`
--

CREATE TABLE IF NOT EXISTS `default_def_page_fields` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `default_def_page_fields`
--

INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`) VALUES
(1, '2013-12-02 17:53:19', '2013-12-06 17:40:50', 1, NULL, '<p>This is Advertising management software. Use this to make you add bussiness easy and accurate.</p>\r\n'),
(2, '2013-12-02 17:53:19', NULL, 1, NULL, '<p>To contact us please fill out the form below.</p>\n				{{ contact:form name="text|required" email="text|required|valid_email" subject="dropdown|Support|Sales|Feedback|Other" message="textarea" attachment="file|zip" }}\n					<div><label for="name">Name:</label>{{ name }}</div>\n					<div><label for="email">Email:</label>{{ email }}</div>\n					<div><label for="subject">Subject:</label>{{ subject }}</div>\n					<div><label for="message">Message:</label>{{ message }}</div>\n					<div><label for="attachment">Attach  a zip file:</label>{{ attachment }}</div>\n				{{ /contact:form }}'),
(3, '2013-12-02 17:53:19', NULL, 1, NULL, '{{ search:form class="search-form" }} \n		<input name="q" placeholder="Search terms..." />\n	{{ /search:form }}'),
(4, '2013-12-02 17:53:19', NULL, 1, NULL, '{{ search:form class="search-form" }} \n		<input name="q" placeholder="Search terms..." />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for "{{ query }}".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href="{{ url }}">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}'),
(5, '2013-12-02 17:53:19', NULL, 1, NULL, '<p>We cannot find the page you are looking for, please click <a title="Home" href="{{ pages:url id=''1'' }}">here</a> to go to the homepage.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `default_email_templates`
--

CREATE TABLE IF NOT EXISTS `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `default_email_templates`
--

INSERT INTO `default_email_templates` (`id`, `slug`, `name`, `description`, `subject`, `body`, `lang`, `is_default`, `module`) VALUES
(1, 'comments', 'Comment Notification', 'Email that is sent to admin when someone creates a comment', 'You have just received a comment from {{ name }}', '<h3>You have received a comment from {{ name }}</h3>\n				<p>\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}<br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>\n				<p>{{ comment }}</p>\n				<p>View Comment: {{ redirect_url }}</p>', 'en', 1, 'comments'),
(2, 'contact', 'Contact Notification', 'Template for the contact form', '{{ settings:site_name }} :: {{ subject }}', 'This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: {{ sender_ip }}\n				OS {{ sender_os }}\n				Agent {{ sender_agent }}\n				<hr />\n				{{ message }}\n\n				{{ name }},\n\n				{{ email }}', 'en', 1, 'pages'),
(3, 'registered', 'New User Registered', 'Email sent to the site contact e-mail when a new user registers', '{{ settings:site_name }} :: You have just received a registration from {{ name }}', '<h3>You have received a registration from {{ name }}</h3>\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}</strong><br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>', 'en', 1, 'users'),
(4, 'activation', 'Activation Email', 'The email which contains the activation code that is sent to a new user', '{{ settings:site_name }} - Account Activation', '<p>Hello {{ user:first_name }},</p>\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n				<p><a href="{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n				<p>&nbsp;</p>\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n				<p><a href="{{ url:site }}users/activate">{{ url:site }}users/activate</a></p>\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>', 'en', 1, 'users'),
(5, 'forgotten_password', 'Forgotten Password Email', 'The email that is sent containing a password reset code', '{{ settings:site_name }} - Forgotten Password', '<p>Hello {{ user:first_name }},</p>\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href="{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>', 'en', 1, 'users'),
(6, 'new_password', 'New Password Email', 'After a password is reset this email is sent containing the new password', '{{ settings:site_name }} - New Password', '<p>Hello {{ user:first_name }},</p>\n				<p>Your new password is: {{ new_password }}</p>\n				<p>After logging in you may change your password by visiting <a href="{{ url:site }}edit-profile">{{ url:site }}edit-profile</a></p>', 'en', 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `default_files`
--

CREATE TABLE IF NOT EXISTS `default_files` (
  `id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_files`
--

INSERT INTO `default_files` (`id`, `folder_id`, `user_id`, `type`, `name`, `filename`, `path`, `description`, `extension`, `mimetype`, `keywords`, `width`, `height`, `filesize`, `alt_attribute`, `download_count`, `date_added`, `sort`) VALUES
('01905f738dc3426', 1, 1, 'i', 'locationpicture', '44b789a8b7f058e0e1911b5b005f2e8c.jpg', '{{ url:site }}files/large/44b789a8b7f058e0e1911b5b005f2e8c.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 48, '', 0, 1389147190, 0),
('02530add73bee4e', 1, 1, 'i', 'hordinginstallpicture', 'b9b8cfccc9abb771de040005a57bca8b.jpg', '{{ url:site }}files/large/b9b8cfccc9abb771de040005a57bca8b.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 41, '', 0, 1389687561, 0),
('0a603f448a62cc5', 1, 1, 'i', 'gggg', '79473af3d4dc96ac063b578adfd4a9cc.jpg', '{{ url:site }}files/large/79473af3d4dc96ac063b578adfd4a9cc.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 826, '', 0, 1387126853, 0),
('0c2068d3b9b83ac', 1, 1, 'i', 'locationpicture', '56f8995842fae3acd54d71d8170a28b6.jpg', '{{ url:site }}files/large/56f8995842fae3acd54d71d8170a28b6.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 760, '', 0, 1387130626, 0),
('100b66471062dcc', 1, 1, 'i', 'locationpicture', 'e9aee25b54bff5102a78735f0d98cf95.png', '{{ url:site }}files/large/e9aee25b54bff5102a78735f0d98cf95.png', '', '.png', 'image/png', '', 400, 200, 47, '', 0, 1387129386, 0),
('1291963c8261879', 1, 1, 'i', 'locationpicture', '65cdaae8fb265fc34a6ff0dc941e7da0.png', '{{ url:site }}files/large/65cdaae8fb265fc34a6ff0dc941e7da0.png', '', '.png', 'image/png', '', 400, 200, 47, '', 0, 1387129229, 0),
('149388e95716fd9', 1, 1, 'i', 'locationpicture', '32329b95534e0bf92a0b43b43aaa8f29.jpg', '{{ url:site }}files/large/32329b95534e0bf92a0b43b43aaa8f29.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 51, '', 0, 1387692492, 0),
('22715f7c6761c26', 1, 1, 'i', 'locationpicture', '214a7d8e367330a197a6b9949fc19ef4.jpg', '{{ url:site }}files/large/214a7d8e367330a197a6b9949fc19ef4.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 101, '', 0, 1389686209, 0),
('2b675c2f1d2c309', 1, 1, 'i', 'hordinginstallpicture', '5eeb4034093274ac7eaa0d6d07cfdd39.jpg', '{{ url:site }}files/large/5eeb4034093274ac7eaa0d6d07cfdd39.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 548, '', 0, 1387131333, 0),
('2d6a0f480b76c68', 1, 1, 'i', 'hordinginstallpicture', 'd2c7228cd3aeb7bcb2a5655c714cca3a.jpg', '{{ url:site }}files/large/d2c7228cd3aeb7bcb2a5655c714cca3a.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 606, '', 0, 1387131477, 0),
('30222e9b0db06a4', 1, 1, 'i', 'locationpicture', 'ae161c00c346b2d2e135bb845039a208.jpg', '{{ url:site }}files/large/ae161c00c346b2d2e135bb845039a208.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 606, '', 0, 1389674569, 0),
('32fade6896634fb', 1, 1, 'i', 'hordinginstallpicture3', '182c179c8f70c9ab4b7cf4e90e525e14.jpg', '{{ url:site }}files/large/182c179c8f70c9ab4b7cf4e90e525e14.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 859, '', 0, 1389680676, 0),
('343b652e832bf8a', 1, 1, 'i', 'locationpicture', 'a9b1c2a32c17e797003fa78153ee0dc1.jpg', '{{ url:site }}files/large/a9b1c2a32c17e797003fa78153ee0dc1.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 58, '', 0, 1389680021, 0),
('3998f1f8c0076a4', 1, 1, 'i', 'locationpicture', 'bc5d50faee66756e346a8024729ddc0c.jpg', '{{ url:site }}files/large/bc5d50faee66756e346a8024729ddc0c.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 760, '', 0, 1389680155, 0),
('3b6204e0123763c', 1, 1, 'i', 'locationpicture', '9d71d10f43f3ca1c020744cb9b67d7e7.jpg', '{{ url:site }}files/large/9d71d10f43f3ca1c020744cb9b67d7e7.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 758, '', 0, 1387127373, 0),
('4e040f3d30ef3f1', 1, 1, 'i', 'gggg', '6927ea5f7ad403a7dc533d7a0d68dacc.jpg', '{{ url:site }}files/large/6927ea5f7ad403a7dc533d7a0d68dacc.jpg', '', '.jpg', 'image/jpeg', '', 1024, 768, 763, '', 0, 1387125810, 0),
('5f403b9c75a78dd', 1, 1, 'i', 'locationpicture', 'a9d74bc4eff002e6f7186e73e1e775ef.jpg', '{{ url:site }}files/large/a9d74bc4eff002e6f7186e73e1e775ef.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 606, '', 0, 1389680021, 0),
('62e90a9e9cc48c1', 1, 1, 'i', 'locationpicture', 'c7c156245ef315ebf5d2cb832b3d1f6e.jpg', '{{ url:site }}files/large/c7c156245ef315ebf5d2cb832b3d1f6e.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 859, '', 0, 1387130168, 0),
('68638bcdc3f74b2', 1, 1, 'i', 'locationpicture', '02cf2c0871a5b53c92988cf37dddfb74.jpg', '{{ url:site }}files/large/02cf2c0871a5b53c92988cf37dddfb74.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 826, '', 0, 1389680155, 0),
('69059bf1f116f58', 1, 1, 'i', 'locationpicture', 'db9fe4eba3fe69a7a933def4456422c7.jpg', '{{ url:site }}files/large/db9fe4eba3fe69a7a933def4456422c7.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 58, '', 0, 1389672445, 0),
('6f1fd09a2abd9e6', 1, 1, 'i', 'hordinginstallpicture2', 'a9738d69835f0af2a2f3fa1c025f6636.jpg', '{{ url:site }}files/large/a9738d69835f0af2a2f3fa1c025f6636.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 826, '', 0, 1389680676, 0),
('712d030b79c549e', 1, 1, 'i', 'hordinginstallpicture', '04f39f093e5fd597927a0cd61d8297ae.jpg', '{{ url:site }}files/large/04f39f093e5fd597927a0cd61d8297ae.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 758, '', 0, 1389680676, 0),
('7a90cd32f8a8f5b', 1, 1, 'i', 'locationpicture', '4c32959a2ff1058eac37ba12470bccae.jpg', '{{ url:site }}files/large/4c32959a2ff1058eac37ba12470bccae.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 51, '', 0, 1387692038, 0),
('8df839a82d0526e', 1, 1, 'i', 'hordinginstallpicture3', 'e9249385dafd4f643791e0d3ecda0541.jpg', '{{ url:site }}files/large/e9249385dafd4f643791e0d3ecda0541.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 39, '', 0, 1389687561, 0),
('954d884cf4f001d', 1, 1, 'i', 'locationpicture', 'd4e72f02228f0fc2c12af52045334d85.jpg', '{{ url:site }}files/large/d4e72f02228f0fc2c12af52045334d85.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 51, '', 0, 1387692219, 0),
('965c1e8ed0cbe2e', 1, 1, 'i', 'hordinginstallpicture', '6831fe0230c0b3d556caa58f8c828829.jpg', '{{ url:site }}files/large/6831fe0230c0b3d556caa58f8c828829.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 5, '', 0, 1387410785, 0),
('98e0385ff93644f', 1, 1, 'i', 'gggg', 'e4e55c966942b858703c4c293b1b837e.jpg', '{{ url:site }}files/large/e4e55c966942b858703c4c293b1b837e.jpg', '', '.jpg', 'image/jpeg', '', 1024, 768, 606, '', 0, 1387125970, 0),
('9e1916796f494cf', 1, 1, 'i', 'locationpicture', 'cb431b2d5a7437ccee7bb0cb33f7a9ec.jpg', '{{ url:site }}files/large/cb431b2d5a7437ccee7bb0cb33f7a9ec.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 763, '', 0, 1387127354, 0),
('aac8251bc90e7cf', 1, 1, 'i', 'hordinginstallpicture', 'e1186fb6819d2354b104d565eef6e993.jpg', '{{ url:site }}files/large/e1186fb6819d2354b104d565eef6e993.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 14, '', 0, 1387177730, 0),
('b5254754b7f3e01', 1, 1, 'i', 'locationpicture', 'e4467b4cc507b0412da53d6b77f12627.jpg', '{{ url:site }}files/large/e4467b4cc507b0412da53d6b77f12627.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 548, '', 0, 1387179871, 0),
('baaf3f9064a9fbc', 1, 1, 'i', 'locationpicture', 'a157c744ef08742d1814801c2872f510.jpg', '{{ url:site }}files/large/a157c744ef08742d1814801c2872f510.jpg', '', '.jpg', 'image/jpeg', '', 1024, 768, 763, '', 0, 1387127239, 0),
('c0d72d6bf7c6833', 1, 1, 'i', 'locationpicture', '8c275d6b63575c3897150309b0dd222c.jpg', '{{ url:site }}files/large/8c275d6b63575c3897150309b0dd222c.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 606, '', 0, 1387130641, 0),
('c5c28620f4bf90c', 1, 1, 'i', 'locationpicture', 'd04f7cfe9468edb03280e20c48279ecf.jpg', '{{ url:site }}files/large/d04f7cfe9468edb03280e20c48279ecf.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 40, '', 0, 1389075067, 0),
('c771b5dfba31857', 1, 1, 'i', 'locationpicture', '40a1a4c45f6419eb7ed8ebc2e9cb085d.jpg', '{{ url:site }}files/large/40a1a4c45f6419eb7ed8ebc2e9cb085d.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 51, '', 0, 1387692537, 0),
('ccc64a54d06f226', 1, 1, 'i', 'locationpicture', 'd99c43164882b05fa07297caffcbd355.jpg', '{{ url:site }}files/large/d99c43164882b05fa07297caffcbd355.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 51, '', 0, 1387692243, 0),
('cda19f696058ba3', 1, 1, 'i', 'locationpicture', 'ef666e9319f0fc889a63f1362ad7027c.png', '{{ url:site }}files/large/ef666e9319f0fc889a63f1362ad7027c.png', '', '.png', 'image/png', '', 400, 200, 47, '', 0, 1387128986, 0),
('ce1989a3b6b12af', 1, 1, 'i', 'locationpicture', '44032a5ff93d2c505c5b6c35e1063a1a.jpg', '{{ url:site }}files/large/44032a5ff93d2c505c5b6c35e1063a1a.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 763, '', 0, 1389680021, 0),
('d34f799aa9eb52f', 1, 1, 'i', 'locationpicture', 'b96fe06798285185f69275eafd94a4e6.jpg', '{{ url:site }}files/large/b96fe06798285185f69275eafd94a4e6.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 763, '', 0, 1387179937, 0),
('e0ab1549c3672bf', 1, 1, 'i', 'locationpicture', '22264f30ea190a9e975f7b02993e0223.png', '{{ url:site }}files/large/22264f30ea190a9e975f7b02993e0223.png', '', '.png', 'image/png', '', 400, 200, 47, '', 0, 1387128835, 0),
('e471668b76d06cd', 1, 1, 'i', 'locationpicture', '0922789f37b4046a0b40b2ada95890ab.jpg', '{{ url:site }}files/large/0922789f37b4046a0b40b2ada95890ab.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 763, '', 0, 1387130183, 0),
('eada771df0ff1a5', 1, 1, 'i', 'locationpicture', '4124dca8c8db25403daaf5305051cf0e.jpg', '{{ url:site }}files/large/4124dca8c8db25403daaf5305051cf0e.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 758, '', 0, 1387127416, 0),
('f1868cfc608ddf1', 1, 1, 'i', 'locationpicture', '4f904132abdc03ca16a59d5adc484ba5.jpg', '{{ url:site }}files/large/4f904132abdc03ca16a59d5adc484ba5.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 101, '', 0, 1387177638, 0),
('f47dd16719803db', 1, 1, 'i', 'hordinginstallpicture2', '1c55d8b680086996b7ed04ca9c35b3f5.jpg', '{{ url:site }}files/large/1c55d8b680086996b7ed04ca9c35b3f5.jpg', '', '.jpg', 'image/jpeg', '', 400, 200, 53, '', 0, 1389687561, 0);

-- --------------------------------------------------------

--
-- Table structure for table `default_file_folders`
--

CREATE TABLE IF NOT EXISTS `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `default_file_folders`
--

INSERT INTO `default_file_folders` (`id`, `parent_id`, `slug`, `name`, `location`, `remote_container`, `date_added`, `sort`, `hidden`) VALUES
(1, 1, 'testinguploadnavin', 'testinguploadnavin', 'local', '', 1387123924, 1387123924, 0),
(2, 1, 'testinguploadnavin-1', 'testinguploadnavin-1', 'local', '', 1387124297, 1387124297, 0),
(3, 1, 'testinguploadnavin-2', 'testinguploadnavin-2', 'local', '', 1387125779, 1387125779, 0),
(4, 1, 'testinguploadnavin-3', 'testinguploadnavin-3', 'local', '', 1387125810, 1387125810, 0);

-- --------------------------------------------------------

--
-- Table structure for table `default_groups`
--

CREATE TABLE IF NOT EXISTS `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `default_groups`
--

INSERT INTO `default_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'user', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `default_hoarding_installed`
--

CREATE TABLE IF NOT EXISTS `default_hoarding_installed` (
  `hording_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `size` varchar(100) NOT NULL,
  `landlord_id` int(11) DEFAULT NULL,
  `dealer_id` int(11) NOT NULL,
  `labour_id` int(11) NOT NULL,
  `painter_id` int(11) DEFAULT NULL,
  `municipal_id` int(11) NOT NULL,
  `tenure_aggrement_id` int(11) NOT NULL,
  `hording_status` int(1) NOT NULL COMMENT '1 installed, 2 not installed',
  `picture_name` varchar(300) DEFAULT NULL,
  `picture_name2` varchar(300) DEFAULT NULL,
  `picture_name3` varchar(300) DEFAULT NULL,
  `comments` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`hording_install_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `default_hoarding_installed`
--

INSERT INTO `default_hoarding_installed` (`hording_install_id`, `client_id`, `location_id`, `size`, `landlord_id`, `dealer_id`, `labour_id`, `painter_id`, `municipal_id`, `tenure_aggrement_id`, `hording_status`, `picture_name`, `picture_name2`, `picture_name3`, `comments`, `created`, `updated`) VALUES
(1, 15, 4, '90by 90', NULL, 1, 1, 1, 1, 1, 2, '715395084af1c12a7b391dd969705a2d.jpg', 'c94a7c879695ae9197097f93aa874940.jpg', '0b0d842f3f0551557ca65c4a3e122e90.jpg', 'Payment for this hording is very crucial.', '2013-12-14 04:17:09', '2014-03-17 12:43:52'),
(2, 16, 5, '90 by 90', NULL, 0, 0, 0, 0, 2, 1, '8aac8fb3a3f1a37ffe3cde4ec4b55a17.jpg', NULL, NULL, 'Flex need to be changed in about every 2 weeks', '2013-12-14 04:19:00', '2014-01-13 13:18:08'),
(3, 17, 8, '80 by 80', NULL, 0, 0, 0, 0, 3, 1, 'b9b8cfccc9abb771de040005a57bca8b.jpg', '1c55d8b680086996b7ed04ca9c35b3f5.jpg', 'e9249385dafd4f643791e0d3ecda0541.jpg', 'Reliance mobile broadband hording.', '2013-12-14 04:20:42', '2014-01-14 19:19:21'),
(4, 18, 13, '80 by 80', 22, 1, 1, 1, 2, 4, 1, NULL, NULL, NULL, 'Flex change 5 days after.', '2013-12-14 04:21:57', '2013-12-14 21:51:57'),
(5, 15, 14, '80 by 80', 20, 1, 1, 1, 1, 5, 2, NULL, NULL, NULL, 'This is new hording customer.', '2013-12-14 04:23:06', '2014-03-17 17:37:27'),
(6, 16, 15, '80 by 80', 21, 1, 1, 1, 2, 6, 1, NULL, NULL, NULL, 'New hording material applied.', '2013-12-14 04:24:23', '2013-12-14 21:54:23'),
(7, 14, 16, '80 by 80', 20, 1, 1, 1, 1, 7, 1, NULL, NULL, NULL, 'nothing', '2013-12-14 04:25:39', '2013-12-14 21:55:39'),
(8, 15, 12, '90by 90', 6, 0, 0, 0, 0, 8, 1, NULL, NULL, NULL, 'no dues', '2013-12-14 04:26:18', '2013-12-14 21:56:18'),
(9, 15, 17, '90 by 90', 20, 1, 1, 1, 1, 9, 1, NULL, NULL, NULL, '', '2013-12-14 04:27:03', '2013-12-14 21:57:03'),
(10, 14, 18, '90 by 90', 6, 0, 0, 0, 0, 21, 1, 'd2c7228cd3aeb7bcb2a5655c714cca3a.jpg', NULL, NULL, '', '2013-12-15 06:15:33', '2013-12-15 23:47:57'),
(11, 17, 1613, '90 by 90', NULL, 36, 0, 34, 8, 22, 1, 'bf16f0b7b9740c8678570a6bb79282dc.jpg', 'e855244161287664b2b79710576aa2db.jpg', '919c4a11374ab78f89c8e92903a73d3e.jpg', 'check install', '2014-01-13 07:33:54', '2014-01-13 13:03:54'),
(12, 54, 1619, '90 by 90', NULL, 56, 58, 59, 57, 24, 1, '04f39f093e5fd597927a0cd61d8297ae.jpg', 'a9738d69835f0af2a2f3fa1c025f6636.jpg', '182c179c8f70c9ab4b7cf4e90e525e14.jpg', 'test new upload test', '2014-01-14 05:24:36', '2014-01-14 17:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `default_installments`
--

CREATE TABLE IF NOT EXISTS `default_installments` (
  `installment_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` int(11) NOT NULL,
  `ref_type` int(4) NOT NULL,
  `pay_date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1 pending, 2 paid',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`installment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=125 ;

--
-- Dumping data for table `default_installments`
--

INSERT INTO `default_installments` (`installment_id`, `ref_id`, `ref_type`, `pay_date`, `amount`, `status`, `created`, `updated`) VALUES
(15, 4, 1, '2013-12-18', 8000, 1, '2013-12-14 04:21:57', '2013-12-14 21:51:58'),
(16, 4, 1, '2013-12-31', 26000, 1, '2013-12-14 04:21:57', '2013-12-14 21:51:58'),
(17, 5, 1, '2013-12-24', 9900, 1, '2013-12-14 04:23:06', '2013-12-14 21:53:06'),
(18, 5, 1, '2014-01-18', 39100, 1, '2013-12-14 04:23:06', '2013-12-14 21:53:06'),
(19, 6, 1, '2014-01-10', 60000, 1, '2013-12-14 04:24:23', '2013-12-14 21:54:23'),
(20, 6, 1, '2014-02-21', 5000, 1, '2013-12-14 04:24:23', '2013-12-14 21:54:23'),
(21, 7, 1, '2014-01-11', 500, 1, '2013-12-14 04:25:39', '2013-12-14 21:55:39'),
(22, 7, 1, '2014-01-25', 500, 1, '2013-12-14 04:25:39', '2013-12-14 21:55:39'),
(23, 7, 1, '2014-01-31', 87358, 1, '2013-12-14 04:25:39', '2013-12-14 21:55:39'),
(24, 10, 3, '2013-12-18', 800, 1, '2013-12-14 04:28:14', '2013-12-14 21:58:15'),
(25, 10, 3, '2014-01-24', 800, 1, '2013-12-14 04:28:14', '2013-12-14 21:58:15'),
(26, 10, 3, '2014-01-31', 800, 1, '2013-12-14 04:28:14', '2013-12-14 21:58:15'),
(27, 10, 3, '2014-02-21', 70000, 1, '2013-12-14 04:28:14', '2013-12-14 21:58:15'),
(31, 12, 3, '2013-12-18', 500, 1, '2013-12-14 04:37:49', '2013-12-14 22:07:50'),
(32, 12, 3, '2014-01-10', 5600, 1, '2013-12-14 04:37:49', '2013-12-14 22:07:50'),
(33, 12, 3, '2014-03-14', 7895, 1, '2013-12-14 04:37:49', '2013-12-14 22:07:50'),
(34, 12, 3, '2014-03-31', 973159, 1, '2013-12-14 04:37:49', '2013-12-14 22:07:50'),
(35, 14, 3, '2013-12-19', 7984, 1, '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(36, 14, 3, '2013-12-31', 3987, 1, '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(37, 14, 3, '2014-01-10', 9874, 1, '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(38, 14, 3, '2014-01-24', 2854, 1, '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(39, 14, 3, '2014-01-31', 9875, 1, '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(40, 14, 3, '2014-02-14', 7984, 1, '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(41, 14, 3, '2014-02-28', 935242, 1, '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(42, 16, 2, '2013-12-18', 500, 1, '2013-12-14 04:44:55', '2013-12-14 22:14:55'),
(43, 16, 2, '2013-12-31', 500, 1, '2013-12-14 04:44:55', '2013-12-14 22:14:55'),
(44, 16, 2, '2014-01-17', 8374, 1, '2013-12-14 04:44:55', '2013-12-14 22:14:55'),
(45, 17, 2, '2013-12-31', 887780, 1, '2013-12-14 04:45:25', '2013-12-14 22:15:25'),
(46, 18, 2, '2013-12-18', 500, 1, '2013-12-14 04:46:14', '2013-12-14 22:16:14'),
(47, 18, 2, '2014-01-03', 500, 1, '2013-12-14 04:46:14', '2013-12-14 22:16:14'),
(48, 18, 2, '2014-01-31', 87871, 1, '2013-12-14 04:46:14', '2013-12-14 22:16:14'),
(50, 21, 1, '2013-12-24', 121213, 1, '2013-12-15 06:17:57', '2013-12-15 23:47:57'),
(96, 1, 1, '2013-12-27', 500, 1, '2014-01-11 03:19:13', '2014-01-11 20:49:13'),
(97, 1, 1, '2014-01-10', 5000, 1, '2014-01-11 03:19:13', '2014-01-11 20:49:13'),
(98, 1, 1, '2014-01-31', 5000, 1, '2014-01-11 03:19:13', '2014-01-11 20:49:13'),
(99, 1, 1, '2014-02-07', 8000, 1, '2014-01-11 03:19:13', '2014-01-11 20:49:13'),
(100, 1, 1, '2014-02-28', 70600, 1, '2014-01-11 03:19:13', '2014-01-11 20:49:13'),
(101, 22, 1, '2014-01-15', 5000, 1, '2014-01-13 07:33:54', '2014-01-13 13:03:54'),
(102, 22, 1, '2014-01-28', 5000, 1, '2014-01-13 07:33:54', '2014-01-13 13:03:54'),
(103, 22, 1, '2014-01-31', 5000, 1, '2014-01-13 07:33:54', '2014-01-13 13:03:54'),
(104, 2, 1, '2013-12-25', 8000, 1, '2014-01-13 07:48:08', '2014-01-13 13:18:08'),
(105, 2, 1, '2014-01-31', 9000, 1, '2014-01-13 07:48:08', '2014-01-13 13:18:08'),
(106, 2, 1, '2014-02-28', 10000, 1, '2014-01-13 07:48:08', '2014-01-13 13:18:08'),
(107, 2, 1, '2014-03-28', 12000, 1, '2014-01-13 07:48:08', '2014-01-13 13:18:08'),
(108, 2, 1, '2014-04-25', 48000, 1, '2014-01-13 07:48:08', '2014-01-13 13:18:08'),
(110, 13, 3, '2014-01-22', 7916, 1, '2014-01-13 09:54:54', '2014-01-13 15:24:54'),
(114, 11, 3, '2013-12-17', 1500, 1, '2014-01-13 09:55:37', '2014-01-13 15:25:37'),
(115, 11, 3, '2013-12-26', 1500, 1, '2014-01-13 09:55:37', '2014-01-13 15:25:37'),
(116, 11, 3, '2013-12-31', 9774755, 1, '2014-01-13 09:55:37', '2014-01-13 15:25:37'),
(117, 23, 3, '2014-01-31', 6000, 1, '2014-01-13 09:59:26', '2014-01-13 15:29:26'),
(118, 24, 1, '2014-01-21', 2000, 1, '2014-01-14 05:24:36', '2014-01-14 17:24:36'),
(119, 24, 1, '2014-01-31', 4000, 1, '2014-01-14 05:24:36', '2014-01-14 17:24:36'),
(120, 25, 3, '2014-01-31', 8888, 1, '2014-01-14 05:30:12', '2014-01-14 17:30:12'),
(121, 3, 1, '2013-12-18', 12000, 1, '2014-01-14 07:19:21', '2014-01-14 19:19:21'),
(122, 3, 1, '2013-12-31', 15000, 1, '2014-01-14 07:19:21', '2014-01-14 19:19:21'),
(123, 3, 1, '2014-01-10', 16000, 1, '2014-01-14 07:19:21', '2014-01-14 19:19:21'),
(124, 3, 1, '2014-01-31', 31000, 1, '2014-01-14 07:19:21', '2014-01-14 19:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `default_keywords`
--

CREATE TABLE IF NOT EXISTS `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_keywords`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_keywords_applied`
--

CREATE TABLE IF NOT EXISTS `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_keywords_applied`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_migrations`
--

CREATE TABLE IF NOT EXISTS `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_migrations`
--

INSERT INTO `default_migrations` (`version`) VALUES
(128);

-- --------------------------------------------------------

--
-- Table structure for table `default_modules`
--

CREATE TABLE IF NOT EXISTS `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `default_modules`
--

INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(1, 'a:25:{s:2:"en";s:8:"Settings";s:2:"ar";s:18:"الإعدادات";s:2:"br";s:15:"Configurações";s:2:"pt";s:15:"Configurações";s:2:"cs";s:10:"Nastavení";s:2:"da";s:13:"Indstillinger";s:2:"de";s:13:"Einstellungen";s:2:"el";s:18:"Ρυθμίσεις";s:2:"es";s:15:"Configuraciones";s:2:"fa";s:14:"تنظیمات";s:2:"fi";s:9:"Asetukset";s:2:"fr";s:11:"Paramètres";s:2:"he";s:12:"הגדרות";s:2:"id";s:10:"Pengaturan";s:2:"it";s:12:"Impostazioni";s:2:"lt";s:10:"Nustatymai";s:2:"nl";s:12:"Instellingen";s:2:"pl";s:10:"Ustawienia";s:2:"ru";s:18:"Настройки";s:2:"sl";s:10:"Nastavitve";s:2:"tw";s:12:"網站設定";s:2:"cn";s:12:"网站设定";s:2:"hu";s:14:"Beállítások";s:2:"th";s:21:"ตั้งค่า";s:2:"se";s:14:"Inställningar";}', 'settings', '1.0.0', NULL, 'a:25:{s:2:"en";s:89:"Allows administrators to update settings like Site Name, messages and email address, etc.";s:2:"ar";s:161:"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.";s:2:"br";s:120:"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.";s:2:"pt";s:113:"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.";s:2:"cs";s:102:"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.";s:2:"da";s:90:"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.";s:2:"de";s:92:"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.";s:2:"el";s:230:"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.";s:2:"es";s:131:"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.";s:2:"fa";s:105:"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود";s:2:"fi";s:105:"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.";s:2:"fr";s:118:"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.";s:2:"he";s:116:"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו";s:2:"id";s:112:"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.";s:2:"it";s:109:"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.";s:2:"lt";s:104:"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.";s:2:"nl";s:114:"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.";s:2:"pl";s:103:"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.";s:2:"ru";s:135:"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.";s:2:"sl";s:98:"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.";s:2:"tw";s:99:"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。";s:2:"cn";s:99:"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。";s:2:"hu";s:125:"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...";s:2:"th";s:232:"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น";s:2:"se";s:84:"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.";}', 1, 0, 1, 'settings', 1, 1, 1, 1386006895),
(2, 'a:11:{s:2:"en";s:12:"Streams Core";s:2:"pt";s:14:"Núcleo Fluxos";s:2:"fr";s:10:"Noyau Flux";s:2:"el";s:23:"Πυρήνας Ροών";s:2:"se";s:18:"Streams grundmodul";s:2:"tw";s:14:"Streams 核心";s:2:"cn";s:14:"Streams 核心";s:2:"ar";s:31:"الجداول الأساسية";s:2:"it";s:12:"Streams Core";s:2:"fa";s:26:"هسته استریم ها";s:2:"fi";s:13:"Striimit ydin";}', 'streams_core', '1.0.0', NULL, 'a:11:{s:2:"en";s:29:"Core data module for streams.";s:2:"pt";s:37:"Módulo central de dados para fluxos.";s:2:"fr";s:32:"Noyau de données pour les Flux.";s:2:"el";s:113:"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.";s:2:"se";s:50:"Streams grundmodul för enklare hantering av data.";s:2:"tw";s:29:"Streams 核心資料模組。";s:2:"cn";s:29:"Streams 核心资料模组。";s:2:"ar";s:57:"وحدة البيانات الأساسية للجداول";s:2:"it";s:17:"Core dello Stream";s:2:"fa";s:48:"ماژول مرکزی برای استریم ها";s:2:"fi";s:48:"Ydin datan hallinoiva moduuli striimejä varten.";}', 1, 0, 0, '0', 1, 1, 1, 1386006895),
(3, 'a:21:{s:2:"en";s:15:"Email Templates";s:2:"ar";s:48:"قوالب الرسائل الإلكترونية";s:2:"br";s:17:"Modelos de e-mail";s:2:"pt";s:17:"Modelos de e-mail";s:2:"da";s:16:"Email skabeloner";s:2:"el";s:22:"Δυναμικά email";s:2:"es";s:19:"Plantillas de email";s:2:"fa";s:26:"قالب های ایمیل";s:2:"fr";s:17:"Modèles d''emails";s:2:"he";s:12:"תבניות";s:2:"id";s:14:"Template Email";s:2:"lt";s:22:"El. laiškų šablonai";s:2:"nl";s:15:"Email sjablonen";s:2:"ru";s:25:"Шаблоны почты";s:2:"sl";s:14:"Email predloge";s:2:"tw";s:12:"郵件範本";s:2:"cn";s:12:"邮件范本";s:2:"hu";s:15:"E-mail sablonok";s:2:"fi";s:25:"Sähköposti viestipohjat";s:2:"th";s:33:"แม่แบบอีเมล";s:2:"se";s:12:"E-postmallar";}', 'templates', '1.1.0', NULL, 'a:21:{s:2:"en";s:46:"Create, edit, and save dynamic email templates";s:2:"ar";s:97:"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.";s:2:"br";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"pt";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"da";s:49:"Opret, redigér og gem dynamiske emailskabeloner.";s:2:"el";s:108:"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.";s:2:"es";s:54:"Crear, editar y guardar plantillas de email dinámicas";s:2:"fa";s:92:"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا";s:2:"fr";s:61:"Créer, éditer et sauver dynamiquement des modèles d''emails";s:2:"he";s:54:"ניהול של תבניות דואר אלקטרוני";s:2:"id";s:55:"Membuat, mengedit, dan menyimpan template email dinamis";s:2:"lt";s:58:"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.";s:2:"nl";s:49:"Maak, bewerk, en beheer dynamische emailsjablonen";s:2:"ru";s:127:"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны";s:2:"sl";s:52:"Ustvari, uredi in shrani spremenljive email predloge";s:2:"tw";s:61:"新增、編輯與儲存可顯示動態資料的 email 範本";s:2:"cn";s:61:"新增、编辑与储存可显示动态资料的 email 范本";s:2:"hu";s:63:"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat";s:2:"fi";s:66:"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.";s:2:"th";s:129:"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก";s:2:"se";s:49:"Skapa, redigera och spara dynamiska E-postmallar.";}', 1, 0, 1, 'structure', 1, 1, 1, 1386006895),
(4, 'a:25:{s:2:"en";s:7:"Add-ons";s:2:"ar";s:16:"الإضافات";s:2:"br";s:12:"Complementos";s:2:"pt";s:12:"Complementos";s:2:"cs";s:8:"Doplňky";s:2:"da";s:7:"Add-ons";s:2:"de";s:13:"Erweiterungen";s:2:"el";s:16:"Πρόσθετα";s:2:"es";s:9:"Agregados";s:2:"fa";s:17:"افزونه ها";s:2:"fi";s:9:"Lisäosat";s:2:"fr";s:10:"Extensions";s:2:"he";s:12:"תוספות";s:2:"id";s:7:"Pengaya";s:2:"it";s:7:"Add-ons";s:2:"lt";s:7:"Priedai";s:2:"nl";s:7:"Add-ons";s:2:"pl";s:12:"Rozszerzenia";s:2:"ru";s:20:"Дополнения";s:2:"sl";s:11:"Razširitve";s:2:"tw";s:12:"附加模組";s:2:"cn";s:12:"附加模组";s:2:"hu";s:14:"Bővítmények";s:2:"th";s:27:"ส่วนเสริม";s:2:"se";s:8:"Tillägg";}', 'addons', '2.0.0', NULL, 'a:25:{s:2:"en";s:59:"Allows admins to see a list of currently installed modules.";s:2:"ar";s:91:"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.";s:2:"br";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"pt";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"cs";s:68:"Umožňuje administrátorům vidět seznam nainstalovaných modulů.";s:2:"da";s:63:"Lader administratorer se en liste over de installerede moduler.";s:2:"de";s:56:"Zeigt Administratoren alle aktuell installierten Module.";s:2:"el";s:152:"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.";s:2:"es";s:71:"Permite a los administradores ver una lista de los módulos instalados.";s:2:"fa";s:93:"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت";s:2:"fi";s:60:"Listaa järjestelmänvalvojalle käytössä olevat moduulit.";s:2:"fr";s:66:"Permet aux administrateurs de voir la liste des modules installés";s:2:"he";s:160:"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים";s:2:"id";s:57:"Memperlihatkan kepada admin daftar modul yang terinstall.";s:2:"it";s:83:"Permette agli amministratori di vedere una lista dei moduli attualmente installati.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:79:"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.";s:2:"pl";s:81:"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.";s:2:"ru";s:83:"Список модулей, которые установлены на сайте.";s:2:"sl";s:65:"Dovoljuje administratorjem pregled trenutno nameščenih modulov.";s:2:"tw";s:54:"管理員可以檢視目前已經安裝模組的列表";s:2:"cn";s:54:"管理员可以检视目前已经安装模组的列表";s:2:"hu";s:79:"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.";s:2:"th";s:162:"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน";s:2:"se";s:67:"Gör det möjligt för administratören att se installerade mouler.";}', 0, 0, 1, '0', 1, 1, 1, 1386006895),
(5, 'a:17:{s:2:"en";s:4:"Blog";s:2:"ar";s:16:"المدوّنة";s:2:"br";s:4:"Blog";s:2:"pt";s:4:"Blog";s:2:"el";s:18:"Ιστολόγιο";s:2:"fa";s:8:"بلاگ";s:2:"he";s:8:"בלוג";s:2:"id";s:4:"Blog";s:2:"lt";s:6:"Blogas";s:2:"pl";s:4:"Blog";s:2:"ru";s:8:"Блог";s:2:"tw";s:6:"文章";s:2:"cn";s:6:"文章";s:2:"hu";s:4:"Blog";s:2:"fi";s:5:"Blogi";s:2:"th";s:15:"บล็อก";s:2:"se";s:5:"Blogg";}', 'blog', '2.0.0', NULL, 'a:25:{s:2:"en";s:18:"Post blog entries.";s:2:"ar";s:48:"أنشر المقالات على مدوّنتك.";s:2:"br";s:30:"Escrever publicações de blog";s:2:"pt";s:39:"Escrever e editar publicações no blog";s:2:"cs";s:49:"Publikujte nové články a příspěvky na blog.";s:2:"da";s:17:"Skriv blogindlæg";s:2:"de";s:47:"Veröffentliche neue Artikel und Blog-Einträge";s:2:"sl";s:23:"Objavite blog prispevke";s:2:"fi";s:28:"Kirjoita blogi artikkeleita.";s:2:"el";s:93:"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.";s:2:"es";s:54:"Escribe entradas para los artículos y blog (web log).";s:2:"fa";s:44:"مقالات منتشر شده در بلاگ";s:2:"fr";s:34:"Poster des articles d''actualités.";s:2:"he";s:19:"ניהול בלוג";s:2:"id";s:15:"Post entri blog";s:2:"it";s:36:"Pubblica notizie e post per il blog.";s:2:"lt";s:40:"Rašykite naujienas bei blog''o įrašus.";s:2:"nl";s:41:"Post nieuwsartikelen en blogs op uw site.";s:2:"pl";s:27:"Dodawaj nowe wpisy na blogu";s:2:"ru";s:49:"Управление записями блога.";s:2:"tw";s:42:"發表新聞訊息、部落格等文章。";s:2:"cn";s:42:"发表新闻讯息、部落格等文章。";s:2:"th";s:48:"โพสต์รายการบล็อก";s:2:"hu";s:32:"Blog bejegyzések létrehozása.";s:2:"se";s:18:"Inlägg i bloggen.";}', 1, 1, 1, 'content', 1, 1, 1, 1386006895),
(6, 'a:25:{s:2:"en";s:8:"Comments";s:2:"ar";s:18:"التعليقات";s:2:"br";s:12:"Comentários";s:2:"pt";s:12:"Comentários";s:2:"cs";s:11:"Komentáře";s:2:"da";s:11:"Kommentarer";s:2:"de";s:10:"Kommentare";s:2:"el";s:12:"Σχόλια";s:2:"es";s:11:"Comentarios";s:2:"fi";s:9:"Kommentit";s:2:"fr";s:12:"Commentaires";s:2:"fa";s:10:"نظرات";s:2:"he";s:12:"תגובות";s:2:"id";s:8:"Komentar";s:2:"it";s:8:"Commenti";s:2:"lt";s:10:"Komentarai";s:2:"nl";s:8:"Reacties";s:2:"pl";s:10:"Komentarze";s:2:"ru";s:22:"Комментарии";s:2:"sl";s:10:"Komentarji";s:2:"tw";s:6:"回應";s:2:"cn";s:6:"回应";s:2:"hu";s:16:"Hozzászólások";s:2:"th";s:33:"ความคิดเห็น";s:2:"se";s:11:"Kommentarer";}', 'comments', '1.1.0', NULL, 'a:25:{s:2:"en";s:76:"Users and guests can write comments for content like blog, pages and photos.";s:2:"ar";s:152:"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.";s:2:"br";s:97:"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"pt";s:100:"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"cs";s:100:"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.";s:2:"da";s:83:"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.";s:2:"de";s:65:"Benutzer und Gäste können für fast alles Kommentare schreiben.";s:2:"el";s:224:"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.";s:2:"es";s:130:"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.";s:2:"fa";s:168:"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند";s:2:"fi";s:107:"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.";s:2:"fr";s:130:"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.";s:2:"he";s:94:"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו";s:2:"id";s:100:"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.";s:2:"it";s:85:"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:52:"Gebruikers en gasten kunnen reageren op bijna alles.";s:2:"pl";s:93:"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.";s:2:"ru";s:187:"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.";s:2:"sl";s:89:"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike";s:2:"tw";s:75:"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。";s:2:"cn";s:75:"用户和访客可以针对新闻、页面与照片等内容发表回应。";s:2:"hu";s:117:"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).";s:2:"th";s:240:"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย";s:2:"se";s:98:"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.";}', 0, 0, 1, 'content', 1, 1, 1, 1386006895),
(7, 'a:25:{s:2:"en";s:7:"Contact";s:2:"ar";s:14:"الإتصال";s:2:"br";s:7:"Contato";s:2:"pt";s:8:"Contacto";s:2:"cs";s:7:"Kontakt";s:2:"da";s:7:"Kontakt";s:2:"de";s:7:"Kontakt";s:2:"el";s:22:"Επικοινωνία";s:2:"es";s:8:"Contacto";s:2:"fa";s:18:"تماس با ما";s:2:"fi";s:13:"Ota yhteyttä";s:2:"fr";s:7:"Contact";s:2:"he";s:17:"יצירת קשר";s:2:"id";s:6:"Kontak";s:2:"it";s:10:"Contattaci";s:2:"lt";s:18:"Kontaktinė formą";s:2:"nl";s:7:"Contact";s:2:"pl";s:7:"Kontakt";s:2:"ru";s:27:"Обратная связь";s:2:"sl";s:7:"Kontakt";s:2:"tw";s:12:"聯絡我們";s:2:"cn";s:12:"联络我们";s:2:"hu";s:9:"Kapcsolat";s:2:"th";s:18:"ติดต่อ";s:2:"se";s:7:"Kontakt";}', 'contact', '1.0.0', NULL, 'a:25:{s:2:"en";s:112:"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.";s:2:"ar";s:157:"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.";s:2:"br";s:139:"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.";s:2:"pt";s:116:"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.";s:2:"cs";s:149:"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.";s:2:"da";s:123:"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse";s:2:"de";s:119:"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.";s:2:"el";s:273:"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.";s:2:"fa";s:239:"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.";s:2:"es";s:156:"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.";s:2:"fi";s:128:"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.";s:2:"fr";s:122:"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.";s:2:"he";s:155:"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות";s:2:"id";s:149:"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka";s:2:"it";s:119:"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.";s:2:"lt";s:124:"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.";s:2:"nl";s:125:"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.";s:2:"pl";s:126:"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.";s:2:"ru";s:234:"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.";s:2:"sl";s:113:"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.";s:2:"tw";s:147:"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。";s:2:"cn";s:147:"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。";s:2:"th";s:316:"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา";s:2:"hu";s:156:"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.";s:2:"se";s:53:"Lägger till ett kontaktformulär till din webbplats.";}', 0, 0, 0, '0', 1, 1, 1, 1386006895),
(8, 'a:24:{s:2:"en";s:5:"Files";s:2:"ar";s:16:"الملفّات";s:2:"br";s:8:"Arquivos";s:2:"pt";s:9:"Ficheiros";s:2:"cs";s:7:"Soubory";s:2:"da";s:5:"Filer";s:2:"de";s:7:"Dateien";s:2:"el";s:12:"Αρχεία";s:2:"es";s:8:"Archivos";s:2:"fa";s:13:"فایل ها";s:2:"fi";s:9:"Tiedostot";s:2:"fr";s:8:"Fichiers";s:2:"he";s:10:"קבצים";s:2:"id";s:4:"File";s:2:"it";s:4:"File";s:2:"lt";s:6:"Failai";s:2:"nl";s:9:"Bestanden";s:2:"ru";s:10:"Файлы";s:2:"sl";s:8:"Datoteke";s:2:"tw";s:6:"檔案";s:2:"cn";s:6:"档案";s:2:"hu";s:7:"Fájlok";s:2:"th";s:12:"ไฟล์";s:2:"se";s:5:"Filer";}', 'files', '2.0.0', NULL, 'a:24:{s:2:"en";s:40:"Manages files and folders for your site.";s:2:"ar";s:50:"إدارة ملفات ومجلّدات موقعك.";s:2:"br";s:53:"Permite gerenciar facilmente os arquivos de seu site.";s:2:"pt";s:59:"Permite gerir facilmente os ficheiros e pastas do seu site.";s:2:"cs";s:43:"Spravujte soubory a složky na vašem webu.";s:2:"da";s:41:"Administrer filer og mapper for dit site.";s:2:"de";s:35:"Verwalte Dateien und Verzeichnisse.";s:2:"el";s:100:"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.";s:2:"es";s:43:"Administra archivos y carpetas en tu sitio.";s:2:"fa";s:79:"مدیریت فایل های چند رسانه ای و فولدر ها سایت";s:2:"fi";s:43:"Hallitse sivustosi tiedostoja ja kansioita.";s:2:"fr";s:46:"Gérer les fichiers et dossiers de votre site.";s:2:"he";s:47:"ניהול תיקיות וקבצים שבאתר";s:2:"id";s:42:"Mengatur file dan folder dalam situs Anda.";s:2:"it";s:38:"Gestisci file e cartelle del tuo sito.";s:2:"lt";s:28:"Katalogų ir bylų valdymas.";s:2:"nl";s:41:"Beheer bestanden en mappen op uw website.";s:2:"ru";s:78:"Управление файлами и папками вашего сайта.";s:2:"sl";s:38:"Uredi datoteke in mape na vaši strani";s:2:"tw";s:33:"管理網站中的檔案與目錄";s:2:"cn";s:33:"管理网站中的档案与目录";s:2:"hu";s:41:"Fájlok és mappák kezelése az oldalon.";s:2:"th";s:141:"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ";s:2:"se";s:45:"Hanterar filer och mappar för din webbplats.";}', 0, 0, 1, 'content', 1, 1, 1, 1386006895),
(9, 'a:24:{s:2:"en";s:6:"Groups";s:2:"ar";s:18:"المجموعات";s:2:"br";s:6:"Grupos";s:2:"pt";s:6:"Grupos";s:2:"cs";s:7:"Skupiny";s:2:"da";s:7:"Grupper";s:2:"de";s:7:"Gruppen";s:2:"el";s:12:"Ομάδες";s:2:"es";s:6:"Grupos";s:2:"fa";s:13:"گروه ها";s:2:"fi";s:7:"Ryhmät";s:2:"fr";s:7:"Groupes";s:2:"he";s:12:"קבוצות";s:2:"id";s:4:"Grup";s:2:"it";s:6:"Gruppi";s:2:"lt";s:7:"Grupės";s:2:"nl";s:7:"Groepen";s:2:"ru";s:12:"Группы";s:2:"sl";s:7:"Skupine";s:2:"tw";s:6:"群組";s:2:"cn";s:6:"群组";s:2:"hu";s:9:"Csoportok";s:2:"th";s:15:"กลุ่ม";s:2:"se";s:7:"Grupper";}', 'groups', '1.0.0', NULL, 'a:24:{s:2:"en";s:54:"Users can be placed into groups to manage permissions.";s:2:"ar";s:100:"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.";s:2:"br";s:72:"Usuários podem ser inseridos em grupos para gerenciar suas permissões.";s:2:"pt";s:74:"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.";s:2:"cs";s:77:"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.";s:2:"da";s:49:"Brugere kan inddeles i grupper for adgangskontrol";s:2:"de";s:85:"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.";s:2:"el";s:168:"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.";s:2:"es";s:75:"Los usuarios podrán ser colocados en grupos para administrar sus permisos.";s:2:"fa";s:149:"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد";s:2:"fi";s:84:"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.";s:2:"fr";s:82:"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.";s:2:"he";s:62:"נותן אפשרות לאסוף משתמשים לקבוצות";s:2:"id";s:68:"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.";s:2:"it";s:69:"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.";s:2:"lt";s:67:"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.";s:2:"nl";s:73:"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.";s:2:"ru";s:134:"Пользователей можно объединять в группы, для управления правами доступа.";s:2:"sl";s:64:"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj";s:2:"tw";s:45:"用戶可以依群組分類並管理其權限";s:2:"cn";s:45:"用户可以依群组分类并管理其权限";s:2:"hu";s:73:"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.";s:2:"th";s:84:"สามารถวางผู้ใช้ลงในกลุ่มเพื่";s:2:"se";s:76:"Användare kan delas in i grupper för att hantera roller och behörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1386006895),
(10, 'a:17:{s:2:"en";s:8:"Keywords";s:2:"ar";s:21:"كلمات البحث";s:2:"br";s:14:"Palavras-chave";s:2:"pt";s:14:"Palavras-chave";s:2:"da";s:9:"Nøgleord";s:2:"el";s:27:"Λέξεις Κλειδιά";s:2:"fa";s:21:"کلمات کلیدی";s:2:"fr";s:10:"Mots-Clés";s:2:"id";s:10:"Kata Kunci";s:2:"nl";s:14:"Sleutelwoorden";s:2:"tw";s:6:"鍵詞";s:2:"cn";s:6:"键词";s:2:"hu";s:11:"Kulcsszavak";s:2:"fi";s:10:"Avainsanat";s:2:"sl";s:15:"Ključne besede";s:2:"th";s:15:"คำค้น";s:2:"se";s:9:"Nyckelord";}', 'keywords', '1.1.0', NULL, 'a:17:{s:2:"en";s:71:"Maintain a central list of keywords to label and organize your content.";s:2:"ar";s:124:"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.";s:2:"br";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"pt";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"da";s:72:"Vedligehold en central liste af nøgleord for at organisere dit indhold.";s:2:"el";s:181:"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.";s:2:"fa";s:110:"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا";s:2:"fr";s:87:"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.";s:2:"id";s:71:"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.";s:2:"nl";s:91:"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.";s:2:"tw";s:64:"集中管理可用於標題與內容的鍵詞(keywords)列表。";s:2:"cn";s:64:"集中管理可用于标题与内容的键词(keywords)列表。";s:2:"hu";s:65:"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.";s:2:"fi";s:92:"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.";s:2:"sl";s:82:"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.";s:2:"th";s:189:"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ";s:2:"se";s:61:"Hantera nyckelord för att organisera webbplatsens innehåll.";}', 0, 0, 1, 'data', 1, 1, 1, 1386006895),
(11, 'a:15:{s:2:"en";s:11:"Maintenance";s:2:"pt";s:12:"Manutenção";s:2:"ar";s:14:"الصيانة";s:2:"el";s:18:"Συντήρηση";s:2:"hu";s:13:"Karbantartás";s:2:"fa";s:15:"نگه داری";s:2:"fi";s:9:"Ylläpito";s:2:"fr";s:11:"Maintenance";s:2:"id";s:12:"Pemeliharaan";s:2:"it";s:12:"Manutenzione";s:2:"se";s:10:"Underhåll";s:2:"sl";s:12:"Vzdrževanje";s:2:"th";s:39:"การบำรุงรักษา";s:2:"tw";s:6:"維護";s:2:"cn";s:6:"维护";}', 'maintenance', '1.0.0', NULL, 'a:15:{s:2:"en";s:63:"Manage the site cache and export information from the database.";s:2:"pt";s:68:"Gerir o cache do seu site e exportar informações da base de dados.";s:2:"ar";s:81:"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.";s:2:"el";s:142:"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.";s:2:"id";s:60:"Mengatur cache situs dan mengexport informasi dari database.";s:2:"it";s:65:"Gestisci la cache del sito e esporta le informazioni dal database";s:2:"fa";s:73:"مدیریت کش سایت و صدور اطلاعات از دیتابیس";s:2:"fr";s:71:"Gérer le cache du site et exporter les contenus de la base de données";s:2:"fi";s:59:"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.";s:2:"hu";s:66:"Az oldal gyorsítótár kezelése és az adatbázis exportálása.";s:2:"se";s:76:"Underhåll webbplatsens cache och exportera data från webbplatsens databas.";s:2:"sl";s:69:"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.";s:2:"th";s:150:"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล";s:2:"tw";s:45:"經由管理介面手動刪除暫存資料。";s:2:"cn";s:45:"经由管理介面手动删除暂存资料。";}', 0, 0, 1, 'data', 1, 1, 1, 1386006895),
(12, 'a:25:{s:2:"en";s:10:"Navigation";s:2:"ar";s:14:"الروابط";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"cs";s:8:"Navigace";s:2:"da";s:10:"Navigation";s:2:"de";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"es";s:11:"Navegación";s:2:"fa";s:11:"منو ها";s:2:"fi";s:10:"Navigointi";s:2:"fr";s:10:"Navigation";s:2:"he";s:10:"ניווט";s:2:"id";s:8:"Navigasi";s:2:"it";s:11:"Navigazione";s:2:"lt";s:10:"Navigacija";s:2:"nl";s:9:"Navigatie";s:2:"pl";s:9:"Nawigacja";s:2:"ru";s:18:"Навигация";s:2:"sl";s:10:"Navigacija";s:2:"tw";s:12:"導航選單";s:2:"cn";s:12:"导航选单";s:2:"th";s:36:"ตัวช่วยนำทาง";s:2:"hu";s:11:"Navigáció";s:2:"se";s:10:"Navigation";}', 'navigation', '1.1.0', NULL, 'a:25:{s:2:"en";s:78:"Manage links on navigation menus and all the navigation groups they belong to.";s:2:"ar";s:85:"إدارة روابط وقوائم ومجموعات الروابط في الموقع.";s:2:"br";s:91:"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.";s:2:"pt";s:93:"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.";s:2:"cs";s:73:"Správa odkazů v navigaci a všech souvisejících navigačních skupin.";s:2:"da";s:82:"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.";s:2:"de";s:76:"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen";s:2:"el";s:207:"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.";s:2:"es";s:102:"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.";s:2:"fa";s:68:"مدیریت منو ها و گروه های مربوط به آنها";s:2:"fi";s:91:"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.";s:2:"fr";s:97:"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.";s:2:"he";s:73:"ניהול שלוחות תפריטי ניווט וקבוצות ניווט";s:2:"id";s:73:"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.";s:2:"it";s:97:"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.";s:2:"lt";s:95:"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.";s:2:"nl";s:92:"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.";s:2:"pl";s:95:"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.";s:2:"ru";s:136:"Управление ссылками в меню навигации и группах, к которым они принадлежат.";s:2:"sl";s:64:"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.";s:2:"tw";s:72:"管理導航選單中的連結，以及它們所隸屬的導航群組。";s:2:"cn";s:72:"管理导航选单中的连结，以及它们所隶属的导航群组。";s:2:"th";s:108:"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง";s:2:"se";s:33:"Hantera länkar och länkgrupper.";s:2:"hu";s:100:"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.";}', 0, 0, 1, 'structure', 1, 1, 1, 1386006895),
(13, 'a:25:{s:2:"en";s:5:"Pages";s:2:"ar";s:14:"الصفحات";s:2:"br";s:8:"Páginas";s:2:"pt";s:8:"Páginas";s:2:"cs";s:8:"Stránky";s:2:"da";s:5:"Sider";s:2:"de";s:6:"Seiten";s:2:"el";s:14:"Σελίδες";s:2:"es";s:8:"Páginas";s:2:"fa";s:14:"صفحه ها ";s:2:"fi";s:5:"Sivut";s:2:"fr";s:5:"Pages";s:2:"he";s:8:"דפים";s:2:"id";s:7:"Halaman";s:2:"it";s:6:"Pagine";s:2:"lt";s:9:"Puslapiai";s:2:"nl";s:13:"Pagina&apos;s";s:2:"pl";s:6:"Strony";s:2:"ru";s:16:"Страницы";s:2:"sl";s:6:"Strani";s:2:"tw";s:6:"頁面";s:2:"cn";s:6:"页面";s:2:"hu";s:7:"Oldalak";s:2:"th";s:21:"หน้าเพจ";s:2:"se";s:5:"Sidor";}', 'pages', '2.2.0', NULL, 'a:25:{s:2:"en";s:55:"Add custom pages to the site with any content you want.";s:2:"ar";s:99:"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.";s:2:"br";s:82:"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.";s:2:"pt";s:86:"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.";s:2:"cs";s:74:"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.";s:2:"da";s:71:"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.";s:2:"de";s:49:"Füge eigene Seiten mit anpassbaren Inhalt hinzu.";s:2:"el";s:152:"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.";s:2:"es";s:77:"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.";s:2:"fa";s:96:"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید";s:2:"fi";s:47:"Lisää mitä tahansa sisältöä sivustollesi.";s:2:"fr";s:89:"Permet d''ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.";s:2:"he";s:35:"ניהול דפי תוכן האתר";s:2:"id";s:75:"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.";s:2:"it";s:73:"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.";s:2:"lt";s:46:"Pridėkite nuosavus puslapius betkokio turinio";s:2:"nl";s:70:"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.";s:2:"pl";s:53:"Dodaj własne strony z dowolną treścią do witryny.";s:2:"ru";s:134:"Управление информационными страницами сайта, с произвольным содержимым.";s:2:"sl";s:44:"Dodaj stran s kakršno koli vsebino želite.";s:2:"tw";s:39:"為您的網站新增自定的頁面。";s:2:"cn";s:39:"为您的网站新增自定的页面。";s:2:"th";s:168:"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ";s:2:"hu";s:67:"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.";s:2:"se";s:39:"Lägg till egna sidor till webbplatsen.";}', 1, 1, 1, 'content', 1, 1, 1, 1386006895),
(14, 'a:25:{s:2:"en";s:11:"Permissions";s:2:"ar";s:18:"الصلاحيات";s:2:"br";s:11:"Permissões";s:2:"pt";s:11:"Permissões";s:2:"cs";s:12:"Oprávnění";s:2:"da";s:14:"Adgangskontrol";s:2:"de";s:14:"Zugriffsrechte";s:2:"el";s:20:"Δικαιώματα";s:2:"es";s:8:"Permisos";s:2:"fa";s:15:"اجازه ها";s:2:"fi";s:16:"Käyttöoikeudet";s:2:"fr";s:11:"Permissions";s:2:"he";s:12:"הרשאות";s:2:"id";s:9:"Perizinan";s:2:"it";s:8:"Permessi";s:2:"lt";s:7:"Teisės";s:2:"nl";s:15:"Toegangsrechten";s:2:"pl";s:11:"Uprawnienia";s:2:"ru";s:25:"Права доступа";s:2:"sl";s:10:"Dovoljenja";s:2:"tw";s:6:"權限";s:2:"cn";s:6:"权限";s:2:"hu";s:14:"Jogosultságok";s:2:"th";s:18:"สิทธิ์";s:2:"se";s:13:"Behörigheter";}', 'permissions', '1.0.0', NULL, 'a:25:{s:2:"en";s:68:"Control what type of users can see certain sections within the site.";s:2:"ar";s:127:"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.";s:2:"br";s:68:"Controle quais tipos de usuários podem ver certas seções no site.";s:2:"pt";s:75:"Controle quais os tipos de utilizadores podem ver certas secções no site.";s:2:"cs";s:93:"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.";s:2:"da";s:72:"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.";s:2:"de";s:70:"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.";s:2:"el";s:180:"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.";s:2:"es";s:81:"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.";s:2:"fa";s:59:"مدیریت اجازه های گروه های کاربری";s:2:"fi";s:72:"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.";s:2:"fr";s:104:"Permet de définir les autorisations des groupes d''utilisateurs pour afficher les différentes sections.";s:2:"he";s:75:"ניהול הרשאות כניסה לאיזורים מסוימים באתר";s:2:"id";s:76:"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.";s:2:"it";s:78:"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.";s:2:"lt";s:72:"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.";s:2:"nl";s:71:"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.";s:2:"pl";s:79:"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.";s:2:"ru";s:209:"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.";s:2:"sl";s:85:"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.";s:2:"tw";s:81:"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。";s:2:"cn";s:81:"用来控制不同类别的用户，设定其浏览特定网站内容的权限。";s:2:"hu";s:129:"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.";s:2:"th";s:117:"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง";s:2:"se";s:27:"Hantera gruppbehörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1386006895),
(15, 'a:24:{s:2:"en";s:9:"Redirects";s:2:"ar";s:18:"التوجيهات";s:2:"br";s:17:"Redirecionamentos";s:2:"pt";s:17:"Redirecionamentos";s:2:"cs";s:16:"Přesměrování";s:2:"da";s:13:"Omadressering";s:2:"el";s:30:"Ανακατευθύνσεις";s:2:"es";s:13:"Redirecciones";s:2:"fa";s:17:"انتقال ها";s:2:"fi";s:18:"Uudelleenohjaukset";s:2:"fr";s:12:"Redirections";s:2:"he";s:12:"הפניות";s:2:"id";s:8:"Redirect";s:2:"it";s:11:"Reindirizzi";s:2:"lt";s:14:"Peradresavimai";s:2:"nl";s:12:"Verwijzingen";s:2:"ru";s:30:"Перенаправления";s:2:"sl";s:12:"Preusmeritve";s:2:"tw";s:6:"轉址";s:2:"cn";s:6:"转址";s:2:"hu";s:17:"Átirányítások";s:2:"pl";s:14:"Przekierowania";s:2:"th";s:42:"เปลี่ยนเส้นทาง";s:2:"se";s:14:"Omdirigeringar";}', 'redirects', '1.0.0', NULL, 'a:24:{s:2:"en";s:33:"Redirect from one URL to another.";s:2:"ar";s:47:"التوجيه من رابط URL إلى آخر.";s:2:"br";s:39:"Redirecionamento de uma URL para outra.";s:2:"pt";s:40:"Redirecionamentos de uma URL para outra.";s:2:"cs";s:43:"Přesměrujte z jedné adresy URL na jinou.";s:2:"da";s:35:"Omadresser fra en URL til en anden.";s:2:"el";s:81:"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη";s:2:"es";s:34:"Redireccionar desde una URL a otra";s:2:"fa";s:63:"انتقال دادن یک صفحه به یک آدرس دیگر";s:2:"fi";s:45:"Uudelleenohjaa käyttäjän paikasta toiseen.";s:2:"fr";s:34:"Redirection d''une URL à un autre.";s:2:"he";s:43:"הפניות מכתובת אחת לאחרת";s:2:"id";s:40:"Redirect dari satu URL ke URL yang lain.";s:2:"it";s:35:"Reindirizza da una URL ad un altra.";s:2:"lt";s:56:"Peradresuokite puslapį iš vieno adreso (URL) į kitą.";s:2:"nl";s:38:"Verwijs vanaf een URL naar een andere.";s:2:"ru";s:78:"Перенаправления с одного адреса на другой.";s:2:"sl";s:44:"Preusmeritev iz enega URL naslova na drugega";s:2:"tw";s:33:"將網址轉址、重新定向。";s:2:"cn";s:33:"将网址转址、重新定向。";s:2:"hu";s:38:"Egy URL átirányítása egy másikra.";s:2:"pl";s:44:"Przekierowanie z jednego adresu URL na inny.";s:2:"th";s:123:"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง";s:2:"se";s:38:"Omdirigera från en URL till en annan.";}', 0, 0, 1, 'structure', 1, 1, 1, 1386006895),
(16, 'a:9:{s:2:"en";s:6:"Search";s:2:"fr";s:9:"Recherche";s:2:"se";s:4:"Sök";s:2:"ar";s:10:"البحث";s:2:"tw";s:6:"搜尋";s:2:"cn";s:6:"搜寻";s:2:"it";s:7:"Ricerca";s:2:"fa";s:10:"جستجو";s:2:"fi";s:4:"Etsi";}', 'search', '1.0.0', NULL, 'a:9:{s:2:"en";s:72:"Search through various types of content with this modular search system.";s:2:"fr";s:84:"Rechercher parmi différents types de contenus avec système de recherche modulaire.";s:2:"se";s:36:"Sök igenom olika typer av innehåll";s:2:"ar";s:102:"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.";s:2:"tw";s:63:"此模組可用以搜尋網站中不同類型的資料內容。";s:2:"cn";s:63:"此模组可用以搜寻网站中不同类型的资料内容。";s:2:"it";s:71:"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare";s:2:"fa";s:115:"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.";s:2:"fi";s:76:"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.";}', 0, 0, 0, '0', 1, 1, 1, 1386006895),
(17, 'a:20:{s:2:"en";s:7:"Sitemap";s:2:"ar";s:23:"خريطة الموقع";s:2:"br";s:12:"Mapa do Site";s:2:"pt";s:12:"Mapa do Site";s:2:"de";s:7:"Sitemap";s:2:"el";s:31:"Χάρτης Ιστότοπου";s:2:"es";s:14:"Mapa del Sitio";s:2:"fa";s:17:"نقشه سایت";s:2:"fi";s:10:"Sivukartta";s:2:"fr";s:12:"Plan du site";s:2:"id";s:10:"Peta Situs";s:2:"it";s:14:"Mappa del sito";s:2:"lt";s:16:"Svetainės medis";s:2:"nl";s:7:"Sitemap";s:2:"ru";s:21:"Карта сайта";s:2:"tw";s:12:"網站地圖";s:2:"cn";s:12:"网站地图";s:2:"th";s:21:"ไซต์แมพ";s:2:"hu";s:13:"Oldaltérkép";s:2:"se";s:9:"Sajtkarta";}', 'sitemap', '1.3.0', NULL, 'a:21:{s:2:"en";s:87:"The sitemap module creates an index of all pages and an XML sitemap for search engines.";s:2:"ar";s:120:"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.";s:2:"br";s:102:"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"pt";s:102:"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"da";s:86:"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.";s:2:"de";s:92:"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.";s:2:"el";s:190:"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.";s:2:"es";s:111:"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.";s:2:"fa";s:150:"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد";s:2:"fi";s:82:"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.";s:2:"fr";s:106:"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.";s:2:"id";s:110:"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.";s:2:"it";s:104:"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.";s:2:"lt";s:86:"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.";s:2:"nl";s:89:"De sitemap module maakt een index van alle pagina''s en een XML sitemap voor zoekmachines.";s:2:"ru";s:144:"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.";s:2:"tw";s:84:"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。";s:2:"cn";s:84:"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。";s:2:"th";s:202:"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.";s:2:"hu";s:94:"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.";s:2:"se";s:86:"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.";}', 0, 1, 0, 'content', 1, 1, 1, 1386006895);
INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(18, 'a:25:{s:2:"en";s:5:"Users";s:2:"ar";s:20:"المستخدمون";s:2:"br";s:9:"Usuários";s:2:"pt";s:12:"Utilizadores";s:2:"cs";s:11:"Uživatelé";s:2:"da";s:7:"Brugere";s:2:"de";s:8:"Benutzer";s:2:"el";s:14:"Χρήστες";s:2:"es";s:8:"Usuarios";s:2:"fa";s:14:"کاربران";s:2:"fi";s:12:"Käyttäjät";s:2:"fr";s:12:"Utilisateurs";s:2:"he";s:14:"משתמשים";s:2:"id";s:8:"Pengguna";s:2:"it";s:6:"Utenti";s:2:"lt";s:10:"Vartotojai";s:2:"nl";s:10:"Gebruikers";s:2:"pl";s:12:"Użytkownicy";s:2:"ru";s:24:"Пользователи";s:2:"sl";s:10:"Uporabniki";s:2:"tw";s:6:"用戶";s:2:"cn";s:6:"用户";s:2:"hu";s:14:"Felhasználók";s:2:"th";s:27:"ผู้ใช้งาน";s:2:"se";s:10:"Användare";}', 'users', '1.1.0', NULL, 'a:25:{s:2:"en";s:81:"Let users register and log in to the site, and manage them via the control panel.";s:2:"ar";s:133:"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.";s:2:"br";s:125:"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.";s:2:"pt";s:125:"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.";s:2:"cs";s:103:"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.";s:2:"da";s:89:"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.";s:2:"de";s:108:"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.";s:2:"el";s:208:"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.";s:2:"es";s:138:"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.";s:2:"fa";s:151:"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید";s:2:"fi";s:126:"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.";s:2:"fr";s:112:"Permet aux utilisateurs de s''enregistrer et de se connecter au site et de les gérer via le panneau de contrôle";s:2:"he";s:62:"ניהול משתמשים: רישום, הפעלה ומחיקה";s:2:"id";s:102:"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.";s:2:"it";s:95:"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.";s:2:"lt";s:106:"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.";s:2:"nl";s:88:"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.";s:2:"pl";s:87:"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.";s:2:"ru";s:155:"Управление зарегистрированными пользователями, активирование новых пользователей.";s:2:"sl";s:96:"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče";s:2:"tw";s:87:"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。";s:2:"cn";s:87:"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。";s:2:"th";s:210:"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม";s:2:"hu";s:120:"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.";s:2:"se";s:111:"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.";}', 0, 0, 1, '0', 1, 1, 1, 1386006895),
(19, 'a:25:{s:2:"en";s:9:"Variables";s:2:"ar";s:20:"المتغيّرات";s:2:"br";s:10:"Variáveis";s:2:"pt";s:10:"Variáveis";s:2:"cs";s:10:"Proměnné";s:2:"da";s:8:"Variable";s:2:"de";s:9:"Variablen";s:2:"el";s:20:"Μεταβλητές";s:2:"es";s:9:"Variables";s:2:"fa";s:16:"متغییرها";s:2:"fi";s:9:"Muuttujat";s:2:"fr";s:9:"Variables";s:2:"he";s:12:"משתנים";s:2:"id";s:8:"Variabel";s:2:"it";s:9:"Variabili";s:2:"lt";s:10:"Kintamieji";s:2:"nl";s:10:"Variabelen";s:2:"pl";s:7:"Zmienne";s:2:"ru";s:20:"Переменные";s:2:"sl";s:13:"Spremenljivke";s:2:"tw";s:12:"系統變數";s:2:"cn";s:12:"系统变数";s:2:"th";s:18:"ตัวแปร";s:2:"se";s:9:"Variabler";s:2:"hu";s:10:"Változók";}', 'variables', '1.0.0', NULL, 'a:25:{s:2:"en";s:59:"Manage global variables that can be accessed from anywhere.";s:2:"ar";s:97:"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.";s:2:"br";s:61:"Gerencia as variáveis globais acessíveis de qualquer lugar.";s:2:"pt";s:58:"Gerir as variáveis globais acessíveis de qualquer lugar.";s:2:"cs";s:56:"Spravujte globální proměnné přístupné odkudkoliv.";s:2:"da";s:51:"Håndtér globale variable som kan tilgås overalt.";s:2:"de";s:74:"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.";s:2:"el";s:129:"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.";s:2:"es";s:50:"Manage global variables to access from everywhere.";s:2:"fa";s:136:"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند";s:2:"fi";s:66:"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.";s:2:"fr";s:92:"Gérer des variables globales pour pouvoir y accéder depuis n''importe quel endroit du site.";s:2:"he";s:96:"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר";s:2:"id";s:59:"Mengatur variabel global yang dapat diakses dari mana saja.";s:2:"it";s:58:"Gestisci le variabili globali per accedervi da ogni parte.";s:2:"lt";s:64:"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.";s:2:"nl";s:54:"Beheer globale variabelen die overal beschikbaar zijn.";s:2:"pl";s:86:"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.";s:2:"ru";s:136:"Управление глобальными переменными, которые доступны в любом месте сайта.";s:2:"sl";s:53:"Urejanje globalnih spremenljivk za dostop od kjerkoli";s:2:"th";s:148:"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.";s:2:"tw";s:45:"管理此網站內可存取的全局變數。";s:2:"cn";s:45:"管理此网站内可存取的全局变数。";s:2:"hu";s:62:"Globális változók kezelése a hozzáféréshez, bárhonnan.";s:2:"se";s:66:"Hantera globala variabler som kan avändas över hela webbplatsen.";}', 0, 0, 1, 'data', 1, 1, 1, 1386006895),
(20, 'a:23:{s:2:"en";s:7:"Widgets";s:2:"br";s:7:"Widgets";s:2:"pt";s:7:"Widgets";s:2:"cs";s:7:"Widgety";s:2:"da";s:7:"Widgets";s:2:"de";s:7:"Widgets";s:2:"el";s:7:"Widgets";s:2:"es";s:7:"Widgets";s:2:"fa";s:13:"ویجت ها";s:2:"fi";s:9:"Vimpaimet";s:2:"fr";s:7:"Widgets";s:2:"id";s:6:"Widget";s:2:"it";s:7:"Widgets";s:2:"lt";s:11:"Papildiniai";s:2:"nl";s:7:"Widgets";s:2:"ru";s:14:"Виджеты";s:2:"sl";s:9:"Vtičniki";s:2:"tw";s:9:"小組件";s:2:"cn";s:9:"小组件";s:2:"hu";s:9:"Widget-ek";s:2:"th";s:21:"วิดเจ็ต";s:2:"se";s:8:"Widgetar";s:2:"ar";s:14:"الودجتس";}', 'widgets', '1.2.0', NULL, 'a:23:{s:2:"en";s:69:"Manage small sections of self-contained logic in blocks or "Widgets".";s:2:"ar";s:132:"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ"ودجتس".";s:2:"br";s:77:"Gerenciar pequenas seções de conteúdos em bloco conhecidos como "Widgets".";s:2:"pt";s:74:"Gerir pequenas secções de conteúdos em bloco conhecidos como "Widgets".";s:2:"cs";s:56:"Spravujte malé funkční části webu neboli "Widgety".";s:2:"da";s:74:"Håndter små sektioner af selv-opretholdt logik i blokke eller "Widgets".";s:2:"de";s:62:"Verwaltet kleine, eigentständige Bereiche, genannt "Widgets".";s:2:"el";s:149:"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή "Widgets".";s:2:"es";s:75:"Manejar pequeñas secciones de lógica autocontenida en bloques o "Widgets"";s:2:"fa";s:76:"مدیریت قسمت های کوچکی از سایت به طور مستقل";s:2:"fi";s:81:"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai "Vimpaimia".";s:2:"fr";s:41:"Gérer des mini application ou "Widgets".";s:2:"id";s:101:"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah "Widget".";s:2:"it";s:70:"Gestisci piccole sezioni di logica a se stante in blocchi o "Widgets".";s:2:"lt";s:43:"Nedidelių, savarankiškų blokų valdymas.";s:2:"nl";s:75:"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel "Widgets".";s:2:"ru";s:91:"Управление небольшими, самостоятельными блоками.";s:2:"sl";s:61:"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)";s:2:"tw";s:103:"可將小段的程式碼透過小組件來管理。即所謂 "Widgets"，或稱為小工具、部件。";s:2:"cn";s:103:"可将小段的程式码透过小组件来管理。即所谓 "Widgets"，或称为小工具、部件。";s:2:"hu";s:56:"Önálló kis logikai tömbök vagy widget-ek kezelése.";s:2:"th";s:152:"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต";s:2:"se";s:83:"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.";}', 1, 0, 1, 'content', 1, 1, 1, 1386006895),
(21, 'a:9:{s:2:"en";s:7:"WYSIWYG";s:2:"fa";s:7:"WYSIWYG";s:2:"fr";s:7:"WYSIWYG";s:2:"pt";s:7:"WYSIWYG";s:2:"se";s:15:"HTML-redigerare";s:2:"tw";s:7:"WYSIWYG";s:2:"cn";s:7:"WYSIWYG";s:2:"ar";s:27:"المحرر الرسومي";s:2:"it";s:7:"WYSIWYG";}', 'wysiwyg', '1.0.0', NULL, 'a:10:{s:2:"en";s:60:"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.";s:2:"fa";s:73:"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. ";s:2:"fr";s:63:"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor";s:2:"pt";s:61:"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.";s:2:"el";s:113:"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.";s:2:"se";s:37:"Redigeringsmodul för HTML, CKEditor.";s:2:"tw";s:83:"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。";s:2:"cn";s:83:"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。";s:2:"ar";s:76:"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.";s:2:"it";s:57:"Fornisce l''editor WYSIWYG per PtroCMS creato con CKEditor";}', 0, 0, 0, '0', 1, 1, 1, 1386006895),
(22, 'a:1:{s:2:"en";s:6:"Sample";}', 'sample', '2.1', NULL, 'a:1:{s:2:"en";s:32:"This is a PyroCMS module sample.";}', 0, 1, 1, 'content', 1, 1, 0, 1386006895),
(23, 'a:1:{s:2:"en";s:9:"resources";}', 'resources', '2.1', NULL, 'a:1:{s:2:"en";s:37:"This is a Leadtiger module resources.";}', 0, 1, 1, 'content', 1, 1, 0, 1386007159);

-- --------------------------------------------------------

--
-- Table structure for table `default_municipal_corp_tenure`
--

CREATE TABLE IF NOT EXISTS `default_municipal_corp_tenure` (
  `mc_tenure_id` int(11) NOT NULL AUTO_INCREMENT,
  `municipal_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `tenure_aggrement_id` int(11) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1 in agreement, 2 not in agreement',
  `comments` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mc_tenure_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `default_municipal_corp_tenure`
--

INSERT INTO `default_municipal_corp_tenure` (`mc_tenure_id`, `municipal_id`, `location_id`, `tenure_aggrement_id`, `status`, `comments`, `created`, `updated`) VALUES
(1, 27, 5, 16, 1, 'good', '2013-12-14 04:44:55', '2013-12-14 22:14:55'),
(2, 8, 4, 17, 1, 'good', '2013-12-14 04:45:25', '2013-12-14 22:15:25'),
(3, 29, 12, 18, 1, 'good', '2013-12-14 04:46:14', '2013-12-14 22:16:14'),
(4, 29, 13, 19, 1, '', '2013-12-14 04:46:51', '2013-12-14 22:16:51'),
(5, 28, 16, 20, 1, 'good', '2013-12-14 04:47:26', '2013-12-14 22:17:26');

-- --------------------------------------------------------

--
-- Table structure for table `default_navigation_groups`
--

CREATE TABLE IF NOT EXISTS `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `default_navigation_groups`
--

INSERT INTO `default_navigation_groups` (`id`, `title`, `abbrev`) VALUES
(2, 'Sidebar', 'sidebar'),
(3, 'Footer', 'footer');

-- --------------------------------------------------------

--
-- Table structure for table `default_navigation_links`
--

CREATE TABLE IF NOT EXISTS `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_navigation_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_options`
--

CREATE TABLE IF NOT EXISTS `default_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `select_list_id` int(11) DEFAULT NULL,
  `front_value` varchar(45) DEFAULT NULL,
  `back_value` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `options_select_list_id_idx` (`select_list_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `default_options`
--

INSERT INTO `default_options` (`option_id`, `select_list_id`, `front_value`, `back_value`, `order`) VALUES
(1, 1, 'Owner', 1, 1),
(2, 1, 'Distributor', 1, 2),
(3, 1, 'Broker', 1, 3),
(4, 1, 'Midler', 1, 4),
(5, 2, 'Dealer owner', 2, 1),
(6, 2, 'Franchise', 2, 2),
(7, 2, 'Dealer Distributor', 2, 3),
(8, 2, 'Dealer Broker', 2, 4),
(9, 3, 'MC Itself', 3, 1),
(10, 3, 'MC Contractor', 3, 2),
(11, 4, 'Weekly', 4, 1),
(12, 4, 'Monthly', 4, 2),
(13, 4, 'Quarterly', 4, 3),
(14, 4, 'Half Yearly', 4, 4),
(15, 4, 'Three quaters', 4, 5),
(16, 4, 'Yearly', 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `default_pages`
--

CREATE TABLE IF NOT EXISTS `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_no_index` tinyint(1) DEFAULT NULL,
  `meta_robots_no_follow` tinyint(1) DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `default_pages`
--

INSERT INTO `default_pages` (`id`, `slug`, `class`, `title`, `uri`, `parent_id`, `type_id`, `entry_id`, `css`, `js`, `meta_title`, `meta_keywords`, `meta_robots_no_index`, `meta_robots_no_follow`, `meta_description`, `rss_enabled`, `comments_enabled`, `status`, `created_on`, `updated_on`, `restricted_to`, `is_home`, `strict_uri`, `order`) VALUES
(1, 'home', '', 'Home', 'home', 0, '1', '1', '', '', '', '', 0, 0, '', 0, 0, 'live', 1386006800, 1386351650, '0', 1, 1, 1386006800),
(2, 'contact', '', 'Contact', 'contact', 0, '1', '2', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1386006800, 0, '', 0, 1, 1386006800),
(3, 'search', '', 'Search', 'search', 0, '1', '3', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1386006800, 0, '', 0, 1, 1386006800),
(4, 'results', '', 'Results', 'search/results', 3, '1', '4', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1386006800, 0, '', 0, 0, 1386006800),
(5, '404', '', 'Page missing', '404', 0, '1', '5', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1386006800, 0, '', 0, 1, 1386006800);

-- --------------------------------------------------------

--
-- Table structure for table `default_page_types`
--

CREATE TABLE IF NOT EXISTS `default_page_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `stream_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  `save_as_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `content_label` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `default_page_types`
--

INSERT INTO `default_page_types` (`id`, `slug`, `title`, `description`, `stream_id`, `meta_title`, `meta_keywords`, `meta_description`, `body`, `css`, `js`, `theme_layout`, `updated_on`, `save_as_files`, `content_label`, `title_label`) VALUES
(1, 'default', 'Default', 'A simple page type with a WYSIWYG editor that will get you started adding content.', 2, NULL, NULL, NULL, '<h2>{{ page:title }}</h2>\n\n{{ body }}', '', '', 'default', 1386006800, 'n', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_payments`
--

CREATE TABLE IF NOT EXISTS `default_payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `tenure_id` int(11) NOT NULL,
  `tenure_type` int(2) NOT NULL COMMENT 'hording install, rent agrrement. mc agreement',
  `payment_amount` int(11) NOT NULL,
  `payment_amount_date` datetime NOT NULL,
  `payment_type` int(2) NOT NULL COMMENT '1 payment in, 2 payment out',
  `comments` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `default_payments`
--

INSERT INTO `default_payments` (`payment_id`, `tenure_id`, `tenure_type`, `payment_amount`, `payment_amount_date`, `payment_type`, `comments`, `updated`) VALUES
(1, 1, 1, 900, '2013-12-14 00:00:00', 1, 'Payment installment which had paid intially', '2014-03-17 12:03:41'),
(2, 1, 1, 600, '2014-03-04 00:00:00', 1, '', '2014-03-17 12:03:41'),
(3, 10, 3, 5600, '2013-12-14 00:00:00', 2, 'Payment installment which had paid intially', '2014-03-17 12:03:51'),
(4, 10, 3, 500, '2014-01-14 00:00:00', 2, '', '2014-03-17 12:03:51'),
(5, 5, 1, 6000, '2013-12-14 00:00:00', 1, 'Payment installment which had paid intially', '2014-03-17 05:03:55'),
(6, 5, 1, 2500, '2014-03-13 00:00:00', 1, '', '2014-03-17 17:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `default_people`
--

CREATE TABLE IF NOT EXISTS `default_people` (
  `people_id` int(11) NOT NULL AUTO_INCREMENT,
  `people_first_name` varchar(300) DEFAULT NULL,
  `people_last_name` varchar(300) DEFAULT NULL,
  `people_mc_name` varchar(300) DEFAULT NULL,
  `people_landlord_location_id` int(11) DEFAULT NULL,
  `people_buniness_name` varchar(300) DEFAULT NULL,
  `people_address1` varchar(255) DEFAULT NULL,
  `people_address2` varchar(255) DEFAULT NULL,
  `people_address3` varchar(255) DEFAULT NULL,
  `people_city` int(11) DEFAULT NULL COMMENT 'people_city is station id',
  `people_state_id` int(11) DEFAULT NULL,
  `people_country_id` int(11) DEFAULT NULL,
  `people_type` int(4) DEFAULT NULL,
  `people_client_id` int(11) DEFAULT NULL,
  `people_phone` varchar(300) DEFAULT NULL,
  `people_mobile` varchar(300) DEFAULT NULL,
  `people_email_address` varchar(300) DEFAULT NULL,
  `people_bank_name` varchar(300) DEFAULT NULL,
  `people_bank_account` varchar(300) DEFAULT NULL,
  `RTGS_IFSC_CODE` varchar(300) DEFAULT NULL,
  `people_mc_contact_person` varchar(300) DEFAULT NULL,
  `people_mc_cp_designation` varchar(300) DEFAULT NULL,
  `people_mc_itself_or_contractor` int(2) DEFAULT NULL,
  `people_business_type` int(4) DEFAULT NULL,
  `people_type_of_dealer` int(4) DEFAULT NULL,
  `people_rate_of_painter` varchar(50) DEFAULT NULL,
  `people_rate_of_labourer` varchar(50) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '1 for not deleted, 0 for deleted',
  `comments` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`people_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `default_people`
--

INSERT INTO `default_people` (`people_id`, `people_first_name`, `people_last_name`, `people_mc_name`, `people_landlord_location_id`, `people_buniness_name`, `people_address1`, `people_address2`, `people_address3`, `people_city`, `people_state_id`, `people_country_id`, `people_type`, `people_client_id`, `people_phone`, `people_mobile`, `people_email_address`, `people_bank_name`, `people_bank_account`, `RTGS_IFSC_CODE`, `people_mc_contact_person`, `people_mc_cp_designation`, `people_mc_itself_or_contractor`, `people_business_type`, `people_type_of_dealer`, `people_rate_of_painter`, `people_rate_of_labourer`, `status`, `comments`, `created`, `updated`) VALUES
(6, 'Landlords chenge', NULL, NULL, NULL, NULL, 'test', 'test', 'test', 351, NULL, NULL, 2, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test', '2014-01-09 11:01:26', '2014-01-09 17:08:26'),
(7, 'painter', NULL, NULL, NULL, NULL, 'test', 'test', 'test', 530, NULL, NULL, 3, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', NULL, 1, 'test', '2014-01-11 10:01:51', '2014-01-11 16:24:51'),
(8, NULL, NULL, 'MCJ Jalandhar', NULL, NULL, 'test', 'test', 'est', 185, NULL, NULL, 4, NULL, '', '', '', NULL, NULL, NULL, '', '', 9, NULL, NULL, NULL, NULL, 1, 'test', '2014-01-11 06:01:16', '2014-01-11 11:30:16'),
(9, NULL, NULL, 'MCL Ludhiana', NULL, NULL, 'test', 'test', 'tet', 1132, NULL, NULL, 4, NULL, '', '', '', NULL, NULL, NULL, '', '', 9, NULL, NULL, NULL, NULL, 1, 'tset', '2014-01-11 06:01:35', '2014-01-11 11:30:35'),
(10, 'Dealer', NULL, NULL, NULL, NULL, 'test', 'test', 'test', 650, NULL, NULL, 5, 16, '9879879874', '9879874', 'k@ww.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test', '2014-01-11 06:01:16', '2014-01-11 12:10:16'),
(11, 'Labourer', NULL, NULL, NULL, NULL, 'test', 'test', 'test', 40, NULL, NULL, 6, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '44', 1, 'test', '2014-01-11 10:01:46', '2014-01-11 16:16:46'),
(13, 'Landlords new', NULL, NULL, NULL, NULL, 'test', 'tset', 'test', 45, NULL, NULL, 2, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'tset', '2014-01-09 09:01:12', '2014-01-09 15:05:12'),
(14, 'Ajit News Paper', NULL, NULL, NULL, NULL, 'Model town', '', '', 54, NULL, NULL, 1, NULL, '9879879874', '9879879874', 'navin@aaa.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'This is good client.', '2014-01-09 11:01:14', '2014-01-09 17:06:14'),
(15, 'Punjab Kesari', NULL, NULL, NULL, NULL, 'GT Road', '', '', 57, NULL, NULL, 1, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'This is a good client.', '2014-01-09 11:01:30', '2014-01-09 17:06:30'),
(16, 'HP Printers', NULL, NULL, NULL, NULL, 'Monica tower', '', '', 62, NULL, NULL, 1, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'This is good client.', '2014-01-09 11:01:46', '2014-01-09 17:06:46'),
(17, 'Relience Mobiles', NULL, NULL, NULL, NULL, 'Green Model town', 'Near Samrala Chownk', '', 125, NULL, NULL, 1, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'This is good client.', '2014-01-09 11:01:03', '2014-01-09 17:07:03'),
(18, 'Airtel Network', NULL, NULL, NULL, NULL, 'Amritsar', 'Near Bus Stand', '', 1015, NULL, NULL, 1, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'This is good client.', '2014-01-09 10:01:46', '2014-01-09 16:24:46'),
(19, 'Idea Mobiles', 'Moiles', NULL, NULL, NULL, 'Abohar bus stand', '', '', 4, 2189, 113, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 'This is good client.', '2013-12-07 06:12:06', '2014-01-09 16:23:02'),
(20, 'Ranjit Singh', NULL, NULL, NULL, NULL, 'Kapurthala Road', '', '', 6, NULL, NULL, 2, NULL, '9879879874', '9879879874', 'navin@aaa.com', 'Satate Bank', '98745', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'This is landlord.', '2014-01-09 05:01:34', '2014-01-09 22:35:34'),
(21, 'Narinder Kaur', NULL, NULL, NULL, NULL, 'Shimla Colony', '', '', 940, NULL, NULL, 2, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'This is good client.', '2014-01-11 05:01:54', '2014-01-11 10:59:54'),
(22, 'Gurdial Singh', NULL, NULL, NULL, NULL, 'Shimla Colony', '', '', 1285, NULL, NULL, 2, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'This is landlord.', '2014-01-11 05:01:13', '2014-01-11 11:00:13'),
(23, 'test', NULL, NULL, NULL, NULL, 'test', '', '', 916, NULL, NULL, 3, NULL, '9879879874', '9879879874', 'kk@ww.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22', NULL, 1, 'teest', '2014-01-11 10:01:08', '2014-01-11 16:25:08'),
(24, 'test', NULL, NULL, NULL, NULL, 'test', 'test', 'test', 864, NULL, NULL, 5, 17, '9879879874', '9879879874', 'qqq@eee.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test', '2014-01-11 06:01:30', '2014-01-11 12:10:30'),
(25, 'test', NULL, NULL, NULL, NULL, 'test', 'test', 'tets', 864, NULL, NULL, 6, NULL, '9879879874', '9879879874', 'kk@ww.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '33', 1, 'tes', '2014-01-11 10:01:02', '2014-01-11 16:17:02'),
(26, 'test', '', NULL, NULL, NULL, 'tset', 'test', 'test', 0, 2168, 113, 1, NULL, '9879879874', '9879879874', 'kk@ww.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'test', '2013-12-09 02:12:28', '2013-12-09 20:08:28'),
(27, NULL, NULL, 'MCJ Amritsar', NULL, NULL, 'near bus stand', 'near lal chownk', '', 1119, NULL, NULL, 4, NULL, '9876549874', '9876549874', 'kk@ww.com', NULL, NULL, NULL, 'Navin', 'Abc', 9, NULL, NULL, NULL, NULL, 1, 'Good mc', '2014-01-11 06:01:52', '2014-01-11 11:30:52'),
(28, NULL, NULL, 'MCJ phagwara', NULL, NULL, 'phagwara new gt road', '', '', 1431, NULL, NULL, 4, NULL, '9876549874', '9876549874', 'kk@ww.com', NULL, NULL, NULL, 'navin', 'head', 10, NULL, NULL, NULL, NULL, 1, 'good', '2014-01-11 06:01:08', '2014-01-11 11:31:08'),
(29, NULL, NULL, 'MCJ Nawanshar', NULL, NULL, 'near slow road', '', '', 1339, NULL, NULL, 4, NULL, '9876549874', '9876549874', 'kk@ww.com', NULL, NULL, NULL, 'navin', 'head', 9, NULL, NULL, NULL, NULL, 1, 'good', '2014-01-11 06:01:24', '2014-01-11 11:31:24'),
(30, 'test client with new design', NULL, NULL, NULL, NULL, 'new design', 'new design', 'new design', 0, 2189, 113, 1, NULL, '9876549874', '9879879874', 'a@dd.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'test', '2013-12-18 04:12:53', '2013-12-18 21:59:53'),
(31, 'test client with new design', NULL, NULL, NULL, NULL, 'test', 'test', 'test', 78, NULL, NULL, 2, NULL, '9879879874', '9879879874', 'a@dd.com', 'test', '354435345', '242424345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test', '2014-01-11 05:01:38', '2014-01-11 11:00:38'),
(32, 'test painter with new design', NULL, NULL, NULL, NULL, 'new design', 'new design', 'new design', 1225, NULL, NULL, 3, NULL, '9879879874', '9879879874', 'a@dd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23', NULL, 1, 'new design', '2014-01-11 10:01:23', '2014-01-11 16:25:23'),
(33, 'sdfds test painter with new design sdfsdf', NULL, NULL, NULL, NULL, 'new design', 'new designnew design', 'new design', 1431, NULL, NULL, 3, NULL, '45345345', '435345345', 'a@dd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3453', NULL, 1, 'new design', '2014-01-11 10:01:41', '2014-01-11 16:25:41'),
(34, 'test painter with new design', NULL, NULL, NULL, NULL, 'test', 'test', 'test', 583, NULL, NULL, 3, NULL, '534543', '5435345', 'a@dd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '453', NULL, 1, 'test', '2014-01-11 10:01:57', '2014-01-11 16:25:57'),
(35, NULL, NULL, 'test mc with new design', NULL, NULL, 'new design', 'new designnew design', 'new design', 62, NULL, NULL, 4, NULL, '456456464', '4646464564', 'a@dd.com', NULL, NULL, NULL, 'new design', 'new design', 9, NULL, NULL, NULL, NULL, 1, 'new design', '2014-01-11 06:01:28', '2014-01-11 11:33:28'),
(36, 'test dealer with new design', NULL, NULL, NULL, NULL, 'new design', 'new design', 'new design', 864, NULL, NULL, 5, 14, '546546', '6464', 'a@dd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'new design', '2014-01-11 06:01:49', '2014-01-11 12:10:49'),
(37, 'test labour with new design', NULL, NULL, NULL, NULL, 'new design', 'new design', 'new design', 1352, NULL, NULL, 6, NULL, '56464564', '464565645', 'a@dd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4535', 1, 'new design', '2014-01-11 10:01:16', '2014-01-11 16:17:16'),
(38, 'Virdi infotech', NULL, NULL, NULL, NULL, 'infotech', 'infotech', 'infotech', 1014, NULL, NULL, 1, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', '2014-01-09 11:01:18', '2014-01-09 17:05:18'),
(39, 'test', NULL, NULL, NULL, NULL, 'test', 'testtest', 'test', 1000, NULL, NULL, 2, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '2014-01-09 09:01:13', '2014-01-09 15:04:13'),
(40, 'test', NULL, NULL, NULL, NULL, 'test', 'testtesttet', 'test', 452, NULL, NULL, 2, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '2014-01-09 09:01:42', '2014-01-09 15:04:42'),
(41, 'Dot com tech', NULL, NULL, NULL, NULL, 'Dot com tech', 'Dot com tech', '', 43, NULL, NULL, 1, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'test', '2014-01-09 11:01:43', '2014-01-09 17:05:43'),
(42, 'Brill infosystems', NULL, NULL, NULL, NULL, 'Phase 7', '', '', 1032, NULL, NULL, 1, NULL, '', '', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', '2014-01-09 11:01:20', '2014-01-09 16:32:20'),
(43, 'Web infotech', NULL, NULL, NULL, NULL, 'IT Park', '', '', 1026, NULL, NULL, 1, NULL, '', '', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', '2014-01-09 11:01:22', '2014-01-09 16:33:22'),
(44, 'Digi mantra', NULL, NULL, NULL, NULL, 'it park', '', '', 1026, NULL, NULL, 1, NULL, '', '', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', '2014-01-09 11:01:32', '2014-01-09 16:34:32'),
(45, 'Bir infotech', NULL, NULL, NULL, NULL, 'kartar pur', '', '', 1020, NULL, NULL, 1, NULL, '', '', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', '2014-01-09 11:01:18', '2014-01-09 16:35:18'),
(46, 'Guru info services', NULL, NULL, NULL, NULL, 'Kapurthala', '', '', 1018, NULL, NULL, 1, NULL, '', '', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', '2014-01-09 11:01:56', '2014-01-09 16:35:56'),
(47, 'Goa info', NULL, NULL, NULL, NULL, 'chandigarh', '', '', 843, NULL, NULL, 1, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', '2014-01-09 11:01:53', '2014-01-09 16:50:53'),
(48, 'Mantoor Singh', NULL, NULL, NULL, NULL, 'Jaliavala bagh', '', '', 107, NULL, NULL, 2, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '2014-01-11 05:01:26', '2014-01-11 11:01:26'),
(49, 'hjgjhg', NULL, NULL, NULL, NULL, 'jhgjhg', '', '', 0, NULL, NULL, 1, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '', '2014-01-11 05:01:56', '2014-01-11 10:42:56'),
(50, 'landlord for hording install test', NULL, NULL, NULL, NULL, 'landlord for hording install test', 'landlord for hording install test', 'landlord for hording install test', 35, NULL, NULL, 2, NULL, '987654984', '9879879874', 'info@onlymycare.com', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'abcdef', '2014-01-13 07:01:13', '2014-01-13 13:00:13'),
(51, 'landlord to test rent tenure', NULL, NULL, NULL, NULL, 'landlord to test rent tenure', 'landlord to test rent tenure', 'landlord to test rent tenure', 57, NULL, NULL, 2, NULL, '', '', 'info@onlymycare.com', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '2014-01-13 09:01:45', '2014-01-13 15:26:45'),
(52, 'land for city wise landlord test', NULL, NULL, NULL, NULL, 'land for city wise landlord test', 'land for city wise landlord test', 'land for city wise landlord test', 1035, NULL, NULL, 2, NULL, '987987984', '9879879874', 'info@onlymycare.com', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'land for city wise landlord test', '2014-01-13 03:01:48', '2014-01-13 21:24:48'),
(53, 'new landlord for city wise landlord test', NULL, NULL, NULL, NULL, 'new landlord for city wise landlord test', 'new landlord for city wise landlord test', 'new landlord for city wise landlord test', 1035, NULL, NULL, 2, NULL, '9879879874', '9879879874', 'info@onlymycare.com', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'new landlord for city wise landlord test', '2014-01-13 04:01:50', '2014-01-13 22:07:50'),
(54, 'test new upload test', NULL, NULL, NULL, NULL, 'test new upload test', 'test new upload test', 'test new upload test', 821, NULL, NULL, 1, NULL, '9879879874', '9879879874', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, 'test new upload test', '2014-01-14 05:01:47', '2014-01-14 17:02:47'),
(55, 'test new upload test', NULL, NULL, NULL, NULL, 'test new upload test', 'test new upload test', 'test new upload test', 57, NULL, NULL, 2, NULL, '98798798774', '', 'info@onlymycare.com', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test new upload test', '2014-01-14 05:01:46', '2014-01-14 17:03:46'),
(56, 'test new upload test', NULL, NULL, NULL, NULL, 'test new upload test', 'test new upload test', 'test new upload test', 64, NULL, NULL, 5, 14, '', '', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'test new upload test', '2014-01-14 05:01:16', '2014-01-14 17:04:16'),
(57, NULL, NULL, 'test new upload test', NULL, NULL, 'test new upload test', 'test new upload test', 'test new upload test', 53, NULL, NULL, 4, NULL, '', '', 'info@onlymycare.com', NULL, NULL, NULL, '', '', 9, NULL, NULL, NULL, NULL, 1, 'test new upload test', '2014-01-14 05:01:48', '2014-01-14 17:04:48'),
(58, 'test new upload test', NULL, NULL, NULL, NULL, 'test new upload test', 'test new upload test', 'test new upload test', 1026, NULL, NULL, 6, NULL, '9879874977', '9879879874', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9879879874', 1, 'test new upload test', '2014-01-14 05:01:42', '2014-01-14 17:18:42'),
(59, 'test new upload test', NULL, NULL, NULL, NULL, 'test new upload test', 'test new upload test', 'test new upload test', 1026, NULL, NULL, 3, NULL, '9879879874', '98798798794', 'info@onlymycare.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '44', NULL, 1, 'test new upload test', '2014-01-14 05:01:37', '2014-01-14 17:19:37'),
(60, NULL, NULL, 'test new upload test', NULL, NULL, 'test new upload test', 'test new upload test', 'test new upload test', 371, NULL, NULL, 4, NULL, '9879879874', '9879879874', 'info@onlymycare.com', NULL, NULL, NULL, '', '', 9, NULL, NULL, NULL, NULL, 1, 'test new upload test', '2014-01-14 05:01:07', '2014-01-14 17:21:07');

-- --------------------------------------------------------

--
-- Table structure for table `default_permissions`
--

CREATE TABLE IF NOT EXISTS `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_place`
--

CREATE TABLE IF NOT EXISTS `default_place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(300) NOT NULL,
  `place_address1` varchar(300) DEFAULT NULL,
  `place_address2` varchar(300) DEFAULT NULL,
  `place_address3` varchar(300) DEFAULT NULL,
  `place_city` varchar(100) DEFAULT NULL,
  `place_state_id` int(6) DEFAULT NULL,
  `place_country_id` int(6) DEFAULT NULL,
  `place_station_id` int(11) DEFAULT NULL,
  `place_landlord_id` int(11) DEFAULT NULL,
  `place_type` int(2) NOT NULL COMMENT 'station 1, location 2',
  `place_picture_name` varchar(300) DEFAULT NULL,
  `place_picture_name2` varchar(300) DEFAULT NULL,
  `place_picture_name3` varchar(300) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '1 not deleted, 2 deleted',
  `comments` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`place_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1620 ;

--
-- Dumping data for table `default_place`
--

INSERT INTO `default_place` (`place_id`, `place_name`, `place_address1`, `place_address2`, `place_address3`, `place_city`, `place_state_id`, `place_country_id`, `place_station_id`, `place_landlord_id`, `place_type`, `place_picture_name`, `place_picture_name2`, `place_picture_name3`, `status`, `comments`, `created`, `updated`) VALUES
(1, 'Janak Puri', 'Janak Main', 'abc', '', 'Delhi', 2174, 113, 0, NULL, 1, NULL, NULL, '', 1, 'This is main site', '2013-12-05 05:12:31', '2013-12-05 22:45:31'),
(2, 'model town', 'main model town', 'herra road', '', 'jalandhar', 2189, 113, 0, NULL, 1, NULL, NULL, '', 1, 'this is main site', '2013-12-05 03:12:55', '2013-12-14 18:23:03'),
(4, 'abc janak puri one', 'right side wall', 'opp ranjit dhaba', 'janak puri flatno 3', NULL, NULL, NULL, 998, 20, 2, '1d2c32d70a37d0c787f125f6e9fb1ed3.jpg', '01896838b69516437029a627f2a1f1f4.jpg', '240e22991d347bbd9142cec66480dbbe.jpg', 1, 'this is good location', '2014-01-13 10:01:20', '2014-01-13 15:37:20'),
(5, 'jalandhar 5', 'jalandhar house no 333', 'green model town', 'near market', NULL, NULL, NULL, 837, 20, 2, '44032a5ff93d2c505c5b6c35e1063a1a.jpg', 'a9d74bc4eff002e6f7186e73e1e775ef.jpg', 'a9b1c2a32c17e797003fa78153ee0dc1.jpg', 1, 'this is good', '2014-01-14 05:01:41', '2014-01-14 17:13:41'),
(6, 'ghanta ghar ludhiana', 'new ghanta ghar', 'over bridge', 'abc', 'ludhiana', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, 'this has 5 locations', '2013-12-05 05:12:01', '2013-12-05 23:17:01'),
(7, 'ghanta ghar', 'ghanta ghar over the bridge', 'near railing', 'next to stairs', NULL, NULL, NULL, 1053, 31, 2, 'db9fe4eba3fe69a7a933def4456422c7.jpg', NULL, '', 1, 'this is expensive locatiins', '2014-01-14 03:01:25', '2014-01-14 15:07:25'),
(8, 'Secod side of ghanta ghar', 'near fly over', '', '', NULL, 2189, 113, 6, 4, 2, '0a17b7ce217e7b00209e65407088969d.jpg', NULL, '', 1, 'This is location.', '2014-01-09 04:01:10', '2014-01-09 16:21:52'),
(9, 'Amritsar dana mandi', 'Near Bus stand', '', '', 'Amritsar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, 'This is station.', '2014-01-09 06:01:48', '2014-01-09 12:28:48'),
(10, 'Kartarpur testtesttest', 'Near Bus stand', '', '', 'Kartarpur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, 'This is kartarpur area 2', '2014-01-09 07:01:56', '2014-01-09 13:04:56'),
(11, 'Chandighar sector 22', 'sector 22', '', '', 'Chandighar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, 'This is big station.', '2013-12-07 06:12:18', '2013-12-14 18:23:07'),
(12, 'Bus stand left side', 'near janak hotel', '', '', NULL, NULL, NULL, 9, NULL, 2, NULL, NULL, '', 1, 'this is most busy location.', '2013-12-07 06:12:11', '2013-12-14 18:23:10'),
(13, 'Sector 22', 'Near Cenima', '', '', NULL, NULL, NULL, 11, 22, 2, 'f6b124b1d964cf4632d49d41470ddfdf.jpg', NULL, '', 1, 'This is posh location.', '2014-01-09 04:01:15', '2014-01-09 21:52:15'),
(14, 'kalia colony', '56 a kalia colony', '', '', NULL, NULL, NULL, 9, 22, 2, 'bdb054fefa3a6ecc13e5f4b739c87c07.jpg', NULL, '', 1, 'these is location', '2014-01-09 04:01:45', '2014-01-09 21:52:45'),
(15, 'aman nagar', '227 aman nagar', '', '', NULL, NULL, NULL, 10, 22, 2, '157c665ce0b5bb552bd673997dec44c5.jpg', NULL, '', 1, 'hello', '2014-01-09 04:01:15', '2014-01-09 21:53:15'),
(16, 'GNDU campus', 'shensha palace', '', '', NULL, NULL, NULL, 701, 20, 2, '2378322f60d3817bff7fef2fac3a343a.jpg', NULL, '', 1, 'hello', '2014-01-13 10:01:13', '2014-01-13 15:38:13'),
(17, 'Dav college', 'fly over dav college', '', '', NULL, NULL, NULL, 1199, 31, 2, '63f8ddb9576d6de201a6dafa09020aa7.jpg', NULL, '', 1, 'hello', '2014-01-13 10:01:29', '2014-01-13 15:38:29'),
(18, 'shila colony', 'near gt road kalish nagar', '', '', NULL, NULL, NULL, 663, 13, 2, '4853daac5cbdd03013549b85b0ae9ad2.jpg', NULL, '', 1, 'hello', '2014-01-13 10:01:49', '2014-01-13 15:38:49'),
(19, 'Thisur', 'Thisur', '', '', NULL, NULL, NULL, 713, 21, 2, '4a1734629c70cb4141049180f1b03d55.jpg', NULL, '', 1, '', '2014-01-13 10:01:25', '2014-01-13 15:39:25'),
(20, 'Panaji real estate', 'Panaji real estate', 'Panaji real estate', 'Panaji real estate', NULL, NULL, NULL, 358, 20, 2, '2050fb6ee0dadf36d6d12ef44e117af1.jpg', NULL, '', 1, '', '2014-01-14 07:01:50', '2014-01-14 13:01:50'),
(21, 'Mumbai real estate', 'Mumbai real estate', 'Mumbai real estate', 'Mumbai real estate', NULL, NULL, NULL, 843, 22, 2, 'e4467b4cc507b0412da53d6b77f12627.jpg', NULL, '', 1, 'test', '2014-01-13 10:01:26', '2014-01-13 15:41:26'),
(22, 'Gurgaon real estate', 'Gurgaon real estate', 'Gurgaon real estate', 'Gurgaon real estate', NULL, NULL, NULL, 472, 22, 2, 'b96fe06798285185f69275eafd94a4e6.jpg', NULL, '', 1, 'test', '2014-01-13 10:01:07', '2014-01-13 15:42:07'),
(23, 'station with new design', 'new design', 'new design', 'new design', 'new design', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, 'hello', '2013-12-18 03:12:49', '2013-12-18 21:16:49'),
(24, 'location with new design', 'new design', 'new design', 'new design', NULL, NULL, NULL, 877, 13, 2, 'e7da471c902513952fce2a4b49783b5f.jpg', NULL, '', 1, 'new design', '2014-01-13 10:01:58', '2014-01-13 15:36:58'),
(25, 'test', '', '', '', 'test', 2168, 113, NULL, NULL, 1, NULL, NULL, '', 1, 'test', '2014-01-08 03:01:19', '2014-01-08 20:55:19'),
(26, 'Sanawar real estate', 'Sanawar real estate', 'Sanawar real estate', 'Sanawar real estate', NULL, NULL, NULL, 782, 31, 2, '21eb5113fbd8ebe2739e66f7676783f5.jpg', NULL, '', 1, 'test', '2014-01-14 08:01:03', '2014-01-14 14:07:03'),
(27, 'Shimla real eatste', 'Shimla real eatste', 'Shimla real eatste', 'Shimla real eatste', NULL, NULL, NULL, 516, 20, 2, '473e4cb5d79919cc2d010c0c5a4e4505.jpg', NULL, '', 1, 'test hello', '2014-01-13 10:01:48', '2014-01-13 15:43:48'),
(28, 'Saharanpur real estate', 'Saharanpur real estate', 'Saharanpur real estate', 'Saharanpur real estate', NULL, NULL, NULL, 1381, 6, 2, '8437cf14098ada6b396814a60f8b6a4e.jpg', NULL, '', 1, 'tset', '2014-01-13 10:01:48', '2014-01-13 15:44:48'),
(29, 'Kolhapur', NULL, NULL, NULL, 'Kolhapur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(30, 'Port Blair', NULL, NULL, NULL, 'Port Blair', 2168, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(31, 'Adilabad', NULL, NULL, NULL, 'Adilabad', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(32, 'Adoni', NULL, NULL, NULL, 'Adoni', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(33, 'Amadalavalasa', NULL, NULL, NULL, 'Amadalavalasa', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(34, 'Amalapuram', NULL, NULL, NULL, 'Amalapuram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(35, 'Anakapalle', NULL, NULL, NULL, 'Anakapalle', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(36, 'Anantapur', NULL, NULL, NULL, 'Anantapur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(37, 'Badepalle', NULL, NULL, NULL, 'Badepalle', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(38, 'Banganapalle', NULL, NULL, NULL, 'Banganapalle', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(39, 'Bapatla', NULL, NULL, NULL, 'Bapatla', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(40, 'Bellampalle', NULL, NULL, NULL, 'Bellampalle', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(41, 'Bethamcherla', NULL, NULL, NULL, 'Bethamcherla', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(42, 'Bhadrachalam', NULL, NULL, NULL, 'Bhadrachalam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(43, 'Bhainsa', NULL, NULL, NULL, 'Bhainsa', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(44, 'Bheemunipatnam', NULL, NULL, NULL, 'Bheemunipatnam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(45, 'Bhimavaram', NULL, NULL, NULL, 'Bhimavaram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(46, 'Bhongir', NULL, NULL, NULL, 'Bhongir', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(47, 'Bobbili', NULL, NULL, NULL, 'Bobbili', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(48, 'Bodhan', NULL, NULL, NULL, 'Bodhan', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(49, 'Chilakaluripet', NULL, NULL, NULL, 'Chilakaluripet', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(50, 'Chirala', NULL, NULL, NULL, 'Chirala', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(51, 'Chittoor', NULL, NULL, NULL, 'Chittoor', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(52, 'Cuddapah', NULL, NULL, NULL, 'Cuddapah', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(53, 'Devarakonda', NULL, NULL, NULL, 'Devarakonda', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(54, 'Dharmavaram', NULL, NULL, NULL, 'Dharmavaram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(55, 'Eluru', NULL, NULL, NULL, 'Eluru', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(56, 'Farooqnagar', NULL, NULL, NULL, 'Farooqnagar', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(57, 'Gadwal', NULL, NULL, NULL, 'Gadwal', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(58, 'Gooty', NULL, NULL, NULL, 'Gooty', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(59, 'Gudivada', NULL, NULL, NULL, 'Gudivada', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(60, 'Gudur', NULL, NULL, NULL, 'Gudur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(61, 'Guntakal', NULL, NULL, NULL, 'Guntakal', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(62, 'Guntur', NULL, NULL, NULL, 'Guntur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(63, 'Hanuman Junction', NULL, NULL, NULL, 'Hanuman Junction', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(64, 'Hindupur', NULL, NULL, NULL, 'Hindupur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(65, 'Hyderabad', NULL, NULL, NULL, 'Hyderabad', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(66, 'Ichchapuram', NULL, NULL, NULL, 'Ichchapuram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(67, 'Jaggaiahpet', NULL, NULL, NULL, 'Jaggaiahpet', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(68, 'Jagtial', NULL, NULL, NULL, 'Jagtial', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(69, 'Jammalamadugu', NULL, NULL, NULL, 'Jammalamadugu', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(70, 'Jangaon', NULL, NULL, NULL, 'Jangaon', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(71, 'Kadapa', NULL, NULL, NULL, 'Kadapa', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(72, 'Kadiri', NULL, NULL, NULL, 'Kadiri', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(73, 'Kagaznagar', NULL, NULL, NULL, 'Kagaznagar', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(74, 'Kakinada', NULL, NULL, NULL, 'Kakinada', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(75, 'Kalyandurg', NULL, NULL, NULL, 'Kalyandurg', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(76, 'Kamareddy', NULL, NULL, NULL, 'Kamareddy', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(77, 'Kandukur', NULL, NULL, NULL, 'Kandukur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(78, 'Karimnagar', NULL, NULL, NULL, 'Karimnagar', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(79, 'Kavali', NULL, NULL, NULL, 'Kavali', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(80, 'Khammam', NULL, NULL, NULL, 'Khammam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(81, 'Koratla', NULL, NULL, NULL, 'Koratla', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(82, 'Kothagudem', NULL, NULL, NULL, 'Kothagudem', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(83, 'Kothapeta', NULL, NULL, NULL, 'Kothapeta', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(84, 'Kovvur', NULL, NULL, NULL, 'Kovvur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(85, 'Kurnool', NULL, NULL, NULL, 'Kurnool', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(86, 'Kyathampalle', NULL, NULL, NULL, 'Kyathampalle', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(87, 'Macherla', NULL, NULL, NULL, 'Macherla', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(88, 'Machilipatnam', NULL, NULL, NULL, 'Machilipatnam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(89, 'Madanapalle', NULL, NULL, NULL, 'Madanapalle', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(90, 'Mahbubnagar', NULL, NULL, NULL, 'Mahbubnagar', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(91, 'Mancherial', NULL, NULL, NULL, 'Mancherial', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(92, 'Mandamarri', NULL, NULL, NULL, 'Mandamarri', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(93, 'Mandapeta', NULL, NULL, NULL, 'Mandapeta', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(94, 'Manuguru', NULL, NULL, NULL, 'Manuguru', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(95, 'Markapur', NULL, NULL, NULL, 'Markapur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(96, 'Medak', NULL, NULL, NULL, 'Medak', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(97, 'Miryalaguda', NULL, NULL, NULL, 'Miryalaguda', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(98, 'Mogalthur', NULL, NULL, NULL, 'Mogalthur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(99, 'Nagari', NULL, NULL, NULL, 'Nagari', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(100, 'Nagarkurnool', NULL, NULL, NULL, 'Nagarkurnool', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(101, 'Nandyal', NULL, NULL, NULL, 'Nandyal', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(102, 'Narasapur', NULL, NULL, NULL, 'Narasapur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(103, 'Narasaraopet', NULL, NULL, NULL, 'Narasaraopet', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(104, 'Narayanpet', NULL, NULL, NULL, 'Narayanpet', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(105, 'Narsipatnam', NULL, NULL, NULL, 'Narsipatnam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(106, 'Nellore', NULL, NULL, NULL, 'Nellore', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(107, 'Nidadavole', NULL, NULL, NULL, 'Nidadavole', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(108, 'Nirmal', NULL, NULL, NULL, 'Nirmal', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(109, 'Nizamabad', NULL, NULL, NULL, 'Nizamabad', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(110, 'Nuzvid', NULL, NULL, NULL, 'Nuzvid', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(111, 'Ongole', NULL, NULL, NULL, 'Ongole', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(112, 'Palacole', NULL, NULL, NULL, 'Palacole', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(113, 'Palasa Kasibugga', NULL, NULL, NULL, 'Palasa Kasibugga', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(114, 'Palwancha', NULL, NULL, NULL, 'Palwancha', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(115, 'Parvathipuram', NULL, NULL, NULL, 'Parvathipuram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(116, 'Pedana', NULL, NULL, NULL, 'Pedana', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(117, 'Peddapuram', NULL, NULL, NULL, 'Peddapuram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(118, 'Pithapuram', NULL, NULL, NULL, 'Pithapuram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(119, 'Pondur', NULL, NULL, NULL, 'Pondur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(120, 'Ponnur', NULL, NULL, NULL, 'Ponnur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(121, 'Proddatur', NULL, NULL, NULL, 'Proddatur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(122, 'Punganur', NULL, NULL, NULL, 'Punganur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(123, 'Puttur', NULL, NULL, NULL, 'Puttur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(124, 'Rajahmundry', NULL, NULL, NULL, 'Rajahmundry', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(125, 'Rajam', NULL, NULL, NULL, 'Rajam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(126, 'Ramachandrapuram', NULL, NULL, NULL, 'Ramachandrapuram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(127, 'Ramagundam', NULL, NULL, NULL, 'Ramagundam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(128, 'Rayachoti', NULL, NULL, NULL, 'Rayachoti', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(129, 'Rayadurg', NULL, NULL, NULL, 'Rayadurg', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(130, 'Renigunta', NULL, NULL, NULL, 'Renigunta', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(131, 'Repalle', NULL, NULL, NULL, 'Repalle', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(132, 'Sadasivpet', NULL, NULL, NULL, 'Sadasivpet', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(133, 'Salur', NULL, NULL, NULL, 'Salur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(134, 'Samalkot', NULL, NULL, NULL, 'Samalkot', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(135, 'Sangareddy', NULL, NULL, NULL, 'Sangareddy', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(136, 'Sattenapalle', NULL, NULL, NULL, 'Sattenapalle', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(137, 'Siddipet', NULL, NULL, NULL, 'Siddipet', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(138, 'Singapur', NULL, NULL, NULL, 'Singapur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(139, 'Sircilla', NULL, NULL, NULL, 'Sircilla', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(140, 'Srikakulam', NULL, NULL, NULL, 'Srikakulam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(141, 'Srikalahasti', NULL, NULL, NULL, 'Srikalahasti', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(142, 'Suryapet', NULL, NULL, NULL, 'Suryapet', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(143, 'Tadepalligudem', NULL, NULL, NULL, 'Tadepalligudem', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(144, 'Tadpatri', NULL, NULL, NULL, 'Tadpatri', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(145, 'Tandur', NULL, NULL, NULL, 'Tandur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(146, 'Tanuku', NULL, NULL, NULL, 'Tanuku', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(147, 'Tenali', NULL, NULL, NULL, 'Tenali', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(148, 'Tirupati', NULL, NULL, NULL, 'Tirupati', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(149, 'Tuni', NULL, NULL, NULL, 'Tuni', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(150, 'Uravakonda', NULL, NULL, NULL, 'Uravakonda', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(151, 'Venkatagiri', NULL, NULL, NULL, 'Venkatagiri', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(152, 'Vicarabad', NULL, NULL, NULL, 'Vicarabad', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(153, 'Vijayawada', NULL, NULL, NULL, 'Vijayawada', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(154, 'Vinukonda', NULL, NULL, NULL, 'Vinukonda', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(155, 'Visakhapatnam', NULL, NULL, NULL, 'Visakhapatnam', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(156, 'Vizianagaram', NULL, NULL, NULL, 'Vizianagaram', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(157, 'Wanaparthy', NULL, NULL, NULL, 'Wanaparthy', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(158, 'Warangal', NULL, NULL, NULL, 'Warangal', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(159, 'Yellandu', NULL, NULL, NULL, 'Yellandu', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(160, 'Yemmiganur', NULL, NULL, NULL, 'Yemmiganur', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(161, 'Yerraguntla', NULL, NULL, NULL, 'Yerraguntla', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(162, 'Zahirabad', NULL, NULL, NULL, 'Zahirabad', 2169, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(163, 'Rajampet', NULL, NULL, NULL, 'Rajampet', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(164, 'Along', NULL, NULL, NULL, 'Along', 2196, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(165, 'Bomdila', NULL, NULL, NULL, 'Bomdila', 2196, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(166, 'Itanagar', NULL, NULL, NULL, 'Itanagar', 2196, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(167, 'Naharlagun', NULL, NULL, NULL, 'Naharlagun', 2196, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(168, 'Pasighat', NULL, NULL, NULL, 'Pasighat', 2196, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(169, 'Abhayapuri', NULL, NULL, NULL, 'Abhayapuri', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(170, 'Amguri', NULL, NULL, NULL, 'Amguri', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(171, 'Anandnagaar', NULL, NULL, NULL, 'Anandnagaar', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(172, 'Barpeta', NULL, NULL, NULL, 'Barpeta', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(173, 'Barpeta Road', NULL, NULL, NULL, 'Barpeta Road', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(174, 'Bilasipara', NULL, NULL, NULL, 'Bilasipara', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(175, 'Bongaigaon', NULL, NULL, NULL, 'Bongaigaon', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(176, 'Dhekiajuli', NULL, NULL, NULL, 'Dhekiajuli', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(177, 'Dhubri', NULL, NULL, NULL, 'Dhubri', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(178, 'Dibrugarh', NULL, NULL, NULL, 'Dibrugarh', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(179, 'Digboi', NULL, NULL, NULL, 'Digboi', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(180, 'Diphu', NULL, NULL, NULL, 'Diphu', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(181, 'Dispur', NULL, NULL, NULL, 'Dispur', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(182, 'Gauripur', NULL, NULL, NULL, 'Gauripur', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(183, 'Goalpara', NULL, NULL, NULL, 'Goalpara', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(184, 'Golaghat', NULL, NULL, NULL, 'Golaghat', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(185, 'Guwahati', NULL, NULL, NULL, 'Guwahati', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(186, 'Haflong', NULL, NULL, NULL, 'Haflong', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(187, 'Hailakandi', NULL, NULL, NULL, 'Hailakandi', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(188, 'Hojai', NULL, NULL, NULL, 'Hojai', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(189, 'Jorhat', NULL, NULL, NULL, 'Jorhat', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(190, 'Karimganj', NULL, NULL, NULL, 'Karimganj', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(191, 'Kokrajhar', NULL, NULL, NULL, 'Kokrajhar', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(192, 'Lanka', NULL, NULL, NULL, 'Lanka', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(193, 'Lumding', NULL, NULL, NULL, 'Lumding', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(194, 'Mangaldoi', NULL, NULL, NULL, 'Mangaldoi', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(195, 'Mankachar', NULL, NULL, NULL, 'Mankachar', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(196, 'Margherita', NULL, NULL, NULL, 'Margherita', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(197, 'Mariani', NULL, NULL, NULL, 'Mariani', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(198, 'Marigaon', NULL, NULL, NULL, 'Marigaon', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(199, 'Nagaon', NULL, NULL, NULL, 'Nagaon', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(200, 'Nalbari', NULL, NULL, NULL, 'Nalbari', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(201, 'North Lakhimpur', NULL, NULL, NULL, 'North Lakhimpur', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(202, 'Rangia', NULL, NULL, NULL, 'Rangia', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(203, 'Sibsagar', NULL, NULL, NULL, 'Sibsagar', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(204, 'Silapathar', NULL, NULL, NULL, 'Silapathar', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(205, 'Silchar', NULL, NULL, NULL, 'Silchar', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(206, 'Tezpur', NULL, NULL, NULL, 'Tezpur', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(207, 'Tinsukia', NULL, NULL, NULL, 'Tinsukia', 2170, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(208, 'Amarpur', NULL, NULL, NULL, 'Amarpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(209, 'Araria', NULL, NULL, NULL, 'Araria', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(210, 'Areraj', NULL, NULL, NULL, 'Areraj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(211, 'Arrah', NULL, NULL, NULL, 'Arrah', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(212, 'Asarganj', NULL, NULL, NULL, 'Asarganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(213, 'Aurangabad', NULL, NULL, NULL, 'Aurangabad', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(214, 'Bagaha', NULL, NULL, NULL, 'Bagaha', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(215, 'Bahadurganj', NULL, NULL, NULL, 'Bahadurganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(216, 'Bairgania', NULL, NULL, NULL, 'Bairgania', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(217, 'Bakhtiarpur', NULL, NULL, NULL, 'Bakhtiarpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(218, 'Banka', NULL, NULL, NULL, 'Banka', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(219, 'Banmankhi Bazar', NULL, NULL, NULL, 'Banmankhi Bazar', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(220, 'Barahiya', NULL, NULL, NULL, 'Barahiya', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(221, 'Barauli', NULL, NULL, NULL, 'Barauli', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(222, 'Barbigha', NULL, NULL, NULL, 'Barbigha', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(223, 'Barh', NULL, NULL, NULL, 'Barh', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(224, 'Begusarai', NULL, NULL, NULL, 'Begusarai', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(225, 'Behea', NULL, NULL, NULL, 'Behea', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(226, 'Bettiah', NULL, NULL, NULL, 'Bettiah', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(227, 'Bhabua', NULL, NULL, NULL, 'Bhabua', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(228, 'Bhagalpur', NULL, NULL, NULL, 'Bhagalpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(229, 'Bihar Sharif', NULL, NULL, NULL, 'Bihar Sharif', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(230, 'Bikramganj', NULL, NULL, NULL, 'Bikramganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(231, 'Bodh Gaya', NULL, NULL, NULL, 'Bodh Gaya', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(232, 'Buxar', NULL, NULL, NULL, 'Buxar', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(233, 'Chandan Bara', NULL, NULL, NULL, 'Chandan Bara', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(234, 'Chanpatia', NULL, NULL, NULL, 'Chanpatia', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(235, 'Chhapra', NULL, NULL, NULL, 'Chhapra', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(236, 'Colgong', NULL, NULL, NULL, 'Colgong', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(237, 'Dalsinghsarai', NULL, NULL, NULL, 'Dalsinghsarai', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(238, 'Darbhanga', NULL, NULL, NULL, 'Darbhanga', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(239, 'Daudnagar', NULL, NULL, NULL, 'Daudnagar', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(240, 'Dehri-on-Sone', NULL, NULL, NULL, 'Dehri-on-Sone', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(241, 'Dhaka', NULL, NULL, NULL, 'Dhaka', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(242, 'Dighwara', NULL, NULL, NULL, 'Dighwara', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(243, 'Dumraon', NULL, NULL, NULL, 'Dumraon', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(244, 'Fatwah', NULL, NULL, NULL, 'Fatwah', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(245, 'Forbesganj', NULL, NULL, NULL, 'Forbesganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(246, 'Gaya', NULL, NULL, NULL, 'Gaya', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(247, 'Gogri Jamalpur', NULL, NULL, NULL, 'Gogri Jamalpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(248, 'Gopalganj', NULL, NULL, NULL, 'Gopalganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(249, 'Hajipur', NULL, NULL, NULL, 'Hajipur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(250, 'Hilsa', NULL, NULL, NULL, 'Hilsa', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(251, 'Hisua', NULL, NULL, NULL, 'Hisua', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(252, 'Islampur', NULL, NULL, NULL, 'Islampur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(253, 'Jagdispur', NULL, NULL, NULL, 'Jagdispur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(254, 'Jamalpur', NULL, NULL, NULL, 'Jamalpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(255, 'Jamui', NULL, NULL, NULL, 'Jamui', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(256, 'Jehanabad', NULL, NULL, NULL, 'Jehanabad', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(257, 'Jhajha', NULL, NULL, NULL, 'Jhajha', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(258, 'Jhanjharpur', NULL, NULL, NULL, 'Jhanjharpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(259, 'Jogabani', NULL, NULL, NULL, 'Jogabani', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(260, 'Kanti', NULL, NULL, NULL, 'Kanti', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(261, 'Katihar', NULL, NULL, NULL, 'Katihar', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(262, 'Khagaria', NULL, NULL, NULL, 'Khagaria', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(263, 'Kharagpur', NULL, NULL, NULL, 'Kharagpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(264, 'Kishanganj', NULL, NULL, NULL, 'Kishanganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(265, 'Lakhisarai', NULL, NULL, NULL, 'Lakhisarai', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(266, 'Lalganj', NULL, NULL, NULL, 'Lalganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(267, 'Madhepura', NULL, NULL, NULL, 'Madhepura', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(268, 'Madhubani', NULL, NULL, NULL, 'Madhubani', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(269, 'Maharajganj', NULL, NULL, NULL, 'Maharajganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(270, 'Mahnar Bazar', NULL, NULL, NULL, 'Mahnar Bazar', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(271, 'Makhdumpur', NULL, NULL, NULL, 'Makhdumpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(272, 'Maner', NULL, NULL, NULL, 'Maner', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(273, 'Manihari', NULL, NULL, NULL, 'Manihari', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(274, 'Marhaura', NULL, NULL, NULL, 'Marhaura', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(275, 'Masaurhi', NULL, NULL, NULL, 'Masaurhi', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(276, 'Mirganj', NULL, NULL, NULL, 'Mirganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(277, 'Mokameh', NULL, NULL, NULL, 'Mokameh', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(278, 'Motihari', NULL, NULL, NULL, 'Motihari', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(279, 'Motipur', NULL, NULL, NULL, 'Motipur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(280, 'Munger', NULL, NULL, NULL, 'Munger', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(281, 'Murliganj', NULL, NULL, NULL, 'Murliganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(282, 'Muzaffarpur', NULL, NULL, NULL, 'Muzaffarpur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(283, 'Narkatiaganj', NULL, NULL, NULL, 'Narkatiaganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(284, 'Naugachhia', NULL, NULL, NULL, 'Naugachhia', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(285, 'Nawada', NULL, NULL, NULL, 'Nawada', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(286, 'Nokha', NULL, NULL, NULL, 'Nokha', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(287, 'Patna', NULL, NULL, NULL, 'Patna', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(288, 'Piro', NULL, NULL, NULL, 'Piro', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(289, 'Purnia', NULL, NULL, NULL, 'Purnia', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(290, 'Rafiganj', NULL, NULL, NULL, 'Rafiganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(291, 'Rajgir', NULL, NULL, NULL, 'Rajgir', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(292, 'Ramnagar', NULL, NULL, NULL, 'Ramnagar', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(293, 'Raxaul Bazar', NULL, NULL, NULL, 'Raxaul Bazar', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(294, 'Revelganj', NULL, NULL, NULL, 'Revelganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(295, 'Rosera', NULL, NULL, NULL, 'Rosera', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(296, 'Saharsa', NULL, NULL, NULL, 'Saharsa', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(297, 'Samastipur', NULL, NULL, NULL, 'Samastipur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(298, 'Sasaram', NULL, NULL, NULL, 'Sasaram', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(299, 'Sheikhpura', NULL, NULL, NULL, 'Sheikhpura', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(300, 'Sheohar', NULL, NULL, NULL, 'Sheohar', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(301, 'Sherghati', NULL, NULL, NULL, 'Sherghati', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(302, 'Silao', NULL, NULL, NULL, 'Silao', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(303, 'Sitamarhi', NULL, NULL, NULL, 'Sitamarhi', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(304, 'Siwan', NULL, NULL, NULL, 'Siwan', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(305, 'Sonepur', NULL, NULL, NULL, 'Sonepur', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(306, 'Sugauli', NULL, NULL, NULL, 'Sugauli', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(307, 'Sultanganj', NULL, NULL, NULL, 'Sultanganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(308, 'Supaul', NULL, NULL, NULL, 'Supaul', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(309, 'Warisaliganj', NULL, NULL, NULL, 'Warisaliganj', 2171, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(310, 'Ahiwara', NULL, NULL, NULL, 'Ahiwara', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(311, 'Akaltara', NULL, NULL, NULL, 'Akaltara', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(312, 'Ambagarh Chowki', NULL, NULL, NULL, 'Ambagarh Chowki', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(313, 'Ambikapur', NULL, NULL, NULL, 'Ambikapur', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(314, 'Arang', NULL, NULL, NULL, 'Arang', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(315, 'Bade Bacheli', NULL, NULL, NULL, 'Bade Bacheli', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(316, 'Balod', NULL, NULL, NULL, 'Balod', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(317, 'Baloda Bazar', NULL, NULL, NULL, 'Baloda Bazar', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(318, 'Bemetra', NULL, NULL, NULL, 'Bemetra', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(319, 'Bhatapara', NULL, NULL, NULL, 'Bhatapara', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(320, 'Bilaspur', NULL, NULL, NULL, 'Bilaspur', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(321, 'Birgaon', NULL, NULL, NULL, 'Birgaon', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(322, 'Champa', NULL, NULL, NULL, 'Champa', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(323, 'Chirmiri', NULL, NULL, NULL, 'Chirmiri', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(324, 'Dalli-Rajhara', NULL, NULL, NULL, 'Dalli-Rajhara', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(325, 'Dhamtari', NULL, NULL, NULL, 'Dhamtari', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(326, 'Dipka', NULL, NULL, NULL, 'Dipka', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(327, 'Dongargarh', NULL, NULL, NULL, 'Dongargarh', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(328, 'Durg-Bhilai Nagar', NULL, NULL, NULL, 'Durg-Bhilai Nagar', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:26'),
(329, 'Gobranawapara', NULL, NULL, NULL, 'Gobranawapara', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(330, 'Jagdalpur', NULL, NULL, NULL, 'Jagdalpur', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(331, 'Janjgir', NULL, NULL, NULL, 'Janjgir', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(332, 'Jashpurnagar', NULL, NULL, NULL, 'Jashpurnagar', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27');
INSERT INTO `default_place` (`place_id`, `place_name`, `place_address1`, `place_address2`, `place_address3`, `place_city`, `place_state_id`, `place_country_id`, `place_station_id`, `place_landlord_id`, `place_type`, `place_picture_name`, `place_picture_name2`, `place_picture_name3`, `status`, `comments`, `created`, `updated`) VALUES
(333, 'Kanker', NULL, NULL, NULL, 'Kanker', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(334, 'Kawardha', NULL, NULL, NULL, 'Kawardha', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(335, 'Kondagaon', NULL, NULL, NULL, 'Kondagaon', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(336, 'Korba', NULL, NULL, NULL, 'Korba', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(337, 'Mahasamund', NULL, NULL, NULL, 'Mahasamund', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(338, 'Mahendragarh', NULL, NULL, NULL, 'Mahendragarh', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(339, 'Mungeli', NULL, NULL, NULL, 'Mungeli', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(340, 'Naila Janjgir', NULL, NULL, NULL, 'Naila Janjgir', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(341, 'Raigarh', NULL, NULL, NULL, 'Raigarh', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(342, 'Raipur', NULL, NULL, NULL, 'Raipur', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(343, 'Rajnandgaon', NULL, NULL, NULL, 'Rajnandgaon', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(344, 'Sakti', NULL, NULL, NULL, 'Sakti', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(345, 'Tilda Newra', NULL, NULL, NULL, 'Tilda Newra', 5267, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(346, 'Amli', NULL, NULL, NULL, 'Amli', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(347, 'Silvassa', NULL, NULL, NULL, 'Silvassa', 2173, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(348, 'Daman and Diu', NULL, NULL, NULL, 'Daman and Diu', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(349, 'Daman and Diu', NULL, NULL, NULL, 'Daman and Diu', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(350, 'Asola', NULL, NULL, NULL, 'Asola', 2174, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(351, 'Delhi', NULL, NULL, NULL, 'Delhi', 2174, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(352, 'Aldona', NULL, NULL, NULL, 'Aldona', 2199, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(353, 'Curchorem Cacora', NULL, NULL, NULL, 'Curchorem Cacora', 2199, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(354, 'Madgaon', NULL, NULL, NULL, 'Madgaon', 2199, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(355, 'Mapusa', NULL, NULL, NULL, 'Mapusa', 2199, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(356, 'Margao', NULL, NULL, NULL, 'Margao', 2199, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(357, 'Marmagao', NULL, NULL, NULL, 'Marmagao', 2199, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(358, 'Panaji', NULL, NULL, NULL, 'Panaji', 2199, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(359, 'Ahmedabad', NULL, NULL, NULL, 'Ahmedabad', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(360, 'Amreli', NULL, NULL, NULL, 'Amreli', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(361, 'Anand', NULL, NULL, NULL, 'Anand', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(362, 'Ankleshwar', NULL, NULL, NULL, 'Ankleshwar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(363, 'Bharuch', NULL, NULL, NULL, 'Bharuch', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(364, 'Bhavnagar', NULL, NULL, NULL, 'Bhavnagar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(365, 'Bhuj', NULL, NULL, NULL, 'Bhuj', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(366, 'Cambay', NULL, NULL, NULL, 'Cambay', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(367, 'Dahod', NULL, NULL, NULL, 'Dahod', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(368, 'Deesa', NULL, NULL, NULL, 'Deesa', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(369, 'Dharampur, India', NULL, NULL, NULL, 'Dharampur, India', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(370, 'Dholka', NULL, NULL, NULL, 'Dholka', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(371, 'Gandhinagar', NULL, NULL, NULL, 'Gandhinagar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(372, 'Godhra', NULL, NULL, NULL, 'Godhra', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(373, 'Himatnagar', NULL, NULL, NULL, 'Himatnagar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(374, 'Idar', NULL, NULL, NULL, 'Idar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(375, 'Jamnagar', NULL, NULL, NULL, 'Jamnagar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(376, 'Junagadh', NULL, NULL, NULL, 'Junagadh', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(377, 'Kadi', NULL, NULL, NULL, 'Kadi', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(378, 'Kalavad', NULL, NULL, NULL, 'Kalavad', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(379, 'Kalol', NULL, NULL, NULL, 'Kalol', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(380, 'Kapadvanj', NULL, NULL, NULL, 'Kapadvanj', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(381, 'Karjan', NULL, NULL, NULL, 'Karjan', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(382, 'Keshod', NULL, NULL, NULL, 'Keshod', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(383, 'Khambhalia', NULL, NULL, NULL, 'Khambhalia', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(384, 'Khambhat', NULL, NULL, NULL, 'Khambhat', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(385, 'Kheda', NULL, NULL, NULL, 'Kheda', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(386, 'Khedbrahma', NULL, NULL, NULL, 'Khedbrahma', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(387, 'Kheralu', NULL, NULL, NULL, 'Kheralu', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(388, 'Kodinar', NULL, NULL, NULL, 'Kodinar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(389, 'Lathi', NULL, NULL, NULL, 'Lathi', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(390, 'Limbdi', NULL, NULL, NULL, 'Limbdi', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(391, 'Lunawada', NULL, NULL, NULL, 'Lunawada', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(392, 'Mahesana', NULL, NULL, NULL, 'Mahesana', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(393, 'Mahuva', NULL, NULL, NULL, 'Mahuva', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(394, 'Manavadar', NULL, NULL, NULL, 'Manavadar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(395, 'Mandvi', NULL, NULL, NULL, 'Mandvi', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(396, 'Mangrol', NULL, NULL, NULL, 'Mangrol', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(397, 'Mansa', NULL, NULL, NULL, 'Mansa', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(398, 'Mehmedabad', NULL, NULL, NULL, 'Mehmedabad', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(399, 'Modasa', NULL, NULL, NULL, 'Modasa', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(400, 'Morvi', NULL, NULL, NULL, 'Morvi', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(401, 'Nadiad', NULL, NULL, NULL, 'Nadiad', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(402, 'Navsari', NULL, NULL, NULL, 'Navsari', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(403, 'Padra', NULL, NULL, NULL, 'Padra', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(404, 'Palanpur', NULL, NULL, NULL, 'Palanpur', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(405, 'Palitana', NULL, NULL, NULL, 'Palitana', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(406, 'Pardi', NULL, NULL, NULL, 'Pardi', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(407, 'Patan', NULL, NULL, NULL, 'Patan', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(408, 'Petlad', NULL, NULL, NULL, 'Petlad', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(409, 'Porbandar', NULL, NULL, NULL, 'Porbandar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(410, 'Radhanpur', NULL, NULL, NULL, 'Radhanpur', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(411, 'Rajkot', NULL, NULL, NULL, 'Rajkot', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(412, 'Rajpipla', NULL, NULL, NULL, 'Rajpipla', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(413, 'Rajula', NULL, NULL, NULL, 'Rajula', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(414, 'Ranavav', NULL, NULL, NULL, 'Ranavav', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(415, 'Rapar', NULL, NULL, NULL, 'Rapar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(416, 'Salaya', NULL, NULL, NULL, 'Salaya', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(417, 'Sanand', NULL, NULL, NULL, 'Sanand', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(418, 'Savarkundla', NULL, NULL, NULL, 'Savarkundla', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(419, 'Sidhpur', NULL, NULL, NULL, 'Sidhpur', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(420, 'Sihor', NULL, NULL, NULL, 'Sihor', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(421, 'Songadh', NULL, NULL, NULL, 'Songadh', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(422, 'Surat', NULL, NULL, NULL, 'Surat', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(423, 'Talaja', NULL, NULL, NULL, 'Talaja', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(424, 'Thangadh', NULL, NULL, NULL, 'Thangadh', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(425, 'Tharad', NULL, NULL, NULL, 'Tharad', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(426, 'Umbergaon', NULL, NULL, NULL, 'Umbergaon', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(427, 'Umreth', NULL, NULL, NULL, 'Umreth', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(428, 'Una', NULL, NULL, NULL, 'Una', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(429, 'Unjha', NULL, NULL, NULL, 'Unjha', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(430, 'Upleta', NULL, NULL, NULL, 'Upleta', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(431, 'Vadnagar', NULL, NULL, NULL, 'Vadnagar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(432, 'Vadodara', NULL, NULL, NULL, 'Vadodara', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(433, 'Valsad', NULL, NULL, NULL, 'Valsad', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(434, 'Vapi', NULL, NULL, NULL, 'Vapi', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(435, 'Vapi', NULL, NULL, NULL, 'Vapi', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(436, 'Veraval', NULL, NULL, NULL, 'Veraval', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(437, 'Vijapur', NULL, NULL, NULL, 'Vijapur', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(438, 'Viramgam', NULL, NULL, NULL, 'Viramgam', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(439, 'Visnagar', NULL, NULL, NULL, 'Visnagar', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(440, 'Vyara', NULL, NULL, NULL, 'Vyara', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(441, 'Wadhwan', NULL, NULL, NULL, 'Wadhwan', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(442, 'Wankaner', NULL, NULL, NULL, 'Wankaner', 2175, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(443, 'Adalaj', NULL, NULL, NULL, 'Adalaj', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(444, 'Adityana', NULL, NULL, NULL, 'Adityana', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(445, 'Alang', NULL, NULL, NULL, 'Alang', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(446, 'Ambaji', NULL, NULL, NULL, 'Ambaji', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(447, 'Ambaliyasan', NULL, NULL, NULL, 'Ambaliyasan', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(448, 'Andada', NULL, NULL, NULL, 'Andada', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(449, 'Anjar', NULL, NULL, NULL, 'Anjar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(450, 'Anklav', NULL, NULL, NULL, 'Anklav', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(451, 'Antaliya', NULL, NULL, NULL, 'Antaliya', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(452, 'Arambhada', NULL, NULL, NULL, 'Arambhada', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(453, 'Atul', NULL, NULL, NULL, 'Atul', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(454, 'Ballabhgarh', NULL, NULL, NULL, 'Ballabhgarh', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(455, 'Ambala', NULL, NULL, NULL, 'Ambala', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(456, 'Ambala', NULL, NULL, NULL, 'Ambala', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(457, 'Asankhurd', NULL, NULL, NULL, 'Asankhurd', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(458, 'Assandh', NULL, NULL, NULL, 'Assandh', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(459, 'Ateli', NULL, NULL, NULL, 'Ateli', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(460, 'Babiyal', NULL, NULL, NULL, 'Babiyal', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(461, 'Bahadurgarh', NULL, NULL, NULL, 'Bahadurgarh', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(462, 'Barwala', NULL, NULL, NULL, 'Barwala', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(463, 'Bhiwani', NULL, NULL, NULL, 'Bhiwani', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(464, 'Charkhi Dadri', NULL, NULL, NULL, 'Charkhi Dadri', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(465, 'Cheeka', NULL, NULL, NULL, 'Cheeka', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(466, 'Ellenabad 2', NULL, NULL, NULL, 'Ellenabad 2', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(467, 'Faridabad', NULL, NULL, NULL, 'Faridabad', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(468, 'Fatehabad', NULL, NULL, NULL, 'Fatehabad', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(469, 'Ganaur', NULL, NULL, NULL, 'Ganaur', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(470, 'Gharaunda', NULL, NULL, NULL, 'Gharaunda', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(471, 'Gohana', NULL, NULL, NULL, 'Gohana', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(472, 'Gurgaon', NULL, NULL, NULL, 'Gurgaon', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(473, 'Haibat(Yamuna Nagar)', NULL, NULL, NULL, 'Haibat(Yamuna Nagar)', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(474, 'Hansi', NULL, NULL, NULL, 'Hansi', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(475, 'Hisar', NULL, NULL, NULL, 'Hisar', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(476, 'Hodal', NULL, NULL, NULL, 'Hodal', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(477, 'Jhajjar', NULL, NULL, NULL, 'Jhajjar', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(478, 'Jind', NULL, NULL, NULL, 'Jind', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(479, 'Kaithal', NULL, NULL, NULL, 'Kaithal', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(480, 'Kalan Wali', NULL, NULL, NULL, 'Kalan Wali', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(481, 'Kalka', NULL, NULL, NULL, 'Kalka', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(482, 'Karnal', NULL, NULL, NULL, 'Karnal', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(483, 'Ladwa', NULL, NULL, NULL, 'Ladwa', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(484, 'Mahendragarh', NULL, NULL, NULL, 'Mahendragarh', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(485, 'Mandi Dabwali', NULL, NULL, NULL, 'Mandi Dabwali', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(486, 'Narnaul', NULL, NULL, NULL, 'Narnaul', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(487, 'Narwana', NULL, NULL, NULL, 'Narwana', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(488, 'Palwal', NULL, NULL, NULL, 'Palwal', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(489, 'Panchkula', NULL, NULL, NULL, 'Panchkula', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(490, 'Panipat', NULL, NULL, NULL, 'Panipat', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(491, 'Pehowa', NULL, NULL, NULL, 'Pehowa', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(492, 'Pinjore', NULL, NULL, NULL, 'Pinjore', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(493, 'Rania', NULL, NULL, NULL, 'Rania', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(494, 'Ratia', NULL, NULL, NULL, 'Ratia', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(495, 'Rewari', NULL, NULL, NULL, 'Rewari', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(496, 'Rohtak', NULL, NULL, NULL, 'Rohtak', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(497, 'Safidon', NULL, NULL, NULL, 'Safidon', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(498, 'Samalkha', NULL, NULL, NULL, 'Samalkha', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(499, 'Shahbad', NULL, NULL, NULL, 'Shahbad', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(500, 'Sirsa', NULL, NULL, NULL, 'Sirsa', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(501, 'Sohna', NULL, NULL, NULL, 'Sohna', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(502, 'Sonipat', NULL, NULL, NULL, 'Sonipat', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(503, 'Taraori', NULL, NULL, NULL, 'Taraori', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(504, 'Thanesar', NULL, NULL, NULL, 'Thanesar', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(505, 'Tohana', NULL, NULL, NULL, 'Tohana', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(506, 'Yamunanagar', NULL, NULL, NULL, 'Yamunanagar', 2176, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(507, 'Arki', NULL, NULL, NULL, 'Arki', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(508, 'Baddi', NULL, NULL, NULL, 'Baddi', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(509, 'Bilaspur', NULL, NULL, NULL, 'Bilaspur', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(510, 'Chamba', NULL, NULL, NULL, 'Chamba', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(511, 'Dalhousie', NULL, NULL, NULL, 'Dalhousie', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(512, 'Dharamsala', NULL, NULL, NULL, 'Dharamsala', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(513, 'Hamirpur', NULL, NULL, NULL, 'Hamirpur', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(514, 'Mandi', NULL, NULL, NULL, 'Mandi', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(515, 'Nahan', NULL, NULL, NULL, 'Nahan', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(516, 'Shimla', NULL, NULL, NULL, 'Shimla', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(517, 'Solan', NULL, NULL, NULL, 'Solan', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(518, 'Sundarnagar', NULL, NULL, NULL, 'Sundarnagar', 2177, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(519, 'Jammu', NULL, NULL, NULL, 'Jammu', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(520, 'Achabbal', NULL, NULL, NULL, 'Achabbal', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(521, 'Akhnoor', NULL, NULL, NULL, 'Akhnoor', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(522, 'Anantnag', NULL, NULL, NULL, 'Anantnag', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(523, 'Arnia', NULL, NULL, NULL, 'Arnia', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(524, 'Awantipora', NULL, NULL, NULL, 'Awantipora', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(525, 'Bandipore', NULL, NULL, NULL, 'Bandipore', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(526, 'Baramula', NULL, NULL, NULL, 'Baramula', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(527, 'Kathua', NULL, NULL, NULL, 'Kathua', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(528, 'Leh', NULL, NULL, NULL, 'Leh', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(529, 'Punch', NULL, NULL, NULL, 'Punch', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(530, 'Rajauri', NULL, NULL, NULL, 'Rajauri', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(531, 'Sopore', NULL, NULL, NULL, 'Sopore', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(532, 'Srinagar', NULL, NULL, NULL, 'Srinagar', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(533, 'Udhampur', NULL, NULL, NULL, 'Udhampur', 2178, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(534, 'Amlabad', NULL, NULL, NULL, 'Amlabad', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(535, 'Ara', NULL, NULL, NULL, 'Ara', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(536, 'Barughutu', NULL, NULL, NULL, 'Barughutu', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(537, 'Bokaro Steel City', NULL, NULL, NULL, 'Bokaro Steel City', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(538, 'Chaibasa', NULL, NULL, NULL, 'Chaibasa', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(539, 'Chakradharpur', NULL, NULL, NULL, 'Chakradharpur', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(540, 'Chandrapura', NULL, NULL, NULL, 'Chandrapura', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(541, 'Chatra', NULL, NULL, NULL, 'Chatra', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(542, 'Chirkunda', NULL, NULL, NULL, 'Chirkunda', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(543, 'Churi', NULL, NULL, NULL, 'Churi', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(544, 'Daltonganj', NULL, NULL, NULL, 'Daltonganj', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(545, 'Deoghar', NULL, NULL, NULL, 'Deoghar', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(546, 'Dhanbad', NULL, NULL, NULL, 'Dhanbad', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(547, 'Dumka', NULL, NULL, NULL, 'Dumka', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(548, 'Garhwa', NULL, NULL, NULL, 'Garhwa', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(549, 'Ghatshila', NULL, NULL, NULL, 'Ghatshila', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(550, 'Giridih', NULL, NULL, NULL, 'Giridih', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(551, 'Godda', NULL, NULL, NULL, 'Godda', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(552, 'Gomoh', NULL, NULL, NULL, 'Gomoh', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(553, 'Gumia', NULL, NULL, NULL, 'Gumia', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(554, 'Gumla', NULL, NULL, NULL, 'Gumla', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(555, 'Hazaribag', NULL, NULL, NULL, 'Hazaribag', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(556, 'Hussainabad', NULL, NULL, NULL, 'Hussainabad', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(557, 'Jamshedpur', NULL, NULL, NULL, 'Jamshedpur', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(558, 'Jamtara', NULL, NULL, NULL, 'Jamtara', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(559, 'Jhumri Tilaiya', NULL, NULL, NULL, 'Jhumri Tilaiya', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(560, 'Khunti', NULL, NULL, NULL, 'Khunti', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(561, 'Lohardaga', NULL, NULL, NULL, 'Lohardaga', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(562, 'Madhupur', NULL, NULL, NULL, 'Madhupur', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(563, 'Mihijam', NULL, NULL, NULL, 'Mihijam', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(564, 'Musabani', NULL, NULL, NULL, 'Musabani', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(565, 'Pakaur', NULL, NULL, NULL, 'Pakaur', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(566, 'Patratu', NULL, NULL, NULL, 'Patratu', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(567, 'Phusro', NULL, NULL, NULL, 'Phusro', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(568, 'Ramngarh', NULL, NULL, NULL, 'Ramngarh', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(569, 'Ranchi', NULL, NULL, NULL, 'Ranchi', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(570, 'Sahibganj', NULL, NULL, NULL, 'Sahibganj', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(571, 'Saunda', NULL, NULL, NULL, 'Saunda', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(572, 'Simdega', NULL, NULL, NULL, 'Simdega', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(573, 'Tenu Dam-cum- Kathhara', NULL, NULL, NULL, 'Tenu Dam-cum- Kathhara', 5268, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(574, 'Arasikere', NULL, NULL, NULL, 'Arasikere', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(575, 'Bangalore', NULL, NULL, NULL, 'Bangalore', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(576, 'Belgaum', NULL, NULL, NULL, 'Belgaum', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(577, 'Bellary', NULL, NULL, NULL, 'Bellary', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(578, 'Chamrajnagar', NULL, NULL, NULL, 'Chamrajnagar', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(579, 'Chikkaballapur', NULL, NULL, NULL, 'Chikkaballapur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(580, 'Chintamani', NULL, NULL, NULL, 'Chintamani', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(581, 'Chitradurga', NULL, NULL, NULL, 'Chitradurga', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(582, 'Gulbarga', NULL, NULL, NULL, 'Gulbarga', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(583, 'Gundlupet', NULL, NULL, NULL, 'Gundlupet', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(584, 'Hassan', NULL, NULL, NULL, 'Hassan', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(585, 'Hospet', NULL, NULL, NULL, 'Hospet', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(586, 'Hubli', NULL, NULL, NULL, 'Hubli', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(587, 'Karkala', NULL, NULL, NULL, 'Karkala', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(588, 'Karwar', NULL, NULL, NULL, 'Karwar', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(589, 'Kolar', NULL, NULL, NULL, 'Kolar', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(590, 'Kota', NULL, NULL, NULL, 'Kota', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(591, 'Lakshmeshwar', NULL, NULL, NULL, 'Lakshmeshwar', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(592, 'Lingsugur', NULL, NULL, NULL, 'Lingsugur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(593, 'Maddur', NULL, NULL, NULL, 'Maddur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(594, 'Madhugiri', NULL, NULL, NULL, 'Madhugiri', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(595, 'Madikeri', NULL, NULL, NULL, 'Madikeri', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(596, 'Magadi', NULL, NULL, NULL, 'Magadi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(597, 'Mahalingpur', NULL, NULL, NULL, 'Mahalingpur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(598, 'Malavalli', NULL, NULL, NULL, 'Malavalli', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(599, 'Malur', NULL, NULL, NULL, 'Malur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(600, 'Mandya', NULL, NULL, NULL, 'Mandya', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(601, 'Mangalore', NULL, NULL, NULL, 'Mangalore', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(602, 'Manvi', NULL, NULL, NULL, 'Manvi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(603, 'Mudalgi', NULL, NULL, NULL, 'Mudalgi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(604, 'Mudbidri', NULL, NULL, NULL, 'Mudbidri', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(605, 'Muddebihal', NULL, NULL, NULL, 'Muddebihal', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(606, 'Mudhol', NULL, NULL, NULL, 'Mudhol', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(607, 'Mulbagal', NULL, NULL, NULL, 'Mulbagal', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(608, 'Mundargi', NULL, NULL, NULL, 'Mundargi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(609, 'Mysore', NULL, NULL, NULL, 'Mysore', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(610, 'Nanjangud', NULL, NULL, NULL, 'Nanjangud', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(611, 'Pavagada', NULL, NULL, NULL, 'Pavagada', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(612, 'Puttur', NULL, NULL, NULL, 'Puttur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(613, 'Rabkavi Banhatti', NULL, NULL, NULL, 'Rabkavi Banhatti', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(614, 'Raichur', NULL, NULL, NULL, 'Raichur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(615, 'Ramanagaram', NULL, NULL, NULL, 'Ramanagaram', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(616, 'Ramdurg', NULL, NULL, NULL, 'Ramdurg', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(617, 'Ranibennur', NULL, NULL, NULL, 'Ranibennur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(618, 'Robertson Pet', NULL, NULL, NULL, 'Robertson Pet', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(619, 'Ron', NULL, NULL, NULL, 'Ron', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(620, 'Sadalgi', NULL, NULL, NULL, 'Sadalgi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(621, 'Sagar', NULL, NULL, NULL, 'Sagar', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(622, 'Sakleshpur', NULL, NULL, NULL, 'Sakleshpur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(623, 'Sandur', NULL, NULL, NULL, 'Sandur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(624, 'Sankeshwar', NULL, NULL, NULL, 'Sankeshwar', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(625, 'Saundatti-Yellamma', NULL, NULL, NULL, 'Saundatti-Yellamma', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(626, 'Savanur', NULL, NULL, NULL, 'Savanur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(627, 'Sedam', NULL, NULL, NULL, 'Sedam', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(628, 'Shahabad', NULL, NULL, NULL, 'Shahabad', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(629, 'Shahpur', NULL, NULL, NULL, 'Shahpur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(630, 'Shiggaon', NULL, NULL, NULL, 'Shiggaon', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(631, 'Shikapur', NULL, NULL, NULL, 'Shikapur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(632, 'Shimoga', NULL, NULL, NULL, 'Shimoga', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(633, 'Shorapur', NULL, NULL, NULL, 'Shorapur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(634, 'Shrirangapattana', NULL, NULL, NULL, 'Shrirangapattana', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(635, 'Sidlaghatta', NULL, NULL, NULL, 'Sidlaghatta', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(636, 'Sindgi', NULL, NULL, NULL, 'Sindgi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(637, 'Sindhnur', NULL, NULL, NULL, 'Sindhnur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(638, 'Sira', NULL, NULL, NULL, 'Sira', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(639, 'Sirsi', NULL, NULL, NULL, 'Sirsi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(640, 'Siruguppa', NULL, NULL, NULL, 'Siruguppa', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(641, 'Srinivaspur', NULL, NULL, NULL, 'Srinivaspur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(642, 'Talikota', NULL, NULL, NULL, 'Talikota', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(643, 'Tarikere', NULL, NULL, NULL, 'Tarikere', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(644, 'Tekkalakota', NULL, NULL, NULL, 'Tekkalakota', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(645, 'Terdal', NULL, NULL, NULL, 'Terdal', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(646, 'Tiptur', NULL, NULL, NULL, 'Tiptur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(647, 'Tumkur', NULL, NULL, NULL, 'Tumkur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(648, 'Udupi', NULL, NULL, NULL, 'Udupi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(649, 'Vijayapura', NULL, NULL, NULL, 'Vijayapura', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(650, 'Wadi', NULL, NULL, NULL, 'Wadi', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(651, 'Yadgir', NULL, NULL, NULL, 'Yadgir', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(652, 'Adoor', NULL, NULL, NULL, 'Adoor', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(653, 'Akathiyoor', NULL, NULL, NULL, 'Akathiyoor', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(654, 'Alappuzha', NULL, NULL, NULL, 'Alappuzha', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(655, 'Ancharakandy', NULL, NULL, NULL, 'Ancharakandy', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(656, 'Aroor', NULL, NULL, NULL, 'Aroor', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(657, 'Ashtamichira', NULL, NULL, NULL, 'Ashtamichira', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(658, 'Attingal', NULL, NULL, NULL, 'Attingal', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(659, 'Avinissery', NULL, NULL, NULL, 'Avinissery', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(660, 'Chalakudy', NULL, NULL, NULL, 'Chalakudy', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(661, 'Changanassery', NULL, NULL, NULL, 'Changanassery', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(662, 'Chendamangalam', NULL, NULL, NULL, 'Chendamangalam', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(663, 'Chengannur', NULL, NULL, NULL, 'Chengannur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(664, 'Cherthala', NULL, NULL, NULL, 'Cherthala', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(665, 'Cheruthazham', NULL, NULL, NULL, 'Cheruthazham', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(666, 'Chittur-Thathamangalam', NULL, NULL, NULL, 'Chittur-Thathamangalam', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(667, 'Chockli', NULL, NULL, NULL, 'Chockli', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(668, 'Erattupetta', NULL, NULL, NULL, 'Erattupetta', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(669, 'Guruvayoor', NULL, NULL, NULL, 'Guruvayoor', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(670, 'Irinjalakuda', NULL, NULL, NULL, 'Irinjalakuda', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(671, 'Kadirur', NULL, NULL, NULL, 'Kadirur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(672, 'Kalliasseri', NULL, NULL, NULL, 'Kalliasseri', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(673, 'Kalpetta', NULL, NULL, NULL, 'Kalpetta', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(674, 'Kanhangad', NULL, NULL, NULL, 'Kanhangad', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(675, 'Kanjikkuzhi', NULL, NULL, NULL, 'Kanjikkuzhi', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(676, 'Kannur', NULL, NULL, NULL, 'Kannur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(677, 'Kasaragod', NULL, NULL, NULL, 'Kasaragod', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(678, 'Kayamkulam', NULL, NULL, NULL, 'Kayamkulam', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27');
INSERT INTO `default_place` (`place_id`, `place_name`, `place_address1`, `place_address2`, `place_address3`, `place_city`, `place_state_id`, `place_country_id`, `place_station_id`, `place_landlord_id`, `place_type`, `place_picture_name`, `place_picture_name2`, `place_picture_name3`, `status`, `comments`, `created`, `updated`) VALUES
(679, 'Kochi', NULL, NULL, NULL, 'Kochi', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(680, 'Kodungallur', NULL, NULL, NULL, 'Kodungallur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(681, 'Kollam', NULL, NULL, NULL, 'Kollam', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(682, 'Koothuparamba', NULL, NULL, NULL, 'Koothuparamba', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(683, 'Kothamangalam', NULL, NULL, NULL, 'Kothamangalam', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(684, 'Kottayam', NULL, NULL, NULL, 'Kottayam', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(685, 'Kozhikode', NULL, NULL, NULL, 'Kozhikode', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(686, 'Kunnamkulam', NULL, NULL, NULL, 'Kunnamkulam', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(687, 'Malappuram', NULL, NULL, NULL, 'Malappuram', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(688, 'Mattannur', NULL, NULL, NULL, 'Mattannur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(689, 'Mavelikkara', NULL, NULL, NULL, 'Mavelikkara', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(690, 'Mavoor', NULL, NULL, NULL, 'Mavoor', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(691, 'Muvattupuzha', NULL, NULL, NULL, 'Muvattupuzha', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(692, 'Nedumangad', NULL, NULL, NULL, 'Nedumangad', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(693, 'Neyyattinkara', NULL, NULL, NULL, 'Neyyattinkara', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(694, 'Ottappalam', NULL, NULL, NULL, 'Ottappalam', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(695, 'Palai', NULL, NULL, NULL, 'Palai', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(696, 'Palakkad', NULL, NULL, NULL, 'Palakkad', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(697, 'Panniyannur', NULL, NULL, NULL, 'Panniyannur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(698, 'Pappinisseri', NULL, NULL, NULL, 'Pappinisseri', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(699, 'Paravoor', NULL, NULL, NULL, 'Paravoor', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(700, 'Pathanamthitta', NULL, NULL, NULL, 'Pathanamthitta', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(701, 'Payyannur', NULL, NULL, NULL, 'Payyannur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(702, 'Peringathur', NULL, NULL, NULL, 'Peringathur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(703, 'Perinthalmanna', NULL, NULL, NULL, 'Perinthalmanna', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(704, 'Perumbavoor', NULL, NULL, NULL, 'Perumbavoor', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(705, 'Ponnani', NULL, NULL, NULL, 'Ponnani', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(706, 'Punalur', NULL, NULL, NULL, 'Punalur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(707, 'Quilandy', NULL, NULL, NULL, 'Quilandy', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(708, 'Shoranur', NULL, NULL, NULL, 'Shoranur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(709, 'Taliparamba', NULL, NULL, NULL, 'Taliparamba', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(710, 'Thiruvalla', NULL, NULL, NULL, 'Thiruvalla', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(711, 'Thiruvananthapuram', NULL, NULL, NULL, 'Thiruvananthapuram', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(712, 'Thodupuzha', NULL, NULL, NULL, 'Thodupuzha', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(713, 'Thrissur', NULL, NULL, NULL, 'Thrissur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(714, 'Tirur', NULL, NULL, NULL, 'Tirur', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(715, 'Vadakara', NULL, NULL, NULL, 'Vadakara', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(716, 'Vaikom', NULL, NULL, NULL, 'Vaikom', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(717, 'Varkala', NULL, NULL, NULL, 'Varkala', 2179, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(718, 'Kavaratti', NULL, NULL, NULL, 'Kavaratti', 2180, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(719, 'Ashok Nagar', NULL, NULL, NULL, 'Ashok Nagar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(720, 'Balaghat', NULL, NULL, NULL, 'Balaghat', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(721, 'Betul', NULL, NULL, NULL, 'Betul', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(722, 'Bhopal', NULL, NULL, NULL, 'Bhopal', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(723, 'Burhanpur', NULL, NULL, NULL, 'Burhanpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(724, 'Chhatarpur', NULL, NULL, NULL, 'Chhatarpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(725, 'Dabra', NULL, NULL, NULL, 'Dabra', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(726, 'Datia', NULL, NULL, NULL, 'Datia', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(727, 'Dewas', NULL, NULL, NULL, 'Dewas', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(728, 'Dhar', NULL, NULL, NULL, 'Dhar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(729, 'Fatehabad', NULL, NULL, NULL, 'Fatehabad', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(730, 'Gwalior', NULL, NULL, NULL, 'Gwalior', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(731, 'Indore', NULL, NULL, NULL, 'Indore', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(732, 'Itarsi', NULL, NULL, NULL, 'Itarsi', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(733, 'Jabalpur', NULL, NULL, NULL, 'Jabalpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(734, 'Katni', NULL, NULL, NULL, 'Katni', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(735, 'Kotma', NULL, NULL, NULL, 'Kotma', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(736, 'Lahar', NULL, NULL, NULL, 'Lahar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(737, 'Lundi', NULL, NULL, NULL, 'Lundi', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(738, 'Maharajpur', NULL, NULL, NULL, 'Maharajpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(739, 'Mahidpur', NULL, NULL, NULL, 'Mahidpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(740, 'Maihar', NULL, NULL, NULL, 'Maihar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(741, 'Malajkhand', NULL, NULL, NULL, 'Malajkhand', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(742, 'Manasa', NULL, NULL, NULL, 'Manasa', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(743, 'Manawar', NULL, NULL, NULL, 'Manawar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(744, 'Mandideep', NULL, NULL, NULL, 'Mandideep', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(745, 'Mandla', NULL, NULL, NULL, 'Mandla', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(746, 'Mandsaur', NULL, NULL, NULL, 'Mandsaur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(747, 'Mauganj', NULL, NULL, NULL, 'Mauganj', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(748, 'Mhow Cantonment', NULL, NULL, NULL, 'Mhow Cantonment', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(749, 'Mhowgaon', NULL, NULL, NULL, 'Mhowgaon', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(750, 'Morena', NULL, NULL, NULL, 'Morena', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(751, 'Multai', NULL, NULL, NULL, 'Multai', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(752, 'Murwara', NULL, NULL, NULL, 'Murwara', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(753, 'Nagda', NULL, NULL, NULL, 'Nagda', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(754, 'Nainpur', NULL, NULL, NULL, 'Nainpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(755, 'Narsinghgarh', NULL, NULL, NULL, 'Narsinghgarh', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(756, 'Narsinghgarh', NULL, NULL, NULL, 'Narsinghgarh', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(757, 'Neemuch', NULL, NULL, NULL, 'Neemuch', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(758, 'Nepanagar', NULL, NULL, NULL, 'Nepanagar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(759, 'Niwari', NULL, NULL, NULL, 'Niwari', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(760, 'Nowgong', NULL, NULL, NULL, 'Nowgong', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(761, 'Nowrozabad', NULL, NULL, NULL, 'Nowrozabad', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(762, 'Pachore', NULL, NULL, NULL, 'Pachore', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(763, 'Pali', NULL, NULL, NULL, 'Pali', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(764, 'Panagar', NULL, NULL, NULL, 'Panagar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(765, 'Pandhurna', NULL, NULL, NULL, 'Pandhurna', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(766, 'Panna', NULL, NULL, NULL, 'Panna', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(767, 'Pasan', NULL, NULL, NULL, 'Pasan', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(768, 'Pipariya', NULL, NULL, NULL, 'Pipariya', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(769, 'Pithampur', NULL, NULL, NULL, 'Pithampur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(770, 'Porsa', NULL, NULL, NULL, 'Porsa', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(771, 'Prithvipur', NULL, NULL, NULL, 'Prithvipur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(772, 'Raghogarh-Vijaypur', NULL, NULL, NULL, 'Raghogarh-Vijaypur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(773, 'Rahatgarh', NULL, NULL, NULL, 'Rahatgarh', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(774, 'Raisen', NULL, NULL, NULL, 'Raisen', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(775, 'Rajgarh', NULL, NULL, NULL, 'Rajgarh', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(776, 'Ratlam', NULL, NULL, NULL, 'Ratlam', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(777, 'Rau', NULL, NULL, NULL, 'Rau', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(778, 'Rehli', NULL, NULL, NULL, 'Rehli', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(779, 'Rewa', NULL, NULL, NULL, 'Rewa', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(780, 'Sabalgarh', NULL, NULL, NULL, 'Sabalgarh', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(781, 'Sagar', NULL, NULL, NULL, 'Sagar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(782, 'Sanawad', NULL, NULL, NULL, 'Sanawad', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(783, 'Sarangpur', NULL, NULL, NULL, 'Sarangpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(784, 'Sarni', NULL, NULL, NULL, 'Sarni', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(785, 'Satna', NULL, NULL, NULL, 'Satna', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(786, 'Sausar', NULL, NULL, NULL, 'Sausar', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(787, 'Sehore', NULL, NULL, NULL, 'Sehore', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(788, 'Sendhwa', NULL, NULL, NULL, 'Sendhwa', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(789, 'Seoni', NULL, NULL, NULL, 'Seoni', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(790, 'Seoni-Malwa', NULL, NULL, NULL, 'Seoni-Malwa', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(791, 'Shahdol', NULL, NULL, NULL, 'Shahdol', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(792, 'Shajapur', NULL, NULL, NULL, 'Shajapur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(793, 'Shamgarh', NULL, NULL, NULL, 'Shamgarh', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(794, 'Sheopur', NULL, NULL, NULL, 'Sheopur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(795, 'Shivpuri', NULL, NULL, NULL, 'Shivpuri', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(796, 'Shujalpur', NULL, NULL, NULL, 'Shujalpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(797, 'Sidhi', NULL, NULL, NULL, 'Sidhi', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(798, 'Sihora', NULL, NULL, NULL, 'Sihora', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(799, 'Singrauli', NULL, NULL, NULL, 'Singrauli', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(800, 'Sironj', NULL, NULL, NULL, 'Sironj', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(801, 'Sohagpur', NULL, NULL, NULL, 'Sohagpur', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(802, 'Tarana', NULL, NULL, NULL, 'Tarana', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(803, 'Tikamgarh', NULL, NULL, NULL, 'Tikamgarh', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(804, 'Ujhani', NULL, NULL, NULL, 'Ujhani', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(805, 'Ujjain', NULL, NULL, NULL, 'Ujjain', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(806, 'Umaria', NULL, NULL, NULL, 'Umaria', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(807, 'Vidisha', NULL, NULL, NULL, 'Vidisha', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(808, 'Wara Seoni', NULL, NULL, NULL, 'Wara Seoni', 2181, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(809, 'Ahmednagar', NULL, NULL, NULL, 'Ahmednagar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(810, 'Akola', NULL, NULL, NULL, 'Akola', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(811, 'Amravati', NULL, NULL, NULL, 'Amravati', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(812, 'Aurangabad', NULL, NULL, NULL, 'Aurangabad', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(813, 'Baramati', NULL, NULL, NULL, 'Baramati', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(814, 'Chalisgaon', NULL, NULL, NULL, 'Chalisgaon', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(815, 'Chinchani', NULL, NULL, NULL, 'Chinchani', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(816, 'Devgarh', NULL, NULL, NULL, 'Devgarh', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(817, 'Dhule', NULL, NULL, NULL, 'Dhule', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(818, 'Dombivli', NULL, NULL, NULL, 'Dombivli', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(819, 'Durgapur', NULL, NULL, NULL, 'Durgapur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(820, 'Ichalkaranji', NULL, NULL, NULL, 'Ichalkaranji', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(821, 'Jalna', NULL, NULL, NULL, 'Jalna', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(822, 'Kalyan', NULL, NULL, NULL, 'Kalyan', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(823, 'Latur', NULL, NULL, NULL, 'Latur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(824, 'Loha', NULL, NULL, NULL, 'Loha', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(825, 'Lonar', NULL, NULL, NULL, 'Lonar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(826, 'Lonavla', NULL, NULL, NULL, 'Lonavla', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(827, 'Mahad', NULL, NULL, NULL, 'Mahad', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(828, 'Mahuli', NULL, NULL, NULL, 'Mahuli', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(829, 'Malegaon', NULL, NULL, NULL, 'Malegaon', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(830, 'Malkapur', NULL, NULL, NULL, 'Malkapur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(831, 'Manchar', NULL, NULL, NULL, 'Manchar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(832, 'Mangalvedhe', NULL, NULL, NULL, 'Mangalvedhe', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(833, 'Mangrulpir', NULL, NULL, NULL, 'Mangrulpir', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(834, 'Manjlegaon', NULL, NULL, NULL, 'Manjlegaon', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(835, 'Manmad', NULL, NULL, NULL, 'Manmad', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(836, 'Manwath', NULL, NULL, NULL, 'Manwath', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(837, 'Mehkar', NULL, NULL, NULL, 'Mehkar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(838, 'Mhaswad', NULL, NULL, NULL, 'Mhaswad', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(839, 'Miraj', NULL, NULL, NULL, 'Miraj', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(840, 'Morshi', NULL, NULL, NULL, 'Morshi', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(841, 'Mukhed', NULL, NULL, NULL, 'Mukhed', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(842, 'Mul', NULL, NULL, NULL, 'Mul', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(843, 'Mumbai', NULL, NULL, NULL, 'Mumbai', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(844, 'Murtijapur', NULL, NULL, NULL, 'Murtijapur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(845, 'Nagpur', NULL, NULL, NULL, 'Nagpur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(846, 'Nalasopara', NULL, NULL, NULL, 'Nalasopara', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(847, 'Nanded-Waghala', NULL, NULL, NULL, 'Nanded-Waghala', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(848, 'Nandgaon', NULL, NULL, NULL, 'Nandgaon', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(849, 'Nandura', NULL, NULL, NULL, 'Nandura', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(850, 'Nandurbar', NULL, NULL, NULL, 'Nandurbar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(851, 'Narkhed', NULL, NULL, NULL, 'Narkhed', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(852, 'Nashik', NULL, NULL, NULL, 'Nashik', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(853, 'Navi Mumbai', NULL, NULL, NULL, 'Navi Mumbai', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(854, 'Nawapur', NULL, NULL, NULL, 'Nawapur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(855, 'Nilanga', NULL, NULL, NULL, 'Nilanga', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(856, 'Osmanabad', NULL, NULL, NULL, 'Osmanabad', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(857, 'Ozar', NULL, NULL, NULL, 'Ozar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(858, 'Pachora', NULL, NULL, NULL, 'Pachora', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(859, 'Paithan', NULL, NULL, NULL, 'Paithan', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(860, 'Palghar', NULL, NULL, NULL, 'Palghar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(861, 'Pandharkaoda', NULL, NULL, NULL, 'Pandharkaoda', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(862, 'Pandharpur', NULL, NULL, NULL, 'Pandharpur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(863, 'Panvel', NULL, NULL, NULL, 'Panvel', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(864, 'Parbhani', NULL, NULL, NULL, 'Parbhani', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(865, 'Parli', NULL, NULL, NULL, 'Parli', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(866, 'Parola', NULL, NULL, NULL, 'Parola', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(867, 'Partur', NULL, NULL, NULL, 'Partur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(868, 'Pathardi', NULL, NULL, NULL, 'Pathardi', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(869, 'Pathri', NULL, NULL, NULL, 'Pathri', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(870, 'Patur', NULL, NULL, NULL, 'Patur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(871, 'Pauni', NULL, NULL, NULL, 'Pauni', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(872, 'Pen', NULL, NULL, NULL, 'Pen', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(873, 'Phaltan', NULL, NULL, NULL, 'Phaltan', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(874, 'Pulgaon', NULL, NULL, NULL, 'Pulgaon', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(875, 'Pune', NULL, NULL, NULL, 'Pune', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(876, 'Purna', NULL, NULL, NULL, 'Purna', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(877, 'Pusad', NULL, NULL, NULL, 'Pusad', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(878, 'Rahuri', NULL, NULL, NULL, 'Rahuri', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(879, 'Rajura', NULL, NULL, NULL, 'Rajura', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(880, 'Ramtek', NULL, NULL, NULL, 'Ramtek', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(881, 'Ratnagiri', NULL, NULL, NULL, 'Ratnagiri', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(882, 'Raver', NULL, NULL, NULL, 'Raver', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(883, 'Risod', NULL, NULL, NULL, 'Risod', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(884, 'Sailu', NULL, NULL, NULL, 'Sailu', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(885, 'Sangamner', NULL, NULL, NULL, 'Sangamner', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(886, 'Sangli', NULL, NULL, NULL, 'Sangli', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(887, 'Sangole', NULL, NULL, NULL, 'Sangole', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(888, 'Sasvad', NULL, NULL, NULL, 'Sasvad', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(889, 'Satana', NULL, NULL, NULL, 'Satana', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(890, 'Satara', NULL, NULL, NULL, 'Satara', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(891, 'Savner', NULL, NULL, NULL, 'Savner', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(892, 'Sawantwadi', NULL, NULL, NULL, 'Sawantwadi', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(893, 'Shahade', NULL, NULL, NULL, 'Shahade', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(894, 'Shegaon', NULL, NULL, NULL, 'Shegaon', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(895, 'Shendurjana', NULL, NULL, NULL, 'Shendurjana', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(896, 'Shirdi', NULL, NULL, NULL, 'Shirdi', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(897, 'Shirpur-Warwade', NULL, NULL, NULL, 'Shirpur-Warwade', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(898, 'Shirur', NULL, NULL, NULL, 'Shirur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(899, 'Shrigonda', NULL, NULL, NULL, 'Shrigonda', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(900, 'Shrirampur', NULL, NULL, NULL, 'Shrirampur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(901, 'Sillod', NULL, NULL, NULL, 'Sillod', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(902, 'Sinnar', NULL, NULL, NULL, 'Sinnar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(903, 'Solapur', NULL, NULL, NULL, 'Solapur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(904, 'Soyagaon', NULL, NULL, NULL, 'Soyagaon', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(905, 'Talegaon Dabhade', NULL, NULL, NULL, 'Talegaon Dabhade', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(906, 'Talode', NULL, NULL, NULL, 'Talode', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(907, 'Tasgaon', NULL, NULL, NULL, 'Tasgaon', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(908, 'Tirora', NULL, NULL, NULL, 'Tirora', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(909, 'Tuljapur', NULL, NULL, NULL, 'Tuljapur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(910, 'Tumsar', NULL, NULL, NULL, 'Tumsar', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(911, 'Uran', NULL, NULL, NULL, 'Uran', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(912, 'Uran Islampur', NULL, NULL, NULL, 'Uran Islampur', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(913, 'Wadgaon Road', NULL, NULL, NULL, 'Wadgaon Road', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(914, 'Wai', NULL, NULL, NULL, 'Wai', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(915, 'Wani', NULL, NULL, NULL, 'Wani', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(916, 'Wardha', NULL, NULL, NULL, 'Wardha', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(917, 'Warora', NULL, NULL, NULL, 'Warora', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(918, 'Warud', NULL, NULL, NULL, 'Warud', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(919, 'Washim', NULL, NULL, NULL, 'Washim', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(920, 'Yevla', NULL, NULL, NULL, 'Yevla', 2182, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(921, 'Uchgaon', NULL, NULL, NULL, 'Uchgaon', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(922, 'Udgir', NULL, NULL, NULL, 'Udgir', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(923, 'Umarga', NULL, NULL, NULL, 'Umarga', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(924, 'Umarkhed', NULL, NULL, NULL, 'Umarkhed', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(925, 'Umred', NULL, NULL, NULL, 'Umred', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(926, 'Vadgaon Kasba', NULL, NULL, NULL, 'Vadgaon Kasba', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(927, 'Vaijapur', NULL, NULL, NULL, 'Vaijapur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(928, 'Vasai', NULL, NULL, NULL, 'Vasai', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(929, 'Virar', NULL, NULL, NULL, 'Virar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(930, 'Vita', NULL, NULL, NULL, 'Vita', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(931, 'Yavatmal', NULL, NULL, NULL, 'Yavatmal', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(932, 'Yawal', NULL, NULL, NULL, 'Yawal', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(933, 'Imphal', NULL, NULL, NULL, 'Imphal', 2183, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(934, 'Kakching', NULL, NULL, NULL, 'Kakching', 2183, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(935, 'Lilong', NULL, NULL, NULL, 'Lilong', 2183, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(936, 'Mayang Imphal', NULL, NULL, NULL, 'Mayang Imphal', 2183, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(937, 'Thoubal', NULL, NULL, NULL, 'Thoubal', 2183, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(938, 'Jowai', NULL, NULL, NULL, 'Jowai', 2184, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(939, 'Nongstoin', NULL, NULL, NULL, 'Nongstoin', 2184, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(940, 'Shillong', NULL, NULL, NULL, 'Shillong', 2184, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(941, 'Tura', NULL, NULL, NULL, 'Tura', 2184, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(942, 'Aizawl', NULL, NULL, NULL, 'Aizawl', 2197, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(943, 'Champhai', NULL, NULL, NULL, 'Champhai', 2197, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(944, 'Lunglei', NULL, NULL, NULL, 'Lunglei', 2197, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(945, 'Saiha', NULL, NULL, NULL, 'Saiha', 2197, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(946, 'Dimapur', NULL, NULL, NULL, 'Dimapur', 2186, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(947, 'Kohima', NULL, NULL, NULL, 'Kohima', 2186, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(948, 'Mokokchung', NULL, NULL, NULL, 'Mokokchung', 2186, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(949, 'Tuensang', NULL, NULL, NULL, 'Tuensang', 2186, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(950, 'Wokha', NULL, NULL, NULL, 'Wokha', 2186, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(951, 'Zunheboto', NULL, NULL, NULL, 'Zunheboto', 2186, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(952, 'Anandapur', NULL, NULL, NULL, 'Anandapur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(953, 'Anugul', NULL, NULL, NULL, 'Anugul', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(954, 'Asika', NULL, NULL, NULL, 'Asika', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(955, 'Balangir', NULL, NULL, NULL, 'Balangir', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(956, 'Balasore', NULL, NULL, NULL, 'Balasore', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(957, 'Baleshwar', NULL, NULL, NULL, 'Baleshwar', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(958, 'Bamra', NULL, NULL, NULL, 'Bamra', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(959, 'Barbil', NULL, NULL, NULL, 'Barbil', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(960, 'Bargarh', NULL, NULL, NULL, 'Bargarh', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(961, 'Bargarh', NULL, NULL, NULL, 'Bargarh', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(962, 'Baripada', NULL, NULL, NULL, 'Baripada', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(963, 'Basudebpur', NULL, NULL, NULL, 'Basudebpur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(964, 'Belpahar', NULL, NULL, NULL, 'Belpahar', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(965, 'Bhadrak', NULL, NULL, NULL, 'Bhadrak', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(966, 'Bhawanipatna', NULL, NULL, NULL, 'Bhawanipatna', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(967, 'Bhuban', NULL, NULL, NULL, 'Bhuban', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(968, 'Bhubaneswar', NULL, NULL, NULL, 'Bhubaneswar', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(969, 'Biramitrapur', NULL, NULL, NULL, 'Biramitrapur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(970, 'Brahmapur', NULL, NULL, NULL, 'Brahmapur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(971, 'Brajrajnagar', NULL, NULL, NULL, 'Brajrajnagar', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(972, 'Byasanagar', NULL, NULL, NULL, 'Byasanagar', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(973, 'Cuttack', NULL, NULL, NULL, 'Cuttack', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(974, 'Debagarh', NULL, NULL, NULL, 'Debagarh', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(975, 'Dhenkanal', NULL, NULL, NULL, 'Dhenkanal', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(976, 'Gunupur', NULL, NULL, NULL, 'Gunupur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(977, 'Hinjilicut', NULL, NULL, NULL, 'Hinjilicut', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(978, 'Jagatsinghapur', NULL, NULL, NULL, 'Jagatsinghapur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(979, 'Jajapur', NULL, NULL, NULL, 'Jajapur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(980, 'Jaleswar', NULL, NULL, NULL, 'Jaleswar', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(981, 'Jatani', NULL, NULL, NULL, 'Jatani', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(982, 'Jeypur', NULL, NULL, NULL, 'Jeypur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(983, 'Jharsuguda', NULL, NULL, NULL, 'Jharsuguda', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(984, 'Joda', NULL, NULL, NULL, 'Joda', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(985, 'Kantabanji', NULL, NULL, NULL, 'Kantabanji', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(986, 'Karanjia', NULL, NULL, NULL, 'Karanjia', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(987, 'Kendrapara', NULL, NULL, NULL, 'Kendrapara', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(988, 'Kendujhar', NULL, NULL, NULL, 'Kendujhar', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(989, 'Khordha', NULL, NULL, NULL, 'Khordha', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(990, 'Koraput', NULL, NULL, NULL, 'Koraput', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(991, 'Malkangiri', NULL, NULL, NULL, 'Malkangiri', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(992, 'Nabarangapur', NULL, NULL, NULL, 'Nabarangapur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(993, 'Paradip', NULL, NULL, NULL, 'Paradip', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(994, 'Parlakhemundi', NULL, NULL, NULL, 'Parlakhemundi', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(995, 'Pattamundai', NULL, NULL, NULL, 'Pattamundai', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(996, 'Phulabani', NULL, NULL, NULL, 'Phulabani', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(997, 'Puri', NULL, NULL, NULL, 'Puri', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(998, 'Rairangpur', NULL, NULL, NULL, 'Rairangpur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(999, 'Rajagangapur', NULL, NULL, NULL, 'Rajagangapur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1000, 'Raurkela', NULL, NULL, NULL, 'Raurkela', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1001, 'Rayagada', NULL, NULL, NULL, 'Rayagada', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1002, 'Sambalpur', NULL, NULL, NULL, 'Sambalpur', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1003, 'Soro', NULL, NULL, NULL, 'Soro', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1004, 'Sunabeda', NULL, NULL, NULL, 'Sunabeda', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1005, 'Sundargarh', NULL, NULL, NULL, 'Sundargarh', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1006, 'Talcher', NULL, NULL, NULL, 'Talcher', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1007, 'Titlagarh', NULL, NULL, NULL, 'Titlagarh', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1008, 'Umarkote', NULL, NULL, NULL, 'Umarkote', 2187, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1009, 'Karaikal', NULL, NULL, NULL, 'Karaikal', 2188, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1010, 'Mahe', NULL, NULL, NULL, 'Mahe', 2188, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1011, 'Pondicherry', NULL, NULL, NULL, 'Pondicherry', 2188, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1012, 'Yanam', NULL, NULL, NULL, 'Yanam', 2188, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1013, 'Ahmedgarh', NULL, NULL, NULL, 'Ahmedgarh', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1014, 'Amritsar', NULL, NULL, NULL, 'Amritsar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1015, 'Barnala', NULL, NULL, NULL, 'Barnala', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1016, 'Batala', NULL, NULL, NULL, 'Batala', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1017, 'Bathinda', NULL, NULL, NULL, 'Bathinda', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1018, 'Bhagha Purana', NULL, NULL, NULL, 'Bhagha Purana', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1019, 'Budhlada', NULL, NULL, NULL, 'Budhlada', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1020, 'Chandigarh', NULL, NULL, NULL, 'Chandigarh', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1021, 'Dasua', NULL, NULL, NULL, 'Dasua', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1022, 'Dhuri', NULL, NULL, NULL, 'Dhuri', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1023, 'Dinanagar', NULL, NULL, NULL, 'Dinanagar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1024, 'Faridkot', NULL, NULL, NULL, 'Faridkot', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27');
INSERT INTO `default_place` (`place_id`, `place_name`, `place_address1`, `place_address2`, `place_address3`, `place_city`, `place_state_id`, `place_country_id`, `place_station_id`, `place_landlord_id`, `place_type`, `place_picture_name`, `place_picture_name2`, `place_picture_name3`, `status`, `comments`, `created`, `updated`) VALUES
(1025, 'Fazilka', NULL, NULL, NULL, 'Fazilka', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1026, 'Firozpur', NULL, NULL, NULL, 'Firozpur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1027, 'Firozpur Cantt.', NULL, NULL, NULL, 'Firozpur Cantt.', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1028, 'Giddarbaha', NULL, NULL, NULL, 'Giddarbaha', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1029, 'Gobindgarh', NULL, NULL, NULL, 'Gobindgarh', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1030, 'Gurdaspur', NULL, NULL, NULL, 'Gurdaspur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1031, 'Hoshiarpur', NULL, NULL, NULL, 'Hoshiarpur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1032, 'Jagraon', NULL, NULL, NULL, 'Jagraon', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1033, 'Jaitu', NULL, NULL, NULL, 'Jaitu', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1034, 'Jalalabad', NULL, NULL, NULL, 'Jalalabad', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1035, 'Jalandhar', NULL, NULL, NULL, 'Jalandhar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1036, 'Jalandhar Cantt.', NULL, NULL, NULL, 'Jalandhar Cantt.', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1037, 'Jandiala', NULL, NULL, NULL, 'Jandiala', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1038, 'Kapurthala', NULL, NULL, NULL, 'Kapurthala', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1039, 'Karoran', NULL, NULL, NULL, 'Karoran', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1040, 'Kartarpur', NULL, NULL, NULL, 'Kartarpur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1041, 'Khanna', NULL, NULL, NULL, 'Khanna', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1042, 'Kharar', NULL, NULL, NULL, 'Kharar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1043, 'Kot Kapura', NULL, NULL, NULL, 'Kot Kapura', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1044, 'Kurali', NULL, NULL, NULL, 'Kurali', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1045, 'Longowal', NULL, NULL, NULL, 'Longowal', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1046, 'Ludhiana', NULL, NULL, NULL, 'Ludhiana', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1047, 'Malerkotla', NULL, NULL, NULL, 'Malerkotla', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1048, 'Malout', NULL, NULL, NULL, 'Malout', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1049, 'Mansa', NULL, NULL, NULL, 'Mansa', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1050, 'Maur', NULL, NULL, NULL, 'Maur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1051, 'Moga', NULL, NULL, NULL, 'Moga', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1052, 'Mohali', NULL, NULL, NULL, 'Mohali', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1053, 'Morinda', NULL, NULL, NULL, 'Morinda', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1054, 'Mukerian', NULL, NULL, NULL, 'Mukerian', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1055, 'Muktsar', NULL, NULL, NULL, 'Muktsar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1056, 'Nabha', NULL, NULL, NULL, 'Nabha', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1057, 'Nakodar', NULL, NULL, NULL, 'Nakodar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1058, 'Nangal', NULL, NULL, NULL, 'Nangal', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1059, 'Nawanshahr', NULL, NULL, NULL, 'Nawanshahr', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1060, 'Pathankot', NULL, NULL, NULL, 'Pathankot', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1061, 'Patiala', NULL, NULL, NULL, 'Patiala', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1062, 'Patran', NULL, NULL, NULL, 'Patran', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1063, 'Patti', NULL, NULL, NULL, 'Patti', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1064, 'Phagwara', NULL, NULL, NULL, 'Phagwara', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1065, 'Phillaur', NULL, NULL, NULL, 'Phillaur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1066, 'Qadian', NULL, NULL, NULL, 'Qadian', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1067, 'Raikot', NULL, NULL, NULL, 'Raikot', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1068, 'Rajpura', NULL, NULL, NULL, 'Rajpura', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1069, 'Rampura Phul', NULL, NULL, NULL, 'Rampura Phul', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1070, 'Rupnagar', NULL, NULL, NULL, 'Rupnagar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1071, 'Samana', NULL, NULL, NULL, 'Samana', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1072, 'Sangrur', NULL, NULL, NULL, 'Sangrur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1073, 'Sirhind Fatehgarh Sahib', NULL, NULL, NULL, 'Sirhind Fatehgarh Sahib', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1074, 'Sujanpur', NULL, NULL, NULL, 'Sujanpur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1075, 'Sunam', NULL, NULL, NULL, 'Sunam', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1076, 'Talwara', NULL, NULL, NULL, 'Talwara', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1077, 'Tarn Taran', NULL, NULL, NULL, 'Tarn Taran', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1078, 'Urmar Tanda', NULL, NULL, NULL, 'Urmar Tanda', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1079, 'Zira', NULL, NULL, NULL, 'Zira', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1080, 'Zirakpur', NULL, NULL, NULL, 'Zirakpur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1081, 'Bali', NULL, NULL, NULL, 'Bali', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1082, 'Banswara', NULL, NULL, NULL, 'Banswara', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1083, 'Ajmer', NULL, NULL, NULL, 'Ajmer', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1084, 'Alwar', NULL, NULL, NULL, 'Alwar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1085, 'Bandikui', NULL, NULL, NULL, 'Bandikui', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1086, 'Baran', NULL, NULL, NULL, 'Baran', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1087, 'Barmer', NULL, NULL, NULL, 'Barmer', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1088, 'Bikaner', NULL, NULL, NULL, 'Bikaner', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1089, 'Fatehpur', NULL, NULL, NULL, 'Fatehpur', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1090, 'Jaipur', NULL, NULL, NULL, 'Jaipur', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1091, 'Jaisalmer', NULL, NULL, NULL, 'Jaisalmer', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1092, 'Jodhpur', NULL, NULL, NULL, 'Jodhpur', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1093, 'Kota', NULL, NULL, NULL, 'Kota', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1094, 'Lachhmangarh', NULL, NULL, NULL, 'Lachhmangarh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1095, 'Ladnu', NULL, NULL, NULL, 'Ladnu', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1096, 'Lakheri', NULL, NULL, NULL, 'Lakheri', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1097, 'Lalsot', NULL, NULL, NULL, 'Lalsot', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1098, 'Losal', NULL, NULL, NULL, 'Losal', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1099, 'Makrana', NULL, NULL, NULL, 'Makrana', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1100, 'Malpura', NULL, NULL, NULL, 'Malpura', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1101, 'Mandalgarh', NULL, NULL, NULL, 'Mandalgarh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1102, 'Mandawa', NULL, NULL, NULL, 'Mandawa', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1103, 'Mangrol', NULL, NULL, NULL, 'Mangrol', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1104, 'Merta City', NULL, NULL, NULL, 'Merta City', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1105, 'Mount Abu', NULL, NULL, NULL, 'Mount Abu', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1106, 'Nadbai', NULL, NULL, NULL, 'Nadbai', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1107, 'Nagar', NULL, NULL, NULL, 'Nagar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1108, 'Nagaur', NULL, NULL, NULL, 'Nagaur', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1109, 'Nargund', NULL, NULL, NULL, 'Nargund', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1110, 'Nasirabad', NULL, NULL, NULL, 'Nasirabad', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1111, 'Nathdwara', NULL, NULL, NULL, 'Nathdwara', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1112, 'Navalgund', NULL, NULL, NULL, 'Navalgund', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1113, 'Nawalgarh', NULL, NULL, NULL, 'Nawalgarh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1114, 'Neem-Ka-Thana', NULL, NULL, NULL, 'Neem-Ka-Thana', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1115, 'Nelamangala', NULL, NULL, NULL, 'Nelamangala', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1116, 'Nimbahera', NULL, NULL, NULL, 'Nimbahera', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1117, 'Nipani', NULL, NULL, NULL, 'Nipani', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1118, 'Niwai', NULL, NULL, NULL, 'Niwai', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1119, 'Nohar', NULL, NULL, NULL, 'Nohar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1120, 'Nokha', NULL, NULL, NULL, 'Nokha', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1121, 'Pali', NULL, NULL, NULL, 'Pali', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1122, 'Phalodi', NULL, NULL, NULL, 'Phalodi', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1123, 'Phulera', NULL, NULL, NULL, 'Phulera', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1124, 'Pilani', NULL, NULL, NULL, 'Pilani', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1125, 'Pilibanga', NULL, NULL, NULL, 'Pilibanga', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1126, 'Pindwara', NULL, NULL, NULL, 'Pindwara', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1127, 'Pipar City', NULL, NULL, NULL, 'Pipar City', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1128, 'Prantij', NULL, NULL, NULL, 'Prantij', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1129, 'Pratapgarh', NULL, NULL, NULL, 'Pratapgarh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1130, 'Raisinghnagar', NULL, NULL, NULL, 'Raisinghnagar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1131, 'Rajakhera', NULL, NULL, NULL, 'Rajakhera', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1132, 'Rajaldesar', NULL, NULL, NULL, 'Rajaldesar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1133, 'Rajgarh (Alwar)', NULL, NULL, NULL, 'Rajgarh (Alwar)', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1134, 'Rajgarh (Churu', NULL, NULL, NULL, 'Rajgarh (Churu', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1135, 'Rajsamand', NULL, NULL, NULL, 'Rajsamand', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1136, 'Ramganj Mandi', NULL, NULL, NULL, 'Ramganj Mandi', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1137, 'Ramngarh', NULL, NULL, NULL, 'Ramngarh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1138, 'Ratangarh', NULL, NULL, NULL, 'Ratangarh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1139, 'Rawatbhata', NULL, NULL, NULL, 'Rawatbhata', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1140, 'Rawatsar', NULL, NULL, NULL, 'Rawatsar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1141, 'Reengus', NULL, NULL, NULL, 'Reengus', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1142, 'Sadri', NULL, NULL, NULL, 'Sadri', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1143, 'Sadulshahar', NULL, NULL, NULL, 'Sadulshahar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1144, 'Sagwara', NULL, NULL, NULL, 'Sagwara', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1145, 'Sambhar', NULL, NULL, NULL, 'Sambhar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1146, 'Sanchore', NULL, NULL, NULL, 'Sanchore', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1147, 'Sangaria', NULL, NULL, NULL, 'Sangaria', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1148, 'Sardarshahar', NULL, NULL, NULL, 'Sardarshahar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1149, 'Sawai Madhopur', NULL, NULL, NULL, 'Sawai Madhopur', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1150, 'Shahpura', NULL, NULL, NULL, 'Shahpura', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1151, 'Shahpura', NULL, NULL, NULL, 'Shahpura', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1152, 'Sheoganj', NULL, NULL, NULL, 'Sheoganj', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1153, 'Sikar', NULL, NULL, NULL, 'Sikar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1154, 'Sirohi', NULL, NULL, NULL, 'Sirohi', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1155, 'Sojat', NULL, NULL, NULL, 'Sojat', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1156, 'Sri Madhopur', NULL, NULL, NULL, 'Sri Madhopur', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1157, 'Sujangarh', NULL, NULL, NULL, 'Sujangarh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1158, 'Sumerpur', NULL, NULL, NULL, 'Sumerpur', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1159, 'Suratgarh', NULL, NULL, NULL, 'Suratgarh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1160, 'Taranagar', NULL, NULL, NULL, 'Taranagar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1161, 'Todabhim', NULL, NULL, NULL, 'Todabhim', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1162, 'Todaraisingh', NULL, NULL, NULL, 'Todaraisingh', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1163, 'Tonk', NULL, NULL, NULL, 'Tonk', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1164, 'Udaipur', NULL, NULL, NULL, 'Udaipur', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1165, 'Udaipurwati', NULL, NULL, NULL, 'Udaipurwati', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1166, 'Vijainagar', NULL, NULL, NULL, 'Vijainagar', 2190, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1167, 'Gangtok', NULL, NULL, NULL, 'Gangtok', 2195, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1168, 'Calcutta', NULL, NULL, NULL, 'Calcutta', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1169, 'Arakkonam', NULL, NULL, NULL, 'Arakkonam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1170, 'Arcot', NULL, NULL, NULL, 'Arcot', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1171, 'Aruppukkottai', NULL, NULL, NULL, 'Aruppukkottai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1172, 'Bhavani', NULL, NULL, NULL, 'Bhavani', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1173, 'Chengalpattu', NULL, NULL, NULL, 'Chengalpattu', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1174, 'Chennai', NULL, NULL, NULL, 'Chennai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1175, 'Chinna salem', NULL, NULL, NULL, 'Chinna salem', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1176, 'Coimbatore', NULL, NULL, NULL, 'Coimbatore', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1177, 'Coonoor', NULL, NULL, NULL, 'Coonoor', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1178, 'Cuddalore', NULL, NULL, NULL, 'Cuddalore', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1179, 'Dharmapuri', NULL, NULL, NULL, 'Dharmapuri', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1180, 'Dindigul', NULL, NULL, NULL, 'Dindigul', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1181, 'Erode', NULL, NULL, NULL, 'Erode', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1182, 'Gudalur', NULL, NULL, NULL, 'Gudalur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1183, 'Gudalur', NULL, NULL, NULL, 'Gudalur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1184, 'Gudalur', NULL, NULL, NULL, 'Gudalur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1185, 'Kanchipuram', NULL, NULL, NULL, 'Kanchipuram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1186, 'Karaikudi', NULL, NULL, NULL, 'Karaikudi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1187, 'Karungal', NULL, NULL, NULL, 'Karungal', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1188, 'Karur', NULL, NULL, NULL, 'Karur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1189, 'Kollankodu', NULL, NULL, NULL, 'Kollankodu', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1190, 'Lalgudi', NULL, NULL, NULL, 'Lalgudi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1191, 'Madurai', NULL, NULL, NULL, 'Madurai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1192, 'Nagapattinam', NULL, NULL, NULL, 'Nagapattinam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1193, 'Nagercoil', NULL, NULL, NULL, 'Nagercoil', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1194, 'Namagiripettai', NULL, NULL, NULL, 'Namagiripettai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1195, 'Namakkal', NULL, NULL, NULL, 'Namakkal', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1196, 'Nandivaram-Guduvancheri', NULL, NULL, NULL, 'Nandivaram-Guduvancheri', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1197, 'Nanjikottai', NULL, NULL, NULL, 'Nanjikottai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1198, 'Natham', NULL, NULL, NULL, 'Natham', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1199, 'Nellikuppam', NULL, NULL, NULL, 'Nellikuppam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1200, 'Neyveli', NULL, NULL, NULL, 'Neyveli', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1201, 'O'' Valley', NULL, NULL, NULL, 'O'' Valley', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1202, 'Oddanchatram', NULL, NULL, NULL, 'Oddanchatram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1203, 'P.N.Patti', NULL, NULL, NULL, 'P.N.Patti', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1204, 'Pacode', NULL, NULL, NULL, 'Pacode', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1205, 'Padmanabhapuram', NULL, NULL, NULL, 'Padmanabhapuram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1206, 'Palani', NULL, NULL, NULL, 'Palani', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1207, 'Palladam', NULL, NULL, NULL, 'Palladam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1208, 'Pallapatti', NULL, NULL, NULL, 'Pallapatti', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1209, 'Pallikonda', NULL, NULL, NULL, 'Pallikonda', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1210, 'Panagudi', NULL, NULL, NULL, 'Panagudi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1211, 'Panruti', NULL, NULL, NULL, 'Panruti', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1212, 'Paramakudi', NULL, NULL, NULL, 'Paramakudi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1213, 'Parangipettai', NULL, NULL, NULL, 'Parangipettai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1214, 'Pattukkottai', NULL, NULL, NULL, 'Pattukkottai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1215, 'Perambalur', NULL, NULL, NULL, 'Perambalur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1216, 'Peravurani', NULL, NULL, NULL, 'Peravurani', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1217, 'Periyakulam', NULL, NULL, NULL, 'Periyakulam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1218, 'Periyasemur', NULL, NULL, NULL, 'Periyasemur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1219, 'Pernampattu', NULL, NULL, NULL, 'Pernampattu', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1220, 'Pollachi', NULL, NULL, NULL, 'Pollachi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1221, 'Polur', NULL, NULL, NULL, 'Polur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1222, 'Ponneri', NULL, NULL, NULL, 'Ponneri', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1223, 'Pudukkottai', NULL, NULL, NULL, 'Pudukkottai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1224, 'Pudupattinam', NULL, NULL, NULL, 'Pudupattinam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1225, 'Puliyankudi', NULL, NULL, NULL, 'Puliyankudi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1226, 'Punjaipugalur', NULL, NULL, NULL, 'Punjaipugalur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1227, 'Rajapalayam', NULL, NULL, NULL, 'Rajapalayam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1228, 'Ramanathapuram', NULL, NULL, NULL, 'Ramanathapuram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1229, 'Rameshwaram', NULL, NULL, NULL, 'Rameshwaram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1230, 'Rasipuram', NULL, NULL, NULL, 'Rasipuram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1231, 'Salem', NULL, NULL, NULL, 'Salem', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1232, 'Sankarankoil', NULL, NULL, NULL, 'Sankarankoil', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1233, 'Sankari', NULL, NULL, NULL, 'Sankari', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1234, 'Sathyamangalam', NULL, NULL, NULL, 'Sathyamangalam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1235, 'Sattur', NULL, NULL, NULL, 'Sattur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1236, 'Shenkottai', NULL, NULL, NULL, 'Shenkottai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1237, 'Sholavandan', NULL, NULL, NULL, 'Sholavandan', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1238, 'Sholingur', NULL, NULL, NULL, 'Sholingur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1239, 'Sirkali', NULL, NULL, NULL, 'Sirkali', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1240, 'Sivaganga', NULL, NULL, NULL, 'Sivaganga', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1241, 'Sivagiri', NULL, NULL, NULL, 'Sivagiri', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1242, 'Sivakasi', NULL, NULL, NULL, 'Sivakasi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1243, 'Srivilliputhur', NULL, NULL, NULL, 'Srivilliputhur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1244, 'Surandai', NULL, NULL, NULL, 'Surandai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1245, 'Suriyampalayam', NULL, NULL, NULL, 'Suriyampalayam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1246, 'Tenkasi', NULL, NULL, NULL, 'Tenkasi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1247, 'Thammampatti', NULL, NULL, NULL, 'Thammampatti', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1248, 'Thanjavur', NULL, NULL, NULL, 'Thanjavur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1249, 'Tharamangalam', NULL, NULL, NULL, 'Tharamangalam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1250, 'Tharangambadi', NULL, NULL, NULL, 'Tharangambadi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1251, 'Theni Allinagaram', NULL, NULL, NULL, 'Theni Allinagaram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1252, 'Thirumangalam', NULL, NULL, NULL, 'Thirumangalam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1253, 'Thirunindravur', NULL, NULL, NULL, 'Thirunindravur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1254, 'Thiruparappu', NULL, NULL, NULL, 'Thiruparappu', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1255, 'Thirupuvanam', NULL, NULL, NULL, 'Thirupuvanam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1256, 'Thiruthuraipoondi', NULL, NULL, NULL, 'Thiruthuraipoondi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1257, 'Thiruvallur', NULL, NULL, NULL, 'Thiruvallur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1258, 'Thiruvarur', NULL, NULL, NULL, 'Thiruvarur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1259, 'Thoothukudi', NULL, NULL, NULL, 'Thoothukudi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1260, 'Thuraiyur', NULL, NULL, NULL, 'Thuraiyur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1261, 'Tindivanam', NULL, NULL, NULL, 'Tindivanam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1262, 'Tiruchendur', NULL, NULL, NULL, 'Tiruchendur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1263, 'Tiruchengode', NULL, NULL, NULL, 'Tiruchengode', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1264, 'Tiruchirappalli', NULL, NULL, NULL, 'Tiruchirappalli', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1265, 'Tirukalukundram', NULL, NULL, NULL, 'Tirukalukundram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1266, 'Tirukkoyilur', NULL, NULL, NULL, 'Tirukkoyilur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1267, 'Tirunelveli', NULL, NULL, NULL, 'Tirunelveli', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1268, 'Tirupathur', NULL, NULL, NULL, 'Tirupathur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1269, 'Tirupathur', NULL, NULL, NULL, 'Tirupathur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1270, 'Tiruppur', NULL, NULL, NULL, 'Tiruppur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1271, 'Tiruttani', NULL, NULL, NULL, 'Tiruttani', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1272, 'Tiruvannamalai', NULL, NULL, NULL, 'Tiruvannamalai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1273, 'Tiruvethipuram', NULL, NULL, NULL, 'Tiruvethipuram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1274, 'Tittakudi', NULL, NULL, NULL, 'Tittakudi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1275, 'Udhagamandalam', NULL, NULL, NULL, 'Udhagamandalam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1276, 'Udumalaipettai', NULL, NULL, NULL, 'Udumalaipettai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1277, 'Unnamalaikadai', NULL, NULL, NULL, 'Unnamalaikadai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1278, 'Usilampatti', NULL, NULL, NULL, 'Usilampatti', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1279, 'Uthamapalayam', NULL, NULL, NULL, 'Uthamapalayam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1280, 'Uthiramerur', NULL, NULL, NULL, 'Uthiramerur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1281, 'Vadakkuvalliyur', NULL, NULL, NULL, 'Vadakkuvalliyur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1282, 'Vadalur', NULL, NULL, NULL, 'Vadalur', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1283, 'Vadipatti', NULL, NULL, NULL, 'Vadipatti', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1284, 'Valparai', NULL, NULL, NULL, 'Valparai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1285, 'Vandavasi', NULL, NULL, NULL, 'Vandavasi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1286, 'Vaniyambadi', NULL, NULL, NULL, 'Vaniyambadi', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1287, 'Vedaranyam', NULL, NULL, NULL, 'Vedaranyam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1288, 'Vellakoil', NULL, NULL, NULL, 'Vellakoil', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1289, 'Vellore', NULL, NULL, NULL, 'Vellore', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1290, 'Vikramasingapuram', NULL, NULL, NULL, 'Vikramasingapuram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1291, 'Viluppuram', NULL, NULL, NULL, 'Viluppuram', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1292, 'Virudhachalam', NULL, NULL, NULL, 'Virudhachalam', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1293, 'Virudhunagar', NULL, NULL, NULL, 'Virudhunagar', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1294, 'Viswanatham', NULL, NULL, NULL, 'Viswanatham', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1295, 'Agartala', NULL, NULL, NULL, 'Agartala', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1296, 'Badharghat', NULL, NULL, NULL, 'Badharghat', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1297, 'Dharmanagar', NULL, NULL, NULL, 'Dharmanagar', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1298, 'Indranagar', NULL, NULL, NULL, 'Indranagar', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1299, 'Jogendranagar', NULL, NULL, NULL, 'Jogendranagar', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1300, 'Kailasahar', NULL, NULL, NULL, 'Kailasahar', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1301, 'Khowai', NULL, NULL, NULL, 'Khowai', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1302, 'Pratapgarh', NULL, NULL, NULL, 'Pratapgarh', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1303, 'Udaipur', NULL, NULL, NULL, 'Udaipur', 2192, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1304, 'Achhnera', NULL, NULL, NULL, 'Achhnera', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1305, 'Adari', NULL, NULL, NULL, 'Adari', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1306, 'Agra', NULL, NULL, NULL, 'Agra', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1307, 'Aligarh', NULL, NULL, NULL, 'Aligarh', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1308, 'Allahabad', NULL, NULL, NULL, 'Allahabad', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1309, 'Amroha', NULL, NULL, NULL, 'Amroha', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1310, 'Azamgarh', NULL, NULL, NULL, 'Azamgarh', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1311, 'Bahraich', NULL, NULL, NULL, 'Bahraich', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1312, 'Ballia', NULL, NULL, NULL, 'Ballia', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1313, 'Balrampur', NULL, NULL, NULL, 'Balrampur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1314, 'Banda', NULL, NULL, NULL, 'Banda', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1315, 'Bareilly', NULL, NULL, NULL, 'Bareilly', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1316, 'Chandausi', NULL, NULL, NULL, 'Chandausi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1317, 'Dadri', NULL, NULL, NULL, 'Dadri', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1318, 'Deoria', NULL, NULL, NULL, 'Deoria', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1319, 'Etawah', NULL, NULL, NULL, 'Etawah', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1320, 'Fatehabad', NULL, NULL, NULL, 'Fatehabad', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1321, 'Fatehpur', NULL, NULL, NULL, 'Fatehpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1322, 'Fatehpur', NULL, NULL, NULL, 'Fatehpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1323, 'Greater Noida', NULL, NULL, NULL, 'Greater Noida', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1324, 'Hamirpur', NULL, NULL, NULL, 'Hamirpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1325, 'Hardoi', NULL, NULL, NULL, 'Hardoi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1326, 'Jajmau', NULL, NULL, NULL, 'Jajmau', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1327, 'Jaunpur', NULL, NULL, NULL, 'Jaunpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1328, 'Jhansi', NULL, NULL, NULL, 'Jhansi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1329, 'Kalpi', NULL, NULL, NULL, 'Kalpi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1330, 'Kanpur', NULL, NULL, NULL, 'Kanpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1331, 'Kota', NULL, NULL, NULL, 'Kota', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1332, 'Laharpur', NULL, NULL, NULL, 'Laharpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1333, 'Lakhimpur', NULL, NULL, NULL, 'Lakhimpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1334, 'Lal Gopalganj Nindaura', NULL, NULL, NULL, 'Lal Gopalganj Nindaura', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1335, 'Lalganj', NULL, NULL, NULL, 'Lalganj', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1336, 'Lalitpur', NULL, NULL, NULL, 'Lalitpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1337, 'Lar', NULL, NULL, NULL, 'Lar', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1338, 'Loni', NULL, NULL, NULL, 'Loni', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1339, 'Lucknow', NULL, NULL, NULL, 'Lucknow', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1340, 'Mathura', NULL, NULL, NULL, 'Mathura', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1341, 'Meerut', NULL, NULL, NULL, 'Meerut', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1342, 'Modinagar', NULL, NULL, NULL, 'Modinagar', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1343, 'Muradnagar', NULL, NULL, NULL, 'Muradnagar', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1344, 'Nagina', NULL, NULL, NULL, 'Nagina', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1345, 'Najibabad', NULL, NULL, NULL, 'Najibabad', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1346, 'Nakur', NULL, NULL, NULL, 'Nakur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1347, 'Nanpara', NULL, NULL, NULL, 'Nanpara', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1348, 'Naraura', NULL, NULL, NULL, 'Naraura', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1349, 'Naugawan Sadat', NULL, NULL, NULL, 'Naugawan Sadat', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1350, 'Nautanwa', NULL, NULL, NULL, 'Nautanwa', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1351, 'Nawabganj', NULL, NULL, NULL, 'Nawabganj', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1352, 'Nehtaur', NULL, NULL, NULL, 'Nehtaur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1353, 'NOIDA', NULL, NULL, NULL, 'NOIDA', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1354, 'Noorpur', NULL, NULL, NULL, 'Noorpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1355, 'Obra', NULL, NULL, NULL, 'Obra', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1356, 'Orai', NULL, NULL, NULL, 'Orai', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1357, 'Padrauna', NULL, NULL, NULL, 'Padrauna', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1358, 'Palia Kalan', NULL, NULL, NULL, 'Palia Kalan', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1359, 'Parasi', NULL, NULL, NULL, 'Parasi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1360, 'Phulpur', NULL, NULL, NULL, 'Phulpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1361, 'Pihani', NULL, NULL, NULL, 'Pihani', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1362, 'Pilibhit', NULL, NULL, NULL, 'Pilibhit', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27');
INSERT INTO `default_place` (`place_id`, `place_name`, `place_address1`, `place_address2`, `place_address3`, `place_city`, `place_state_id`, `place_country_id`, `place_station_id`, `place_landlord_id`, `place_type`, `place_picture_name`, `place_picture_name2`, `place_picture_name3`, `status`, `comments`, `created`, `updated`) VALUES
(1363, 'Pilkhuwa', NULL, NULL, NULL, 'Pilkhuwa', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1364, 'Powayan', NULL, NULL, NULL, 'Powayan', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1365, 'Pukhrayan', NULL, NULL, NULL, 'Pukhrayan', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1366, 'Puranpur', NULL, NULL, NULL, 'Puranpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1367, 'Purquazi', NULL, NULL, NULL, 'Purquazi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1368, 'Purwa', NULL, NULL, NULL, 'Purwa', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1369, 'Rae Bareli', NULL, NULL, NULL, 'Rae Bareli', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1370, 'Rampur', NULL, NULL, NULL, 'Rampur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1371, 'Rampur Maniharan', NULL, NULL, NULL, 'Rampur Maniharan', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1372, 'Rasra', NULL, NULL, NULL, 'Rasra', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1373, 'Rath', NULL, NULL, NULL, 'Rath', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1374, 'Renukoot', NULL, NULL, NULL, 'Renukoot', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1375, 'Reoti', NULL, NULL, NULL, 'Reoti', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1376, 'Robertsganj', NULL, NULL, NULL, 'Robertsganj', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1377, 'Rudauli', NULL, NULL, NULL, 'Rudauli', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1378, 'Rudrapur', NULL, NULL, NULL, 'Rudrapur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1379, 'Sadabad', NULL, NULL, NULL, 'Sadabad', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1380, 'Safipur', NULL, NULL, NULL, 'Safipur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1381, 'Saharanpur', NULL, NULL, NULL, 'Saharanpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1382, 'Sahaspur', NULL, NULL, NULL, 'Sahaspur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1383, 'Sahaswan', NULL, NULL, NULL, 'Sahaswan', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1384, 'Sahawar', NULL, NULL, NULL, 'Sahawar', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1385, 'Sahjanwa', NULL, NULL, NULL, 'Sahjanwa', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1386, 'Saidpur, Ghazipur', NULL, NULL, NULL, 'Saidpur, Ghazipur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1387, 'Sambhal', NULL, NULL, NULL, 'Sambhal', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1388, 'Samdhan', NULL, NULL, NULL, 'Samdhan', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1389, 'Samthar', NULL, NULL, NULL, 'Samthar', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1390, 'Sandi', NULL, NULL, NULL, 'Sandi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1391, 'Sandila', NULL, NULL, NULL, 'Sandila', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1392, 'Sardhana', NULL, NULL, NULL, 'Sardhana', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1393, 'Seohara', NULL, NULL, NULL, 'Seohara', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1394, 'Shahabad, Hardoi', NULL, NULL, NULL, 'Shahabad, Hardoi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1395, 'Shahabad, Rampur', NULL, NULL, NULL, 'Shahabad, Rampur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1396, 'Shahganj', NULL, NULL, NULL, 'Shahganj', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1397, 'Shahjahanpur', NULL, NULL, NULL, 'Shahjahanpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1398, 'Shamli', NULL, NULL, NULL, 'Shamli', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1399, 'Shamsabad, Agra', NULL, NULL, NULL, 'Shamsabad, Agra', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1400, 'Shamsabad, Farrukhabad', NULL, NULL, NULL, 'Shamsabad, Farrukhabad', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1401, 'Sherkot', NULL, NULL, NULL, 'Sherkot', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1402, 'Shikarpur, Bulandshahr', NULL, NULL, NULL, 'Shikarpur, Bulandshahr', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1403, 'Shikohabad', NULL, NULL, NULL, 'Shikohabad', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1404, 'Shishgarh', NULL, NULL, NULL, 'Shishgarh', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1405, 'Siana', NULL, NULL, NULL, 'Siana', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1406, 'Sikanderpur', NULL, NULL, NULL, 'Sikanderpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1407, 'Sikandra Rao', NULL, NULL, NULL, 'Sikandra Rao', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1408, 'Sikandrabad', NULL, NULL, NULL, 'Sikandrabad', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1409, 'Sirsaganj', NULL, NULL, NULL, 'Sirsaganj', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1410, 'Sirsi', NULL, NULL, NULL, 'Sirsi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1411, 'Sitapur', NULL, NULL, NULL, 'Sitapur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1412, 'Soron', NULL, NULL, NULL, 'Soron', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1413, 'Suar', NULL, NULL, NULL, 'Suar', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1414, 'Sultanpur', NULL, NULL, NULL, 'Sultanpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1415, 'Sumerpur', NULL, NULL, NULL, 'Sumerpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1416, 'Tanda', NULL, NULL, NULL, 'Tanda', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1417, 'Tanda', NULL, NULL, NULL, 'Tanda', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1418, 'Tetri Bazar', NULL, NULL, NULL, 'Tetri Bazar', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1419, 'Thakurdwara', NULL, NULL, NULL, 'Thakurdwara', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1420, 'Thana Bhawan', NULL, NULL, NULL, 'Thana Bhawan', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1421, 'Tilhar', NULL, NULL, NULL, 'Tilhar', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1422, 'Tirwaganj', NULL, NULL, NULL, 'Tirwaganj', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1423, 'Tulsipur', NULL, NULL, NULL, 'Tulsipur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1424, 'Tundla', NULL, NULL, NULL, 'Tundla', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1425, 'Unnao', NULL, NULL, NULL, 'Unnao', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1426, 'Utraula', NULL, NULL, NULL, 'Utraula', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1427, 'Varanasi', NULL, NULL, NULL, 'Varanasi', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1428, 'Vrindavan', NULL, NULL, NULL, 'Vrindavan', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1429, 'Warhapur', NULL, NULL, NULL, 'Warhapur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1430, 'Zaidpur', NULL, NULL, NULL, 'Zaidpur', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1431, 'Zamania', NULL, NULL, NULL, 'Zamania', 2193, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1432, 'Almora', NULL, NULL, NULL, 'Almora', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1433, 'Bazpur', NULL, NULL, NULL, 'Bazpur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1434, 'Chamba', NULL, NULL, NULL, 'Chamba', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1435, 'Dehradun', NULL, NULL, NULL, 'Dehradun', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1436, 'Haldwani', NULL, NULL, NULL, 'Haldwani', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1437, 'Haridwar', NULL, NULL, NULL, 'Haridwar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1438, 'Jaspur', NULL, NULL, NULL, 'Jaspur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1439, 'Kashipur', NULL, NULL, NULL, 'Kashipur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1440, 'kichha', NULL, NULL, NULL, 'kichha', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1441, 'Kotdwara', NULL, NULL, NULL, 'Kotdwara', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1442, 'Manglaur', NULL, NULL, NULL, 'Manglaur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1443, 'Mussoorie', NULL, NULL, NULL, 'Mussoorie', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1444, 'Nagla', NULL, NULL, NULL, 'Nagla', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1445, 'Nainital', NULL, NULL, NULL, 'Nainital', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1446, 'Pauri', NULL, NULL, NULL, 'Pauri', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1447, 'Pithoragarh', NULL, NULL, NULL, 'Pithoragarh', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1448, 'Ramnagar', NULL, NULL, NULL, 'Ramnagar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1449, 'Rishikesh', NULL, NULL, NULL, 'Rishikesh', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1450, 'Roorkee', NULL, NULL, NULL, 'Roorkee', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1451, 'Rudrapur', NULL, NULL, NULL, 'Rudrapur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1452, 'Sitarganj', NULL, NULL, NULL, 'Sitarganj', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1453, 'Tehri', NULL, NULL, NULL, 'Tehri', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1454, 'Muzaffarnagar', NULL, NULL, NULL, 'Muzaffarnagar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1455, 'Adra, Purulia', NULL, NULL, NULL, 'Adra, Purulia', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1456, 'Alipurduar', NULL, NULL, NULL, 'Alipurduar', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1457, 'Arambagh', NULL, NULL, NULL, 'Arambagh', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1458, 'Asansol', NULL, NULL, NULL, 'Asansol', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1459, 'Baharampur', NULL, NULL, NULL, 'Baharampur', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1460, 'Bally', NULL, NULL, NULL, 'Bally', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1461, 'Balurghat', NULL, NULL, NULL, 'Balurghat', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1462, 'Bankura', NULL, NULL, NULL, 'Bankura', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1463, 'Barakar', NULL, NULL, NULL, 'Barakar', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1464, 'Barasat', NULL, NULL, NULL, 'Barasat', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1465, 'Bardhaman', NULL, NULL, NULL, 'Bardhaman', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1466, 'Bidhan Nagar', NULL, NULL, NULL, 'Bidhan Nagar', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1467, 'Chinsura', NULL, NULL, NULL, 'Chinsura', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1468, 'Contai', NULL, NULL, NULL, 'Contai', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1469, 'Cooch Behar', NULL, NULL, NULL, 'Cooch Behar', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1470, 'Darjeeling', NULL, NULL, NULL, 'Darjeeling', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1471, 'Durgapur', NULL, NULL, NULL, 'Durgapur', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1472, 'Haldia', NULL, NULL, NULL, 'Haldia', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1473, 'Howrah', NULL, NULL, NULL, 'Howrah', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1474, 'Islampur', NULL, NULL, NULL, 'Islampur', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1475, 'Jhargram', NULL, NULL, NULL, 'Jhargram', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1476, 'Kharagpur', NULL, NULL, NULL, 'Kharagpur', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1477, 'Kolkata', NULL, NULL, NULL, 'Kolkata', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1478, 'Mainaguri', NULL, NULL, NULL, 'Mainaguri', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1479, 'Mal', NULL, NULL, NULL, 'Mal', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1480, 'Mathabhanga', NULL, NULL, NULL, 'Mathabhanga', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1481, 'Medinipur', NULL, NULL, NULL, 'Medinipur', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1482, 'Memari', NULL, NULL, NULL, 'Memari', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1483, 'Monoharpur', NULL, NULL, NULL, 'Monoharpur', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1484, 'Murshidabad', NULL, NULL, NULL, 'Murshidabad', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1485, 'Nabadwip', NULL, NULL, NULL, 'Nabadwip', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1486, 'Naihati', NULL, NULL, NULL, 'Naihati', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1487, 'Panchla', NULL, NULL, NULL, 'Panchla', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1488, 'Pandua', NULL, NULL, NULL, 'Pandua', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1489, 'Paschim Punropara', NULL, NULL, NULL, 'Paschim Punropara', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1490, 'Purulia', NULL, NULL, NULL, 'Purulia', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1491, 'Raghunathpur', NULL, NULL, NULL, 'Raghunathpur', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1492, 'Raiganj', NULL, NULL, NULL, 'Raiganj', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1493, 'Rampurhat', NULL, NULL, NULL, 'Rampurhat', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1494, 'Ranaghat', NULL, NULL, NULL, 'Ranaghat', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1495, 'Sainthia', NULL, NULL, NULL, 'Sainthia', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1496, 'Santipur', NULL, NULL, NULL, 'Santipur', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1497, 'Siliguri', NULL, NULL, NULL, 'Siliguri', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1498, 'Sonamukhi', NULL, NULL, NULL, 'Sonamukhi', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1499, 'Srirampore', NULL, NULL, NULL, 'Srirampore', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1500, 'Suri', NULL, NULL, NULL, 'Suri', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1501, 'Taki', NULL, NULL, NULL, 'Taki', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1502, 'Tamluk', NULL, NULL, NULL, 'Tamluk', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1503, 'Tarakeswar', NULL, NULL, NULL, 'Tarakeswar', 2194, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1504, 'Chikmagalur', NULL, NULL, NULL, 'Chikmagalur', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1505, 'Davanagere', NULL, NULL, NULL, 'Davanagere', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1506, 'Dharwad', NULL, NULL, NULL, 'Dharwad', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1507, 'Gadag', NULL, NULL, NULL, 'Gadag', 2185, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1508, 'Chennai', NULL, NULL, NULL, 'Chennai', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1509, 'Coimbatore', NULL, NULL, NULL, 'Coimbatore', 2191, 113, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1510, 'Barrackpur', NULL, NULL, NULL, 'Barrackpur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1511, 'Barwani', NULL, NULL, NULL, 'Barwani', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1512, 'Basna', NULL, NULL, NULL, 'Basna', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1513, 'Bawal', NULL, NULL, NULL, 'Bawal', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1514, 'Beawar', NULL, NULL, NULL, 'Beawar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1515, 'Berhampur', NULL, NULL, NULL, 'Berhampur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1516, 'Bhajanpura', NULL, NULL, NULL, 'Bhajanpura', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1517, 'Bhandara', NULL, NULL, NULL, 'Bhandara', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1518, 'Bharatpur', NULL, NULL, NULL, 'Bharatpur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1519, 'Bharthana', NULL, NULL, NULL, 'Bharthana', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1520, 'Bhilai', NULL, NULL, NULL, 'Bhilai', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1521, 'Bhilwara', NULL, NULL, NULL, 'Bhilwara', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1522, 'Bhinmal', NULL, NULL, NULL, 'Bhinmal', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1523, 'Bhiwandi', NULL, NULL, NULL, 'Bhiwandi', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1524, 'Bhusawal', NULL, NULL, NULL, 'Bhusawal', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1525, 'Bidar', NULL, NULL, NULL, 'Bidar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1526, 'Bijnaur', NULL, NULL, NULL, 'Bijnaur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1527, 'Bilara', NULL, NULL, NULL, 'Bilara', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1528, 'Budaun', NULL, NULL, NULL, 'Budaun', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:27'),
(1529, 'Bulandshahr', NULL, NULL, NULL, 'Bulandshahr', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1530, 'Burla', NULL, NULL, NULL, 'Burla', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1531, 'Chakeri', NULL, NULL, NULL, 'Chakeri', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1532, 'Champawat', NULL, NULL, NULL, 'Champawat', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1533, 'Chandil', NULL, NULL, NULL, 'Chandil', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1534, 'Chandrapur', NULL, NULL, NULL, 'Chandrapur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1535, 'Chapirevula', NULL, NULL, NULL, 'Chapirevula', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1536, 'Charkhari', NULL, NULL, NULL, 'Charkhari', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1537, 'Charkhi Dadri', NULL, NULL, NULL, 'Charkhi Dadri', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1538, 'Chhindwara', NULL, NULL, NULL, 'Chhindwara', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1539, 'Chiplun', NULL, NULL, NULL, 'Chiplun', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1540, 'Chitrakoot', NULL, NULL, NULL, 'Chitrakoot', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1541, 'Churu', NULL, NULL, NULL, 'Churu', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1542, 'Dalkhola', NULL, NULL, NULL, 'Dalkhola', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1543, 'Damoh', NULL, NULL, NULL, 'Damoh', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1544, 'Daund', NULL, NULL, NULL, 'Daund', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1545, 'Dehgam', NULL, NULL, NULL, 'Dehgam', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1546, 'Devgarh', NULL, NULL, NULL, 'Devgarh', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1547, 'Dhulian', NULL, NULL, NULL, 'Dhulian', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1548, 'Dumdum', NULL, NULL, NULL, 'Dumdum', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1549, 'Dwarka1', NULL, NULL, NULL, 'Dwarka1', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1550, 'Etah', NULL, NULL, NULL, 'Etah', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1551, 'Faizabad', NULL, NULL, NULL, 'Faizabad', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1552, 'Falna', NULL, NULL, NULL, 'Falna', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1553, 'Farrukhabad', NULL, NULL, NULL, 'Farrukhabad', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1554, 'Fatehgarh', NULL, NULL, NULL, 'Fatehgarh', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1555, 'Fatehpur Chaurasi', NULL, NULL, NULL, 'Fatehpur Chaurasi', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1556, 'Fatehpur Sikri', NULL, NULL, NULL, 'Fatehpur Sikri', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1557, 'Firozabad', NULL, NULL, NULL, 'Firozabad', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1558, 'Gadchiroli', NULL, NULL, NULL, 'Gadchiroli', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1559, 'Gandhidham', NULL, NULL, NULL, 'Gandhidham', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1560, 'Ganjam', NULL, NULL, NULL, 'Ganjam', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1561, 'Ghatampur', NULL, NULL, NULL, 'Ghatampur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1562, 'Ghatanji', NULL, NULL, NULL, 'Ghatanji', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1563, 'Ghaziabad', NULL, NULL, NULL, 'Ghaziabad', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1564, 'Ghazipur', NULL, NULL, NULL, 'Ghazipur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1565, 'Goa Velha', NULL, NULL, NULL, 'Goa Velha', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1566, 'Gokak', NULL, NULL, NULL, 'Gokak', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1567, 'Gondiya', NULL, NULL, NULL, 'Gondiya', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1568, 'Gorakhpur', NULL, NULL, NULL, 'Gorakhpur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1569, 'Guna', NULL, NULL, NULL, 'Guna', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1570, 'Hanumangarh', NULL, NULL, NULL, 'Hanumangarh', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1571, 'Harda', NULL, NULL, NULL, 'Harda', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1572, 'Harsawa', NULL, NULL, NULL, 'Harsawa', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1573, 'Hastinapur', NULL, NULL, NULL, 'Hastinapur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1574, 'Hathras', NULL, NULL, NULL, 'Hathras', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1575, 'Jagadhri', NULL, NULL, NULL, 'Jagadhri', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1576, 'Jais', NULL, NULL, NULL, 'Jais', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1577, 'Jaitaran', NULL, NULL, NULL, 'Jaitaran', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1578, 'Jalgaon', NULL, NULL, NULL, 'Jalgaon', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1579, 'Jalore', NULL, NULL, NULL, 'Jalore', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1580, 'Jhabua', NULL, NULL, NULL, 'Jhabua', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1581, 'Jhalawar', NULL, NULL, NULL, 'Jhalawar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1582, 'Jhunjhunu', NULL, NULL, NULL, 'Jhunjhunu', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1583, 'Junnar', NULL, NULL, NULL, 'Junnar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1584, 'Kailaras', NULL, NULL, NULL, 'Kailaras', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1585, 'Kalburgi', NULL, NULL, NULL, 'Kalburgi', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1586, 'Kalimpong', NULL, NULL, NULL, 'Kalimpong', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1587, 'Kamthi', NULL, NULL, NULL, 'Kamthi', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1588, 'Kanpur', NULL, NULL, NULL, 'Kanpur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1589, 'Karad', NULL, NULL, NULL, 'Karad', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1590, 'Keylong', NULL, NULL, NULL, 'Keylong', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1591, 'Kheri', NULL, NULL, NULL, 'Kheri', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1592, 'Khurai', NULL, NULL, NULL, 'Khurai', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1593, 'Kodad', NULL, NULL, NULL, 'Kodad', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1594, 'Konnagar', NULL, NULL, NULL, 'Konnagar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1595, 'Krishnanagar', NULL, NULL, NULL, 'Krishnanagar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1596, 'Kuchinda', NULL, NULL, NULL, 'Kuchinda', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1597, 'Madhyamgram', NULL, NULL, NULL, 'Madhyamgram', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1598, 'Mahabaleswar', NULL, NULL, NULL, 'Mahabaleswar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1599, 'Mahoba', NULL, NULL, NULL, 'Mahoba', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1600, 'Mahwa', NULL, NULL, NULL, 'Mahwa', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1601, 'Manesar', NULL, NULL, NULL, 'Manesar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1602, 'Mangalagiri', NULL, NULL, NULL, 'Mangalagiri', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1603, 'Mira-Bhayandar', NULL, NULL, NULL, 'Mira-Bhayandar', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1604, 'Mirzapur', NULL, NULL, NULL, 'Mirzapur', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1605, 'Mithapur', '', '', '', 'Mithapur', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, '', '2014-01-09 06:01:44', '2014-01-09 12:27:44'),
(1606, 'Mohania', NULL, NULL, NULL, 'Mohania', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1607, 'Mokama', NULL, NULL, NULL, 'Mokama', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1608, 'Moradabad', '', '', '', 'Moradabad', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, '', '2014-01-09 06:01:12', '2014-01-09 12:27:12'),
(1609, 'Mukatsar', '', '', '', 'Mukatsar', 2189, 113, NULL, NULL, 1, NULL, NULL, '', 1, '', '2014-01-09 06:01:39', '2014-01-09 12:26:39'),
(1610, 'Nagalapuram', NULL, NULL, NULL, 'Nagalapuram', NULL, NULL, NULL, NULL, 1, NULL, NULL, '', 1, NULL, '2014-01-09 06:54:26', '2014-01-09 12:24:28'),
(1611, 'three pic location', 'three pic location', 'three pic location', 'three pic location', NULL, NULL, NULL, 917, 48, 2, '4ee0bb8e0909db6d5faba52890512bd5.jpg', NULL, NULL, 1, 'test', '2014-01-11 11:01:09', '2014-01-11 17:26:09'),
(1612, 'Kartarpur testtesttest with 3 picture', 'Kartarpur testtesttest with 3 picture', 'Kartarpur testtesttest with 3 picture', 'Kartarpur testtesttest with 3 picture', NULL, NULL, NULL, 11, 22, 2, '5bc8208901c048fb13d104e9478f6546.jpg', '9d73027b23c1633b45e5a2c07a12aa02.jpg', '4189d01136a4a911c617cac2d105957e.jpg', 1, 'test', '2014-01-11 12:01:06', '2014-01-11 18:18:06'),
(1613, 'location for hording install test', 'location for hording install test', 'location for hording install test', 'location for hording install test', NULL, NULL, NULL, 35, 50, 2, 'a97558f160025f895ca3add1290e9157.jpg', '5d504b7fabdcb43e36492011a2b78b20.jpg', '3b6141cb781e8e4ecdfcc2eaee941ba3.jpg', 1, 'abcdef', '2014-01-13 07:01:24', '2014-01-13 13:01:24'),
(1614, 'locaton to test rent tenure', 'locaton to test rent tenure', 'locaton to test rent tenure', 'locaton to test rent tenure', NULL, NULL, NULL, 1035, 51, 2, 'dbd9a0b85215170c9d286bcc29359f70.jpg', '42fc9e7ea9d8c25ce3f626bca614cc99.jpg', '5712110cba3b1ae7b7aade8a773f2076.jpg', 1, '', '2014-01-14 07:01:51', '2014-01-14 12:57:51'),
(1615, 'location for city wise land test', 'location for city wise land test', 'location for city wise land test', 'location for city wise land test', NULL, NULL, NULL, 1035, 52, 2, '6b0464dad9e135792436fbc590a2fb84.jpg', NULL, NULL, 1, '', '2014-01-13 03:01:01', '2014-01-13 21:26:01'),
(1616, 'new location for city wise landlord test', 'new location for city wise landlord test', 'new location for city wise landlord test', 'new location for city wise landlord test', NULL, NULL, NULL, 1035, 53, 2, 'ae161c00c346b2d2e135bb845039a208.jpg', 'ce1994c94feed48d493f894ff8e18b65.jpg', NULL, 1, '', '2014-01-14 03:01:49', '2014-01-14 15:42:49'),
(1617, 'test new upload test', '', '', '', 'nawanshar', 2189, 113, NULL, NULL, 1, NULL, NULL, NULL, 1, 'test new upload test', '2014-01-14 05:01:35', '2014-01-14 17:05:35'),
(1618, 'nawanshar', '', '', '', 'nawanshar', 2189, 113, NULL, NULL, 1, NULL, NULL, NULL, 1, 'nawanshar', '2014-01-14 05:01:33', '2014-01-14 17:06:33'),
(1619, 'test new upload test', 'test new upload test', 'test new upload test', 'test new upload test', NULL, NULL, NULL, 472, 55, 2, 'bc5d50faee66756e346a8024729ddc0c.jpg', '02cf2c0871a5b53c92988cf37dddfb74.jpg', '214a7d8e367330a197a6b9949fc19ef4.jpg', 1, 'test new upload test', '2014-01-14 06:01:49', '2014-01-14 18:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `default_profiles`
--

CREATE TABLE IF NOT EXISTS `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `default_profiles`
--

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `company`, `lang`, `bio`, `dob`, `gender`, `phone`, `mobile`, `address_line1`, `address_line2`, `address_line3`, `postcode`, `website`, `updated_on`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'Multipro Software', 'Multipro', 'Software', 'Multipro', 'en', 'We are best software development company.', 631152000, 'm', '9876289405', '9876289405', '01812602742', NULL, 'Jalandhar', '144001', 'http://onlymycare.com', 1467024736);

-- --------------------------------------------------------

--
-- Table structure for table `default_redirects`
--

CREATE TABLE IF NOT EXISTS `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_redirects`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_rented_locations`
--

CREATE TABLE IF NOT EXISTS `default_rented_locations` (
  `rent_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `landlord_id` int(11) DEFAULT NULL,
  `tenure_aggrement_id` int(11) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1 rented, 2 not rented',
  `comments` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rent_location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `default_rented_locations`
--

INSERT INTO `default_rented_locations` (`rent_location_id`, `location_id`, `landlord_id`, `tenure_aggrement_id`, `status`, `comments`, `created`, `updated`) VALUES
(1, 5, 20, 10, 1, 'very good land lord', '2013-12-14 04:28:14', '2013-12-14 21:58:15'),
(2, 15, NULL, 11, 1, 'new landlord take care.', '2013-12-14 04:36:42', '2014-01-13 15:25:37'),
(3, 12, 22, 12, 1, 'new hording installments', '2013-12-14 04:37:49', '2013-12-14 22:07:49'),
(4, 7, NULL, 13, 1, '', '2013-12-14 04:38:34', '2014-01-13 15:24:54'),
(5, 14, 22, 14, 1, 'landlord good', '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(6, 16, 21, 15, 1, '', '2013-12-14 04:40:27', '2013-12-14 22:10:27'),
(7, 1614, NULL, 23, 1, '', '2014-01-13 09:59:26', '2014-01-13 15:29:26'),
(8, 1619, NULL, 25, 1, 'test new upload test', '2014-01-14 05:30:12', '2014-01-14 17:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `default_resources`
--

CREATE TABLE IF NOT EXISTS `default_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_resources`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_sample`
--

CREATE TABLE IF NOT EXISTS `default_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_sample`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_search_index`
--

CREATE TABLE IF NOT EXISTS `default_search_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `keyword_hash` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_edit_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`module`,`entry_key`,`entry_id`(190)),
  FULLTEXT KEY `full search` (`title`,`description`,`keywords`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `default_search_index`
--

INSERT INTO `default_search_index` (`id`, `title`, `description`, `keywords`, `keyword_hash`, `module`, `entry_key`, `entry_plural`, `entry_id`, `uri`, `cp_edit_uri`, `cp_delete_uri`) VALUES
(7, 'Home', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '1', 'home', 'admin/pages/edit/1', 'admin/pages/delete/1'),
(2, 'Contact', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '2', 'contact', 'admin/pages/edit/2', 'admin/pages/delete/2'),
(3, 'Search', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '3', 'search', 'admin/pages/edit/3', 'admin/pages/delete/3'),
(4, 'Results', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '4', 'search/results', 'admin/pages/edit/4', 'admin/pages/delete/4'),
(5, 'Page missing', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '5', '404', 'admin/pages/edit/5', 'admin/pages/delete/5');

-- --------------------------------------------------------

--
-- Table structure for table `default_select_lists`
--

CREATE TABLE IF NOT EXISTS `default_select_lists` (
  `select_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`select_list_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `default_select_lists`
--

INSERT INTO `default_select_lists` (`select_list_id`, `name`) VALUES
(1, 'client_select_list'),
(2, 'type_of_dealer'),
(3, 'rfq_question_type'),
(4, 'rfq_shipping_incoterms'),
(5, 'supplier_business_type'),
(6, 'looking_for_export_in'),
(7, 'address_type'),
(8, 'ownership_type'),
(9, 'buyer_or_distributor'),
(10, 'distributor_company_type');

-- --------------------------------------------------------

--
-- Table structure for table `default_settings`
--

CREATE TABLE IF NOT EXISTS `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique_slug` (`slug`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_settings`
--

INSERT INTO `default_settings` (`slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `is_gui`, `module`, `order`) VALUES
('activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'select', '1', '', '0=activate_by_admin|1=activate_by_email|2=no_activation', 0, 1, 'users', 961),
('addons_upload', 'Addons Upload Permissions', 'Keeps mere admins from uploading addons by default', 'text', '0', '1', '', 1, 0, '', 0),
('admin_force_https', 'Force HTTPS for Control Panel?', 'Allow only the HTTPS protocol when using the Control Panel?', 'radio', '0', '', '1=Yes|0=No', 1, 1, '', 0),
('admin_theme', 'Control Panel Theme', 'Select the theme for the control panel.', '', '', 'pyrocms', 'func:get_themes', 1, 0, '', 0),
('akismet_api_key', 'Akismet API Key', 'Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.', 'text', '', '', '', 0, 1, 'integration', 981),
('api_enabled', 'API Enabled', 'Allow API access to all modules which have an API controller.', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
('api_user_keys', 'API User Keys', 'Allow users to sign up for API keys (if the API is Enabled).', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
('auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 964),
('cdn_domain', 'CDN Domain', 'CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.', 'text', '', '', '', 0, 1, 'integration', 1000),
('ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target="_blank" href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html">CKEditor''s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(''textarea#intro.wysiwyg-simple'').ckeditor({\r\n	toolbar: [\r\n		[''pyroimages''],\r\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\r\n	  ],\r\n	extraPlugins: ''pyroimages'',\r\n	width: ''99%'',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(''textarea.wysiwyg-simple'').ckeditor({\r\n	toolbar: [\r\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\r\n	  ],\r\n	width: ''99%'',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(''textarea.wysiwyg-advanced'').ckeditor({\r\n	toolbar: [\r\n		[''Maximize''],\r\n		[''pyroimages'', ''pyrofiles''],\r\n		[''Cut'',''Copy'',''Paste'',''PasteFromWord''],\r\n		[''Undo'',''Redo'',''-'',''Find'',''Replace''],\r\n		[''Link'',''Unlink''],\r\n		[''Table'',''HorizontalRule'',''SpecialChar''],\r\n		[''Bold'',''Italic'',''StrikeThrough''],\r\n		[''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''JustifyBlock'',''-'',''BidiLtr'',''BidiRtl''],\r\n		[''Format'', ''FontSize'', ''Subscript'',''Superscript'', ''NumberedList'',''BulletedList'',''Outdent'',''Indent'',''Blockquote''],\r\n		[''ShowBlocks'', ''RemoveFormat'', ''Source'']\r\n	],\r\n	extraPlugins: ''pyroimages,pyrofiles'',\r\n	width: ''99%'',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	removePlugins: ''elementspath'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});', '', 1, 1, 'wysiwyg', 993),
('comment_markdown', 'Allow Markdown', 'Do you want to allow visitors to post comments using Markdown?', 'select', '0', '0', '0=Text Only|1=Allow Markdown', 1, 1, 'comments', 965),
('comment_order', 'Comment Order', 'Sort order in which to display comments.', 'select', 'ASC', 'ASC', 'ASC=Oldest First|DESC=Newest First', 1, 1, 'comments', 966),
('contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'kumarnavinrai@hotmail.com', '', '', 1, 1, 'email', 979),
('currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', 1, 1, '', 994),
('dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', 0, 1, '', 990),
('dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', 1, 1, '', 989),
('date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target="_blank" href="http://php.net/manual/en/function.date.php">date format</a> from PHP - OR - Using the format of <a target="_blank" href="http://php.net/manual/en/function.strftime.php">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', 1, 1, '', 995),
('default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'default', 'func:get_themes', 1, 0, '', 0),
('enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 968),
('enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '', '1=Enabled|0=Disabled', 1, 1, 'users', 963),
('enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 961),
('files_cache', 'Files Cache', 'When outputting an image via site.com/files what shall we set the cache expiration for?', 'select', '480', '480', '0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days', 1, 1, 'files', 986),
('files_cf_api_key', 'Rackspace Cloud Files API Key', 'You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.', 'text', '', '', '', 0, 1, 'files', 989),
('files_cf_username', 'Rackspace Cloud Files Username', 'To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href="https://manage.rackspacecloud.com/APIAccess.do">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 990),
('files_enabled_providers', 'Enabled File Storage Providers', 'Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below', 'checkbox', '0', '0', 'amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files', 0, 1, 'files', 994),
('files_s3_access_key', 'Amazon S3 Access Key', 'To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href="https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 993),
('files_s3_geographic_location', 'Amazon S3 Geographic Location', 'Either US or EU. If you change this you must also change the S3 URL.', 'radio', 'US', 'US', 'US=United States|EU=Europe', 1, 1, 'files', 991),
('files_s3_secret_key', 'Amazon S3 Secret Key', 'You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.', 'text', '', '', '', 0, 1, 'files', 992),
('files_s3_url', 'Amazon S3 URL', 'Change this if using one of Amazon''s EU locations or a custom domain.', 'text', 'http://{{ bucket }}.s3.amazonaws.com/', 'http://{{ bucket }}.s3.amazonaws.com/', '', 0, 1, 'files', 991),
('files_upload_limit', 'Filesize Limit', 'Maximum filesize to allow when uploading. Specify the size in MB. Example: 5', 'text', '5', '5', '', 1, 1, 'files', 987),
('frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '', '1=Open|0=Closed', 1, 1, '', 988),
('ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', '', '', 0, 1, 'integration', 983),
('ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href="https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US" target="_blank">Authorized Access to your Google Account</a>', 'password', '', '', '', 0, 1, 'integration', 982),
('ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', 0, 1, 'integration', 984),
('ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', 0, 1, 'integration', 985),
('mail_line_endings', 'Email Line Endings', 'Change from the standard \\r\\n line ending to PHP_EOL for some email servers.', 'select', '1', '1', '0=PHP_EOL|1=\\r\\n', 0, 1, 'email', 972),
('mail_protocol', 'Mail Protocol', 'Select desired email protocol.', 'select', 'mail', 'mail', 'mail=Mail|sendmail=Sendmail|smtp=SMTP', 1, 1, 'email', 977),
('mail_sendmail_path', 'Sendmail Path', 'Path to server sendmail binary.', 'text', '', '', '', 0, 1, 'email', 972),
('mail_smtp_host', 'SMTP Host Name', 'The host name of your smtp server.', 'text', '', '', '', 0, 1, 'email', 976),
('mail_smtp_pass', 'SMTP password', 'SMTP password.', 'password', '', '', '', 0, 1, 'email', 975),
('mail_smtp_port', 'SMTP Port', 'SMTP port number.', 'text', '', '', '', 0, 1, 'email', 974),
('mail_smtp_user', 'SMTP User Name', 'SMTP user name.', 'text', '', '', '', 0, 1, 'email', 973),
('meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', 'Software to manage advertising bussiness', '', 0, 1, '', 998),
('moderate_comments', 'Moderate Comments', 'Force comments to be approved before they appear on the site.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 967),
('profile_visibility', 'Profile Visibility', 'Specify who can view user profiles on the public site', 'select', 'public', '', 'public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member', 0, 1, 'users', 960),
('records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 992),
('registered_email', 'User Registered Email', 'Send a notification email to the contact e-mail when someone registers.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 962),
('resources_setting', 'resources Setting', 'A Yes or No option for the resources module', 'select', '1', '1', '1=Yes|0=No', 1, 1, 'resources', 0),
('rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 991),
('sample_setting', 'Sample Setting', 'A Yes or No option for the Sample module', 'select', '1', '1', '1=Yes|0=No', 1, 1, 'sample', 0),
('server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', '', '', 1, 1, 'email', 978),
('site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'en', 'func:get_supported_lang', 1, 1, '', 997),
('site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'Advertcont', '', 1, 1, '', 1000),
('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'en', 'func:get_supported_lang', 1, 1, '', 996),
('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', 'Software to manage advertising bussiness', '', 0, 1, '', 999),
('unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', '', '', 0, 1, '', 987);

-- --------------------------------------------------------

--
-- Table structure for table `default_states`
--

CREATE TABLE IF NOT EXISTS `default_states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`state_id`),
  KEY `states_country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5269 ;

--
-- Dumping data for table `default_states`
--

INSERT INTO `default_states` (`state_id`, `name`, `country_id`) VALUES
(2168, 'Andaman and Nicobar Islands', 113),
(2169, 'Andhra Pradesh', 113),
(2170, 'Assam', 113),
(2171, 'Bihar', 113),
(2172, 'Chandigarh', 113),
(2173, 'Dadra and Nagar Haveli', 113),
(2174, 'Delhi', 113),
(2175, 'Gujarat', 113),
(2176, 'Haryana', 113),
(2177, 'Himachal Pradesh', 113),
(2178, 'Jammu and Kashmir', 113),
(2179, 'Kerala', 113),
(2180, 'Lakshadweep', 113),
(2181, 'Madhya Pradesh', 113),
(2182, 'Maharashtra', 113),
(2183, 'Manipur', 113),
(2184, 'Meghalaya', 113),
(2185, 'Karnataka', 113),
(2186, 'Nagaland', 113),
(2187, 'Orissa', 113),
(2188, 'Pondicherry', 113),
(2189, 'Punjab', 113),
(2190, 'Rajasthan', 113),
(2191, 'Tamil Nadu', 113),
(2192, 'Tripura', 113),
(2193, 'Uttar Pradesh', 113),
(2194, 'West Bengal', 113),
(2195, 'Sikkim', 113),
(2196, 'Arunachal Pradesh', 113),
(2197, 'Mizoram', 113),
(2198, 'Daman and Diu', 113),
(2199, 'Goa', 113),
(5259, 'Uttaranchal', 113),
(5267, 'Chhattisgarh', 113),
(5268, 'Jharkhand', 113);

-- --------------------------------------------------------

--
-- Table structure for table `default_tenure_aggrement`
--

CREATE TABLE IF NOT EXISTS `default_tenure_aggrement` (
  `tenure_aggrement_id` int(11) NOT NULL AUTO_INCREMENT,
  `aggrement_term_start_date` date DEFAULT NULL,
  `aggrement_term_end_date` date DEFAULT NULL,
  `amount_decided_for_term` int(11) DEFAULT NULL,
  `amount_paid` int(11) DEFAULT '0',
  `amount_pay_date` date DEFAULT NULL,
  `amount_due` int(11) DEFAULT NULL,
  `amount_due_date` date DEFAULT NULL,
  `ref_id` int(11) NOT NULL,
  `ref_type` int(5) NOT NULL,
  `tenure_aggrement_status` int(2) NOT NULL COMMENT '1 live, 2 vacant, 3 canceled, 4 renewed',
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tenure_aggrement_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `default_tenure_aggrement`
--

INSERT INTO `default_tenure_aggrement` (`tenure_aggrement_id`, `aggrement_term_start_date`, `aggrement_term_end_date`, `amount_decided_for_term`, `amount_paid`, `amount_pay_date`, `amount_due`, `amount_due_date`, `ref_id`, `ref_type`, `tenure_aggrement_status`, `created`, `updated`) VALUES
(1, '2013-12-06', '2014-01-31', 90000, 1500, '2014-03-04', NULL, NULL, 1, 1, 3, '2013-12-14 04:17:09', '2014-03-17 12:43:52'),
(2, '2014-01-08', '2014-06-30', 95000, 8000, '2013-12-14', NULL, NULL, 2, 1, 1, '2013-12-14 04:19:00', '2013-12-14 21:49:00'),
(3, '2014-01-14', '2014-04-23', 80000, 6000, '2013-12-14', NULL, NULL, 3, 1, 1, '2013-12-14 04:20:42', '2013-12-14 21:50:42'),
(4, '2014-01-01', '2014-04-30', 89000, 55000, '2013-12-14', NULL, NULL, 4, 1, 1, '2013-12-14 04:21:57', '2013-12-14 21:51:58'),
(5, '2013-12-14', '2014-02-28', 55000, 8000, '2014-03-13', NULL, NULL, 5, 1, 3, '2013-12-14 04:23:06', '2014-03-17 17:37:27'),
(6, '2014-01-03', '2014-04-23', 90000, 25000, '2013-12-14', NULL, NULL, 6, 1, 1, '2013-12-14 04:24:23', '2013-12-14 21:54:23'),
(7, '2014-01-15', '2014-04-16', 89258, 900, '2013-12-14', NULL, NULL, 7, 1, 1, '2013-12-14 04:25:39', '2013-12-14 21:55:39'),
(8, '2014-01-14', '2014-04-30', 55000, 55000, '2013-12-14', NULL, NULL, 8, 1, 1, '2013-12-14 04:26:18', '2013-12-14 21:56:18'),
(9, '2014-01-16', '2014-04-28', 25000, 25000, '2013-12-14', NULL, NULL, 9, 1, 1, '2013-12-14 04:27:03', '2013-12-14 21:57:03'),
(10, '2014-01-01', '2014-04-30', 78000, 6100, '2014-01-14', NULL, NULL, 1, 3, 1, '2013-12-14 04:28:14', '2014-03-17 12:42:51'),
(11, '2014-01-01', '2014-04-30', 9876500, 98745, '2013-12-14', NULL, NULL, 2, 3, 1, '2013-12-14 04:36:42', '2014-01-13 15:25:20'),
(12, '2014-01-08', '2014-02-11', 987654, 500, '2013-12-14', NULL, NULL, 3, 3, 1, '2013-12-14 04:37:49', '2013-12-14 22:07:50'),
(13, '2014-01-07', '2014-04-23', 8795, 879, '2013-12-12', NULL, NULL, 4, 3, 1, '2013-12-14 04:38:34', '2014-01-13 15:24:54'),
(14, '2014-01-16', '2014-04-30', 987645, 9845, '2013-12-14', NULL, NULL, 5, 3, 1, '2013-12-14 04:39:56', '2013-12-14 22:09:56'),
(15, '2014-01-01', '2014-03-29', 7000, 7000, '2013-12-14', NULL, NULL, 6, 3, 1, '2013-12-14 04:40:27', '2013-12-14 22:10:27'),
(16, '2014-01-07', '2014-02-28', 9874, 500, '2013-12-14', NULL, NULL, 1, 2, 1, '2013-12-14 04:44:55', '2013-12-14 22:14:55'),
(17, '2014-01-07', '2014-02-28', 897654, 9874, '2013-12-14', NULL, NULL, 2, 2, 1, '2013-12-14 04:45:25', '2013-12-14 22:15:25'),
(18, '2014-01-09', '2014-04-30', 98745, 9874, '2013-12-14', NULL, NULL, 3, 2, 1, '2013-12-14 04:46:14', '2013-12-14 22:16:14'),
(19, '2014-01-03', '2014-04-30', 987455, 987455, '2013-12-14', NULL, NULL, 4, 2, 1, '2013-12-14 04:46:51', '2013-12-14 22:16:52'),
(20, '2014-01-03', '2014-04-30', 9874, 9874, '2013-12-14', NULL, NULL, 5, 2, 1, '2013-12-14 04:47:26', '2013-12-14 22:17:26'),
(21, '2013-12-03', '2014-02-27', 565656, 444443, '2013-12-05', NULL, NULL, 10, 1, 1, '2013-12-15 06:15:33', '2013-12-15 23:45:33'),
(22, '2014-01-15', '2014-03-31', 20000, 5000, '2014-01-13', NULL, NULL, 11, 1, 1, '2014-01-13 07:33:54', '2014-01-13 13:03:54'),
(23, '2014-02-05', '2014-04-30', 9000, 3000, '2014-01-09', NULL, NULL, 7, 3, 1, '2014-01-13 09:59:26', '2014-01-13 15:29:26'),
(24, '2014-02-11', '2014-04-30', 9000, 3000, '2014-01-14', NULL, NULL, 12, 1, 1, '2014-01-14 05:24:36', '2014-01-14 17:24:36'),
(25, '2014-02-10', '2014-04-30', 9875, 987, '2014-01-14', NULL, NULL, 8, 3, 1, '2014-01-14 05:30:12', '2014-01-14 17:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `default_theme_options`
--

CREATE TABLE IF NOT EXISTS `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `default_theme_options`
--

INSERT INTO `default_theme_options` (`id`, `slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `theme`) VALUES
(1, 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(2, 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(3, 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(4, 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(5, 'show_breadcrumbs', 'Show Breadcrumbs', 'Would you like to display breadcrumbs?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'default'),
(6, 'layout', 'Layout', 'Which type of layout shall we use?', 'select', '2 column', '2 column', '2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page', 1, 'default'),
(7, 'background', 'Background', 'Choose the default background for the theme.', 'select', 'fabric', 'fabric', 'black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture', 1, 'base'),
(8, 'slider', 'Slider', 'Would you like to display the slider on the homepage?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base'),
(9, 'color', 'Default Theme Color', 'This changes things like background color, link colors etc…', 'select', 'pink', 'pink', 'red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink', 1, 'base'),
(10, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base'),
(11, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'readable'),
(12, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'cerulean'),
(13, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'spacelab'),
(14, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'cosmo');

-- --------------------------------------------------------

--
-- Table structure for table `default_users`
--

CREATE TABLE IF NOT EXISTS `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `default_users`
--

INSERT INTO `default_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(1, 'kumarnavinrai@hotmail.com', 'dd13256bfb61e01d47f6115fb52cb78bb42a84f2', '10582', 1, '', 1, '', 1386006787, 1467024787, 'admin', NULL, '961662e3a2fd7cb459858c20357f08b0707736d9');

-- --------------------------------------------------------

--
-- Table structure for table `default_variables`
--

CREATE TABLE IF NOT EXISTS `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_variables`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_widgets`
--

CREATE TABLE IF NOT EXISTS `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_widgets`
--


-- --------------------------------------------------------

--
-- Table structure for table `default_widget_areas`
--

CREATE TABLE IF NOT EXISTS `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `default_widget_areas`
--

INSERT INTO `default_widget_areas` (`id`, `slug`, `title`) VALUES
(1, 'sidebar', 'Sidebar');

-- --------------------------------------------------------

--
-- Table structure for table `default_widget_instances`
--

CREATE TABLE IF NOT EXISTS `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `default_widget_instances`
--


-- --------------------------------------------------------

--
-- Table structure for table `docs`
--

CREATE TABLE IF NOT EXISTS `docs` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_filename` varchar(255) DEFAULT NULL,
  `ref_type` tinyint(4) NOT NULL COMMENT '1 for product announcement, 2 for product_recalls, 3 for white_papers, 4 for brochures',
  `ref_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `docs`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `default_states`
--
ALTER TABLE `default_states`
  ADD CONSTRAINT `states_country_id` FOREIGN KEY (`country_id`) REFERENCES `default_countries` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;
