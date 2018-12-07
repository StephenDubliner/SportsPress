-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2018 at 08:01 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brank`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-07-28 20:38:49', '2018-07-28 20:38:49', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8080/brank', 'yes'),
(2, 'home', 'http://localhost:8080/brank', 'yes'),
(3, 'blogname', 'Bad Rank - dev', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'dubliner.stephen+brank@gmai.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/index.php/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:346:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:65:"index.php/category/(.+?)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:60:"index.php/category/(.+?)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:33:"index.php/category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:45:"index.php/category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:27:"index.php/category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:62:"index.php/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:57:"index.php/tag/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:30:"index.php/tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:42:"index.php/tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:24:"index.php/tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:63:"index.php/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:58:"index.php/type/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:31:"index.php/type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:43:"index.php/type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:25:"index.php/type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:47:"index.php/sp_result/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"index.php/sp_result/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:85:"index.php/sp_result/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:80:"index.php/sp_result/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"index.php/sp_result/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"index.php/sp_result/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:36:"index.php/sp_result/([^/]+)/embed/?$";s:42:"index.php?sp_result=$matches[1]&embed=true";s:40:"index.php/sp_result/([^/]+)/trackback/?$";s:36:"index.php?sp_result=$matches[1]&tb=1";s:48:"index.php/sp_result/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_result=$matches[1]&paged=$matches[2]";s:55:"index.php/sp_result/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?sp_result=$matches[1]&cpage=$matches[2]";s:44:"index.php/sp_result/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?sp_result=$matches[1]&page=$matches[2]";s:36:"index.php/sp_result/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"index.php/sp_result/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"index.php/sp_result/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"index.php/sp_result/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"index.php/sp_result/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"index.php/sp_result/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:"index.php/sp_outcome/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:58:"index.php/sp_outcome/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:86:"index.php/sp_outcome/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:81:"index.php/sp_outcome/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:73:"index.php/sp_outcome/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:54:"index.php/sp_outcome/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:37:"index.php/sp_outcome/([^/]+)/embed/?$";s:43:"index.php?sp_outcome=$matches[1]&embed=true";s:41:"index.php/sp_outcome/([^/]+)/trackback/?$";s:37:"index.php?sp_outcome=$matches[1]&tb=1";s:49:"index.php/sp_outcome/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?sp_outcome=$matches[1]&paged=$matches[2]";s:56:"index.php/sp_outcome/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?sp_outcome=$matches[1]&cpage=$matches[2]";s:45:"index.php/sp_outcome/([^/]+)(?:/([0-9]+))?/?$";s:49:"index.php?sp_outcome=$matches[1]&page=$matches[2]";s:37:"index.php/sp_outcome/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"index.php/sp_outcome/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"index.php/sp_outcome/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"index.php/sp_outcome/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"index.php/sp_outcome/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"index.php/sp_outcome/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:47:"index.php/sp_column/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"index.php/sp_column/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:85:"index.php/sp_column/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:80:"index.php/sp_column/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"index.php/sp_column/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"index.php/sp_column/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:36:"index.php/sp_column/([^/]+)/embed/?$";s:42:"index.php?sp_column=$matches[1]&embed=true";s:40:"index.php/sp_column/([^/]+)/trackback/?$";s:36:"index.php?sp_column=$matches[1]&tb=1";s:48:"index.php/sp_column/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_column=$matches[1]&paged=$matches[2]";s:55:"index.php/sp_column/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?sp_column=$matches[1]&cpage=$matches[2]";s:44:"index.php/sp_column/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?sp_column=$matches[1]&page=$matches[2]";s:36:"index.php/sp_column/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"index.php/sp_column/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"index.php/sp_column/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"index.php/sp_column/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"index.php/sp_column/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"index.php/sp_column/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:47:"index.php/sp_metric/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"index.php/sp_metric/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:85:"index.php/sp_metric/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:80:"index.php/sp_metric/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"index.php/sp_metric/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"index.php/sp_metric/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:36:"index.php/sp_metric/([^/]+)/embed/?$";s:42:"index.php?sp_metric=$matches[1]&embed=true";s:40:"index.php/sp_metric/([^/]+)/trackback/?$";s:36:"index.php?sp_metric=$matches[1]&tb=1";s:48:"index.php/sp_metric/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_metric=$matches[1]&paged=$matches[2]";s:55:"index.php/sp_metric/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?sp_metric=$matches[1]&cpage=$matches[2]";s:44:"index.php/sp_metric/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?sp_metric=$matches[1]&page=$matches[2]";s:36:"index.php/sp_metric/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"index.php/sp_metric/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"index.php/sp_metric/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"index.php/sp_metric/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"index.php/sp_metric/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"index.php/sp_metric/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:52:"index.php/sp_performance/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:62:"index.php/sp_performance/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:90:"index.php/sp_performance/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:85:"index.php/sp_performance/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:77:"index.php/sp_performance/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:58:"index.php/sp_performance/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:41:"index.php/sp_performance/([^/]+)/embed/?$";s:47:"index.php?sp_performance=$matches[1]&embed=true";s:45:"index.php/sp_performance/([^/]+)/trackback/?$";s:41:"index.php?sp_performance=$matches[1]&tb=1";s:53:"index.php/sp_performance/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?sp_performance=$matches[1]&paged=$matches[2]";s:60:"index.php/sp_performance/([^/]+)/comment-page-([0-9]{1,})/?$";s:54:"index.php?sp_performance=$matches[1]&cpage=$matches[2]";s:49:"index.php/sp_performance/([^/]+)(?:/([0-9]+))?/?$";s:53:"index.php?sp_performance=$matches[1]&page=$matches[2]";s:41:"index.php/sp_performance/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:51:"index.php/sp_performance/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:79:"index.php/sp_performance/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:74:"index.php/sp_performance/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"index.php/sp_performance/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:47:"index.php/sp_performance/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:50:"index.php/sp_statistic/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:60:"index.php/sp_statistic/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"index.php/sp_statistic/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"index.php/sp_statistic/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:75:"index.php/sp_statistic/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:56:"index.php/sp_statistic/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:39:"index.php/sp_statistic/([^/]+)/embed/?$";s:45:"index.php?sp_statistic=$matches[1]&embed=true";s:43:"index.php/sp_statistic/([^/]+)/trackback/?$";s:39:"index.php?sp_statistic=$matches[1]&tb=1";s:51:"index.php/sp_statistic/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?sp_statistic=$matches[1]&paged=$matches[2]";s:58:"index.php/sp_statistic/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?sp_statistic=$matches[1]&cpage=$matches[2]";s:47:"index.php/sp_statistic/([^/]+)(?:/([0-9]+))?/?$";s:51:"index.php?sp_statistic=$matches[1]&page=$matches[2]";s:39:"index.php/sp_statistic/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:49:"index.php/sp_statistic/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"index.php/sp_statistic/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"index.php/sp_statistic/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"index.php/sp_statistic/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"index.php/sp_statistic/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:43:"index.php/event/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:53:"index.php/event/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:81:"index.php/event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:76:"index.php/event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:68:"index.php/event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:49:"index.php/event/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:32:"index.php/event/([^/]+)/embed/?$";s:41:"index.php?sp_event=$matches[1]&embed=true";s:36:"index.php/event/([^/]+)/trackback/?$";s:35:"index.php?sp_event=$matches[1]&tb=1";s:44:"index.php/event/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?sp_event=$matches[1]&paged=$matches[2]";s:51:"index.php/event/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?sp_event=$matches[1]&cpage=$matches[2]";s:40:"index.php/event/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?sp_event=$matches[1]&page=$matches[2]";s:32:"index.php/event/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"index.php/event/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"index.php/event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"index.php/event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"index.php/event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"index.php/event/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:40:"index.php/team/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"index.php/team/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:78:"index.php/team/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:73:"index.php/team/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"index.php/team/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"index.php/team/.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"index.php/team/(.+?)/embed/?$";s:40:"index.php?sp_team=$matches[1]&embed=true";s:33:"index.php/team/(.+?)/trackback/?$";s:34:"index.php?sp_team=$matches[1]&tb=1";s:41:"index.php/team/(.+?)/page/?([0-9]{1,})/?$";s:47:"index.php?sp_team=$matches[1]&paged=$matches[2]";s:48:"index.php/team/(.+?)/comment-page-([0-9]{1,})/?$";s:47:"index.php?sp_team=$matches[1]&cpage=$matches[2]";s:37:"index.php/team/(.+?)(?:/([0-9]+))?/?$";s:46:"index.php?sp_team=$matches[1]&page=$matches[2]";s:44:"index.php/player/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:54:"index.php/player/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:82:"index.php/player/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:77:"index.php/player/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"index.php/player/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:50:"index.php/player/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:33:"index.php/player/([^/]+)/embed/?$";s:42:"index.php?sp_player=$matches[1]&embed=true";s:37:"index.php/player/([^/]+)/trackback/?$";s:36:"index.php?sp_player=$matches[1]&tb=1";s:45:"index.php/player/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_player=$matches[1]&paged=$matches[2]";s:52:"index.php/player/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?sp_player=$matches[1]&cpage=$matches[2]";s:41:"index.php/player/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?sp_player=$matches[1]&page=$matches[2]";s:33:"index.php/player/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"index.php/player/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"index.php/player/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"index.php/player/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"index.php/player/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"index.php/player/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:43:"index.php/staff/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:53:"index.php/staff/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:81:"index.php/staff/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:76:"index.php/staff/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:68:"index.php/staff/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:49:"index.php/staff/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:32:"index.php/staff/([^/]+)/embed/?$";s:41:"index.php?sp_staff=$matches[1]&embed=true";s:36:"index.php/staff/([^/]+)/trackback/?$";s:35:"index.php?sp_staff=$matches[1]&tb=1";s:44:"index.php/staff/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?sp_staff=$matches[1]&paged=$matches[2]";s:51:"index.php/staff/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?sp_staff=$matches[1]&cpage=$matches[2]";s:40:"index.php/staff/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?sp_staff=$matches[1]&page=$matches[2]";s:32:"index.php/staff/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"index.php/staff/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"index.php/staff/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"index.php/staff/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"index.php/staff/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"index.php/staff/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:65:"index.php/league/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:48:"index.php?sp_league=$matches[1]&feed=$matches[2]";s:60:"index.php/league/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:48:"index.php?sp_league=$matches[1]&feed=$matches[2]";s:33:"index.php/league/([^/]+)/embed/?$";s:42:"index.php?sp_league=$matches[1]&embed=true";s:45:"index.php/league/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_league=$matches[1]&paged=$matches[2]";s:27:"index.php/league/([^/]+)/?$";s:31:"index.php?sp_league=$matches[1]";s:65:"index.php/season/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:48:"index.php?sp_season=$matches[1]&feed=$matches[2]";s:60:"index.php/season/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:48:"index.php?sp_season=$matches[1]&feed=$matches[2]";s:33:"index.php/season/([^/]+)/embed/?$";s:42:"index.php?sp_season=$matches[1]&embed=true";s:45:"index.php/season/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?sp_season=$matches[1]&paged=$matches[2]";s:27:"index.php/season/([^/]+)/?$";s:31:"index.php?sp_season=$matches[1]";s:64:"index.php/venue/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:47:"index.php?sp_venue=$matches[1]&feed=$matches[2]";s:59:"index.php/venue/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:47:"index.php?sp_venue=$matches[1]&feed=$matches[2]";s:32:"index.php/venue/([^/]+)/embed/?$";s:41:"index.php?sp_venue=$matches[1]&embed=true";s:44:"index.php/venue/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?sp_venue=$matches[1]&paged=$matches[2]";s:26:"index.php/venue/([^/]+)/?$";s:30:"index.php?sp_venue=$matches[1]";s:67:"index.php/position/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?sp_position=$matches[1]&feed=$matches[2]";s:62:"index.php/position/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?sp_position=$matches[1]&feed=$matches[2]";s:35:"index.php/position/([^/]+)/embed/?$";s:44:"index.php?sp_position=$matches[1]&embed=true";s:47:"index.php/position/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?sp_position=$matches[1]&paged=$matches[2]";s:29:"index.php/position/([^/]+)/?$";s:33:"index.php?sp_position=$matches[1]";s:63:"index.php/role/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:46:"index.php?sp_role=$matches[1]&feed=$matches[2]";s:58:"index.php/role/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:46:"index.php?sp_role=$matches[1]&feed=$matches[2]";s:31:"index.php/role/([^/]+)/embed/?$";s:40:"index.php?sp_role=$matches[1]&embed=true";s:43:"index.php/role/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?sp_role=$matches[1]&paged=$matches[2]";s:25:"index.php/role/([^/]+)/?$";s:29:"index.php?sp_role=$matches[1]";s:46:"index.php/calendar/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:56:"index.php/calendar/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:84:"index.php/calendar/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:79:"index.php/calendar/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"index.php/calendar/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:52:"index.php/calendar/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"index.php/calendar/([^/]+)/embed/?$";s:44:"index.php?sp_calendar=$matches[1]&embed=true";s:39:"index.php/calendar/([^/]+)/trackback/?$";s:38:"index.php?sp_calendar=$matches[1]&tb=1";s:47:"index.php/calendar/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?sp_calendar=$matches[1]&paged=$matches[2]";s:54:"index.php/calendar/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?sp_calendar=$matches[1]&cpage=$matches[2]";s:43:"index.php/calendar/([^/]+)(?:/([0-9]+))?/?$";s:50:"index.php?sp_calendar=$matches[1]&page=$matches[2]";s:35:"index.php/calendar/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"index.php/calendar/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:73:"index.php/calendar/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:68:"index.php/calendar/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"index.php/calendar/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"index.php/calendar/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"index.php/sp_spec/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"index.php/sp_spec/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:83:"index.php/sp_spec/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:78:"index.php/sp_spec/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"index.php/sp_spec/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:51:"index.php/sp_spec/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"index.php/sp_spec/([^/]+)/embed/?$";s:40:"index.php?sp_spec=$matches[1]&embed=true";s:38:"index.php/sp_spec/([^/]+)/trackback/?$";s:34:"index.php?sp_spec=$matches[1]&tb=1";s:46:"index.php/sp_spec/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?sp_spec=$matches[1]&paged=$matches[2]";s:53:"index.php/sp_spec/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?sp_spec=$matches[1]&cpage=$matches[2]";s:42:"index.php/sp_spec/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?sp_spec=$matches[1]&page=$matches[2]";s:34:"index.php/sp_spec/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"index.php/sp_spec/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"index.php/sp_spec/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"index.php/sp_spec/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"index.php/sp_spec/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"index.php/sp_spec/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:43:"index.php/table/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:53:"index.php/table/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:81:"index.php/table/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:76:"index.php/table/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:68:"index.php/table/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:49:"index.php/table/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:32:"index.php/table/([^/]+)/embed/?$";s:41:"index.php?sp_table=$matches[1]&embed=true";s:36:"index.php/table/([^/]+)/trackback/?$";s:35:"index.php?sp_table=$matches[1]&tb=1";s:44:"index.php/table/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?sp_table=$matches[1]&paged=$matches[2]";s:51:"index.php/table/([^/]+)/comment-page-([0-9]{1,})/?$";s:48:"index.php?sp_table=$matches[1]&cpage=$matches[2]";s:40:"index.php/table/([^/]+)(?:/([0-9]+))?/?$";s:47:"index.php?sp_table=$matches[1]&page=$matches[2]";s:32:"index.php/table/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"index.php/table/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"index.php/table/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"index.php/table/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"index.php/table/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"index.php/table/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:42:"index.php/list/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:52:"index.php/list/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:80:"index.php/list/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:75:"index.php/list/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"index.php/list/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:"index.php/list/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:31:"index.php/list/([^/]+)/embed/?$";s:40:"index.php?sp_list=$matches[1]&embed=true";s:35:"index.php/list/([^/]+)/trackback/?$";s:34:"index.php?sp_list=$matches[1]&tb=1";s:43:"index.php/list/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?sp_list=$matches[1]&paged=$matches[2]";s:50:"index.php/list/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?sp_list=$matches[1]&cpage=$matches[2]";s:39:"index.php/list/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?sp_list=$matches[1]&page=$matches[2]";s:31:"index.php/list/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:"index.php/list/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:69:"index.php/list/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"index.php/list/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"index.php/list/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:"index.php/list/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:50:"index.php/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:27:"index.php?&feed=$matches[1]";s:45:"index.php/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:27:"index.php?&feed=$matches[1]";s:18:"index.php/embed/?$";s:21:"index.php?&embed=true";s:30:"index.php/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:59:"index.php/comments/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:54:"index.php/comments/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:27:"index.php/comments/embed/?$";s:21:"index.php?&embed=true";s:62:"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:57:"index.php/search/(.+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:30:"index.php/search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:42:"index.php/search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:24:"index.php/search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:65:"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:60:"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:33:"index.php/author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:45:"index.php/author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:27:"index.php/author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:87:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:82:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:55:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:67:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:49:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:74:"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:69:"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:42:"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:54:"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:36:"index.php/([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:61:"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:56:"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:29:"index.php/([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:41:"index.php/([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:23:"index.php/([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:68:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:78:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:106:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:101:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:93:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:74:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:63:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:67:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:95:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:90:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:75:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:82:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:71:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:57:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:67:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:95:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:90:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:82:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:63:"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:74:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:61:"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:48:"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:37:"index.php/.?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"index.php/.?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"index.php/.?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"index.php/(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:30:"index.php/(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:58:"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:53:"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom|sp-ical)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:38:"index.php/(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:45:"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:34:"index.php/(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:27:"SportsPress/sportspress.php";i:1;s:39:"github-updater-8.2.1/github-updater.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:61:"/Users/pawel/dev/brank.dev/wp-content/themes/Rookie/style.css";i:2;s:0:"";}', 'no'),
(40, 'template', 'Rookie', 'yes'),
(41, 'stylesheet', 'Rookie', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:5:{i:2;a:4:{s:5:"title";s:7:"Find Us";s:4:"text";s:168:"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM";s:6:"filter";b:1;s:6:"visual";b:1;}i:3;a:4:{s:5:"title";s:15:"About This Site";s:4:"text";s:85:"This may be a good place to introduce yourself and your site or include some credits.";s:6:"filter";b:1;s:6:"visual";b:1;}i:4;a:4:{s:5:"title";s:7:"Find Us";s:4:"text";s:168:"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM";s:6:"filter";b:1;s:6:"visual";b:1;}i:5;a:4:{s:5:"title";s:15:"About This Site";s:4:"text";s:85:"This may be a good place to introduce yourself and your site or include some credits.";s:6:"filter";b:1;s:6:"visual";b:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'initial_db_version', '38590', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(93, 'wp_user_roles', 'a:10:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:199:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_sportspress";b:1;s:24:"view_sportspress_reports";b:1;s:14:"edit_sp_config";b:1;s:14:"read_sp_config";b:1;s:16:"delete_sp_config";b:1;s:15:"edit_sp_configs";b:1;s:22:"edit_others_sp_configs";b:1;s:18:"publish_sp_configs";b:1;s:23:"read_private_sp_configs";b:1;s:17:"delete_sp_configs";b:1;s:25:"delete_private_sp_configs";b:1;s:27:"delete_published_sp_configs";b:1;s:24:"delete_others_sp_configs";b:1;s:23:"edit_private_sp_configs";b:1;s:25:"edit_published_sp_configs";b:1;s:22:"manage_sp_config_terms";b:1;s:20:"edit_sp_config_terms";b:1;s:22:"delete_sp_config_terms";b:1;s:22:"assign_sp_config_terms";b:1;s:13:"edit_sp_event";b:1;s:13:"read_sp_event";b:1;s:15:"delete_sp_event";b:1;s:14:"edit_sp_events";b:1;s:21:"edit_others_sp_events";b:1;s:17:"publish_sp_events";b:1;s:22:"read_private_sp_events";b:1;s:16:"delete_sp_events";b:1;s:24:"delete_private_sp_events";b:1;s:26:"delete_published_sp_events";b:1;s:23:"delete_others_sp_events";b:1;s:22:"edit_private_sp_events";b:1;s:24:"edit_published_sp_events";b:1;s:21:"manage_sp_event_terms";b:1;s:19:"edit_sp_event_terms";b:1;s:21:"delete_sp_event_terms";b:1;s:21:"assign_sp_event_terms";b:1;s:16:"edit_sp_calendar";b:1;s:16:"read_sp_calendar";b:1;s:18:"delete_sp_calendar";b:1;s:17:"edit_sp_calendars";b:1;s:24:"edit_others_sp_calendars";b:1;s:20:"publish_sp_calendars";b:1;s:25:"read_private_sp_calendars";b:1;s:19:"delete_sp_calendars";b:1;s:27:"delete_private_sp_calendars";b:1;s:29:"delete_published_sp_calendars";b:1;s:26:"delete_others_sp_calendars";b:1;s:25:"edit_private_sp_calendars";b:1;s:27:"edit_published_sp_calendars";b:1;s:24:"manage_sp_calendar_terms";b:1;s:22:"edit_sp_calendar_terms";b:1;s:24:"delete_sp_calendar_terms";b:1;s:24:"assign_sp_calendar_terms";b:1;s:12:"edit_sp_team";b:1;s:12:"read_sp_team";b:1;s:14:"delete_sp_team";b:1;s:13:"edit_sp_teams";b:1;s:20:"edit_others_sp_teams";b:1;s:16:"publish_sp_teams";b:1;s:21:"read_private_sp_teams";b:1;s:15:"delete_sp_teams";b:1;s:23:"delete_private_sp_teams";b:1;s:25:"delete_published_sp_teams";b:1;s:22:"delete_others_sp_teams";b:1;s:21:"edit_private_sp_teams";b:1;s:23:"edit_published_sp_teams";b:1;s:20:"manage_sp_team_terms";b:1;s:18:"edit_sp_team_terms";b:1;s:20:"delete_sp_team_terms";b:1;s:20:"assign_sp_team_terms";b:1;s:13:"edit_sp_table";b:1;s:13:"read_sp_table";b:1;s:15:"delete_sp_table";b:1;s:14:"edit_sp_tables";b:1;s:21:"edit_others_sp_tables";b:1;s:17:"publish_sp_tables";b:1;s:22:"read_private_sp_tables";b:1;s:16:"delete_sp_tables";b:1;s:24:"delete_private_sp_tables";b:1;s:26:"delete_published_sp_tables";b:1;s:23:"delete_others_sp_tables";b:1;s:22:"edit_private_sp_tables";b:1;s:24:"edit_published_sp_tables";b:1;s:21:"manage_sp_table_terms";b:1;s:19:"edit_sp_table_terms";b:1;s:21:"delete_sp_table_terms";b:1;s:21:"assign_sp_table_terms";b:1;s:14:"edit_sp_player";b:1;s:14:"read_sp_player";b:1;s:16:"delete_sp_player";b:1;s:15:"edit_sp_players";b:1;s:22:"edit_others_sp_players";b:1;s:18:"publish_sp_players";b:1;s:23:"read_private_sp_players";b:1;s:17:"delete_sp_players";b:1;s:25:"delete_private_sp_players";b:1;s:27:"delete_published_sp_players";b:1;s:24:"delete_others_sp_players";b:1;s:23:"edit_private_sp_players";b:1;s:25:"edit_published_sp_players";b:1;s:22:"manage_sp_player_terms";b:1;s:20:"edit_sp_player_terms";b:1;s:22:"delete_sp_player_terms";b:1;s:22:"assign_sp_player_terms";b:1;s:12:"edit_sp_list";b:1;s:12:"read_sp_list";b:1;s:14:"delete_sp_list";b:1;s:13:"edit_sp_lists";b:1;s:20:"edit_others_sp_lists";b:1;s:16:"publish_sp_lists";b:1;s:21:"read_private_sp_lists";b:1;s:15:"delete_sp_lists";b:1;s:23:"delete_private_sp_lists";b:1;s:25:"delete_published_sp_lists";b:1;s:22:"delete_others_sp_lists";b:1;s:21:"edit_private_sp_lists";b:1;s:23:"edit_published_sp_lists";b:1;s:20:"manage_sp_list_terms";b:1;s:18:"edit_sp_list_terms";b:1;s:20:"delete_sp_list_terms";b:1;s:20:"assign_sp_list_terms";b:1;s:13:"edit_sp_staff";b:1;s:13:"read_sp_staff";b:1;s:15:"delete_sp_staff";b:1;s:14:"edit_sp_staffs";b:1;s:21:"edit_others_sp_staffs";b:1;s:17:"publish_sp_staffs";b:1;s:22:"read_private_sp_staffs";b:1;s:16:"delete_sp_staffs";b:1;s:24:"delete_private_sp_staffs";b:1;s:26:"delete_published_sp_staffs";b:1;s:23:"delete_others_sp_staffs";b:1;s:22:"edit_private_sp_staffs";b:1;s:24:"edit_published_sp_staffs";b:1;s:21:"manage_sp_staff_terms";b:1;s:19:"edit_sp_staff_terms";b:1;s:21:"delete_sp_staff_terms";b:1;s:21:"assign_sp_staff_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:9:"sp_player";a:2:{s:4:"name";s:6:"Player";s:12:"capabilities";a:21:{s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:12:"delete_posts";b:1;s:10:"edit_posts";b:1;s:12:"upload_files";b:1;s:14:"edit_sp_player";b:1;s:14:"read_sp_player";b:1;s:15:"edit_sp_players";b:1;s:25:"edit_published_sp_players";b:1;s:22:"assign_sp_player_terms";b:1;s:13:"edit_sp_event";b:1;s:13:"read_sp_event";b:1;s:14:"edit_sp_events";b:1;s:24:"edit_published_sp_events";b:1;s:21:"assign_sp_event_terms";b:1;s:12:"edit_sp_team";b:1;s:12:"read_sp_team";b:1;s:13:"edit_sp_teams";b:1;s:23:"edit_published_sp_teams";b:1;s:20:"assign_sp_team_terms";b:1;}}s:8:"sp_staff";a:2:{s:4:"name";s:5:"Staff";s:12:"capabilities";a:26:{s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:12:"delete_posts";b:1;s:10:"edit_posts";b:1;s:12:"upload_files";b:1;s:13:"edit_sp_staff";b:1;s:13:"read_sp_staff";b:1;s:14:"edit_sp_staffs";b:1;s:24:"edit_published_sp_staffs";b:1;s:21:"assign_sp_staff_terms";b:1;s:13:"edit_sp_event";b:1;s:13:"read_sp_event";b:1;s:14:"edit_sp_events";b:1;s:24:"edit_published_sp_events";b:1;s:21:"assign_sp_event_terms";b:1;s:12:"edit_sp_team";b:1;s:12:"read_sp_team";b:1;s:13:"edit_sp_teams";b:1;s:23:"edit_published_sp_teams";b:1;s:20:"assign_sp_team_terms";b:1;s:14:"edit_sp_player";b:1;s:14:"read_sp_player";b:1;s:15:"edit_sp_players";b:1;s:25:"edit_published_sp_players";b:1;s:22:"assign_sp_player_terms";b:1;}}s:16:"sp_event_manager";a:2:{s:4:"name";s:13:"Event Manager";s:12:"capabilities";a:35:{s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:12:"delete_posts";b:1;s:10:"edit_posts";b:1;s:12:"upload_files";b:1;s:17:"manage_categories";b:1;s:13:"edit_sp_event";b:1;s:13:"read_sp_event";b:1;s:15:"delete_sp_event";b:1;s:14:"edit_sp_events";b:1;s:21:"edit_others_sp_events";b:1;s:17:"publish_sp_events";b:1;s:16:"delete_sp_events";b:1;s:26:"delete_published_sp_events";b:1;s:24:"edit_published_sp_events";b:1;s:21:"manage_sp_event_terms";b:1;s:19:"edit_sp_event_terms";b:1;s:21:"delete_sp_event_terms";b:1;s:21:"assign_sp_event_terms";b:1;s:12:"edit_sp_team";b:1;s:12:"read_sp_team";b:1;s:13:"edit_sp_teams";b:1;s:23:"edit_published_sp_teams";b:1;s:20:"assign_sp_team_terms";b:1;s:14:"edit_sp_player";b:1;s:14:"read_sp_player";b:1;s:15:"edit_sp_players";b:1;s:25:"edit_published_sp_players";b:1;s:22:"assign_sp_player_terms";b:1;s:13:"edit_sp_staff";b:1;s:13:"read_sp_staff";b:1;s:14:"edit_sp_staffs";b:1;s:24:"edit_published_sp_staffs";b:1;s:21:"assign_sp_staff_terms";b:1;}}s:15:"sp_team_manager";a:2:{s:4:"name";s:12:"Team Manager";s:12:"capabilities";a:57:{s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:12:"delete_posts";b:1;s:10:"edit_posts";b:1;s:22:"delete_published_posts";b:1;s:13:"publish_posts";b:1;s:12:"upload_files";b:1;s:20:"edit_published_posts";b:1;s:14:"edit_sp_player";b:1;s:14:"read_sp_player";b:1;s:16:"delete_sp_player";b:1;s:15:"edit_sp_players";b:1;s:22:"edit_others_sp_players";b:1;s:18:"publish_sp_players";b:1;s:17:"delete_sp_players";b:1;s:27:"delete_published_sp_players";b:1;s:25:"edit_published_sp_players";b:1;s:22:"assign_sp_player_terms";b:1;s:13:"edit_sp_staff";b:1;s:13:"read_sp_staff";b:1;s:15:"delete_sp_staff";b:1;s:14:"edit_sp_staffs";b:1;s:21:"edit_others_sp_staffs";b:1;s:17:"publish_sp_staffs";b:1;s:16:"delete_sp_staffs";b:1;s:26:"delete_published_sp_staffs";b:1;s:24:"edit_published_sp_staffs";b:1;s:21:"assign_sp_staff_terms";b:1;s:13:"edit_sp_event";b:1;s:13:"read_sp_event";b:1;s:15:"delete_sp_event";b:1;s:14:"edit_sp_events";b:1;s:21:"edit_others_sp_events";b:1;s:17:"publish_sp_events";b:1;s:16:"delete_sp_events";b:1;s:26:"delete_published_sp_events";b:1;s:24:"edit_published_sp_events";b:1;s:21:"manage_sp_event_terms";b:1;s:19:"edit_sp_event_terms";b:1;s:21:"delete_sp_event_terms";b:1;s:21:"assign_sp_event_terms";b:1;s:12:"edit_sp_team";b:1;s:12:"read_sp_team";b:1;s:13:"edit_sp_teams";b:1;s:23:"edit_published_sp_teams";b:1;s:20:"assign_sp_team_terms";b:1;s:12:"edit_sp_list";b:1;s:12:"read_sp_list";b:1;s:14:"delete_sp_list";b:1;s:13:"edit_sp_lists";b:1;s:16:"publish_sp_lists";b:1;s:15:"delete_sp_lists";b:1;s:25:"delete_published_sp_lists";b:1;s:23:"edit_published_sp_lists";b:1;s:20:"assign_sp_list_terms";b:1;}}s:17:"sp_league_manager";a:2:{s:4:"name";s:14:"League Manager";s:12:"capabilities";a:176:{s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_sportspress";b:1;s:24:"view_sportspress_reports";b:1;s:14:"edit_sp_config";b:1;s:14:"read_sp_config";b:1;s:16:"delete_sp_config";b:1;s:15:"edit_sp_configs";b:1;s:22:"edit_others_sp_configs";b:1;s:18:"publish_sp_configs";b:1;s:23:"read_private_sp_configs";b:1;s:17:"delete_sp_configs";b:1;s:25:"delete_private_sp_configs";b:1;s:27:"delete_published_sp_configs";b:1;s:24:"delete_others_sp_configs";b:1;s:23:"edit_private_sp_configs";b:1;s:25:"edit_published_sp_configs";b:1;s:22:"manage_sp_config_terms";b:1;s:20:"edit_sp_config_terms";b:1;s:22:"delete_sp_config_terms";b:1;s:22:"assign_sp_config_terms";b:1;s:13:"edit_sp_event";b:1;s:13:"read_sp_event";b:1;s:15:"delete_sp_event";b:1;s:14:"edit_sp_events";b:1;s:21:"edit_others_sp_events";b:1;s:17:"publish_sp_events";b:1;s:22:"read_private_sp_events";b:1;s:16:"delete_sp_events";b:1;s:24:"delete_private_sp_events";b:1;s:26:"delete_published_sp_events";b:1;s:23:"delete_others_sp_events";b:1;s:22:"edit_private_sp_events";b:1;s:24:"edit_published_sp_events";b:1;s:21:"manage_sp_event_terms";b:1;s:19:"edit_sp_event_terms";b:1;s:21:"delete_sp_event_terms";b:1;s:21:"assign_sp_event_terms";b:1;s:16:"edit_sp_calendar";b:1;s:16:"read_sp_calendar";b:1;s:18:"delete_sp_calendar";b:1;s:17:"edit_sp_calendars";b:1;s:24:"edit_others_sp_calendars";b:1;s:20:"publish_sp_calendars";b:1;s:25:"read_private_sp_calendars";b:1;s:19:"delete_sp_calendars";b:1;s:27:"delete_private_sp_calendars";b:1;s:29:"delete_published_sp_calendars";b:1;s:26:"delete_others_sp_calendars";b:1;s:25:"edit_private_sp_calendars";b:1;s:27:"edit_published_sp_calendars";b:1;s:24:"manage_sp_calendar_terms";b:1;s:22:"edit_sp_calendar_terms";b:1;s:24:"delete_sp_calendar_terms";b:1;s:24:"assign_sp_calendar_terms";b:1;s:12:"edit_sp_team";b:1;s:12:"read_sp_team";b:1;s:14:"delete_sp_team";b:1;s:13:"edit_sp_teams";b:1;s:20:"edit_others_sp_teams";b:1;s:16:"publish_sp_teams";b:1;s:21:"read_private_sp_teams";b:1;s:15:"delete_sp_teams";b:1;s:23:"delete_private_sp_teams";b:1;s:25:"delete_published_sp_teams";b:1;s:22:"delete_others_sp_teams";b:1;s:21:"edit_private_sp_teams";b:1;s:23:"edit_published_sp_teams";b:1;s:20:"manage_sp_team_terms";b:1;s:18:"edit_sp_team_terms";b:1;s:20:"delete_sp_team_terms";b:1;s:20:"assign_sp_team_terms";b:1;s:13:"edit_sp_table";b:1;s:13:"read_sp_table";b:1;s:15:"delete_sp_table";b:1;s:14:"edit_sp_tables";b:1;s:21:"edit_others_sp_tables";b:1;s:17:"publish_sp_tables";b:1;s:22:"read_private_sp_tables";b:1;s:16:"delete_sp_tables";b:1;s:24:"delete_private_sp_tables";b:1;s:26:"delete_published_sp_tables";b:1;s:23:"delete_others_sp_tables";b:1;s:22:"edit_private_sp_tables";b:1;s:24:"edit_published_sp_tables";b:1;s:21:"manage_sp_table_terms";b:1;s:19:"edit_sp_table_terms";b:1;s:21:"delete_sp_table_terms";b:1;s:21:"assign_sp_table_terms";b:1;s:14:"edit_sp_player";b:1;s:14:"read_sp_player";b:1;s:16:"delete_sp_player";b:1;s:15:"edit_sp_players";b:1;s:22:"edit_others_sp_players";b:1;s:18:"publish_sp_players";b:1;s:23:"read_private_sp_players";b:1;s:17:"delete_sp_players";b:1;s:25:"delete_private_sp_players";b:1;s:27:"delete_published_sp_players";b:1;s:24:"delete_others_sp_players";b:1;s:23:"edit_private_sp_players";b:1;s:25:"edit_published_sp_players";b:1;s:22:"manage_sp_player_terms";b:1;s:20:"edit_sp_player_terms";b:1;s:22:"delete_sp_player_terms";b:1;s:22:"assign_sp_player_terms";b:1;s:12:"edit_sp_list";b:1;s:12:"read_sp_list";b:1;s:14:"delete_sp_list";b:1;s:13:"edit_sp_lists";b:1;s:20:"edit_others_sp_lists";b:1;s:16:"publish_sp_lists";b:1;s:21:"read_private_sp_lists";b:1;s:15:"delete_sp_lists";b:1;s:23:"delete_private_sp_lists";b:1;s:25:"delete_published_sp_lists";b:1;s:22:"delete_others_sp_lists";b:1;s:21:"edit_private_sp_lists";b:1;s:23:"edit_published_sp_lists";b:1;s:20:"manage_sp_list_terms";b:1;s:18:"edit_sp_list_terms";b:1;s:20:"delete_sp_list_terms";b:1;s:20:"assign_sp_list_terms";b:1;s:13:"edit_sp_staff";b:1;s:13:"read_sp_staff";b:1;s:15:"delete_sp_staff";b:1;s:14:"edit_sp_staffs";b:1;s:21:"edit_others_sp_staffs";b:1;s:17:"publish_sp_staffs";b:1;s:22:"read_private_sp_staffs";b:1;s:16:"delete_sp_staffs";b:1;s:24:"delete_private_sp_staffs";b:1;s:26:"delete_published_sp_staffs";b:1;s:23:"delete_others_sp_staffs";b:1;s:22:"edit_private_sp_staffs";b:1;s:24:"edit_published_sp_staffs";b:1;s:21:"manage_sp_staff_terms";b:1;s:19:"edit_sp_staff_terms";b:1;s:21:"delete_sp_staff_terms";b:1;s:21:"assign_sp_staff_terms";b:1;}}}', 'yes'),
(94, 'fresh_site', '0', 'yes'),
(95, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'sidebars_widgets', 'a:8:{s:19:"wp_inactive_widgets";a:4:{i:0;s:6:"text-2";i:1;s:6:"text-3";i:2;s:6:"text-4";i:3;s:6:"text-5";}s:9:"sidebar-1";a:0:{}s:8:"header-1";a:0:{}s:10:"homepage-1";a:0:{}s:8:"footer-1";a:0:{}s:8:"footer-2";a:0:{}s:8:"footer-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(101, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'cron', 'a:5:{i:1535308729;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1535312415;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1535315929;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1535315949;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(111, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1533563522;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(115, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.9.8-partial-7.zip";s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.8";s:7:"version";s:5:"4.9.8";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:5:"4.9.7";}i:1;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.9.8-partial-7.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-4.9.8-rollback-7.zip";}s:7:"current";s:5:"4.9.8";s:7:"version";s:5:"4.9.8";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:5:"4.9.7";s:9:"new_files";s:0:"";}}s:12:"last_checked";i:1535308589;s:15:"version_checked";s:5:"4.9.7";s:12:"translations";a:0:{}}', 'no'),
(125, 'can_compress_scripts', '1', 'no'),
(140, 'recently_activated', 'a:0:{}', 'yes'),
(143, 'ftp_credentials', 'a:3:{s:8:"hostname";s:9:"localhost";s:8:"username";s:6:"daemon";s:15:"connection_type";s:3:"ftp";}', 'yes'),
(149, 'github_updater_api_key', 'f6fdbb192d5480847aea2a15dd12edc9', 'no'),
(150, 'github_updater', 'a:1:{s:10:"db_version";i:7400;}', 'no'),
(152, 'ghu-ad78493953948f77a685116f7e9e605f', 'a:7:{s:7:"timeout";i:1534487975;s:18:"github-updater.php";a:12:{s:11:"Requires WP";s:3:"4.6";s:12:"Requires PHP";s:3:"5.6";s:17:"GitHub Plugin URI";s:41:"https://github.com/afragen/github-updater";s:16:"GitHub Languages";s:54:"https://github.com/afragen/github-updater-translations";s:4:"Name";s:14:"GitHub Updater";s:9:"PluginURI";s:41:"https://github.com/afragen/github-updater";s:7:"Version";s:5:"8.2.1";s:11:"Description";s:188:"A plugin to automatically update GitHub, Bitbucket, GitLab, or Gitea hosted plugins, themes, and language packs. It also allows for remote installation of plugins or themes into WordPress.";s:6:"Author";s:11:"Andy Fragen";s:10:"TextDomain";s:14:"github-updater";s:10:"DomainPath";s:10:"/languages";s:7:"Network";s:4:"true";}s:4:"repo";s:14:"github-updater";s:7:"dot_org";s:14:"not in dot org";s:4:"meta";a:5:{s:7:"private";b:0;s:12:"last_updated";s:20:"2018-08-13T15:24:17Z";s:8:"watchers";i:2013;s:5:"forks";i:313;s:11:"open_issues";i:9;}s:9:"languages";O:8:"stdClass":17:{s:2:"ar";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:2:"ar";s:7:"updated";s:21:"2017-04-27 12:52-0700";s:7:"package";s:106:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-ar.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"bg_BG";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"bg_BG";s:7:"updated";s:21:"2017-04-27 13:32-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-bg_BG.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"de_AT";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"de_AT";s:7:"updated";s:21:"2017-04-27 12:44-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-de_AT.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"de_CH";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"de_CH";s:7:"updated";s:21:"2017-04-27 12:55-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-de_CH.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"de_DE";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"de_DE";s:7:"updated";s:21:"2017-04-27 13:33-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-de_DE.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"en_CA";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"en_CA";s:7:"updated";s:21:"2017-08-15 16:26-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-en_CA.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"es_ES";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"es_ES";s:7:"updated";s:21:"2017-04-27 13:39-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-es_ES.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"fr_FR";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"fr_FR";s:7:"updated";s:21:"2017-07-25 22:20+0200";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-fr_FR.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:2:"it";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:2:"it";s:7:"updated";s:21:"2017-04-27 13:45-0700";s:7:"package";s:106:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-it.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:2:"ja";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:2:"ja";s:7:"updated";s:21:"2017-04-27 13:05-0700";s:7:"package";s:106:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-ja.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"pt_BR";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"pt_BR";s:7:"updated";s:21:"2018-04-04 01:30-0300";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-pt_BR.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"pt_PT";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"pt_PT";s:7:"updated";s:21:"2018-03-25 20:16+0100";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-pt_PT.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"ro_RO";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"ro_RO";s:7:"updated";s:21:"2017-04-27 12:39-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-ro_RO.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"ru_RU";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"ru_RU";s:7:"updated";s:21:"2017-04-27 12:33-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-ru_RU.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"sv_SE";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"sv_SE";s:7:"updated";s:21:"2017-05-09 09:30+0200";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-sv_SE.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:2:"uk";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:2:"uk";s:7:"updated";s:21:"2017-04-27 12:16-0700";s:7:"package";s:106:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-uk.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}s:5:"zh_TW";O:8:"stdClass":7:{s:4:"slug";s:14:"github-updater";s:8:"language";s:5:"zh_TW";s:7:"updated";s:21:"2018-05-19 09:06-0700";s:7:"package";s:109:"https://github.com/afragen/github-updater-translations/blob/master/packages/github-updater-zh_TW.zip?raw=true";s:10:"autoupdate";s:1:"1";s:4:"type";s:6:"plugin";s:7:"version";s:5:"8.2.1";}}s:4:"tags";a:30:{i:0;s:5:"8.2.1";i:1;s:5:"8.2.0";i:2;s:5:"8.1.2";i:3;s:5:"8.1.1";i:4;s:5:"8.1.0";i:5;s:5:"8.0.0";i:6;s:5:"7.6.2";i:7;s:5:"7.6.1";i:8;s:5:"7.6.0";i:9;s:5:"7.5.0";i:10;s:5:"7.4.4";i:11;s:5:"7.4.3";i:12;s:5:"7.4.2";i:13;s:5:"7.4.1";i:14;s:5:"7.4.0";i:15;s:5:"7.3.1";i:16;s:5:"7.3.0";i:17;s:5:"7.2.0";i:18;s:5:"7.1.0";i:19;s:5:"7.0.0";i:20;s:5:"6.3.5";i:21;s:5:"6.3.4";i:22;s:5:"6.3.3";i:23;s:5:"6.3.2";i:24;s:5:"6.3.1";i:25;s:5:"6.3.0";i:26;s:5:"6.2.2";i:27;s:5:"6.2.1";i:28;s:5:"6.2.0";i:29;s:5:"6.1.1";}}', 'no'),
(192, 'sportspress_sport', 'badminton', 'yes'),
(193, 'sportspress_styles', 'yes', 'yes'),
(194, 'sportspress_table_text_align', 'default', 'yes'),
(195, 'sportspress_enable_live_countdowns', 'yes', 'yes'),
(196, 'sportspress_rich_editing', 'yes', 'yes'),
(197, 'sportspress_enable_responsive_tables', 'no', 'yes'),
(198, 'sportspress_enable_scrollable_tables', 'yes', 'yes'),
(199, 'sportspress_enable_sortable_tables', 'yes', 'yes'),
(200, 'sportspress_widget_unique', 'no', 'yes'),
(201, 'sportspress_event_page_template', 'default', 'yes'),
(202, 'sportspress_link_events', 'yes', 'yes'),
(203, 'sportspress_event_show_date', 'yes', 'yes'),
(204, 'sportspress_event_show_time', 'yes', 'yes'),
(205, 'sportspress_event_show_day', 'no', 'yes'),
(206, 'sportspress_event_show_full_time', 'no', 'yes'),
(207, 'sportspress_mode', 'player', 'yes'),
(208, 'sportspress_event_teams', '2', 'yes'),
(209, 'sportspress_event_filter_teams_by_league', 'no', 'yes'),
(210, 'sportspress_event_filter_teams_by_season', 'no', 'yes'),
(211, 'sportspress_event_minutes', '90', 'yes'),
(212, 'sportspress_event_comment_status', 'no', 'yes'),
(213, 'sportspress_link_venues', 'no', 'yes'),
(214, 'sportspress_event_show_maps', 'yes', 'yes'),
(215, 'sportspress_map_type', 'ROADMAP', 'yes'),
(216, 'sportspress_map_zoom', '15', 'yes'),
(217, 'sportspress_event_reverse_teams', 'no', 'yes'),
(218, 'sportspress_event_logos_format', 'inline', 'yes'),
(219, 'sportspress_event_logos_show_team_names', 'no', 'yes'),
(220, 'sportspress_event_logos_show_time', 'no', 'yes'),
(221, 'sportspress_event_logos_show_results', 'yes', 'yes'),
(222, 'sportspress_event_player_sort', 'jersey', 'yes'),
(223, 'sportspress_event_result_columns', 'auto', 'yes'),
(224, 'sportspress_event_show_outcome', 'yes', 'yes'),
(225, 'sportspress_event_show_staff', 'yes', 'yes'),
(226, 'sportspress_event_show_players', 'yes', 'yes'),
(227, 'sportspress_event_show_total', 'yes', 'yes'),
(228, 'sportspress_event_performance_columns', 'auto', 'yes'),
(229, 'sportspress_event_performance_mode', 'values', 'yes'),
(230, 'sportspress_event_performance_stars_type', '0', 'yes'),
(231, 'sportspress_event_hide_child_positions', 'no', 'yes'),
(232, 'sportspress_event_show_player_numbers', 'no', 'yes'),
(233, 'sportspress_event_show_position', 'no', 'yes'),
(234, 'sportspress_event_performance_show_minutes', 'yes', 'yes'),
(235, 'sportspress_event_performance_sections', '0', 'yes'),
(236, 'sportspress_event_total_performance', 'primary', 'yes'),
(237, 'sportspress_calendar_page_template', 'default', 'yes'),
(238, 'sportspress_event_list_show_title', 'yes', 'yes'),
(239, 'sportspress_event_list_show_logos', 'no', 'yes'),
(240, 'sportspress_event_list_title_format', 'title', 'yes'),
(241, 'sportspress_event_list_time_format', 'combined', 'yes'),
(242, 'sportspress_event_list_paginated', 'yes', 'yes'),
(243, 'sportspress_event_list_rows', '10', 'yes'),
(244, 'sportspress_event_blocks_show_title', 'no', 'yes'),
(245, 'sportspress_event_blocks_show_logos', 'yes', 'yes'),
(246, 'sportspress_event_blocks_show_league', 'no', 'yes'),
(247, 'sportspress_event_blocks_show_season', 'no', 'yes'),
(248, 'sportspress_event_blocks_show_venue', 'no', 'yes'),
(249, 'sportspress_event_blocks_paginated', 'yes', 'yes'),
(250, 'sportspress_event_blocks_rows', '5', 'yes'),
(251, 'sportspress_countdown_show_logos', 'no', 'yes'),
(252, 'sportspress_countdown_show_thumbnail', 'no', 'yes'),
(253, 'sportspress_team_page_template', 'default', 'yes'),
(254, 'sportspress_team_link_staff', 'no', 'yes'),
(255, 'sportspress_link_teams', 'no', 'yes'),
(256, 'sportspress_team_link_venues', 'no', 'yes'),
(257, 'sportspress_team_site_target_blank', 'no', 'yes'),
(258, 'sportspress_team_events_format', 'title', 'yes'),
(259, 'sportspress_table_page_template', 'default', 'yes'),
(260, 'sportspress_table_show_title', 'yes', 'yes'),
(261, 'sportspress_table_show_logos', 'yes', 'yes'),
(262, 'sportspress_table_paginated', 'yes', 'yes'),
(263, 'sportspress_table_rows', '10', 'yes'),
(264, 'sportspress_form_limit', '5', 'yes'),
(265, 'sportspress_table_increment', 'no', 'yes'),
(266, 'sportspress_table_tiebreaker', 'none', 'yes'),
(267, 'sportspress_player_page_template', 'default', 'yes'),
(268, 'sportspress_link_players', 'yes', 'yes'),
(269, 'sportspress_player_show_number', 'no', 'yes'),
(270, 'sportspress_player_show_name', 'no', 'yes'),
(271, 'sportspress_player_show_nationality', 'yes', 'yes'),
(272, 'sportspress_player_show_positions', 'yes', 'yes'),
(273, 'sportspress_player_show_current_teams', 'yes', 'yes'),
(274, 'sportspress_player_show_past_teams', 'yes', 'yes'),
(275, 'sportspress_player_show_leagues', 'no', 'yes'),
(276, 'sportspress_player_show_seasons', 'no', 'yes'),
(277, 'sportspress_player_show_flags', 'yes', 'yes'),
(278, 'sportspress_player_show_birthday', 'no', 'yes'),
(279, 'sportspress_player_show_age', 'no', 'yes'),
(280, 'sportspress_player_events_format', 'title', 'yes'),
(281, 'sportspress_registration_name_inputs', 'no', 'yes'),
(282, 'sportspress_registration_team_input', 'no', 'yes'),
(283, 'sportspress_registration_team_select', 'no', 'yes'),
(284, 'sportspress_registration_add_player', 'no', 'yes'),
(285, 'sportspress_player_columns', 'auto', 'yes'),
(286, 'sportspress_player_performance_sections', '-1', 'yes'),
(287, 'sportspress_player_show_total', 'no', 'yes'),
(288, 'sportspress_player_show_career_total', 'no', 'yes'),
(289, 'sportspress_list_page_template', 'default', 'yes'),
(290, 'sportspress_list_show_title', 'yes', 'yes'),
(291, 'sportspress_list_show_photos', 'no', 'yes'),
(292, 'sportspress_list_show_flags', 'no', 'yes'),
(293, 'sportspress_list_paginated', 'yes', 'yes'),
(294, 'sportspress_list_rows', '10', 'yes'),
(295, 'sportspress_staff_page_template', 'default', 'yes'),
(296, 'sportspress_link_staff', 'yes', 'yes'),
(297, 'sportspress_staff_show_nationality', 'yes', 'yes'),
(298, 'sportspress_staff_show_current_teams', 'yes', 'yes'),
(299, 'sportspress_staff_show_past_teams', 'yes', 'yes'),
(300, 'sportspress_staff_show_flags', 'yes', 'yes'),
(301, 'sportspress_staff_show_birthday', 'no', 'yes'),
(302, 'sportspress_staff_show_age', 'no', 'yes'),
(303, 'sportspress_text[Age]', '', 'yes'),
(304, 'sportspress_text[Article]', '', 'yes'),
(305, 'sportspress_text[Away]', '', 'yes'),
(306, 'sportspress_text[Birthday]', '', 'yes'),
(307, 'sportspress_text[Box Score]', '', 'yes'),
(308, 'sportspress_text[Canceled]', '', 'yes'),
(309, 'sportspress_text[Career Total]', '', 'yes'),
(310, 'sportspress_text[Current Team]', '', 'yes'),
(311, 'sportspress_text[Date]', '', 'yes'),
(312, 'sportspress_text[Defense]', '', 'yes'),
(313, 'sportspress_text[Details]', '', 'yes'),
(314, 'sportspress_text[Event]', '', 'yes'),
(315, 'sportspress_text[Events]', '', 'yes'),
(316, 'sportspress_text[Excerpt]', '', 'yes'),
(317, 'sportspress_text[Fixtures]', '', 'yes'),
(318, 'sportspress_text[Full Time]', '', 'yes'),
(319, 'sportspress_text[Home]', '', 'yes'),
(320, 'sportspress_text[League]', '', 'yes'),
(321, 'sportspress_text[League Table]', '', 'yes'),
(322, 'sportspress_text[Match Day]', '', 'yes'),
(323, 'sportspress_text[Nationality]', '', 'yes'),
(324, 'sportspress_text[Offense]', '', 'yes'),
(325, 'sportspress_text[Outcome]', '', 'yes'),
(326, 'sportspress_text[Past Teams]', '', 'yes'),
(327, 'sportspress_text[Photo]', '', 'yes'),
(328, 'sportspress_text[Player]', '', 'yes'),
(329, 'sportspress_text[Player of the Match]', '', 'yes'),
(330, 'sportspress_text[Players]', '', 'yes'),
(331, 'sportspress_text[Pos]', '', 'yes'),
(332, 'sportspress_text[Position]', '', 'yes'),
(333, 'sportspress_text[Postponed]', '', 'yes'),
(334, 'sportspress_text[Preview]', '', 'yes'),
(335, 'sportspress_text[Profile]', '', 'yes'),
(336, 'sportspress_text[Rank]', '', 'yes'),
(337, 'sportspress_text[Recap]', '', 'yes'),
(338, 'sportspress_text[Results]', '', 'yes'),
(339, 'sportspress_text[Season]', '', 'yes'),
(340, 'sportspress_text[Staff]', '', 'yes'),
(341, 'sportspress_text[Statistics]', '', 'yes'),
(342, 'sportspress_text[TBD]', '', 'yes'),
(343, 'sportspress_text[Team]', '', 'yes'),
(344, 'sportspress_text[Teams]', '', 'yes'),
(345, 'sportspress_text[Time]', '', 'yes'),
(346, 'sportspress_text[Time/Results]', '', 'yes'),
(347, 'sportspress_text[Total]', '', 'yes'),
(348, 'sportspress_text[Venue]', '', 'yes'),
(349, 'sportspress_text[Video]', '', 'yes'),
(350, 'sportspress_text[View all events]', '', 'yes'),
(351, 'sportspress_text[View all players]', '', 'yes'),
(352, 'sportspress_text[View full table]', '', 'yes'),
(353, 'sportspress_text[Visit Site]', '', 'yes'),
(354, 'sportspress_frontend_css_primary', '#2b353e', 'yes'),
(355, 'sportspress_frontend_css_background', '#f4f4f4', 'yes'),
(356, 'sportspress_frontend_css_text', '#222222', 'yes'),
(357, 'sportspress_frontend_css_heading', '#ffffff', 'yes'),
(358, 'sportspress_frontend_css_link', '#00a69c', 'yes'),
(359, 'sportspress_version', '2.6.7', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(362, 'ghu-8129ea67cc056d0df875d80b9f08d767', 'a:7:{s:7:"timeout";i:1534487967;s:15:"sportspress.php";a:9:{s:17:"GitHub Plugin URI";s:46:"https://github.com/StephenDubliner/SportsPress";s:4:"Name";s:11:"SportsPress";s:9:"PluginURI";s:32:"http://themeboy.com/sportspress/";s:7:"Version";s:5:"2.6.7";s:11:"Description";s:81:"Manage your club and its players, staff, events, league tables, and player lists.";s:6:"Author";s:8:"ThemeBoy";s:9:"AuthorURI";s:19:"http://themeboy.com";s:10:"TextDomain";s:11:"sportspress";s:10:"DomainPath";s:11:"/languages/";}s:4:"repo";s:11:"SportsPress";s:7:"dot_org";s:10:"in dot org";s:4:"meta";a:5:{s:7:"private";b:0;s:12:"last_updated";s:20:"2018-08-06T16:38:48Z";s:8:"watchers";i:0;s:5:"forks";i:0;s:11:"open_issues";i:0;}s:6:"readme";a:16:{s:4:"name";s:46:"SportsPress - Sports Club &amp; League Manager";s:4:"tags";a:5:{i:0;s:9:"calendars";i:1;s:4:"club";i:2;s:15:"club management";i:3;s:7:"esports";i:4;s:6:"events";}s:8:"requires";s:3:"3.8";s:6:"tested";s:3:"4.9";s:12:"requires_php";s:0:"";s:12:"contributors";a:5:{s:8:"ThemeBoy";s:33:"//profiles.wordpress.org/ThemeBoy";s:11:"brianmiyaji";s:36:"//profiles.wordpress.org/brianmiyaji";s:8:"aylaview";s:33:"//profiles.wordpress.org/aylaview";s:8:"savvasha";s:33:"//profiles.wordpress.org/savvasha";s:12:"nabil_kadimi";s:37:"//profiles.wordpress.org/nabil_kadimi";}s:10:"stable_tag";s:5:"2.6.7";s:11:"donate_link";s:21:"http://tboy.co/donate";s:17:"short_description";s:142:"SportsPress is an extendable all-in-one sports data plugin that helps sports clubs set up and manage a league or club site quickly and easily.";s:7:"license";s:5:"GPLv3";s:11:"license_uri";s:40:"http://www.gnu.org/licenses/gpl-3.0.html";s:8:"sections";a:4:{s:11:"description";s:6471:"<p>= Create a Professional Sports Website =\nTransform your WordPress blog into a fully configurable team, club, or league website. Features a suite of sports tools including fixtures, results, automated standings, players rankings, and individual profiles for clubs, players, and staff.</p>\n<p>[youtube <a href="http://www.youtube.com/watch?v=KQyga_C5a6M">http://www.youtube.com/watch?v=KQyga_C5a6M</a>]</p>\n<p>= Industry Reviews =</p>\n<blockquote>\n<p>&quot;<em>There are number of professional sports club who likes to maintain their information and statistics online, SportsPress plugin makes this process really easy, cost effective and quick.</em>&quot; — <a href="http://www.indexwp.com/sportspress-plugin-review/">IndexWP</a></p>\n<p>&quot;<em>Script of the Day: While the WordPress repository holds various team and sports-related plugins, few of them come close to what you can achieve with SportsPress.</em>&quot; — <a href="http://news.softpedia.com/news/Script-of-the-Day-SportsPress-409247.shtml">Softpedia</a></p>\n<p>&quot;<em>SportsPress is probably one of the most complete WordPress sports plugins out there. If you have a sports website and you’re looking to showcase your team, or even your entire league, then give this plugin a try.</em>&quot; — <a href="https://www.hostgator.com/blog/best-wordpress-plugins-themes-sports-websites/">HostGator</a></p>\n</blockquote>\n<p>= Features =</p>\n<ul>\n<li>Equation Builder</li>\n<li>Club Profiles with Player List</li>\n<li>Automated League Standings with Club Logos</li>\n<li>Events (Fixtures &amp; Results) with Player Performance</li>\n<li>Events Calendar</li>\n<li>Player Profiles &amp; Statistics</li>\n<li>Player Lists</li>\n<li>Staff Profiles</li>\n<li>Select Current Club and Previous Clubs</li>\n<li>Season Archives</li>\n<li>Venue Information &amp; Maps</li>\n<li>Statistics &amp; League Table Columns Configuration</li>\n<li>Sport Presets</li>\n<li>Switch Between Club vs Club and Player vs Player Mode.</li>\n<li>Import Events, Clubs, Players, and Staff from CSV Files</li>\n<li>Easy Shortcodes Menu in Editor</li>\n<li>Events Integrate with iCal</li>\n<li>Certified compatibility with <a href="http://wpml.org/plugin/sportspress/">WPML</a></li>\n</ul>\n<p>More details about each feature are available on the <a href="http://tboy.co/pro">SportsPress Website</a>.</p>\n<p>= Free Extensions =</p>\n<ul>\n<li><a href="https://wordpress.org/plugins/sportspress-for-baseball/">SportsPress for Baseball</a></li>\n<li><a href="https://wordpress.org/plugins/sportspress-for-basketball/">SportsPress for Basketball</a></li>\n<li><a href="https://wordpress.org/plugins/sportspress-for-cricket/">SportsPress for Cricket</a></li>\n<li><a href="https://wordpress.org/plugins/sportspress-for-soccer/">SportsPress for Football (Soccer)</a></li>\n<li><a href="https://wordpress.org/plugins/sportspress-for-golf/">SportsPress for Golf</a></li>\n</ul>\n<p>= SportsPress Pro =</p>\n<p>Looking for more advanced sports functionality? Upgrade to <a href="http://tboy.co/pro">SportsPress Pro</a> to get access to more advanced features for your team, club, or league website.</p>\n<p>= Available Languages =</p>\n<ul>\n<li>English – English ( en_US )</li>\n<li>Arabic – العربية ( ar )</li>\n<li>Armenian – Հայերեն ( hy )</li>\n<li>Bulgarian – Български ( bg_BG )</li>\n<li>Chinese (China) – 中文 ( zh_CN )</li>\n<li>Croatian – Hrvatski ( hr )</li>\n<li>Czech – Čeština ( cs_CZ )</li>\n<li>Danish – Dansk ( da_DK )</li>\n<li>Dutch – Nederlands ( nl_NL )</li>\n<li>French – Français ( fr_FR )</li>\n<li>Finnish – Suomi ( fi )</li>\n<li>German – Deutsch ( de_DE )</li>\n<li>Greek – Ελληνικά ( el_GR )</li>\n<li>Hungarian – Magyar ( hu_HU )</li>\n<li>Italian – Italiano ( it_IT )</li>\n<li>Japanese – 日本語 ( ja )</li>\n<li>Korean – 한국어 ( ko_KR )</li>\n<li>Macedonian – македонски ( mk_MK )</li>\n<li>Norwegian Bokmål – Norsk bokmål ( nb_NO )</li>\n<li>Persian – فارسی ( fa_IR )</li>\n<li>Polish – Polski ( pl_PL )</li>\n<li>Portuguese (Brazil) – Português do Brasil ( pt_BR )</li>\n<li>Portuguese (Portugal) – Português ( pt_PT )</li>\n<li>Romanian – Română ( ro_RO )</li>\n<li>Russian – Русский ( ru_RU )</li>\n<li>Slovak – Slovenčina ( sk_SK )</li>\n<li>Slovenian – Slovenija ( sl_SI )</li>\n<li>Spanish – Español ( es_ES )</li>\n<li>Swedish – Svenska ( sv_SE )</li>\n<li>Tagalog - Tagalog ( tl )</li>\n<li>Tamil – தமிழ் ( ta_IN )</li>\n<li>Thai – ไทย ( th )</li>\n<li>Turkish – Türkçe ( tr_TR )</li>\n</ul>\n<p>= Sport Presets Included =</p>\n<ul>\n<li>American Football</li>\n<li>Association Football (Soccer)</li>\n<li>Australian Rules Football</li>\n<li>Baseball</li>\n<li>Basketball</li>\n<li>Cricket</li>\n<li>Darts</li>\n<li>Golf</li>\n<li>Handball</li>\n<li>Ice Hockey</li>\n<li>Lacrosse</li>\n<li>Netball</li>\n<li>Rugby League</li>\n<li>Rugby Union</li>\n<li>Snooker</li>\n<li>Softball</li>\n<li>Squash</li>\n<li>Table Tennis</li>\n<li>Tennis</li>\n<li>Volleyball</li>\n<li>Water Polo</li>\n</ul>\n<p>= Esports Presets =</p>\n<ul>\n<li>Counter-Strike: Global Offensive</li>\n<li>Dota 2</li>\n<li>League of Legends</li>\n</ul>\n<p>= SportsPress Themes for Clubs =</p>\n<ul>\n<li><a href="http://tboy.co/courtside">Courtside</a></li>\n<li><a href="http://tboy.co/emblem">Emblem</a></li>\n<li><a href="http://tboy.co/fc">Football Club</a></li>\n<li><a href="http://tboy.co/marquee">Marquee</a></li>\n<li><a href="http://tboy.co/premier">Premier</a></li>\n</ul>\n<p>= Get Involved =</p>\n<p>Feel free to share your suggestions with us so we can continue to develop awesome sports club features for you guys!</p>\n<p>Developers can contribute via the <a href="https://github.com/ThemeBoy/SportsPress/blob/master/CONTRIBUTING.md">SportsPress GitHub Repository</a>.</p>\n<p>Translators can contribute to SportsPress translations through <a href="https://translate.wordpress.org/projects/wp-plugins/sportspress">GlotPress</a>.</p>\n<p>= Stay Current =\nTo keep up with the latest updates and new features, be sure to do the following:</p>\n<ul>\n<li>Visit the <a href="http://tboy.co/pro">SportsPress Pro homepage</a>.</li>\n<li>Subscribe to our <a href="http://tboy.co/youtube">YouTube channel</a>.</li>\n<li>Follow ThemeBoy on <a href="http://tboy.co/facebook">Facebook</a> &amp; <a href="http://tboy.co/twitter">Twitter</a>.</li>\n</ul>\n<p>= Please Rate, Vote, and Enjoy! =\nYour feedback is much appreciated and makes all the difference in improving SportsPress.</p>";s:12:"installation";s:1900:"<p>= Minimum Requirements =</p>\n<ul>\n<li>WordPress 3.8 or greater</li>\n<li>PHP version 5.2.4 or greater</li>\n<li>MySQL version 5.0 or greater</li>\n</ul>\n<p>[youtube <a href="http://www.youtube.com/watch?v=nE8-RlbotmU">http://www.youtube.com/watch?v=nE8-RlbotmU</a>]</p>\n<p>= Automatic Installation =</p>\n<p>Automatic installation is the easiest option as WordPress handles the file transfers itself and you don''t even need to leave your web browser. To do an automatic install of SportsPress, log in to your WordPress admin panel, navigate to the Plugins menu and click Add New.</p>\n<p>In the search field type &quot;SportsPress&quot; and click Search Plugins. Once you''ve found our sports plugin you can view details about it such as the point release, rating and description. Most importantly of course, you can install it by simply clicking Install Now. After clicking that link you will be asked if you''re sure you want to install the plugin. Click yes and WordPress will automatically complete the installation.</p>\n<p>= Manual Installation =</p>\n<p>The manual installation method involves downloading our sports plugin and uploading it to your webserver via your favorite FTP application.</p>\n<ol>\n<li>Download the plugin file to your computer and unzip it</li>\n<li>Using an FTP program, or your hosting control panel, upload the unzipped plugin folder to your WordPress installation''s wp-content/plugins/ directory.</li>\n<li>Activate the plugin from the Plugins menu within the WordPress admin.</li>\n</ol>\n<p>= Upgrading =</p>\n<p>Automatic updates should work like a charm; as always though, ensure you backup your site just in case.</p>\n<p>If on the off-chance you do encounter issues with the event/team/player/staff pages after an update you simply need to flush the permalinks by going to WordPress &gt; Settings &gt; Permalinks and hitting ''save''. That should return things to normal.</p>";s:9:"changelog";s:23389:"<p>= 2.6.7 =</p>\n<ul>\n<li>Fix - Update Google Maps API endpoints.</li>\n</ul>\n<p>= 2.6.6 =</p>\n<ul>\n<li>Fix - Apply reverse teams to frontend templates only.</li>\n</ul>\n<p>= 2.6.5 =</p>\n<ul>\n<li>Tweak - Increase coverage of reverse teams option.</li>\n<li>Tweak - Improve sorting of leagues, positions, and seasons.</li>\n<li>Localization - Additional legacy country code for Greece.</li>\n<li>Fix - Broken post author select on certain pages.</li>\n<li>Fix - Google Calendar link protocol.</li>\n</ul>\n<p>= 2.6.4 =</p>\n<ul>\n<li>Fix - Undefined variable notice in player list.</li>\n</ul>\n<p>= 2.6.3 =</p>\n<ul>\n<li>Fix - Assign past teams during player import.</li>\n<li>Fix - Next team column displaying events furthest away.</li>\n<li>Fix - Add fallback array_replace function for PHP versions earlier than 5.3.</li>\n<li>Fix - Add fallback for web hosts that don''t support multibyte PHP functions, causing blank player profiles.</li>\n</ul>\n<p>= 2.6.2 =</p>\n<ul>\n<li>Fix - Newly added players from past and current team appearing in player lists.</li>\n<li>Fix - Player lists appearing empty without league, season, and team selected.</li>\n</ul>\n<p>= 2.6.1 =</p>\n<ul>\n<li>Fix - Player lists with a team selected showing players from other teams.</li>\n<li>Fix - REST API endpoints not resolving for players.</li>\n<li>Fix - Empty system status page.</li>\n</ul>\n<p>= 2.6 =</p>\n<ul>\n<li>Feature - Add custom details to events using event specs.</li>\n<li>Feature - Conditional equations for variables.</li>\n<li>Feature - Display the next opponent in league tables.</li>\n<li>Feature - Short name option added to teams.</li>\n<li>Feature - Automatic event titles using short name when available.</li>\n<li>Feature - Display featured image in countdown widget.</li>\n<li>Tweak - Stronger connections between leagues, seasons, and teams for automatic player lists.</li>\n<li>Tweak - Relative date option added to editor shortcodes.</li>\n<li>Tweak - Display only current team in player list.</li>\n<li>Tweak - Filter players dropdown by current team only.</li>\n<li>Tweak - Allow 0 as a squad number when importing players.</li>\n<li>Tweak - Prevent filtering through empty results.</li>\n<li>Fix - Interpreting non-integer substitution times.</li>\n<li>Fix - Warning when sorting terms without order.</li>\n<li>Localization - Add WPML support to staff header.</li>\n<li>Localization - Fix RTL not being applied in league tables.</li>\n</ul>\n<p>= 2.5.10 =</p>\n<ul>\n<li>Fix - Date ranges not being applied to calendars.</li>\n</ul>\n<p>= 2.5.9 =</p>\n<ul>\n<li>Fix - Unpublished posts being displayed in some themes.</li>\n</ul>\n<p>= 2.5.8 =</p>\n<ul>\n<li>Fix - Display scheduled events using default permalinks via archives and third-party widgets.</li>\n</ul>\n<p>= 2.5.7 =</p>\n<ul>\n<li>Fix - Blank general settings screen on WordPress versions prior to 4.9.</li>\n<li>Fix - Revert responsive table behavior to prevent display issues on mobile.</li>\n</ul>\n<p>= 2.5.6 =</p>\n<ul>\n<li>Tweak - Adjust player-related hooks.</li>\n<li>Fix - Turn off responsive tables by default.</li>\n</ul>\n<p>= 2.5.5 =</p>\n<ul>\n<li>Feature - Main league and current season settings.</li>\n<li>Feature - New shortcode including full staff profile.</li>\n<li>Feature - Add code highlighting to custom CSS field.</li>\n<li>Feature - Add responsive layout option to tables.</li>\n<li>Feature - Add filters to REST API players endpoint.</li>\n<li>Feature - Option to merge duplicate teams, players, and staff.</li>\n<li>Feature - Option to display specific event in event blocks.</li>\n<li>Feature - Option to sort player checklist by name and squad number in events.</li>\n<li>Feature - Option to filter player lists by team.</li>\n<li>Feature - Option to link staff members.</li>\n<li>Feature - Filter countdown by calendar.</li>\n<li>Fix - Calculate column totals in box score.</li>\n<li>Fix - Mismatched encoding of included library.</li>\n<li>Localization - Fix translation function missing around string.</li>\n</ul>\n<p>= 2.5.4 =</p>\n<ul>\n<li>Fix - Error when editing league table using older versions of WordPress.</li>\n</ul>\n<p>= 2.5.3 =</p>\n<ul>\n<li>Fix - Calendar templates not loading when timezone setting is relative to UTC.</li>\n</ul>\n<p>= 2.5.2 =</p>\n<ul>\n<li>Feature - Add match day to REST API.</li>\n<li>Tweak - Add order to positions during preset installation.</li>\n<li>Tweak - Display links to add new duties and officials if empty.</li>\n<li>Tweak - Add linebreaks to substitute dropdowns.</li>\n<li>Fix - Use default full time minutes in REST API.</li>\n<li>Fix - Uploading custom images as performance icons.</li>\n<li>Fix - Displaying timed performance with custom images.</li>\n</ul>\n<p>= 2.5.1 =</p>\n<ul>\n<li>Feature - Officials importer.</li>\n<li>Feature - Officials added to dashboard glance items.</li>\n<li>Feature - Order setting added to staff jobs for custom sorting.</li>\n<li>Tweak - Display only the highest order job in staff profiles.</li>\n<li>Tweak - Require box score importer to be accessed from within an event.</li>\n<li>Tweak - Add hook to declare importable post types.</li>\n<li>Fix - Officials meta box in events when module is inactive.</li>\n<li>Fix - Issues when timezone is not set.</li>\n</ul>\n<p>= 2.5 =</p>\n<ul>\n<li>Feature - Player of the match and star numbers added to box scores.</li>\n<li>Feature - Officials module for displaying referee appointments in matches.</li>\n<li>Feature - New player performance icons to choose from.</li>\n<li>Feature - Schema microdata added to event calendars, lists, and blocks.</li>\n<li>Feature - Box score importer for updating existing events.</li>\n<li>Feature - Order setting added to taxonomies for custom sorting.</li>\n<li>Feature - New relative date range options in event calendars.</li>\n<li>Feature - Date range options added to league tables and player lists.</li>\n<li>Feature - Option to hide players with zero statistics in player list.</li>\n<li>Tweak - Allow staff members to have multiple jobs.</li>\n<li>Tweak - Indicator dots added to calendars with events in frontend stylesheet.</li>\n<li>Tweak - Box score columns are now selected by default when adding new events.</li>\n<li>Tweak - Events made sortable by match day in admin.</li>\n<li>Tweak - Competitions renamed to leagues.</li>\n<li>Fix - Quick edit teams not showing when filtering players by team.</li>\n<li>Fix - Calendar feeds not updating without E-tag.</li>\n<li>Fix - Admin table cells wrapping.</li>\n<li>Fix - Timezone issues in calendars.</li>\n</ul>\n<p>= 2.4.3 =</p>\n<ul>\n<li>Fix - Substitute Typo.</li>\n<li>Fix - WordPay image trailing slash.</li>\n</ul>\n<p>= 2.4.2 =</p>\n<ul>\n<li>Feature - Add visibility option to player metrics.</li>\n<li>Fix - Remove protocol from default Gravatar images to prevent mix content warnings.</li>\n</ul>\n<p>= 2.4.1 =</p>\n<ul>\n<li>Fix - Static function displaying notice in header.</li>\n</ul>\n<p>= 2.4 =</p>\n<ul>\n<li>Feature - Integration with WordPay to allow paid team and player registrations.</li>\n<li>Feature - New team gallery shortcode and widget for displaying a gallery of team logos.</li>\n<li>Feature - Added support for player career totals based on calculated averages.</li>\n<li>Tweak - Allow competitions to be selected for friendly matches.</li>\n<li>Tweak - Added columns selector to gallery shortcodes.</li>\n<li>Fix - Full time defaulting to 90 minutes.</li>\n<li>Fix - Statistic format not reflected in meta box.</li>\n<li>Fix - Shortcode button hook timing conflicts.</li>\n<li>Preset - Swap par and score in golf preset.</li>\n<li>Preset - Update all presets to reflect new career total type.</li>\n</ul>\n<p>= 2.3.2 =</p>\n<ul>\n<li>Fix - Team in player statistics total row displaying as zero.</li>\n<li>Fix - Notice when no sendoffs are available during minutes played calculation.</li>\n</ul>\n<p>= 2.3.1 =</p>\n<ul>\n<li>Tweak - Update version numbers of recommended sport-specific extensions.</li>\n<li>Fix - Manually entered statistics not reflected in player profile totals.</li>\n<li>Fix - Template hooks not callable for third-party integration.</li>\n<li>Fix - Error when editing league tables in PHP versions earlier than 5.5.</li>\n</ul>\n<p>= 2.3 =</p>\n<ul>\n<li>Feature - New setup wizard for first-time installs.</li>\n<li>Feature - Option to automatically create player profiles during user registration.</li>\n<li>Feature - Choose team or individual mode for each event.</li>\n<li>Feature - Send Off setting for player statistics to suspend minute count for that player.</li>\n<li>Tweak - Remove horizontal scrolling in dashboard to fix hidden dropdowns.</li>\n<li>Tweak - Revert text color overrides for dark color schemes in frontend styles.</li>\n<li>Fix - Borrowed players not automatically loading on event edit.</li>\n<li>Fix - Played minutes calculation and player profile statistics.</li>\n<li>Preset - Update all presets to support new mode switching feature.</li>\n</ul>\n<p>= 2.2.10 =</p>\n<ul>\n<li>Tweak - Update modules page.</li>\n<li>Fix - League table discrepancy due to change in number of teams setting.</li>\n<li>Fix - JavaScript error caused by box score displaying icons without players.</li>\n</ul>\n<p>= 2.2.9 =</p>\n<ul>\n<li>Fix - Warning message above player list template.</li>\n</ul>\n<p>= 2.2.8 =</p>\n<ul>\n<li>Fix - Hidden box score header in values mode.</li>\n<li>Fix - Welcome page displaying after upgrade if preset was saved from settings.</li>\n<li>Fix - Decimal places being dropped from player list statistics.</li>\n</ul>\n<p>= 2.2.7 =</p>\n<ul>\n<li>Tweak - Adjust frontend styles to allow some overrides.</li>\n<li>Tweak - Update modules page with new module options.</li>\n<li>Fix - Javascript error in icon mode box scores.</li>\n<li>Fix - Player list default sorting issue.</li>\n<li>Fix - Empty team checkboxes in player quick edit.</li>\n</ul>\n<p>= 2.2.6 =</p>\n<ul>\n<li>Tweak - Hide box score table header row in icon mode.</li>\n<li>Tweak - Adjust frontend stylesheet.</li>\n<li>Fix - Empty league tables when no columns are selected.</li>\n<li>Fix - Empty player lists when no columns are selected.</li>\n<li>Fix - Link events setting not applied to box score time.</li>\n<li>Fix - Player list sorting error with non-numeric values.</li>\n<li>Fix - Home and away records being combined when opponent not in league table.</li>\n</ul>\n<p>= 2.2.5 =</p>\n<ul>\n<li>Feature - Enable positions to be displayed in icons mode box score.</li>\n<li>Tweak - Reflect mixed column order in player list admin.</li>\n<li>Tweak - Remove table row border in frontend stylesheet.</li>\n<li>Tweak - Automatically apply table adjustments on admin page load.</li>\n<li>Tweak - Simplify box score icon totals.</li>\n<li>Fix - Adjustments not applying to player list values.</li>\n<li>Fix - Minutes not displaying in box score.</li>\n<li>Fix - Player positions displaying not displaying in box score.</li>\n<li>Fix - Total time displaying as 0:00.</li>\n</ul>\n<p>= 2.2.4 =</p>\n<ul>\n<li>Feature - Option to show or hide career totals in player profiles.</li>\n<li>Tweak - Icons not rendering when frontend stylesheet is active.</li>\n<li>Tweak - Remove underline from icon links in frontend stylesheet.</li>\n<li>Tweak - Change competition and season placeholders in events to &quot;None&quot;.</li>\n<li>Tweak - Enable horizontal scrolling on large tables in admin.</li>\n<li>Fix - Equations returning zero when no events played.</li>\n<li>Fix - Player lists and player profiles showing different statistics when filtered by competition or season.</li>\n<li>Fix - Substitution icon not rendering for starting lineup players.</li>\n<li>Fix - Manual player performance errors in profile.</li>\n<li>Fix - Error in event results if team was deleted.</li>\n<li>Fix - Remove deprecated function in PHP 7.0.</li>\n<li>Fix - Non-numeric errors in PHP 7.1.</li>\n</ul>\n<p>= 2.2.3 =</p>\n<ul>\n<li>Fix - Placeholders for non-numeric values in player list displaying as zero.</li>\n</ul>\n<p>= 2.2.2 =</p>\n<ul>\n<li>Tweak - Center align form events.</li>\n<li>Fix - Reverse form array to display events in chronological order.</li>\n<li>Fix - Error in player lists when querying legacy events.</li>\n<li>Fix - Manual values in player lists when no events have been played.</li>\n</ul>\n<p>= 2.2.1 =</p>\n<ul>\n<li>Fix - Empty timeline error when calculating substitution time.</li>\n</ul>\n<p>= 2.2 =</p>\n<ul>\n<li>Feature - New frontend stylesheet for third-party themes.</li>\n<li>Feature - New chronological streak format in league tables.</li>\n<li>Feature - Head to head tiebreaker option in league tables.</li>\n<li>Feature - Add option to select number of players in player lists.</li>\n<li>Feature - Quick edit player''s team and squad number.</li>\n<li>Feature - Bulk edit players'' past and current teams.</li>\n<li>Feature - Taxonomies added to REST API.</li>\n<li>Feature - Ability to display event history in player profiles.</li>\n<li>Feature - Event list format option added to player and team events.</li>\n<li>Feature - Option to record minutes for specific statistics.</li>\n<li>Feature - Time format added for racing and timed sports.</li>\n<li>Feature - Dedicated option to redirect team pages to site URL.</li>\n<li>Feature - Bulk action to generate team calendars.</li>\n<li>Feature - Automatically adjust played minutes based on substitution times.</li>\n<li>Feature - Match day column option added to event lists.</li>\n<li>Tweak - Remove event limit in calendars.</li>\n<li>Tweak - Allow player squad number to be zero.</li>\n<li>Tweak - Enable mixing performance and statistic column order.</li>\n<li>Tweak - Filter player statistic equations by offense and defense.</li>\n<li>Tweak - System status hidden unless in debug mode.</li>\n<li>Tweak - Move event list column options to sidebar.</li>\n<li>Tweak - Return zero instead of error if dividing by zero.</li>\n<li>Tweak - Always display performance icons in admin.</li>\n<li>Tweak - Add preview notation in event blocks by default.</li>\n<li>Tweak - Single player performance name option added for hover text in icons mode.</li>\n<li>Fix - Player list precision number format error.</li>\n<li>Fix - Player list adjustments for existing values.</li>\n<li>Fix - Hide empty positions in player lists and galleries.</li>\n<li>Fix - Import button selectors disappeared in WordPress 4.7.</li>\n<li>Fix - Substitution time missing parentheses.</li>\n<li>Fix - Staff for home team not being displayed in events.</li>\n<li>Fix - Enable output of time and results without team names in home/away mode.</li>\n<li>Fix - Prevent totals override in box scores.</li>\n<li>Localization - Add Gibraltar nationality option and flag.</li>\n</ul>\n<p>= 2.1.7 =</p>\n<ul>\n<li>Fix - Activation error on older versions of PHP.</li>\n</ul>\n<p>= 2.1.6 =</p>\n<ul>\n<li>Feature - Add equation format option to player performance.</li>\n<li>Tweak - Add text options to change tab labels.</li>\n<li>Fix - Activation errors using TGMPA.</li>\n<li>Fix - Empty footer column in team staff table.</li>\n<li>Preset - Update basketball preset.</li>\n</ul>\n<p>= 2.1.5 =</p>\n<ul>\n<li>Feature - Add option to filter players by current or past team in player lists.</li>\n<li>Fix - Scheduled events not queried in REST API.</li>\n</ul>\n<p>= 2.1.4 =</p>\n<ul>\n<li>Feature - Player and staff dropdown templates added to layout designer.</li>\n<li>Tweak - Default tab labels from layout designer.</li>\n<li>Tweak - Add &quot;Home&quot; and &quot;Away&quot; to text options.</li>\n<li>Tweak - Add horizontal padding to centered event list columns.</li>\n<li>Fix - Disable numeric slug generation for events due to permalink issues in some cases.</li>\n<li>Fix - Permalink issues caused by filter for scheduled events.</li>\n<li>Fix - Scheduled events being ignored by REST API.</li>\n<li>Fix - Inconsistent styling of player and staff dropdowns.</li>\n<li>Fix - Only include current players in player lists.</li>\n<li>Fix - Age calculation in BuddyPress context.</li>\n</ul>\n<p>= 2.1.3 =</p>\n<ul>\n<li>Tweak - Add options to select number, team, and position columns to player list shortcode.</li>\n<li>Fix - Totals row offset in player statistics admin.</li>\n<li>Fix - Events not automatically ordered by date in some cases.</li>\n<li>Fix - Google Maps error when address is empty.</li>\n<li>Fix - Player lists for all teams not appearing in team edit screen.</li>\n<li>Fix - Error in player list when team no longer exists.</li>\n<li>Fix - Error in event logos when results are empty.</li>\n<li>Fix - Issue with link to future event from daily archive when multiple events are scheduled for a single day.</li>\n</ul>\n<p>= 2.1.2 =</p>\n<ul>\n<li>Feature - Add offense and defense statistics to REST API.</li>\n<li>Tweak - Hide template tabs with no content.</li>\n<li>Tweak - Allow selection of player lists without teams.</li>\n<li>Tweak - Center-align time/results when between home and away teams in event list.</li>\n<li>Tweak - Increase checklist panel height in admin.</li>\n<li>Tweak - Update text options.</li>\n<li>Fix - Hidden box score columns still displaying when in offense/defense mode.</li>\n<li>Preset - Update cricket preset.</li>\n</ul>\n<p>= 2.1.1 =</p>\n<ul>\n<li>Feature - Add substitution times in box score.</li>\n<li>Feature - Add text options to change template tab names.</li>\n<li>Tweak - Automatically align home and away columns in event lists.</li>\n<li>Fix - Box score minutes display issue.</li>\n</ul>\n<p>= 2.1 =</p>\n<ul>\n<li>Feature - New simplified fixtures importer compatible with <a href="http://tboy.co/leaguelobster">LeagueLobster</a>.</li>\n<li>Feature - Add match day field to events.</li>\n<li>Feature - Add box score minutes to events.</li>\n<li>Feature - Add option to display full time in event details.</li>\n<li>Feature - Add inline and block option to event logos.</li>\n<li>Feature - Add squad number and name option to player details.</li>\n<li>Feature - Add tab options to layout designer.</li>\n<li>Feature - Add option to display player and staff dropdowns in profiles.</li>\n<li>Feature - Add option to select TBA, postponed, and canceled event status.</li>\n<li>Feature - Licenses tab for third-party extensions.</li>\n<li>Tweak - Get player data only when needed.</li>\n<li>Tweak - Add capabilities to taxonomies.</li>\n<li>Tweak - Display tutorials in main menu if user role is not admin or league manager.</li>\n<li>Tweak - Use contextual strings for featured images.</li>\n<li>Tweak - Enable meta query vars in REST API.</li>\n<li>Tweak - Adopt new tab class names in admin.</li>\n<li>Tweak - Inherit text color for event logo team text.</li>\n<li>Tweak - New developers section on modules page with link to join <a href="http://tboy.co/slack">Slack community</a>.</li>\n<li>Fix - Taxonomy links appearing in admin for users that can''t edit events.</li>\n<li>Fix - Debug error on non-standard admin pages.</li>\n<li>Fix - REST API notice in Jetpack.</li>\n</ul>\n<p>= 2.0.16 =</p>\n<ul>\n<li>Tweak - Add shortcode parameter to override global date in event calendar.</li>\n</ul>\n<p>= 2.0.15 =</p>\n<ul>\n<li>Fix - Subversion issues.</li>\n</ul>\n<p>= 2.0.14 =</p>\n<ul>\n<li>Fix - Use search mode in maps to prevent invalid parameter error.</li>\n</ul>\n<p>= 2.0.13 =</p>\n<ul>\n<li>Fix - Google Maps embed code to reflect selected map type.</li>\n<li>Fix - Countdown error when teams are not selected.</li>\n</ul>\n<p>= 2.0.12 =</p>\n<ul>\n<li>Tweak - Add API key to Google Maps in admin.</li>\n</ul>\n<p>= 2.0.11 =</p>\n<ul>\n<li>Tweak - Embed code to reflect change in Google Maps API.</li>\n</ul>\n<p>= 2.0.10 =</p>\n<ul>\n<li>Tweak - Enable sortable tables on all devices.</li>\n</ul>\n<p>= 2.0.9 =</p>\n<ul>\n<li>Feature - Display admin notice when user is not allowed to edit an item.</li>\n</ul>\n<p>= 2.0.8 =</p>\n<ul>\n<li>Feature - Add shortcode parameter to filter event calendars by player.</li>\n<li>Feature - Add text options to change age and birthday labels.</li>\n</ul>\n<p>= 2.0.7 =</p>\n<ul>\n<li>Feature - Add option to show or hide logos or photos in event blocks.</li>\n<li>Tweak - Combine reverse teams option for results and box score.</li>\n<li>Fix - Add filter to template output for extensions.</li>\n</ul>\n<p>= 2.0.6 =</p>\n<ul>\n<li>Tweak - Display squad numbers in defense section.</li>\n<li>Tweak - Display shared values in both offense and defense sections and sync when editing event.</li>\n</ul>\n<p>= 2.0.5 =</p>\n<ul>\n<li>Fix - Hide team column in player statistics for player-vs-player sports.</li>\n</ul>\n<p>= 2.0.4 =</p>\n<ul>\n<li>Fix - Title generator in event importer.</li>\n</ul>\n<p>= 2.0.3 =</p>\n<ul>\n<li>Tweak - Restore career total tables in player profiles.</li>\n<li>Fix - Display sport and timezone selector after first installation.</li>\n</ul>\n<p>= 2.0.2 =</p>\n<ul>\n<li>Fix - New events not saving with automatic titles when title is empty.</li>\n<li>Fix - Event importer not importing new events.</li>\n</ul>\n<p>= 2.0.1 =</p>\n<ul>\n<li>Fix - Some player statistics calculating as zero.</li>\n</ul>\n<p>= 2.0 =</p>\n<ul>\n<li>Feature - Integration with <a href="https://wordpress.org/plugins/rest-api/">WP REST API</a> by adding endpoints for viewing, creating, editing, and deleting SportsPress data.</li>\n<li>Feature - New drag-and-drop layout designer for customizing events, teams, players, and staff pages.</li>\n<li>Feature - Allow player biography to float next to photo in profile.</li>\n<li>Feature - Add option to display separate offensive and defensive statistics in player profiles.</li>\n<li>Feature - Add option to display career totals as a footer row in player statistics tables.</li>\n<li>Feature - Add option to display event calendar or fixtures &amp; results on team pages.</li>\n<li>Feature - Add option to display time in event logos section when results are not ready.</li>\n<li>Feature - Add global visibility settings to player statistic columns.</li>\n<li>Feature - Add team, competition, league, and venue filter to event calendar, event list, and event blocks shortcodes.</li>\n<li>Feature - Automatically re-order competitions, seasons, venues, positions, and jobs by slug.</li>\n<li>Feature - New welcome page outlining notable changes to major plugin version.</li>\n<li>Refactor - Change parameter for sp_get_next_event function to allow custom templating.</li>\n<li>Tweak - Reverse team order also applies to admin.</li>\n<li>Tweak - Hide squad number from defense box score.</li>\n<li>Tweak - Use more compact labeling in player columns admin meta box.</li>\n<li>Tweak - Update modules page to reflect new premium scoreboard module.</li>\n<li>Tweak - Remove hardcoded protocol for calls to Google Maps scripts.</li>\n<li>Tweak - Limit venue archives to events.</li>\n<li>Tweak - Float team profile next to logo on team pages.</li>\n<li>Tweak - Display league table and player list option in teams only when modules are active.</li>\n<li>Tweak - Load profile and description meta boxes as native editors instead of custom methods.</li>\n<li>Tweak - Load team abbreviations independent of post title filter.</li>\n<li>Tweak - Add z-index to make header float above other elements.</li>\n<li>Fix - Error when league table column has no equation.</li>\n<li>Fix - Error when displaying checkboxes for manual event statistics.</li>\n<li>Fix - Venues linking automatically in countdown widgets.</li>\n<li>Fix - Styling issue where countdown widgets were pushed off-screen in some themes.</li>\n<li>Fix - Avoid loading countdown widget if no events are available.</li>\n<li>Preset - Update baseball, cricket, floorball, handball, ice hockey, and softball presets.</li>\n</ul>\n<p>= Full Changelog =</p>\n<ul>\n<li>For older versions, <a href="https://github.com/ThemeBoy/SportsPress/blob/master/changelog.txt">view the full changelog</a>.</li>\n</ul>";s:3:"faq";s:5694:"<h4>Installation Instructions</h4>\n<p>= Minimum Requirements =</p>\n<ul>\n<li>WordPress 3.8 or greater</li>\n<li>PHP version 5.2.4 or greater</li>\n<li>MySQL version 5.0 or greater</li>\n</ul>\n<p>[youtube <a href="http://www.youtube.com/watch?v=nE8-RlbotmU">http://www.youtube.com/watch?v=nE8-RlbotmU</a>]</p>\n<p>= Automatic Installation =</p>\n<p>Automatic installation is the easiest option as WordPress handles the file transfers itself and you don''t even need to leave your web browser. To do an automatic install of SportsPress, log in to your WordPress admin panel, navigate to the Plugins menu and click Add New.</p>\n<p>In the search field type &quot;SportsPress&quot; and click Search Plugins. Once you''ve found our sports plugin you can view details about it such as the point release, rating and description. Most importantly of course, you can install it by simply clicking Install Now. After clicking that link you will be asked if you''re sure you want to install the plugin. Click yes and WordPress will automatically complete the installation.</p>\n<p>= Manual Installation =</p>\n<p>The manual installation method involves downloading our sports plugin and uploading it to your webserver via your favorite FTP application.</p>\n<ol>\n<li>Download the plugin file to your computer and unzip it</li>\n<li>Using an FTP program, or your hosting control panel, upload the unzipped plugin folder to your WordPress installation''s wp-content/plugins/ directory.</li>\n<li>Activate the plugin from the Plugins menu within the WordPress admin.</li>\n</ol>\n<p>= Upgrading =</p>\n<p>Automatic updates should work like a charm; as always though, ensure you backup your site just in case.</p>\n<p>If on the off-chance you do encounter issues with the event/team/player/staff pages after an update you simply need to flush the permalinks by going to WordPress &gt; Settings &gt; Permalinks and hitting ''save''. That should return things to normal.</p>\n<h4>Which sports does this plugin support?</h4>\n<p>The plugin will support most team sports with a scoring system. You can customize the table columns and player statistics via SportsPress settings. We''ve included presets for commonly requested sports, and you can also add your own.</p>\n<h4>Will SportsPress work with my theme?</h4>\n<p>Yes; SportsPress will work with any theme, but may require some styling to make it match nicely.</p>\n<h4>Where can I report bugs or contribute to the project?</h4>\n<p>Bugs can be reported either in our support forum or preferably on the <a href="https://github.com/ThemeBoy/SportsPress/issues">SportsPress GitHub repository</a>.</p>\n<h4>Will SportsPress work with my sport?</h4>\n<p>The plugin comes preinstalled with several different sports presets to help you get started quickly, but is also flexible enough to be customized to fit the need of any team or individual sport. Please <a href="http://wordpress.org/support/plugin/sportspress">let us know</a> if you''d like to work with us to get your preset added the plugin.</p>\n<h4>Can I import teams/players/staff/matches?</h4>\n<p>Yes, CSV importers are included with the plugin. Go to Tools &gt; Import and choose from one of the SportsPress CSV importers. Supports CSV files generated by <a href="http://tboy.co/leaguelobster">LeagueLobster</a>.</p>\n<h4>What''s the difference between the free and Pro plugin?</h4>\n<p>SportsPress is a free plugin developed to give sports organizations the functionality needed to run a team, club, or league website. The plugin allows you to schedule your upcoming matches and enter the results after you''ve played a game. Your league tables, team and player statistics will automatically update once you''ve published the result to reflect the new standings.</p>\n<p>Limitations? Don''t worry, there are no limitations to the number of events, players, staff members, teams, clubs, or leagues you can add to the free plugin.</p>\n<p><a href="http://tboy.co/pro">SportsPress Pro</a> is a premium plugin made for serious teams who are looking for additional sports functionality in their website. By upgrading to SportsPress Pro, you will be given instant access to a suite of sports modules that will appear in your dashboard.</p>\n<p>The current modules that are available exclusively to SportsPress Pro are:</p>\n<ul>\n<li>Tournaments: Create and display tournaments in a bracket/knockout cup format.</li>\n<li>Timelines: Display a visual timeline of player performance in events.</li>\n<li>Scoreboard: Display multiple event results in a horizontal scoreboard.</li>\n<li>Sponsors: Add your sponsors on your website and track each of their clicks and impressions.</li>\n<li>Staff Directories: Show contact information of your key personnel so people know who to get in touch with.</li>\n<li>Team Access: Assign users to a specific team and limit their access to data related to that team.</li>\n<li>Team Colors: Make each team''s profile page unique by displaying their team colors.</li>\n<li>League Menu: Display a global navigation bar at the top of your website for easy navigation from one team to the next.</li>\n<li>Twitter: Add a Twitter feed to team, player, and staff pages.</li>\n<li>Branding: Instantly rebrands your admin panel to reflect your organization''s brand.</li>\n<li>Duplicator: Clone anything with just one click. Great for creating multiple events.</li>\n</ul>\n<p>There are <a href="http://tboy.co/pro">3 different licenses</a> that you can choose from: Club, League, and Agency.</p>\n<p>When you upgrade to one of the SportsPress Pro licenses, you can simply activate the Pro version without losing any of your data. Please note that we recommend that you do a complete backup whenever you make big changes to your website.</p>\n";}s:14:"upgrade_notice";a:0:{}s:11:"screenshots";a:10:{i:1;s:68:"Add a suite of widgets to your site to display your own sports data.";i:2;s:72:"Generate automated standings that update whenever results are published.";i:3;s:82:"Schedule matches and display details, results, box scores, and a map to the venue.";i:4;s:73:"Register teams and players on your site and create lineups for each team.";i:5;s:67:"Display player profiles with configurable details and career stats.";i:6;s:67:"Select your sport to automatically install presets and sample data.";i:7;s:109:"Each team has a unique logo and website URL. Optionally link teams from your blog to their official websites.";i:8;s:74:"The overview page provides a birds-eye view of your entire sports network.";i:9;s:150:"Configure variables used throughout the plugin to fit your sport. Presets are provided for some sports, and will automatically populate these options.";i:10;s:78:"Design your own points system using the custom drag-and-drop equation builder.";}s:3:"faq";a:7:{s:25:"Installation Instructions";s:1900:"<p>= Minimum Requirements =</p>\n<ul>\n<li>WordPress 3.8 or greater</li>\n<li>PHP version 5.2.4 or greater</li>\n<li>MySQL version 5.0 or greater</li>\n</ul>\n<p>[youtube <a href="http://www.youtube.com/watch?v=nE8-RlbotmU">http://www.youtube.com/watch?v=nE8-RlbotmU</a>]</p>\n<p>= Automatic Installation =</p>\n<p>Automatic installation is the easiest option as WordPress handles the file transfers itself and you don''t even need to leave your web browser. To do an automatic install of SportsPress, log in to your WordPress admin panel, navigate to the Plugins menu and click Add New.</p>\n<p>In the search field type &quot;SportsPress&quot; and click Search Plugins. Once you''ve found our sports plugin you can view details about it such as the point release, rating and description. Most importantly of course, you can install it by simply clicking Install Now. After clicking that link you will be asked if you''re sure you want to install the plugin. Click yes and WordPress will automatically complete the installation.</p>\n<p>= Manual Installation =</p>\n<p>The manual installation method involves downloading our sports plugin and uploading it to your webserver via your favorite FTP application.</p>\n<ol>\n<li>Download the plugin file to your computer and unzip it</li>\n<li>Using an FTP program, or your hosting control panel, upload the unzipped plugin folder to your WordPress installation''s wp-content/plugins/ directory.</li>\n<li>Activate the plugin from the Plugins menu within the WordPress admin.</li>\n</ol>\n<p>= Upgrading =</p>\n<p>Automatic updates should work like a charm; as always though, ensure you backup your site just in case.</p>\n<p>If on the off-chance you do encounter issues with the event/team/player/staff pages after an update you simply need to flush the permalinks by going to WordPress &gt; Settings &gt; Permalinks and hitting ''save''. That should return things to normal.</p>";s:38:"Which sports does this plugin support?";s:239:"<p>The plugin will support most team sports with a scoring system. You can customize the table columns and player statistics via SportsPress settings. We''ve included presets for commonly requested sports, and you can also add your own.</p>";s:36:"Will SportsPress work with my theme?";s:103:"<p>Yes; SportsPress will work with any theme, but may require some styling to make it match nicely.</p>";s:53:"Where can I report bugs or contribute to the project?";s:168:"<p>Bugs can be reported either in our support forum or preferably on the <a href="https://github.com/ThemeBoy/SportsPress/issues">SportsPress GitHub repository</a>.</p>";s:36:"Will SportsPress work with my sport?";s:349:"<p>The plugin comes preinstalled with several different sports presets to help you get started quickly, but is also flexible enough to be customized to fit the need of any team or individual sport. Please <a href="http://wordpress.org/support/plugin/sportspress">let us know</a> if you''d like to work with us to get your preset added the plugin.</p>";s:41:"Can I import teams/players/staff/matches?";s:223:"<p>Yes, CSV importers are included with the plugin. Go to Tools &gt; Import and choose from one of the SportsPress CSV importers. Supports CSV files generated by <a href="http://tboy.co/leaguelobster">LeagueLobster</a>.</p>";s:54:"What''s the difference between the free and Pro plugin?";s:2352:"<p>SportsPress is a free plugin developed to give sports organizations the functionality needed to run a team, club, or league website. The plugin allows you to schedule your upcoming matches and enter the results after you''ve played a game. Your league tables, team and player statistics will automatically update once you''ve published the result to reflect the new standings.</p>\n<p>Limitations? Don''t worry, there are no limitations to the number of events, players, staff members, teams, clubs, or leagues you can add to the free plugin.</p>\n<p><a href="http://tboy.co/pro">SportsPress Pro</a> is a premium plugin made for serious teams who are looking for additional sports functionality in their website. By upgrading to SportsPress Pro, you will be given instant access to a suite of sports modules that will appear in your dashboard.</p>\n<p>The current modules that are available exclusively to SportsPress Pro are:</p>\n<ul>\n<li>Tournaments: Create and display tournaments in a bracket/knockout cup format.</li>\n<li>Timelines: Display a visual timeline of player performance in events.</li>\n<li>Scoreboard: Display multiple event results in a horizontal scoreboard.</li>\n<li>Sponsors: Add your sponsors on your website and track each of their clicks and impressions.</li>\n<li>Staff Directories: Show contact information of your key personnel so people know who to get in touch with.</li>\n<li>Team Access: Assign users to a specific team and limit their access to data related to that team.</li>\n<li>Team Colors: Make each team''s profile page unique by displaying their team colors.</li>\n<li>League Menu: Display a global navigation bar at the top of your website for easy navigation from one team to the next.</li>\n<li>Twitter: Add a Twitter feed to team, player, and staff pages.</li>\n<li>Branding: Instantly rebrands your admin panel to reflect your organization''s brand.</li>\n<li>Duplicator: Clone anything with just one click. Great for creating multiple events.</li>\n</ul>\n<p>There are <a href="http://tboy.co/pro">3 different licenses</a> that you can choose from: Club, League, and Agency.</p>\n<p>When you upgrade to one of the SportsPress Pro licenses, you can simply activate the Pro version without losing any of your data. Please note that we recommend that you do a complete backup whenever you make big changes to your website.</p>";}s:8:"warnings";a:0:{}}s:4:"tags";a:20:{i:0;s:4:"v2.6";i:1;s:8:"v2.6-RC1";i:2;s:4:"v2.5";i:3;s:8:"v2.5-RC2";i:4;s:8:"v2.5-RC1";i:5;s:4:"v2.4";i:6;s:4:"v2.3";i:7;s:4:"v2.2";i:8;s:4:"v2.1";i:9;s:4:"v2.0";i:10;s:4:"v1.9";i:11;s:4:"v1.8";i:12;s:4:"v1.7";i:13;s:4:"v1.6";i:14;s:4:"v1.5";i:15;s:4:"v1.4";i:16;s:4:"v1.3";i:17;s:4:"v1.2";i:18;s:4:"v1.1";i:19;s:4:"v1.0";}}', 'no'),
(363, 'widget_sportspress-staff', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(364, 'widget_sportspress-birthdays', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(365, 'widget_sportspress-event-calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(366, 'widget_sportspress-event-list', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(367, 'widget_sportspress-event-blocks', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(368, 'widget_sportspress-countdown', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(369, 'widget_sportspress-league-table', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(370, 'widget_sportspress-team-gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(371, 'widget_sportspress-player-list', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(372, 'widget_sportspress-player-gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(373, 'sportspress_primary_result', 'gw', 'yes'),
(375, 'sportspress_league', '2', 'yes'),
(376, 'sp_season_children', 'a:0:{}', 'yes'),
(377, 'sportspress_season', '3', 'yes'),
(378, 'sportspress_installed', '1', 'yes'),
(379, 'sportspress_completed_setup', '1', 'yes'),
(389, 'WPLANG', '', 'yes'),
(390, 'new_admin_email', 'dubliner.stephen+brank@gmai.com', 'yes'),
(438, 'auto_core_update_failed', 'a:6:{s:9:"attempted";s:5:"4.9.8";s:7:"current";s:5:"4.9.7";s:10:"error_code";s:32:"copy_failed_for_update_core_file";s:10:"error_data";s:33:"wp-admin/includes/update-core.php";s:9:"timestamp";i:1533383263;s:5:"retry";b:0;}', 'no'),
(439, 'auto_core_update_notified', 'a:4:{s:4:"type";s:4:"fail";s:5:"email";s:31:"dubliner.stephen+brank@gmai.com";s:7:"version";s:5:"4.9.8";s:9:"timestamp";i:1533383263;}', 'no'),
(484, 'sportspress_table_padding', '', 'yes'),
(485, 'sportspress_custom_css', '', 'yes'),
(486, 'themeboy', 'a:8:{s:7:"primary";s:7:"#2b353e";s:10:"background";s:7:"#f4f4f4";s:4:"text";s:7:"#222222";s:7:"heading";s:7:"#ffffff";s:4:"link";s:7:"#00a69c";s:9:"customize";s:0:"";s:13:"content_width";d:1000;s:7:"sidebar";s:2:"no";}', 'yes'),
(498, 'taxonomy_4', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(500, 'taxonomy_5', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(502, 'taxonomy_6', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(504, 'taxonomy_7', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(506, 'taxonomy_8', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(508, 'taxonomy_9', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(510, 'taxonomy_10', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(512, 'taxonomy_11', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(514, 'taxonomy_12', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(516, 'taxonomy_13', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(518, 'taxonomy_14', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(520, 'taxonomy_15', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(522, 'taxonomy_16', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(525, 'taxonomy_17', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(527, 'taxonomy_18', 'a:1:{s:11:"sp_sections";a:1:{i:0;i:0;}}', 'yes'),
(529, 'taxonomy_19', 'a:1:{s:11:"sp_sections";a:1:{i:0;i:0;}}', 'yes'),
(531, 'taxonomy_20', 'a:1:{s:11:"sp_sections";a:1:{i:0;i:0;}}', 'yes'),
(533, 'taxonomy_21', 'a:1:{s:11:"sp_sections";a:1:{i:0;i:0;}}', 'yes'),
(535, 'taxonomy_22', 'a:1:{s:11:"sp_sections";a:1:{i:0;i:0;}}', 'yes'),
(537, 'taxonomy_23', 'a:1:{s:11:"sp_sections";a:1:{i:0;i:0;}}', 'yes'),
(541, 'taxonomy_24', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(543, 'taxonomy_25', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(545, 'taxonomy_26', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(546, 'sportspress_event_split_players_by_team', 'yes', 'yes'),
(547, 'sportspress_event_split_players_by_position', 'yes', 'yes'),
(557, 'taxonomy_27', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(559, 'taxonomy_28', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(561, 'taxonomy_29', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(563, 'taxonomy_30', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(565, 'taxonomy_31', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(567, 'taxonomy_32', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(569, 'taxonomy_33', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(571, 'taxonomy_34', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(573, 'taxonomy_35', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(580, 'taxonomy_36', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(582, 'taxonomy_37', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(584, 'taxonomy_38', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(586, 'taxonomy_39', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(588, 'taxonomy_40', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(601, 'taxonomy_41', 'a:1:{s:11:"sp_sections";a:1:{i:0;i:0;}}', 'yes'),
(603, 'taxonomy_42', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(616, 'taxonomy_43', 'a:1:{s:11:"sp_sections";a:1:{i:0;i:0;}}', 'yes'),
(618, 'taxonomy_44', 'a:1:{s:11:"sp_sections";a:2:{i:0;i:0;i:1;i:1;}}', 'yes'),
(955, 'current_theme', 'Rookie', 'yes'),
(956, 'theme_mods_Rookie', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;}', 'yes'),
(957, 'theme_switched', '', 'yes'),
(958, 'sportspress_admin_notices', 'a:2:{i:0;s:14:"template_files";i:1;s:13:"theme_support";}', 'yes'),
(1042, 'sp_league_children', 'a:1:{i:2;a:5:{i:0;i:45;i:1;i:46;i:2;i:47;i:3;i:48;i:4;i:49;}}', 'yes'),
(1213, 'taxonomy_50', 'a:1:{s:11:"sp_sections";a:2:{i:0;s:1:"0";i:1;s:1:"1";}}', 'yes'),
(1216, 'taxonomy_51', 'a:1:{s:11:"sp_sections";a:2:{i:0;s:1:"0";i:1;s:1:"1";}}', 'yes'),
(1219, 'taxonomy_52', 'a:1:{s:11:"sp_sections";a:2:{i:0;s:1:"0";i:1;s:1:"1";}}', 'yes'),
(1220, 'sp_position_children', 'a:1:{i:50;a:2:{i:0;i:51;i:1;i:52;}}', 'yes'),
(1284, 'sportspress_primary_performance', 'divs', 'yes'),
(1960, '_site_transient_timeout_theme_roots', '1535310382', 'no'),
(1962, '_site_transient_theme_roots', 'a:4:{s:6:"Rookie";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'no'),
(1965, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1535308591;s:7:"checked";a:4:{s:6:"Rookie";s:5:"1.5.2";s:13:"twentyfifteen";s:3:"2.0";s:15:"twentyseventeen";s:3:"1.6";s:13:"twentysixteen";s:3:"1.5";}s:8:"response";a:1:{s:15:"twentyseventeen";a:4:{s:5:"theme";s:15:"twentyseventeen";s:11:"new_version";s:3:"1.7";s:3:"url";s:45:"https://wordpress.org/themes/twentyseventeen/";s:7:"package";s:61:"https://downloads.wordpress.org/theme/twentyseventeen.1.7.zip";}}s:12:"translations";a:0:{}}', 'no'),
(1966, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1535308592;s:7:"checked";a:4:{s:19:"akismet/akismet.php";s:5:"4.0.3";s:39:"github-updater-8.2.1/github-updater.php";s:5:"8.2.1";s:9:"hello.php";s:3:"1.7";s:27:"SportsPress/sportspress.php";s:5:"2.6.7";}s:8:"response";a:1:{s:19:"akismet/akismet.php";O:8:"stdClass":12:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.8";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"4.9.8";s:12:"requires_php";b:0;s:13:"compatibility";O:8:"stdClass":0:{}}}s:12:"translations";a:0:{}s:9:"no_update";a:2:{s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";}s:7:"banners";a:1:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}s:27:"SportsPress/sportspress.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/sportspress";s:4:"slug";s:11:"sportspress";s:6:"plugin";s:27:"SportsPress/sportspress.php";s:11:"new_version";s:5:"2.6.7";s:3:"url";s:42:"https://wordpress.org/plugins/sportspress/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/sportspress.2.6.7.zip";s:5:"icons";a:2:{s:2:"2x";s:64:"https://ps.w.org/sportspress/assets/icon-256x256.png?rev=1252005";s:2:"1x";s:64:"https://ps.w.org/sportspress/assets/icon-128x128.png?rev=1252005";}s:7:"banners";a:2:{s:2:"2x";s:67:"https://ps.w.org/sportspress/assets/banner-1544x500.png?rev=1405496";s:2:"1x";s:66:"https://ps.w.org/sportspress/assets/banner-772x250.png?rev=1405496";}s:11:"banners_rtl";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(71, 27, '_sp_first', '1'),
(72, 27, '_edit_lock', '1534367222:1'),
(73, 29, '_edit_last', '1'),
(74, 29, '_edit_lock', '1533498282:1'),
(75, 29, '_wp_trash_meta_status', 'draft'),
(76, 29, '_wp_trash_meta_time', '1533498434'),
(77, 29, '_wp_desired_post_slug', ''),
(1594, 404, 'sp_abbreviation', ''),
(1595, 404, 'sp_condition', '0'),
(1633, 404, '_edit_lock', '1533501915:1'),
(1634, 404, '_edit_last', '1'),
(1635, 404, 'sp_color', '#888888'),
(2054, 417, '_wp_trash_meta_status', 'publish'),
(2055, 417, '_wp_trash_meta_time', '1533503259'),
(2385, 593, 'sp_equation', '$gwfor * $condfor + $glfor'),
(2386, 593, 'sp_precision', '0'),
(2387, 593, 'sp_priority', '1'),
(2388, 593, 'sp_order', 'DESC'),
(2396, 27, '_edit_last', '1'),
(2397, 27, 'sp_status', 'ok'),
(2398, 27, 'sp_format', 'league'),
(2399, 27, 'sp_mode', 'player'),
(2400, 27, 'sp_day', ''),
(2401, 27, 'sp_minutes', ''),
(2402, 27, 'sp_results', 'a:6:{i:781;a:5:{s:3:"dgw";s:1:"1";s:3:"dgl";s:1:"4";s:3:"xgw";s:0:"";s:3:"xgl";s:0:"";s:7:"outcome";a:1:{i:0;s:4:"loss";}}i:780;a:5:{s:3:"dgw";s:1:"5";s:3:"dgl";s:1:"0";s:3:"xgw";s:0:"";s:3:"xgl";s:0:"";s:7:"outcome";a:1:{i:0;s:3:"win";}}i:602;a:5:{s:3:"dgw";s:1:"3";s:3:"dgl";s:1:"2";s:3:"xgw";s:0:"";s:3:"xgl";s:0:"";s:7:"outcome";a:1:{i:0;s:4:"loss";}}i:601;a:5:{s:3:"dgw";s:1:"4";s:3:"dgl";s:1:"1";s:3:"xgw";s:1:"2";s:3:"xgl";s:1:"0";s:7:"outcome";a:1:{i:0;s:3:"win";}}i:783;a:5:{s:3:"dgw";s:1:"2";s:3:"dgl";s:1:"3";s:3:"xgw";s:1:"1";s:3:"xgl";s:1:"1";s:7:"outcome";a:1:{i:0;s:3:"win";}}i:837;a:5:{s:3:"dgw";s:0:"";s:3:"dgl";s:0:"";s:3:"xgw";s:1:"2";s:3:"xgl";s:1:"0";s:7:"outcome";a:1:{i:0;s:3:"win";}}}'),
(2403, 27, 'sp_result_columns', 'a:0:{}'),
(2404, 27, 'sp_players', 'a:6:{i:781;a:1:{i:781;a:4:{s:4:"divd";s:1:"7";s:4:"divs";s:0:"";s:4:"divx";s:0:"";s:3:"dxf";s:0:"";}}i:780;a:1:{i:780;a:4:{s:4:"divd";s:1:"5";s:4:"divs";s:0:"";s:4:"divx";s:0:"";s:3:"dxf";s:0:"";}}i:602;a:1:{i:602;a:4:{s:4:"divd";s:1:"6";s:4:"divs";s:0:"";s:4:"divx";s:0:"";s:3:"dxf";s:0:"";}}i:601;a:1:{i:601;a:4:{s:4:"divd";s:1:"7";s:4:"divs";s:0:"";s:4:"divx";s:1:"8";s:3:"dxf";s:0:"";}}i:783;a:1:{i:783;a:4:{s:4:"divd";s:1:"7";s:4:"divs";s:0:"";s:4:"divx";s:1:"8";s:3:"dxf";s:0:"";}}i:837;a:1:{i:837;a:4:{s:4:"divd";s:0:"";s:4:"divs";s:0:"";s:4:"divx";s:1:"8";s:3:"dxf";s:0:"";}}}'),
(2405, 27, 'sp_order', 'a:0:{}'),
(2406, 27, 'sp_timeline', 'a:0:{}'),
(2407, 27, 'sp_stars', 'a:0:{}'),
(2408, 27, 'sp_specs', 'a:2:{s:9:"winfactor";s:1:"3";s:10:"lostfactor";s:1:"1";}'),
(2409, 27, 'sp_video', ''),
(2410, 601, '_edit_last', '1'),
(2411, 601, 'sp_number', '22'),
(2412, 601, 'sp_metrics', 'a:5:{s:6:"height";s:0:"";s:4:"club";s:0:"";s:8:"playrorl";s:0:"";s:5:"grade";s:0:"";s:6:"gender";s:0:"";}'),
(2413, 601, 'sp_leagues', 'a:0:{}'),
(2414, 601, 'sp_statistics', 'a:2:{i:49;a:1:{i:0;a:6:{s:3:"div";s:0:"";s:10:"pointsstat";s:0:"";s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:8:"winratio";s:0:"";}}i:45;a:1:{i:0;a:6:{s:3:"div";s:0:"";s:10:"pointsstat";s:0:"";s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:8:"winratio";s:0:"";}}}'),
(2415, 601, '_edit_lock', '1533577819:1'),
(2416, 602, '_edit_last', '1'),
(2417, 602, 'sp_number', '333'),
(2418, 602, 'sp_metrics', 'a:5:{s:6:"height";s:0:"";s:4:"club";s:0:"";s:8:"playrorl";s:0:"";s:5:"grade";s:0:"";s:6:"gender";s:0:"";}'),
(2419, 602, 'sp_leagues', 'a:0:{}'),
(2420, 602, 'sp_statistics', 'a:0:{}'),
(2421, 602, '_edit_lock', '1533562649:1'),
(2434, 604, '_edit_last', '1'),
(2435, 604, '_edit_lock', '1533562476:1'),
(2436, 604, 'sp_mode', 'player'),
(2437, 604, 'sp_format', 'standings'),
(2438, 604, 'sp_caption', ''),
(2439, 604, 'sp_date', '0'),
(2440, 604, 'sp_date_from', '2018-08-05'),
(2441, 604, 'sp_date_to', '2018-08-05'),
(2442, 604, 'sp_date_past', '7'),
(2443, 604, 'sp_date_relative', '0'),
(2444, 604, 'sp_main_league', ''),
(2445, 604, 'sp_current_season', ''),
(2446, 604, 'sp_select', 'auto'),
(2447, 604, 'sp_highlight', '0'),
(2448, 604, 'sp_columns', 'a:4:{i:0;s:1:"w";i:1;s:1:"l";i:2;s:6:"points";i:3;s:7:"percent";}'),
(2449, 604, 'sp_adjustments', 'a:7:{i:780;a:7:{s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:783;a:7:{s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:601;a:7:{s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:602;a:7:{s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:781;a:7:{s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:782;a:7:{s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:779;a:7:{s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}}'),
(2450, 604, 'sp_teams', 'a:7:{i:780;a:8:{s:4:"name";s:0:"";s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:783;a:8:{s:4:"name";s:0:"";s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:601;a:8:{s:4:"name";s:0:"";s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:602;a:8:{s:4:"name";s:0:"";s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:781;a:8:{s:4:"name";s:0:"";s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:782;a:8:{s:4:"name";s:0:"";s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}i:779;a:8:{s:4:"name";s:0:"";s:5:"gains";s:0:"";s:1:"t";s:0:"";s:1:"g";s:0:"";s:1:"w";s:0:"";s:1:"l";s:0:"";s:6:"points";s:0:"";s:7:"percent";s:0:"";}}'),
(2451, 593, '_edit_lock', '1534367461:1'),
(2452, 593, '_edit_last', '1'),
(2674, 661, '_edit_last', '1'),
(2675, 661, 'sp_precision', '0'),
(2676, 661, 'sp_priority', '0'),
(2677, 661, 'sp_order', 'DESC'),
(2678, 661, 'sp_equation', '$gainfor'),
(2679, 661, '_edit_lock', '1533506664:1'),
(2911, 701, '_wp_trash_meta_status', 'publish'),
(2912, 701, '_wp_trash_meta_time', '1533508140'),
(3089, 750, '_sp_preset', '1'),
(3090, 750, 'sp_abbreviation', NULL),
(3091, 750, 'sp_condition', '>'),
(3092, 751, '_sp_preset', '1'),
(3093, 751, 'sp_abbreviation', NULL),
(3094, 751, 'sp_condition', '<'),
(3108, 755, '_sp_preset', '1'),
(3109, 755, 'sp_equation', '$eventsplayed'),
(3110, 755, 'sp_precision', '0'),
(3111, 755, 'sp_priority', NULL),
(3112, 755, 'sp_order', 'DESC'),
(3113, 756, '_sp_preset', '1'),
(3114, 756, 'sp_equation', '$eventsplayed'),
(3115, 756, 'sp_precision', '0'),
(3116, 756, 'sp_priority', NULL),
(3117, 756, 'sp_order', 'DESC'),
(3118, 757, '_sp_preset', '1'),
(3119, 757, 'sp_equation', '$win'),
(3120, 757, 'sp_precision', '0'),
(3121, 757, 'sp_priority', NULL),
(3122, 757, 'sp_order', 'DESC'),
(3123, 758, '_sp_preset', '1'),
(3124, 758, 'sp_equation', '$loss'),
(3125, 758, 'sp_precision', '0'),
(3126, 758, 'sp_priority', NULL),
(3127, 758, 'sp_order', 'DESC'),
(3128, 759, '_sp_preset', '1'),
(3129, 759, 'sp_equation', '$gwfor / ($gwfor + $glfor) * 100'),
(3130, 759, 'sp_precision', '2'),
(3131, 759, 'sp_priority', '2'),
(3132, 759, 'sp_order', 'DESC'),
(3133, 760, '_sp_preset', '1'),
(3134, 761, '_sp_preset', '1'),
(3135, 762, '_sp_preset', '1'),
(3136, 763, '_sp_preset', '1'),
(3137, 764, '_sp_preset', '1'),
(3138, 765, '_sp_preset', '1'),
(3139, 766, '_sp_preset', '1'),
(3140, 759, '_edit_lock', '1533508210:1'),
(3152, 754, '_wp_trash_meta_status', 'publish'),
(3153, 754, '_wp_trash_meta_time', '1533508937'),
(3196, 770, '_edit_last', '1'),
(3197, 770, '_edit_lock', '1533509347:1'),
(3206, 774, '_edit_last', '1'),
(3207, 774, 'sp_format', 'list'),
(3208, 774, 'sp_columns', 'a:10:{i:0;s:6:"number";i:1;s:4:"team";i:2;s:1:"0";i:3;s:1:"0";i:4;s:1:"0";i:5;s:11:"gamesplayed";i:6;s:8:"gameswon";i:7;s:12:"eventsplayed";i:8;s:8:"winratio";i:9;s:7:"dpoints";}'),
(3209, 774, 'sp_caption', 'All times, all events'),
(3210, 774, 'sp_date', '0'),
(3211, 774, 'sp_date_from', '2018-08-05'),
(3212, 774, 'sp_date_to', '2018-08-05'),
(3213, 774, 'sp_date_past', '7'),
(3214, 774, 'sp_date_relative', '0'),
(3215, 774, 'sp_main_league', ''),
(3216, 774, 'sp_current_season', ''),
(3217, 774, 'sp_team', '0'),
(3218, 774, 'sp_era', 'all'),
(3219, 774, 'sp_grouping', '0'),
(3220, 774, 'sp_orderby', 'dpoints'),
(3221, 774, 'sp_crop', '0'),
(3222, 774, 'sp_order', 'DESC'),
(3223, 774, 'sp_select', 'auto'),
(3224, 774, 'sp_number', ''),
(3225, 774, 'sp_adjustments', 'a:6:{i:780;a:4:{s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:601;a:4:{s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:783;a:4:{s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:781;a:4:{s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:779;a:4:{s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:782;a:4:{s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}}'),
(3226, 774, 'sp_players', 'a:6:{i:780;a:6:{s:4:"name";s:0:"";s:4:"team";s:3:"790";s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:601;a:6:{s:4:"name";s:0:"";s:4:"team";s:3:"788";s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:783;a:6:{s:4:"name";s:0:"";s:4:"team";s:3:"789";s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:781;a:6:{s:4:"name";s:0:"";s:4:"team";s:3:"788";s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:779;a:6:{s:4:"name";s:0:"";s:4:"team";s:3:"796";s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}i:782;a:6:{s:4:"name";s:0:"";s:4:"team";s:3:"788";s:11:"gamesplayed";s:0:"";s:8:"gameswon";s:0:"";s:12:"eventsplayed";s:0:"";s:7:"dpoints";s:0:"";}}'),
(3227, 774, '_edit_lock', '1533582348:1'),
(3236, 779, '_edit_last', '1'),
(3237, 779, 'sp_number', ''),
(3238, 779, 'sp_metrics', 'a:5:{s:6:"height";s:0:"";s:4:"club";s:0:"";s:8:"playrorl";s:0:"";s:5:"grade";s:0:"";s:6:"gender";s:0:"";}'),
(3239, 779, 'sp_leagues', 'a:0:{}'),
(3240, 779, 'sp_statistics', 'a:0:{}'),
(3241, 779, '_edit_lock', '1533580760:1'),
(3242, 780, '_edit_last', '1'),
(3243, 780, 'sp_number', ''),
(3244, 780, 'sp_metrics', 'a:5:{s:6:"height";s:0:"";s:4:"club";s:0:"";s:8:"playrorl";s:0:"";s:5:"grade";s:0:"";s:6:"gender";s:0:"";}'),
(3245, 780, 'sp_leagues', 'a:0:{}'),
(3246, 780, 'sp_statistics', 'a:0:{}'),
(3247, 780, '_edit_lock', '1533580751:1'),
(3248, 781, '_edit_last', '1'),
(3249, 781, 'sp_number', ''),
(3250, 781, 'sp_metrics', 'a:5:{s:6:"height";s:0:"";s:4:"club";s:0:"";s:8:"playrorl";s:0:"";s:5:"grade";s:0:"";s:6:"gender";s:0:"";}'),
(3251, 781, 'sp_leagues', 'a:0:{}'),
(3252, 781, 'sp_statistics', 'a:0:{}'),
(3253, 781, '_edit_lock', '1533580745:1'),
(3254, 782, '_edit_last', '1'),
(3255, 782, 'sp_number', ''),
(3256, 782, 'sp_metrics', 'a:5:{s:6:"height";s:0:"";s:4:"club";s:0:"";s:8:"playrorl";s:0:"";s:5:"grade";s:0:"";s:6:"gender";s:0:"";}'),
(3257, 782, 'sp_leagues', 'a:0:{}'),
(3258, 782, 'sp_statistics', 'a:0:{}'),
(3259, 782, '_edit_lock', '1533580738:1'),
(3260, 783, '_edit_last', '1'),
(3261, 783, 'sp_number', ''),
(3262, 783, 'sp_metrics', 'a:5:{s:6:"height";s:0:"";s:4:"club";s:0:"";s:8:"playrorl";s:0:"";s:5:"grade";s:0:"";s:6:"gender";s:0:"";}'),
(3263, 783, 'sp_leagues', 'a:0:{}'),
(3264, 783, 'sp_statistics', 'a:0:{}'),
(3265, 783, '_edit_lock', '1534363730:1'),
(3296, 777, '_wp_trash_meta_status', 'publish'),
(3297, 777, '_wp_trash_meta_time', '1533561672'),
(3298, 788, '_edit_last', '1'),
(3299, 788, '_edit_lock', '1533561749:1'),
(3300, 788, 'sp_url', ''),
(3301, 788, 'sp_redirect', '0'),
(3302, 788, 'sp_short_name', 'Caislean'),
(3303, 788, 'sp_abbreviation', 'CN'),
(3304, 789, '_edit_last', '1'),
(3305, 789, '_edit_lock', '1533561792:1'),
(3306, 789, 'sp_url', ''),
(3307, 789, 'sp_redirect', '0'),
(3308, 789, 'sp_short_name', 'Raphaels'),
(3309, 789, 'sp_abbreviation', 'StR'),
(3310, 790, '_edit_last', '1'),
(3311, 790, '_edit_lock', '1533561836:1'),
(3312, 790, 'sp_url', ''),
(3313, 790, 'sp_redirect', '0'),
(3314, 790, 'sp_short_name', 'Sheriff'),
(3315, 790, 'sp_abbreviation', 'Sh'),
(3350, 796, '_edit_last', '1'),
(3351, 796, 'sp_url', ''),
(3352, 796, 'sp_redirect', '0'),
(3353, 796, 'sp_short_name', 'NA'),
(3354, 796, 'sp_abbreviation', 'NA'),
(3355, 796, '_edit_lock', '1533562355:1'),
(3362, 602, 'sp_current_team', '0'),
(3363, 602, 'sp_current_team', '796'),
(3364, 602, 'sp_past_team', '0'),
(3365, 602, 'sp_team', '0'),
(3366, 602, 'sp_team', '796'),
(3367, 602, 'sp_team', '0'),
(3368, 798, '_edit_last', '1'),
(3369, 798, '_edit_lock', '1533579945:1'),
(3370, 798, 'sp_section', '-1'),
(3371, 798, 'sp_type', 'total'),
(3372, 798, 'sp_format', 'number'),
(3373, 798, 'sp_precision', '0'),
(3374, 798, 'sp_visible', '1'),
(3375, 798, 'sp_equation', '$dglfor + $dgwfor'),
(3376, 799, '_edit_last', '1'),
(3377, 799, '_edit_lock', '1533579962:1'),
(3378, 799, 'sp_section', '-1'),
(3379, 799, 'sp_type', 'total'),
(3380, 799, 'sp_format', 'number'),
(3381, 799, 'sp_precision', '0'),
(3382, 799, 'sp_visible', '1'),
(3383, 799, 'sp_equation', '$dgwfor'),
(3384, 800, '_edit_last', '1'),
(3385, 800, '_edit_lock', '1533562775:1'),
(3386, 800, 'sp_section', '-1'),
(3387, 800, 'sp_type', 'total'),
(3388, 800, 'sp_format', 'number'),
(3389, 800, 'sp_precision', '0'),
(3390, 800, 'sp_visible', '1'),
(3391, 800, 'sp_equation', '$eventsplayed'),
(3392, 801, '_edit_last', '1'),
(3393, 801, '_edit_lock', '1533581642:1'),
(3394, 801, 'sp_section', '-1'),
(3395, 801, 'sp_type', 'total'),
(3396, 801, 'sp_format', 'number'),
(3397, 801, 'sp_precision', '0'),
(3398, 801, 'sp_visible', '1'),
(3399, 801, 'sp_equation', '$dgwfor / ( $dgwfor + $dglfor ) * 100'),
(3426, 812, '_menu_item_type', 'custom'),
(3427, 812, '_menu_item_menu_item_parent', '0'),
(3428, 812, '_menu_item_object_id', '812'),
(3429, 812, '_menu_item_object', 'custom'),
(3430, 812, '_menu_item_target', ''),
(3431, 812, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(3432, 812, '_menu_item_xfn', ''),
(3433, 812, '_menu_item_url', 'http://localhost:8080/brank/'),
(3434, 812, '_menu_item_orphaned', '1533563702'),
(3435, 813, '_menu_item_type', 'post_type'),
(3436, 813, '_menu_item_menu_item_parent', '0'),
(3437, 813, '_menu_item_object_id', '2'),
(3438, 813, '_menu_item_object', 'page'),
(3439, 813, '_menu_item_target', ''),
(3440, 813, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(3441, 813, '_menu_item_xfn', ''),
(3442, 813, '_menu_item_url', ''),
(3443, 813, '_menu_item_orphaned', '1533563702'),
(3445, 814, '_menu_item_type', 'custom'),
(3446, 814, '_menu_item_menu_item_parent', '0'),
(3447, 814, '_menu_item_object_id', '814'),
(3448, 814, '_menu_item_object', 'custom'),
(3449, 814, '_menu_item_target', ''),
(3450, 814, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(3451, 814, '_menu_item_xfn', ''),
(3452, 814, '_menu_item_url', 'http://localhost:8080/brank/'),
(3453, 814, '_menu_item_orphaned', '1533563746'),
(3454, 815, '_menu_item_type', 'post_type'),
(3455, 815, '_menu_item_menu_item_parent', '0'),
(3456, 815, '_menu_item_object_id', '2'),
(3457, 815, '_menu_item_object', 'page'),
(3458, 815, '_menu_item_target', ''),
(3459, 815, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(3460, 815, '_menu_item_xfn', ''),
(3461, 815, '_menu_item_url', ''),
(3462, 815, '_menu_item_orphaned', '1533563746'),
(3463, 816, '_wp_trash_meta_status', 'publish'),
(3464, 816, '_wp_trash_meta_time', '1533563830'),
(3507, 822, '_edit_last', '1'),
(3508, 822, '_edit_lock', '1533578252:1'),
(3509, 822, 'sp_status', 'ok'),
(3510, 822, 'sp_format', 'league'),
(3511, 822, 'sp_mode', 'player'),
(3512, 822, 'sp_day', ''),
(3513, 822, 'sp_minutes', ''),
(3517, 822, 'sp_results', 'a:2:{i:601;a:4:{s:4:"cond";s:1:"7";s:2:"gw";s:1:"1";s:2:"gl";s:1:"1";s:7:"outcome";a:1:{i:0;s:4:"loss";}}i:783;a:4:{s:4:"cond";s:1:"5";s:2:"gw";s:1:"1";s:2:"gl";s:1:"1";s:7:"outcome";a:1:{i:0;s:3:"win";}}}'),
(3518, 822, 'sp_result_columns', 'a:0:{}'),
(3519, 822, 'sp_players', 'a:2:{i:601;a:1:{i:601;a:2:{s:3:"div";s:1:"7";s:3:"xdc";s:1:"1";}}i:783;a:1:{i:783;a:2:{s:3:"div";s:1:"6";s:3:"xdc";s:1:"1";}}}'),
(3520, 822, 'sp_order', 'a:0:{}'),
(3521, 822, 'sp_timeline', 'a:2:{i:601;a:1:{i:601;a:2:{s:3:"div";a:7:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:0:"";i:5;s:0:"";i:6;s:0:"";}s:3:"xdc";a:1:{i:0;s:0:"";}}}i:783;a:1:{i:783;a:2:{s:3:"div";a:6:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:0:"";i:5;s:0:"";}s:3:"xdc";a:1:{i:0;s:0:"";}}}}'),
(3522, 822, 'sp_stars', 'a:0:{}'),
(3523, 822, 'sp_specs', 'a:2:{s:9:"winfactor";s:0:"";s:10:"lostfactor";s:0:"";}'),
(3524, 822, 'sp_video', ''),
(3528, 823, '_edit_last', '1'),
(3529, 823, '_edit_lock', '1534364396:1'),
(3530, 823, 'sp_format', 'list'),
(3531, 823, 'sp_columns', 'a:6:{i:0;s:6:"number";i:1;s:1:"0";i:2;s:1:"0";i:3;s:1:"0";i:4;s:7:"xpoints";i:5;s:9:"xdpointsa";}'),
(3532, 823, 'sp_caption', ''),
(3533, 823, 'sp_date', '0'),
(3534, 823, 'sp_date_from', '2018-08-06'),
(3535, 823, 'sp_date_to', '2018-08-06'),
(3536, 823, 'sp_date_past', '7'),
(3537, 823, 'sp_date_relative', '0'),
(3538, 823, 'sp_main_league', ''),
(3539, 823, 'sp_current_season', ''),
(3540, 823, 'sp_team', '0'),
(3541, 823, 'sp_era', 'all'),
(3542, 823, 'sp_grouping', '0'),
(3543, 823, 'sp_orderby', 'xpoints'),
(3544, 823, 'sp_crop', '0'),
(3545, 823, 'sp_order', 'DESC'),
(3546, 823, 'sp_select', 'auto'),
(3547, 823, 'sp_number', ''),
(3548, 823, 'sp_adjustments', 'a:7:{i:837;a:2:{s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:783;a:2:{s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:601;a:2:{s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:782;a:2:{s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:780;a:2:{s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:781;a:2:{s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:779;a:2:{s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}}'),
(3549, 823, 'sp_players', 'a:7:{i:837;a:3:{s:4:"name";s:0:"";s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:783;a:3:{s:4:"name";s:0:"";s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:601;a:3:{s:4:"name";s:0:"";s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:782;a:3:{s:4:"name";s:0:"";s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:780;a:3:{s:4:"name";s:0:"";s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:781;a:3:{s:4:"name";s:0:"";s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}i:779;a:3:{s:4:"name";s:0:"";s:7:"xpoints";s:0:"";s:9:"xdpointsa";s:0:"";}}'),
(3568, 832, '_edit_last', '1'),
(3569, 832, '_edit_lock', '1533576854:1'),
(3582, 835, '_edit_last', '1'),
(3583, 835, 'sp_section', '-1'),
(3584, 835, 'sp_type', 'total'),
(3585, 835, 'sp_format', 'number'),
(3586, 835, 'sp_precision', '0'),
(3587, 835, 'sp_visible', '1'),
(3588, 835, 'sp_equation', '$divx != 0'),
(3589, 835, '_edit_lock', '1533580064:1'),
(3596, 822, 'sp_team', '601'),
(3597, 822, 'sp_team', '783'),
(3598, 822, 'sp_player', '0'),
(3599, 822, 'sp_player', '601'),
(3600, 822, 'sp_player', '0'),
(3601, 822, 'sp_player', '783'),
(3602, 836, '_edit_last', '1'),
(3603, 836, '_edit_lock', '1534362828:1'),
(3604, 836, 'sp_status', 'ok'),
(3605, 836, 'sp_format', 'league'),
(3606, 836, 'sp_mode', 'player'),
(3607, 836, 'sp_day', ''),
(3608, 836, 'sp_minutes', ''),
(3612, 836, 'sp_results', 'a:1:{i:837;a:4:{s:3:"dgw";s:1:"0";s:3:"dgl";s:1:"0";s:3:"xgw";s:1:"3";s:3:"xgl";s:1:"1";}}'),
(3613, 836, 'sp_result_columns', 'a:0:{}'),
(3614, 836, 'sp_players', 'a:1:{i:837;a:1:{i:837;a:4:{s:4:"divd";s:0:"";s:4:"divs";s:0:"";s:4:"divx";s:1:"7";s:3:"dxf";s:2:"d7";}}}'),
(3615, 836, 'sp_order', 'a:0:{}'),
(3616, 836, 'sp_timeline', 'a:0:{}'),
(3617, 836, 'sp_stars', 'a:0:{}'),
(3618, 836, 'sp_specs', 'a:2:{s:9:"winfactor";s:0:"";s:10:"lostfactor";s:0:"";}'),
(3619, 836, 'sp_video', ''),
(3623, 783, 'sp_current_team', '0'),
(3624, 783, 'sp_current_team', '789'),
(3625, 783, 'sp_past_team', '0'),
(3626, 783, 'sp_team', '0'),
(3627, 783, 'sp_team', '789'),
(3628, 783, 'sp_team', '0'),
(3629, 601, 'sp_current_team', '0'),
(3630, 601, 'sp_current_team', '788'),
(3631, 601, 'sp_past_team', '0'),
(3632, 601, 'sp_team', '0'),
(3633, 601, 'sp_team', '788'),
(3634, 601, 'sp_team', '0'),
(3635, 837, '_edit_last', '1'),
(3636, 837, '_edit_lock', '1534364304:1'),
(3637, 837, 'sp_number', ''),
(3640, 837, 'sp_metrics', 'a:5:{s:6:"height";s:0:"";s:4:"club";s:0:"";s:8:"playrorl";s:0:"";s:5:"grade";s:0:"";s:6:"gender";s:0:"";}'),
(3641, 837, 'sp_leagues', 'a:0:{}'),
(3642, 837, 'sp_statistics', 'a:2:{i:49;a:2:{i:0;a:14:{s:11:"gamesplayed";s:0:"";s:9:"xwinratio";s:0:"";s:9:"xgameswon";s:0:"";s:12:"xgamesplayed";s:0:"";s:7:"xpoints";s:0:"";s:7:"dpoints";s:0:"";s:4:"divx";s:0:"";s:4:"divs";s:0:"";s:4:"divd";s:0:"";s:14:"eightthreefive";s:0:"";s:8:"winratio";s:0:"";s:12:"eventsplayed";s:0:"";s:8:"gameswon";s:0:"";s:9:"xdpointsa";s:0:"";}i:3;a:14:{s:11:"gamesplayed";s:0:"";s:9:"xwinratio";s:0:"";s:9:"xgameswon";s:0:"";s:12:"xgamesplayed";s:0:"";s:7:"xpoints";s:0:"";s:7:"dpoints";s:0:"";s:4:"divx";s:0:"";s:4:"divs";s:0:"";s:4:"divd";s:0:"";s:14:"eightthreefive";s:0:"";s:8:"winratio";s:0:"";s:12:"eventsplayed";s:0:"";s:8:"gameswon";s:0:"";s:9:"xdpointsa";s:0:"";}}i:46;a:2:{i:0;a:14:{s:11:"gamesplayed";s:0:"";s:9:"xwinratio";s:0:"";s:9:"xgameswon";s:0:"";s:12:"xgamesplayed";s:0:"";s:7:"xpoints";s:0:"";s:7:"dpoints";s:0:"";s:4:"divx";s:0:"";s:4:"divs";s:0:"";s:4:"divd";s:0:"";s:14:"eightthreefive";s:0:"";s:8:"winratio";s:0:"";s:12:"eventsplayed";s:0:"";s:8:"gameswon";s:0:"";s:9:"xdpointsa";s:0:"";}i:3;a:14:{s:11:"gamesplayed";s:0:"";s:9:"xwinratio";s:0:"";s:9:"xgameswon";s:0:"";s:12:"xgamesplayed";s:0:"";s:7:"xpoints";s:0:"";s:7:"dpoints";s:0:"";s:4:"divx";s:0:"";s:4:"divs";s:0:"";s:4:"divd";s:0:"";s:14:"eightthreefive";s:0:"";s:8:"winratio";s:0:"";s:12:"eventsplayed";s:0:"";s:8:"gameswon";s:0:"";s:9:"xdpointsa";s:0:"";}}}'),
(3655, 769, '_wp_trash_meta_status', 'publish'),
(3656, 769, '_wp_trash_meta_time', '1533578464'),
(3657, 838, '_edit_last', '1'),
(3658, 838, '_edit_lock', '1533583971:1'),
(3659, 838, 'sp_icon', ''),
(3660, 838, 'sp_color', '#111111'),
(3661, 838, 'sp_singular', ''),
(3662, 838, 'sp_section', '-1'),
(3663, 838, 'sp_format', 'number'),
(3664, 838, 'sp_precision', '0'),
(3665, 838, 'sp_timed', '0'),
(3666, 838, 'sp_sendoff', '0'),
(3667, 838, 'sp_visible', '1'),
(3668, 838, 'sp_equation', ''),
(3669, 839, '_edit_last', '1'),
(3670, 839, 'sp_icon', ''),
(3671, 839, 'sp_color', '#111111'),
(3672, 839, 'sp_singular', ''),
(3673, 839, 'sp_section', '-1'),
(3674, 839, 'sp_format', 'number'),
(3675, 839, 'sp_precision', '0'),
(3676, 839, 'sp_timed', '0'),
(3677, 839, 'sp_sendoff', '0'),
(3678, 839, 'sp_visible', '1'),
(3679, 839, 'sp_equation', ''),
(3680, 839, '_edit_lock', '1533587166:1'),
(3681, 840, '_edit_last', '1'),
(3682, 840, 'sp_icon', ''),
(3683, 840, 'sp_color', '#111111'),
(3684, 840, 'sp_singular', ''),
(3685, 840, 'sp_section', '-1'),
(3686, 840, 'sp_format', 'number'),
(3687, 840, 'sp_precision', '0'),
(3688, 840, 'sp_timed', '0'),
(3689, 840, 'sp_sendoff', '0'),
(3690, 840, 'sp_visible', '1'),
(3691, 840, 'sp_equation', ''),
(3692, 840, '_edit_lock', '1534362380:1'),
(3693, 768, '_wp_trash_meta_status', 'publish'),
(3694, 768, '_wp_trash_meta_time', '1533578542'),
(3703, 843, '_edit_last', '1'),
(3704, 843, '_edit_lock', '1533578966:1'),
(3711, 752, '_wp_trash_meta_status', 'publish'),
(3712, 752, '_wp_trash_meta_time', '1533579068'),
(3713, 753, '_wp_trash_meta_status', 'publish'),
(3714, 753, '_wp_trash_meta_time', '1533579081'),
(3715, 844, '_edit_last', '1'),
(3716, 844, 'sp_precision', '0'),
(3717, 844, 'sp_equation', ''),
(3718, 844, '_edit_lock', '1533583935:1'),
(3719, 845, '_edit_last', '1'),
(3720, 845, 'sp_precision', '0'),
(3721, 845, 'sp_equation', ''),
(3722, 845, '_edit_lock', '1533578957:1'),
(3723, 846, '_edit_last', '1'),
(3724, 846, 'sp_precision', '0'),
(3725, 846, 'sp_equation', ''),
(3726, 846, '_edit_lock', '1533578971:1'),
(3727, 847, '_edit_last', '1'),
(3728, 847, 'sp_precision', '0'),
(3729, 847, 'sp_equation', ''),
(3730, 847, '_edit_lock', '1534367422:1'),
(3731, 842, '_wp_trash_meta_status', 'publish'),
(3732, 842, '_wp_trash_meta_time', '1533579378'),
(3733, 841, '_wp_trash_meta_status', 'publish'),
(3734, 841, '_wp_trash_meta_time', '1533579385'),
(3759, 773, '_wp_trash_meta_status', 'publish'),
(3760, 773, '_wp_trash_meta_time', '1533579669'),
(3761, 852, '_edit_last', '1'),
(3762, 852, '_edit_lock', '1534362292:1'),
(3763, 852, 'sp_section', '-1'),
(3764, 852, 'sp_type', 'total'),
(3765, 852, 'sp_format', 'number'),
(3766, 852, 'sp_precision', '0'),
(3767, 852, 'sp_visible', '1'),
(3768, 852, 'sp_equation', '( 1 + 10 - $divd ) * ( $divd != 0 ) * $dgwfor + $dglfor * ( $divd != 0 )'),
(3769, 849, '_wp_trash_meta_status', 'publish'),
(3770, 849, '_wp_trash_meta_time', '1533579907'),
(3771, 850, '_wp_trash_meta_status', 'publish'),
(3772, 850, '_wp_trash_meta_time', '1533579911'),
(3773, 833, '_wp_trash_meta_status', 'publish'),
(3774, 833, '_wp_trash_meta_time', '1533580223'),
(3775, 822, '_wp_trash_meta_status', 'publish'),
(3776, 822, '_wp_trash_meta_time', '1533580251'),
(3777, 822, '_wp_desired_post_slug', 'danum-open-xd'),
(3829, 782, 'sp_current_team', '0'),
(3830, 782, 'sp_current_team', '788'),
(3831, 782, 'sp_past_team', '0'),
(3832, 782, 'sp_team', '0'),
(3833, 782, 'sp_team', '788'),
(3834, 782, 'sp_team', '0'),
(3835, 781, 'sp_current_team', '0'),
(3836, 781, 'sp_current_team', '788'),
(3837, 781, 'sp_past_team', '0'),
(3838, 781, 'sp_team', '0'),
(3839, 781, 'sp_team', '788'),
(3840, 781, 'sp_team', '0'),
(3841, 780, 'sp_current_team', '0'),
(3842, 780, 'sp_past_team', '0'),
(3843, 780, 'sp_past_team', '790'),
(3844, 780, 'sp_team', '0'),
(3845, 780, 'sp_team', '0'),
(3846, 780, 'sp_team', '790'),
(3847, 779, 'sp_current_team', '0'),
(3848, 779, 'sp_current_team', '796'),
(3849, 779, 'sp_past_team', '0'),
(3850, 779, 'sp_team', '0'),
(3851, 779, 'sp_team', '796'),
(3852, 779, 'sp_team', '0'),
(3853, 854, '_edit_last', '1'),
(3854, 854, '_edit_lock', '1534362329:1'),
(3855, 854, 'sp_section', '-1'),
(3856, 854, 'sp_type', 'total'),
(3857, 854, 'sp_format', 'number'),
(3858, 854, 'sp_precision', '0'),
(3859, 854, 'sp_visible', '1'),
(3860, 854, 'sp_equation', '$divx'),
(3873, 855, '_wp_trash_meta_status', 'publish'),
(3874, 855, '_wp_trash_meta_time', '1533581235'),
(3879, 857, '_wp_trash_meta_status', 'publish'),
(3880, 857, '_wp_trash_meta_time', '1533582292'),
(3893, 860, '_edit_last', '1'),
(3894, 860, '_edit_lock', '1533585054:1'),
(3895, 860, 'sp_section', '-1'),
(3896, 860, 'sp_type', 'total'),
(3897, 860, 'sp_format', 'number'),
(3898, 860, 'sp_precision', '0'),
(3899, 860, 'sp_visible', '1'),
(3900, 860, 'sp_equation', '$xgwfor + $xglfor'),
(3901, 861, '_edit_last', '1'),
(3902, 861, '_edit_lock', '1533585103:1'),
(3903, 861, 'sp_section', '-1'),
(3904, 861, 'sp_type', 'total'),
(3905, 861, 'sp_format', 'number'),
(3906, 861, 'sp_precision', '0'),
(3907, 861, 'sp_visible', '1'),
(3908, 861, 'sp_equation', '$xgwfor'),
(3909, 862, '_edit_last', '1'),
(3910, 862, '_edit_lock', '1534362188:1'),
(3911, 862, 'sp_section', '-1'),
(3912, 862, 'sp_type', 'total'),
(3913, 862, 'sp_format', 'number'),
(3914, 862, 'sp_precision', '0'),
(3915, 862, 'sp_visible', '1'),
(3916, 862, 'sp_equation', '$xgwfor / ( $xgwfor + $xglfor ) * 100'),
(3932, 836, 'sp_team', '837'),
(3933, 836, 'sp_player', '0'),
(3934, 836, 'sp_player', '837'),
(3935, 757, '_edit_lock', '1533588430:1'),
(3936, 874, '_edit_last', '1'),
(3937, 874, '_edit_lock', '1534368188:1'),
(3938, 874, 'sp_section', '-1'),
(3939, 874, 'sp_type', 'total'),
(3940, 874, 'sp_format', 'number'),
(3941, 874, 'sp_precision', '0'),
(3942, 874, 'sp_visible', '1'),
(3943, 874, 'sp_equation', '$eventsplayed * ( 1 + 10 ) - $divx * 0'),
(3946, 755, '_edit_lock', '1534364096:1'),
(3947, 837, 'sp_current_team', '796'),
(3948, 837, 'sp_team', '796'),
(3949, 27, 'sp_team', '781'),
(3950, 27, 'sp_team', '780'),
(3951, 27, 'sp_team', '602'),
(3952, 27, 'sp_team', '601'),
(3953, 27, 'sp_team', '783'),
(3954, 27, 'sp_team', '837'),
(3955, 27, 'sp_player', '0'),
(3956, 27, 'sp_player', '781'),
(3957, 27, 'sp_player', '0'),
(3958, 27, 'sp_player', '780'),
(3959, 27, 'sp_player', '0'),
(3960, 27, 'sp_player', '602'),
(3961, 27, 'sp_player', '0'),
(3962, 27, 'sp_player', '601'),
(3963, 27, 'sp_player', '0'),
(3964, 27, 'sp_player', '783'),
(3965, 27, 'sp_player', '0'),
(3966, 27, 'sp_player', '837'),
(3967, 750, '_edit_lock', '1534364582:1'),
(3968, 863, '_wp_trash_meta_status', 'publish'),
(3969, 863, '_wp_trash_meta_time', '1534366966'),
(3970, 875, '_edit_last', '1'),
(3971, 875, 'sp_icon', ''),
(3972, 875, 'sp_color', '#111111'),
(3973, 875, 'sp_singular', ''),
(3974, 875, 'sp_section', '-1'),
(3975, 875, 'sp_format', 'equation'),
(3976, 875, 'sp_precision', '0'),
(3977, 875, 'sp_timed', '0'),
(3978, 875, 'sp_sendoff', '0'),
(3979, 875, 'sp_visible', '1'),
(3980, 875, 'sp_equation', '100'),
(3981, 875, '_edit_lock', '1534368038:1'),
(3982, 876, '_edit_last', '1'),
(3983, 876, 'sp_icon', ''),
(3984, 876, 'sp_color', '#111111'),
(3985, 876, 'sp_singular', ''),
(3986, 876, 'sp_section', '-1'),
(3987, 876, 'sp_format', 'equation'),
(3988, 876, 'sp_precision', '0'),
(3989, 876, 'sp_timed', '1'),
(3990, 876, 'sp_sendoff', '0'),
(3991, 876, 'sp_visible', '1'),
(3992, 876, 'sp_equation', '$divx != 0'),
(3993, 876, '_edit_lock', '1534367064:1'),
(3994, 877, '_edit_last', '1'),
(3995, 877, 'sp_icon', ''),
(3996, 877, 'sp_color', '#111111'),
(3997, 877, 'sp_singular', ''),
(3998, 877, 'sp_section', '-1'),
(3999, 877, 'sp_format', 'equation'),
(4000, 877, 'sp_precision', '0'),
(4001, 877, 'sp_timed', '1'),
(4002, 877, 'sp_sendoff', '0'),
(4003, 877, 'sp_visible', '1'),
(4004, 877, 'sp_equation', '$divs != 0'),
(4005, 877, '_edit_lock', '1534367121:1'),
(4006, 763, '_edit_lock', '1534367474:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-07-28 20:38:49', '2018-07-28 20:38:49', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-07-28 20:38:49', '2018-07-28 20:38:49', '', 0, 'http://localhost:8080/brank/?p=1', 0, 'post', '', 1),
(2, 1, '2018-07-28 20:38:49', '2018-07-28 20:38:49', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost:8080/brank/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-07-28 20:38:49', '2018-07-28 20:38:49', '', 0, 'http://localhost:8080/brank/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-07-28 20:38:49', '2018-07-28 20:38:49', '<h2>Who we are</h2><p>Our website address is: http://localhost:8080/brank.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2018-07-28 20:38:49', '2018-07-28 20:38:49', '', 0, 'http://localhost:8080/brank/?page_id=3', 0, 'page', '', 0),
(27, 1, '2018-08-05 21:13:05', '2018-08-05 21:13:05', '', 'Danum open', '', 'publish', 'closed', 'closed', '', 'danum-open', '', '', '2018-08-15 20:24:29', '2018-08-15 20:24:29', '', 0, 'http://localhost:8080/brank/?post_type=sp_event&#038;p=27', 0, 'sp_event', '', 0),
(29, 1, '2018-08-05 19:47:14', '2018-08-05 19:47:14', '', 'Pawel', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2018-08-05 19:47:14', '2018-08-05 19:47:14', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=29', 0, 'sp_player', '', 0),
(404, 1, '2018-08-05 20:43:04', '2018-08-05 20:43:04', '', 'Walkover', '', 'publish', 'closed', 'closed', '', 'walkover', '', '', '2018-08-05 20:47:25', '2018-08-05 20:47:25', '', 0, 'http://localhost:8080/brank/index.php/sp_outcome/walkover/', 30, 'sp_outcome', '', 0),
(593, 1, '2018-08-05 21:11:08', '2018-08-05 21:11:08', '', 'Points', '', 'publish', 'closed', 'closed', '', 'points', '', '', '2018-08-05 22:50:50', '2018-08-05 22:50:50', '', 0, 'http://localhost:8080/brank/index.php/sp_column/points/', 50, 'sp_column', '', 0),
(601, 1, '2018-08-05 21:13:56', '2018-08-05 21:13:56', '', 'Pawel', '', 'publish', 'closed', 'closed', '', 'pawel', '', '', '2018-08-06 17:50:19', '2018-08-06 17:50:19', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=601', 0, 'sp_player', '', 0),
(602, 1, '2018-08-05 21:14:06', '2018-08-05 21:14:06', '', 'Mike', '', 'publish', 'closed', 'closed', '', 'mike', '', '', '2018-08-06 13:37:29', '2018-08-06 13:37:29', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=602', 0, 'sp_player', '', 0),
(604, 1, '2018-08-06 13:36:07', '2018-08-06 13:36:07', '', 'MD Rank A', '', 'publish', 'closed', 'closed', '', 'md-rank-a', '', '', '2018-08-06 13:36:07', '2018-08-06 13:36:07', '', 0, 'http://localhost:8080/brank/?post_type=sp_table&#038;p=604', 0, 'sp_table', '', 0),
(661, 1, '2018-08-05 22:06:44', '2018-08-05 22:06:44', '', 'gains', '', 'publish', 'closed', 'closed', '', 'gains', '', '', '2018-08-05 22:06:44', '2018-08-05 22:06:44', '', 0, 'http://localhost:8080/brank/?post_type=sp_column&#038;p=661', 0, 'sp_column', '', 0),
(750, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Win', '', 'publish', 'closed', 'closed', '', 'win', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_outcome/win/', 10, 'sp_outcome', '', 0),
(751, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Loss', '', 'publish', 'closed', 'closed', '', 'loss', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_outcome/loss/', 20, 'sp_outcome', '', 0),
(755, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'T', 'Events played', 'publish', 'closed', 'closed', '', 't', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_column/t/', 10, 'sp_column', '', 0),
(756, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'G', 'Games played', 'publish', 'closed', 'closed', '', 'g', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_column/g/', 20, 'sp_column', '', 0),
(757, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'W', 'Wins', 'publish', 'closed', 'closed', '', 'w', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_column/w/', 30, 'sp_column', '', 0),
(758, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'L', 'Losses', 'publish', 'closed', 'closed', '', 'l', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_column/l/', 40, 'sp_column', '', 0),
(759, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', '%', 'Wins ratio', 'publish', 'closed', 'closed', '', 'percent', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_column/percent/', 50, 'sp_column', '', 0),
(760, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Height', 'Player height', 'publish', 'closed', 'closed', '', 'height', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_metric/height/', 20, 'sp_metric', '', 0),
(761, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Club', 'Player club', 'publish', 'closed', 'closed', '', 'club', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_metric/club/', 40, 'sp_metric', '', 0),
(762, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Play R or L', 'Play R or L', 'publish', 'closed', 'closed', '', 'playrorl', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_metric/playrorl/', 60, 'sp_metric', '', 0),
(763, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Grade', 'Grade', 'publish', 'closed', 'closed', '', 'grade', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_metric/grade/', 80, 'sp_metric', '', 0),
(764, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Gender', 'Gender', 'publish', 'closed', 'closed', '', 'gender', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_metric/gender/', 100, 'sp_metric', '', 0),
(765, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Win Factor', 'Win Factor', 'publish', 'closed', 'closed', '', 'winfactor', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_spec/winfactor/', 70, 'sp_spec', '', 0),
(766, 1, '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 'Lost Factor', 'Lost Factor', 'publish', 'closed', 'closed', '', 'lostfactor', '', '', '2018-08-05 22:30:02', '2018-08-05 22:30:02', '', 0, 'http://localhost:8080/brank/index.php/sp_spec/lostfactor/', 90, 'sp_spec', '', 0),
(770, 1, '2018-08-05 22:49:07', '0000-00-00 00:00:00', '', 'gain', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-08-05 22:49:07', '2018-08-05 22:49:07', '', 0, 'http://localhost:8080/brank/?post_type=sp_result&#038;p=770', 0, 'sp_result', '', 0),
(774, 1, '2018-08-05 23:00:59', '2018-08-05 23:00:59', 'Points = Games won * (11 - div) + Games lost', 'Mens Doubles Rank', '', 'publish', 'closed', 'closed', '', 'basic-rank', '', '', '2018-08-06 18:53:39', '2018-08-06 18:53:39', '', 0, 'http://localhost:8080/brank/?post_type=sp_list&#038;p=774', 0, 'sp_list', '', 0),
(779, 1, '2018-08-06 13:12:14', '2018-08-06 13:12:14', '', 'Shon', '', 'publish', 'closed', 'closed', '', 'shon', '', '', '2018-08-06 18:39:20', '2018-08-06 18:39:20', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=779', 0, 'sp_player', '', 0),
(780, 1, '2018-08-06 13:12:25', '2018-08-06 13:12:25', '', 'Mick', '', 'publish', 'closed', 'closed', '', 'mick', '', '', '2018-08-06 18:39:11', '2018-08-06 18:39:11', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=780', 0, 'sp_player', '', 0),
(781, 1, '2018-08-06 13:12:43', '2018-08-06 13:12:43', '', 'Conal', '', 'publish', 'closed', 'closed', '', 'conal', '', '', '2018-08-06 18:39:05', '2018-08-06 18:39:05', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=781', 0, 'sp_player', '', 0),
(782, 1, '2018-08-06 13:12:52', '2018-08-06 13:12:52', '', 'Gopi', '', 'publish', 'closed', 'closed', '', 'gopi', '', '', '2018-08-06 18:38:58', '2018-08-06 18:38:58', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=782', 0, 'sp_player', '', 0),
(783, 1, '2018-08-06 13:13:11', '2018-08-06 13:13:11', '', 'Suresh', '', 'publish', 'closed', 'closed', '', 'suresh', '', '', '2018-08-06 17:50:05', '2018-08-06 17:50:05', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=783', 0, 'sp_player', '', 0),
(788, 1, '2018-08-06 13:24:51', '2018-08-06 13:24:51', '', 'An Caislean Nua', '', 'publish', 'closed', 'closed', '', 'an-caislean-nua', '', '', '2018-08-06 13:24:51', '2018-08-06 13:24:51', '', 0, 'http://localhost:8080/brank/?post_type=sp_team&#038;p=788', 0, 'sp_team', '', 0),
(789, 1, '2018-08-06 13:25:31', '2018-08-06 13:25:31', '', 'Saint Raphaels', '', 'publish', 'closed', 'closed', '', 'saint-raphaels', '', '', '2018-08-06 13:25:31', '2018-08-06 13:25:31', '', 0, 'http://localhost:8080/brank/?post_type=sp_team&#038;p=789', 0, 'sp_team', '', 0),
(790, 1, '2018-08-06 13:26:10', '2018-08-06 13:26:10', '', 'Sheriff', '', 'publish', 'closed', 'closed', '', 'sheriff', '', '', '2018-08-06 13:26:10', '2018-08-06 13:26:10', '', 0, 'http://localhost:8080/brank/?post_type=sp_team&#038;p=790', 0, 'sp_team', '', 0),
(796, 1, '2018-08-06 13:34:51', '2018-08-06 13:34:51', '', 'NA', '', 'publish', 'closed', 'closed', '', 'na', '', '', '2018-08-06 13:34:51', '2018-08-06 13:34:51', '', 0, 'http://localhost:8080/brank/?post_type=sp_team&#038;p=796', 0, 'sp_team', '', 0),
(798, 1, '2018-08-06 13:40:43', '2018-08-06 13:40:43', '', 'DGames played', '', 'publish', 'closed', 'closed', '', 'gamesplayed', '', '', '2018-08-06 18:28:06', '2018-08-06 18:28:06', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=798', 0, 'sp_statistic', '', 0),
(799, 1, '2018-08-06 13:41:18', '2018-08-06 13:41:18', '', 'DGames won', '', 'publish', 'closed', 'closed', '', 'gameswon', '', '', '2018-08-06 18:28:24', '2018-08-06 18:28:24', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=799', 0, 'sp_statistic', '', 0),
(800, 1, '2018-08-06 13:41:51', '2018-08-06 13:41:51', '', 'Events played', '', 'publish', 'closed', 'closed', '', 'eventsplayed', '', '', '2018-08-06 13:41:51', '2018-08-06 13:41:51', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=800', 0, 'sp_statistic', '', 0),
(801, 1, '2018-08-06 13:44:07', '2018-08-06 13:44:07', '', 'DWin ratio', '', 'publish', 'closed', 'closed', '', 'winratio', '', '', '2018-08-06 18:56:19', '2018-08-06 18:56:19', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=801', 0, 'sp_statistic', '', 0),
(812, 1, '2018-08-06 13:55:02', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-08-06 13:55:02', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/brank/?p=812', 1, 'nav_menu_item', '', 0),
(813, 1, '2018-08-06 13:55:02', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-08-06 13:55:02', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/brank/?p=813', 1, 'nav_menu_item', '', 0),
(814, 1, '2018-08-06 13:55:46', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-08-06 13:55:46', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/brank/?p=814', 1, 'nav_menu_item', '', 0),
(815, 1, '2018-08-06 13:55:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-08-06 13:55:46', '0000-00-00 00:00:00', '', 0, 'http://localhost:8080/brank/?p=815', 1, 'nav_menu_item', '', 0),
(816, 1, '2018-08-06 13:57:10', '2018-08-06 13:57:10', '{\n    "themeboy[content_width]": {\n        "value": "1000",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-08-06 13:57:10"\n    },\n    "themeboy[sidebar]": {\n        "value": "no",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-08-06 13:57:10"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '9ab2ba54-d287-42d3-87cc-192b08e16efe', '', '', '2018-08-06 13:57:10', '2018-08-06 13:57:10', '', 0, 'http://localhost:8080/brank/index.php/2018/08/06/9ab2ba54-d287-42d3-87cc-192b08e16efe/', 0, 'customize_changeset', '', 0),
(822, 1, '2018-08-06 17:12:40', '2018-08-06 17:12:40', '', 'Danum open XD', '', 'trash', 'closed', 'closed', '', 'danum-open-xd__trashed', '', '', '2018-08-06 18:30:51', '2018-08-06 18:30:51', '', 0, 'http://localhost:8080/brank/?post_type=sp_event&#038;p=822', 0, 'sp_event', '', 0),
(823, 1, '2018-08-06 17:14:00', '2018-08-06 17:14:00', '', 'Mixed rank', '', 'publish', 'closed', 'closed', '', 'mixed-rank', '', '', '2018-08-15 20:06:34', '2018-08-15 20:06:34', '', 0, 'http://localhost:8080/brank/?post_type=sp_list&#038;p=823', 0, 'sp_list', '', 0),
(832, 1, '2018-08-06 17:34:14', '0000-00-00 00:00:00', '', 'xdc', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-08-06 17:34:14', '2018-08-06 17:34:14', '', 0, 'http://localhost:8080/brank/?post_type=sp_result&#038;p=832', 0, 'sp_result', '', 0),
(835, 1, '2018-08-06 17:36:28', '2018-08-06 17:36:28', '', 'evxdc', '', 'publish', 'closed', 'closed', '', 'eightthreefive', '', '', '2018-08-06 18:30:05', '2018-08-06 18:30:05', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=835', 0, 'sp_statistic', '', 0),
(836, 1, '2018-08-06 17:40:13', '2018-08-06 17:40:13', '', 'over 30 xd', '', 'publish', 'closed', 'closed', '', 'over-30-xd', '', '', '2018-08-06 20:22:24', '2018-08-06 20:22:24', '', 0, 'http://localhost:8080/brank/?post_type=sp_event&#038;p=836', 0, 'sp_event', '', 0),
(837, 1, '2018-08-06 17:51:05', '2018-08-06 17:51:05', '', 'Viki', '', 'publish', 'closed', 'closed', '', 'viki', '', '', '2018-08-15 20:20:29', '2018-08-15 20:20:29', '', 0, 'http://localhost:8080/brank/?post_type=sp_player&#038;p=837', 0, 'sp_player', '', 0),
(838, 1, '2018-08-06 18:01:28', '2018-08-06 18:01:28', '', 'divd', '', 'publish', 'closed', 'closed', '', 'divd', '', '', '2018-08-06 19:35:02', '2018-08-06 19:35:02', '', 0, 'http://localhost:8080/brank/?post_type=sp_performance&#038;p=838', 0, 'sp_performance', '', 0),
(839, 1, '2018-08-06 18:01:41', '2018-08-06 18:01:41', '', 'divs', '', 'publish', 'closed', 'closed', '', 'divs', '', '', '2018-08-06 20:28:20', '2018-08-06 20:28:20', '', 0, 'http://localhost:8080/brank/?post_type=sp_performance&#038;p=839', 0, 'sp_performance', '', 0),
(840, 1, '2018-08-06 18:01:51', '2018-08-06 18:01:51', '', 'divx', '', 'publish', 'closed', 'closed', '', 'divx', '', '', '2018-08-06 19:35:29', '2018-08-06 19:35:29', '', 0, 'http://localhost:8080/brank/?post_type=sp_performance&#038;p=840', 0, 'sp_performance', '', 0),
(843, 1, '2018-08-06 18:09:26', '0000-00-00 00:00:00', '', 'dgw', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-08-06 18:09:26', '2018-08-06 18:09:26', '', 0, 'http://localhost:8080/brank/?post_type=sp_result&#038;p=843', 0, 'sp_result', '', 0),
(844, 1, '2018-08-06 18:11:29', '2018-08-06 18:11:29', '', 'dgw', '', 'publish', 'closed', 'closed', '', 'dgw', '', '', '2018-08-06 18:11:29', '2018-08-06 18:11:29', '', 0, 'http://localhost:8080/brank/?post_type=sp_result&#038;p=844', 0, 'sp_result', '', 0),
(845, 1, '2018-08-06 18:11:39', '2018-08-06 18:11:39', '', 'dgl', '', 'publish', 'closed', 'closed', '', 'dgl', '', '', '2018-08-06 18:11:39', '2018-08-06 18:11:39', '', 0, 'http://localhost:8080/brank/?post_type=sp_result&#038;p=845', 0, 'sp_result', '', 0),
(846, 1, '2018-08-06 18:11:54', '2018-08-06 18:11:54', '', 'xgw', '', 'publish', 'closed', 'closed', '', 'xgw', '', '', '2018-08-06 18:11:54', '2018-08-06 18:11:54', '', 0, 'http://localhost:8080/brank/?post_type=sp_result&#038;p=846', 0, 'sp_result', '', 0),
(847, 1, '2018-08-06 18:12:01', '2018-08-06 18:12:01', '', 'xgl', '', 'publish', 'closed', 'closed', '', 'xgl', '', '', '2018-08-06 18:12:01', '2018-08-06 18:12:01', '', 0, 'http://localhost:8080/brank/?post_type=sp_result&#038;p=847', 0, 'sp_result', '', 0),
(852, 1, '2018-08-06 18:24:42', '2018-08-06 18:24:42', '', 'DPoints', '', 'publish', 'closed', 'closed', '', 'dpoints', '', '', '2018-08-06 19:07:42', '2018-08-06 19:07:42', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=852', 0, 'sp_statistic', '', 0),
(854, 1, '2018-08-06 18:42:33', '2018-08-06 18:42:33', '', 'XDPoints', '', 'publish', 'closed', 'closed', '', 'xpoints', '', '', '2018-08-06 20:03:13', '2018-08-06 20:03:13', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=854', 0, 'sp_statistic', '', 0),
(860, 1, '2018-08-06 19:53:16', '2018-08-06 19:53:16', '', 'XGames played', '', 'publish', 'closed', 'closed', '', 'xgamesplayed', '', '', '2018-08-06 19:53:16', '2018-08-06 19:53:16', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=860', 0, 'sp_statistic', '', 0),
(861, 1, '2018-08-06 19:54:04', '2018-08-06 19:54:04', '', 'XGames won', '', 'publish', 'closed', 'closed', '', 'xgameswon', '', '', '2018-08-06 19:54:04', '2018-08-06 19:54:04', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=861', 0, 'sp_statistic', '', 0),
(862, 1, '2018-08-06 19:55:06', '2018-08-06 19:55:06', '', 'XWin ratio', '', 'publish', 'closed', 'closed', '', 'xwinratio', '', '', '2018-08-06 19:55:06', '2018-08-06 19:55:06', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=862', 0, 'sp_statistic', '', 0),
(874, 1, '2018-08-15 19:58:32', '2018-08-15 19:58:32', '', 'xdpointsA', '', 'publish', 'closed', 'closed', '', 'xdpointsa', '', '', '2018-08-15 20:26:55', '2018-08-15 20:26:55', '', 0, 'http://localhost:8080/brank/?post_type=sp_statistic&#038;p=874', 0, 'sp_statistic', '', 0),
(875, 1, '2018-08-15 21:03:11', '2018-08-15 21:03:11', '', 'dc', '', 'publish', 'closed', 'closed', '', 'dc', '', '', '2018-08-15 21:23:00', '2018-08-15 21:23:00', '', 0, 'http://localhost:8080/brank/?post_type=sp_performance&#038;p=875', 0, 'sp_performance', '', 0),
(876, 1, '2018-08-15 21:03:25', '2018-08-15 21:03:25', '', 'xc', '', 'publish', 'closed', 'closed', '', 'xc', '', '', '2018-08-15 21:06:15', '2018-08-15 21:06:15', '', 0, 'http://localhost:8080/brank/?post_type=sp_performance&#038;p=876', 0, 'sp_performance', '', 0),
(877, 1, '2018-08-15 21:03:32', '2018-08-15 21:03:32', '', 'sc', '', 'publish', 'closed', 'closed', '', 'sc', '', '', '2018-08-15 21:07:42', '2018-08-15 21:07:42', '', 0, 'http://localhost:8080/brank/?post_type=sp_performance&#038;p=877', 0, 'sp_performance', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(42, 50, 'sp_order', '0'),
(43, 51, 'sp_order', '0'),
(44, 52, 'sp_order', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Primary League', 'primary-league', 0),
(3, '2018', '2018', 0),
(45, 'MD', 'md', 0),
(46, 'WD', 'wd', 0),
(47, 'MS', 'ms', 0),
(48, 'WS', 'ws', 0),
(49, 'XD', 'xd', 0),
(50, 'Any', 'any', 0),
(51, 'Men', 'men', 0),
(52, 'Woman', 'woman', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(27, 3, 0),
(601, 45, 0),
(601, 49, 0),
(601, 51, 0),
(774, 51, 0),
(779, 51, 0),
(780, 51, 0),
(781, 51, 0),
(782, 51, 0),
(783, 45, 0),
(783, 49, 0),
(783, 51, 0),
(822, 49, 0),
(837, 46, 0),
(837, 49, 0),
(837, 52, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'sp_league', '', 0, 0),
(3, 3, 'sp_season', '', 0, 1),
(45, 45, 'sp_league', '', 2, 2),
(46, 46, 'sp_league', '', 2, 1),
(47, 47, 'sp_league', '', 2, 0),
(48, 48, 'sp_league', '', 2, 0),
(49, 49, 'sp_league', '', 2, 3),
(50, 50, 'sp_position', '', 0, 0),
(51, 51, 'sp_position', '', 50, 7),
(52, 52, 'sp_position', '', 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy,theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:"01231808c567e49d1e3401cbc78dcb2129b37afb5ba05ffc7f7bab6f16681e0c";a:4:{s:10:"expiration";i:1534532282;s:2:"ip";s:3:"::1";s:2:"ua";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36";s:5:"login";i:1534359482;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '868'),
(18, 1, 'closedpostboxes_sp_spec', 'a:0:{}'),
(19, 1, 'metaboxhidden_sp_spec', 'a:1:{i:0;s:7:"slugdiv";}'),
(20, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(21, 1, 'metaboxhidden_nav-menus', 'a:9:{i:0;s:22:"add-post-type-sp_event";i:1;s:21:"add-post-type-sp_team";i:2;s:23:"add-post-type-sp_player";i:3;s:22:"add-post-type-sp_staff";i:4;s:25:"add-post-type-sp_calendar";i:5;s:22:"add-post-type-sp_table";i:6;s:21:"add-post-type-sp_list";i:7;s:12:"add-post_tag";i:8;s:15:"add-post_format";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BVFoXTU3nZCsRKyINKU8m5QUdGfjbl.', 'admin', 'dubliner.stephen+brank@gmai.com', '', '2018-07-28 20:38:49', '', 0, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1967;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4007;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=878;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
