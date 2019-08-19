-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2019 at 04:16 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voyager`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `creator`, `url`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hello World  Book', 'Dr. Professor', '[{\"download_link\":\"books\\\\March2019\\\\gROMpcOGXfAcemZ9Py8E.pdf\",\"original_name\":\"daleel.pdf\"}]', NULL, '2019-03-02 19:53:17', '2019-03-02 19:53:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `cover_image`, `parent_id`, `created_at`, `updated_at`, `deleted_at`, `creator_id`) VALUES
(1, 'Computer Science', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. Phasellus ante pellentesque erat cum risus consequat imperdiet aliquam, integer placerat et turpis mi eros nec lobortis taciti, vehicula nisl litora tellus ligula porttitor metus.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Vivamus integer non suscipit taciti mus etiam at primis tempor sagittis sit, euismod libero facilisi aptent elementum felis blandit cursus gravida sociis erat ante, eleifend lectus nullam dapibus netus feugiat curae curabitur est ad. Massa curae fringilla porttitor quam sollicitudin iaculis aptent leo ligula euismod dictumst, orci penatibus mauris eros etiam praesent erat volutpat posuere hac. Metus fringilla nec ullamcorper odio aliquam lacinia conubia mauris tempor, etiam ultricies proin quisque lectus sociis id tristique, integer phasellus taciti pretium adipiscing tortor sagittis ligula.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Mollis pretium lorem primis senectus habitasse lectus scelerisque donec, ultricies tortor suspendisse adipiscing fusce morbi volutpat pellentesque, consectetur mi risus molestie curae malesuada cum. Dignissim lacus convallis massa mauris enim ad mattis magnis senectus montes, mollis taciti phasellus accumsan bibendum semper blandit suspendisse faucibus nibh est, metus lobortis morbi cras magna vivamus per risus fermentum. Dapibus imperdiet praesent magnis ridiculus congue gravida curabitur dictum sagittis, enim et magna sit inceptos sodales parturient pharetra mollis, aenean vel nostra tellus commodo pretium sapien sociosqu.</p>', NULL, NULL, '2019-02-28 17:04:26', '2019-03-01 10:36:51', NULL, 1),
(2, 'Mathematics', '<h1>Mathematics</h1>', 'categories\\March2019\\XfoEQxuQNsfd2hwZZo56.jpg', 1, '2019-03-01 11:18:32', '2019-03-01 11:18:32', NULL, 1),
(3, 'Computer Science', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. Phasellus ante pellentesque erat cum risus consequat imperdiet aliquam, integer placerat et turpis mi eros nec lobortis taciti, vehicula nisl litora tellus ligula porttitor metus.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Vivamus integer non suscipit taciti mus etiam at primis tempor sagittis sit, euismod libero facilisi aptent elementum felis blandit cursus gravida sociis erat ante, eleifend lectus nullam dapibus netus feugiat curae curabitur est ad. Massa curae fringilla porttitor quam sollicitudin iaculis aptent leo ligula euismod dictumst, orci penatibus mauris eros etiam praesent erat volutpat posuere hac. Metus fringilla nec ullamcorper odio aliquam lacinia conubia mauris tempor, etiam ultricies proin quisque lectus sociis id tristique, integer phasellus taciti pretium adipiscing tortor sagittis ligula.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Mollis pretium lorem primis senectus habitasse lectus scelerisque donec, ultricies tortor suspendisse adipiscing fusce morbi volutpat pellentesque, consectetur mi risus molestie curae malesuada cum. Dignissim lacus convallis massa mauris enim ad mattis magnis senectus montes, mollis taciti phasellus accumsan bibendum semper blandit suspendisse faucibus nibh est, metus lobortis morbi cras magna vivamus per risus fermentum. Dapibus imperdiet praesent magnis ridiculus congue gravida curabitur dictum sagittis, enim et magna sit inceptos sodales parturient pharetra mollis, aenean vel nostra tellus commodo pretium sapien sociosqu.</p>', NULL, NULL, '2019-02-28 17:04:26', '2019-03-01 10:36:51', NULL, 1),
(4, 'Mathematics', '<h1>Mathematics</h1>', 'categories\\March2019\\XfoEQxuQNsfd2hwZZo56.jpg', 1, '2019-03-01 11:18:32', '2019-03-01 11:18:32', NULL, 1),
(5, 'Computer Science', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. Phasellus ante pellentesque erat cum risus consequat imperdiet aliquam, integer placerat et turpis mi eros nec lobortis taciti, vehicula nisl litora tellus ligula porttitor metus.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Vivamus integer non suscipit taciti mus etiam at primis tempor sagittis sit, euismod libero facilisi aptent elementum felis blandit cursus gravida sociis erat ante, eleifend lectus nullam dapibus netus feugiat curae curabitur est ad. Massa curae fringilla porttitor quam sollicitudin iaculis aptent leo ligula euismod dictumst, orci penatibus mauris eros etiam praesent erat volutpat posuere hac. Metus fringilla nec ullamcorper odio aliquam lacinia conubia mauris tempor, etiam ultricies proin quisque lectus sociis id tristique, integer phasellus taciti pretium adipiscing tortor sagittis ligula.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Mollis pretium lorem primis senectus habitasse lectus scelerisque donec, ultricies tortor suspendisse adipiscing fusce morbi volutpat pellentesque, consectetur mi risus molestie curae malesuada cum. Dignissim lacus convallis massa mauris enim ad mattis magnis senectus montes, mollis taciti phasellus accumsan bibendum semper blandit suspendisse faucibus nibh est, metus lobortis morbi cras magna vivamus per risus fermentum. Dapibus imperdiet praesent magnis ridiculus congue gravida curabitur dictum sagittis, enim et magna sit inceptos sodales parturient pharetra mollis, aenean vel nostra tellus commodo pretium sapien sociosqu.</p>', NULL, NULL, '2019-02-28 17:04:26', '2019-03-01 10:36:51', NULL, 1),
(6, 'Mathematics', '<h1>Mathematics</h1>', 'categories\\March2019\\XfoEQxuQNsfd2hwZZo56.jpg', 1, '2019-03-01 11:18:32', '2019-03-01 11:18:32', NULL, 1),
(7, 'Computer Science', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. Phasellus ante pellentesque erat cum risus consequat imperdiet aliquam, integer placerat et turpis mi eros nec lobortis taciti, vehicula nisl litora tellus ligula porttitor metus.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Vivamus integer non suscipit taciti mus etiam at primis tempor sagittis sit, euismod libero facilisi aptent elementum felis blandit cursus gravida sociis erat ante, eleifend lectus nullam dapibus netus feugiat curae curabitur est ad. Massa curae fringilla porttitor quam sollicitudin iaculis aptent leo ligula euismod dictumst, orci penatibus mauris eros etiam praesent erat volutpat posuere hac. Metus fringilla nec ullamcorper odio aliquam lacinia conubia mauris tempor, etiam ultricies proin quisque lectus sociis id tristique, integer phasellus taciti pretium adipiscing tortor sagittis ligula.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Mollis pretium lorem primis senectus habitasse lectus scelerisque donec, ultricies tortor suspendisse adipiscing fusce morbi volutpat pellentesque, consectetur mi risus molestie curae malesuada cum. Dignissim lacus convallis massa mauris enim ad mattis magnis senectus montes, mollis taciti phasellus accumsan bibendum semper blandit suspendisse faucibus nibh est, metus lobortis morbi cras magna vivamus per risus fermentum. Dapibus imperdiet praesent magnis ridiculus congue gravida curabitur dictum sagittis, enim et magna sit inceptos sodales parturient pharetra mollis, aenean vel nostra tellus commodo pretium sapien sociosqu.</p>', NULL, NULL, '2019-02-28 17:04:26', '2019-03-01 10:36:51', NULL, 1),
(8, 'Mathematics', '<h1>Mathematics</h1>', 'categories\\March2019\\XfoEQxuQNsfd2hwZZo56.jpg', 1, '2019-03-01 11:18:32', '2019-03-01 11:18:32', NULL, 1),
(9, 'Computer Science', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. Phasellus ante pellentesque erat cum risus consequat imperdiet aliquam, integer placerat et turpis mi eros nec lobortis taciti, vehicula nisl litora tellus ligula porttitor metus.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Vivamus integer non suscipit taciti mus etiam at primis tempor sagittis sit, euismod libero facilisi aptent elementum felis blandit cursus gravida sociis erat ante, eleifend lectus nullam dapibus netus feugiat curae curabitur est ad. Massa curae fringilla porttitor quam sollicitudin iaculis aptent leo ligula euismod dictumst, orci penatibus mauris eros etiam praesent erat volutpat posuere hac. Metus fringilla nec ullamcorper odio aliquam lacinia conubia mauris tempor, etiam ultricies proin quisque lectus sociis id tristique, integer phasellus taciti pretium adipiscing tortor sagittis ligula.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Mollis pretium lorem primis senectus habitasse lectus scelerisque donec, ultricies tortor suspendisse adipiscing fusce morbi volutpat pellentesque, consectetur mi risus molestie curae malesuada cum. Dignissim lacus convallis massa mauris enim ad mattis magnis senectus montes, mollis taciti phasellus accumsan bibendum semper blandit suspendisse faucibus nibh est, metus lobortis morbi cras magna vivamus per risus fermentum. Dapibus imperdiet praesent magnis ridiculus congue gravida curabitur dictum sagittis, enim et magna sit inceptos sodales parturient pharetra mollis, aenean vel nostra tellus commodo pretium sapien sociosqu.</p>', NULL, NULL, '2019-02-28 17:04:26', '2019-03-01 10:36:51', NULL, 1),
(10, 'Mathematics', '<h1>Mathematics</h1>', 'categories\\March2019\\XfoEQxuQNsfd2hwZZo56.jpg', 1, '2019-03-01 11:18:32', '2019-03-01 11:18:32', NULL, 1),
(11, 'Computer Science', '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. Phasellus ante pellentesque erat cum risus consequat imperdiet aliquam, integer placerat et turpis mi eros nec lobortis taciti, vehicula nisl litora tellus ligula porttitor metus.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Vivamus integer non suscipit taciti mus etiam at primis tempor sagittis sit, euismod libero facilisi aptent elementum felis blandit cursus gravida sociis erat ante, eleifend lectus nullam dapibus netus feugiat curae curabitur est ad. Massa curae fringilla porttitor quam sollicitudin iaculis aptent leo ligula euismod dictumst, orci penatibus mauris eros etiam praesent erat volutpat posuere hac. Metus fringilla nec ullamcorper odio aliquam lacinia conubia mauris tempor, etiam ultricies proin quisque lectus sociis id tristique, integer phasellus taciti pretium adipiscing tortor sagittis ligula.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Mollis pretium lorem primis senectus habitasse lectus scelerisque donec, ultricies tortor suspendisse adipiscing fusce morbi volutpat pellentesque, consectetur mi risus molestie curae malesuada cum. Dignissim lacus convallis massa mauris enim ad mattis magnis senectus montes, mollis taciti phasellus accumsan bibendum semper blandit suspendisse faucibus nibh est, metus lobortis morbi cras magna vivamus per risus fermentum. Dapibus imperdiet praesent magnis ridiculus congue gravida curabitur dictum sagittis, enim et magna sit inceptos sodales parturient pharetra mollis, aenean vel nostra tellus commodo pretium sapien sociosqu.</p>', NULL, NULL, '2019-02-28 17:04:26', '2019-03-01 10:36:51', NULL, 1),
(12, 'Mathematics', '<h1>Mathematics</h1>', 'categories\\March2019\\XfoEQxuQNsfd2hwZZo56.jpg', 1, '2019-03-01 11:18:32', '2019-03-01 11:18:32', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `description`, `creator_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CSED 2021', NULL, 2, '2019-03-02 21:36:03', '2019-03-02 21:36:03', NULL),
(3, 'CSED 2022', NULL, 2, '2019-03-03 01:13:38', '2019-03-03 01:13:38', NULL),
(4, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:24:44', '2019-08-15 07:24:44', NULL),
(5, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:25:34', '2019-08-15 07:25:34', NULL),
(6, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:27:30', '2019-08-15 07:27:30', NULL),
(7, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:28:35', '2019-08-15 07:28:35', NULL),
(8, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:30:08', '2019-08-15 07:30:08', NULL),
(9, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:30:10', '2019-08-15 07:30:10', NULL),
(10, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:31:45', '2019-08-15 07:31:45', NULL),
(11, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:32:38', '2019-08-15 07:32:38', NULL),
(12, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:33:10', '2019-08-15 07:33:10', NULL),
(13, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:34:27', '2019-08-15 07:34:27', NULL),
(14, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:35:57', '2019-08-15 07:35:57', NULL),
(15, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:36:50', '2019-08-15 07:36:50', NULL),
(16, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:40:19', '2019-08-15 07:40:19', NULL),
(17, 'Hello world', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', NULL, '2019-08-15 07:40:32', '2019-08-15 07:40:32', NULL),
(18, 'Hello', '-	E.g. a User has many Roles and each Role belongsTo many Users \r\n-	That happens using intermediate table', 2, '2019-08-15 07:41:34', '2019-08-15 08:11:02', NULL),
(19, 'Hello world', NULL, 2, '2019-08-17 15:27:05', '2019-08-17 15:27:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `channels_admins`
--

CREATE TABLE `channels_admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels_admins`
--

INSERT INTO `channels_admins` (`id`, `student_id`, `channel_id`, `created_at`) VALUES
(1, 2, 1, NULL),
(2, 3, 1, NULL),
(3, 1, 2, NULL),
(4, 2, 2, NULL),
(5, 2, 13, NULL),
(6, 2, 15, NULL),
(7, 2, 16, NULL),
(8, 2, 17, NULL),
(9, 2, 18, NULL),
(10, 2, 19, NULL),
(11, 3, 1, NULL),
(12, 3, 1, NULL),
(15, 2, 19, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `channels_notifications`
--

CREATE TABLE `channels_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `media_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels_notifications`
--

INSERT INTO `channels_notifications` (`id`, `content`, `media_url`, `media_type`, `creator_id`, `channel_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hello Everyone', '[{\"download_link\":\"channels-notifications\\\\March2019\\\\JfYtBwTlSTAX83RTek5q.png\",\"original_name\":\"cookbook_app_ui_design_tubik_2x.png\"}]', 1, 1, 1, '2019-03-03 01:31:08', '2019-03-03 01:31:08', NULL),
(2, 'Quia beatae consequa', NULL, 1, 3, 1, '2019-08-15 04:58:03', '2019-08-15 04:58:03', NULL),
(3, 'Quia beatae consequa', NULL, 1, 3, 1, '2019-08-15 04:58:03', '2019-08-15 04:58:03', NULL),
(4, 'Hello world', NULL, NULL, 2, NULL, '2019-08-18 23:00:13', '2019-08-18 23:00:13', NULL),
(5, 'Hello world', NULL, NULL, 2, 1, '2019-08-18 23:01:03', '2019-08-18 23:01:03', NULL),
(6, 'Hello world', NULL, NULL, 2, 1, '2019-08-18 23:01:39', '2019-08-18 23:01:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `channels_subscribers`
--

CREATE TABLE `channels_subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels_subscribers`
--

INSERT INTO `channels_subscribers` (`id`, `channel_id`, `student_id`, `created_at`) VALUES
(1, 1, 2, NULL),
(2, 1, 3, NULL),
(3, 2, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `reciever_id` int(11) DEFAULT NULL,
  `accept` tinyint(4) DEFAULT '0',
  `block` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `blocker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `connections`
--

INSERT INTO `connections` (`id`, `sender_id`, `reciever_id`, `accept`, `block`, `created_at`, `updated_at`, `deleted_at`, `blocker_id`) VALUES
(12, 2, 5, 1, 1, '2019-03-04 00:31:14', '2019-03-16 20:24:22', NULL, 2),
(13, 4, 2, 1, 0, '2019-08-18 01:10:41', '2019-08-18 02:16:04', NULL, NULL),
(15, 2, 6, 0, 0, '2019-08-18 01:23:18', '2019-08-18 01:23:18', NULL, NULL),
(16, 2, 3, 0, 0, '2019-08-18 01:50:45', '2019-08-18 01:50:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `group_id`, `created_at`, `updated_at`, `deleted_at`, `name`) VALUES
(1, NULL, '2019-03-03 02:47:48', '2019-03-03 02:47:48', NULL, 'Hello Conversations'),
(3, 1, '2019-03-03 02:51:54', '2019-03-03 02:51:54', NULL, 'Hello Conversations 2'),
(4, 1, '2019-03-03 02:52:12', '2019-03-03 02:52:12', NULL, 'Hello Conversations 3'),
(5, NULL, '2019-03-04 00:31:59', '2019-03-04 00:31:59', NULL, 'Sally Mohammed'),
(6, NULL, '2019-03-16 18:49:02', '2019-03-16 18:49:02', NULL, 'Hello World'),
(7, NULL, '2019-08-17 17:05:37', '2019-08-17 17:05:37', NULL, 'Hello World'),
(8, NULL, '2019-08-17 17:06:06', '2019-08-17 17:06:06', NULL, 'Hello World'),
(9, NULL, '2019-08-17 17:06:53', '2019-08-17 17:06:53', NULL, 'Hello World'),
(14, NULL, '2019-08-17 17:25:45', '2019-08-17 17:25:45', NULL, 'Hello World'),
(15, NULL, '2019-08-17 17:28:10', '2019-08-17 17:36:40', NULL, 'Hello World 2'),
(16, NULL, '2019-08-18 00:27:41', '2019-08-18 00:27:41', NULL, 'Hello World'),
(17, NULL, '2019-08-18 22:35:24', '2019-08-18 22:35:24', NULL, 'Testy'),
(18, NULL, '2019-08-18 22:36:44', '2019-08-18 22:42:08', NULL, 'Testy'),
(19, NULL, '2019-08-18 22:36:53', '2019-08-18 22:41:53', NULL, 'Testy');

-- --------------------------------------------------------

--
-- Table structure for table `conversations_students`
--

CREATE TABLE `conversations_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations_students`
--

INSERT INTO `conversations_students` (`id`, `student_id`, `conversation_id`, `created_at`) VALUES
(1, 2, 1, NULL),
(2, 3, 1, NULL),
(3, 2, 2, NULL),
(4, 3, 2, NULL),
(5, 2, 5, NULL),
(6, 3, 5, NULL),
(7, 2, 6, NULL),
(8, 3, 6, NULL),
(9, 2, 9, NULL),
(10, 2, 10, NULL),
(11, 2, 11, NULL),
(12, 3, 11, NULL),
(13, 2, 12, NULL),
(14, 3, 12, NULL),
(15, 2, 13, NULL),
(16, 3, 13, NULL),
(18, 3, 14, NULL),
(19, 2, 15, NULL),
(20, 3, 15, NULL),
(22, 3, 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(22, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(44, 5, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(45, 5, 'username', 'text', 'Name', 1, 0, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required:min:8\"}}', 2),
(46, 5, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 1, '{\"validation\":{\"rule\":\"min:8\"}}', 4),
(47, 5, 'email', 'text', 'Email', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3),
(52, 5, 'card_id', 'text', 'Card ID', 0, 1, 1, 1, 1, 1, '{}', 17),
(55, 5, 'department_id', 'select_dropdown', 'Department', 0, 1, 1, 1, 1, 1, '{}', 10),
(56, 5, 'faculty_id', 'select_dropdown', 'Faculty', 0, 1, 1, 1, 1, 1, '{}', 8),
(57, 5, 'university_id', 'select_dropdown', 'University', 0, 1, 1, 1, 1, 1, '{}', 6),
(59, 5, 'phone', 'text', 'Phone', 0, 0, 1, 1, 1, 1, '{}', 22),
(60, 5, 'gender', 'select_dropdown', 'Gender', 0, 0, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"0\":\"Female\",\"1\":\"Male\"}}', 23),
(62, 5, 'created_at', 'timestamp', 'Joined', 0, 0, 1, 0, 0, 0, '{}', 25),
(63, 5, 'updated_at', 'timestamp', 'Updated', 0, 0, 1, 0, 0, 0, '{}', 26),
(64, 5, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 27),
(66, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(68, 7, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 3),
(69, 7, 'cover_image', 'image', 'Cover Image', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1200\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"}]}', 4),
(70, 7, 'parent_id', 'select_dropdown', 'Parent', 0, 1, 1, 1, 1, 1, '{}', 7),
(71, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 9),
(72, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(73, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 11),
(74, 7, 'creator_id', 'number', 'Creator', 0, 1, 1, 1, 1, 1, '{}', 5),
(75, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(76, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2),
(77, 8, 'description', 'rich_text_box', 'Description', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 27),
(79, 8, 'category_id', 'select_dropdown', 'Category', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3),
(80, 8, 'university_id', 'select_dropdown', 'University', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5),
(81, 8, 'faculty_id', 'select_dropdown', 'Faculty', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 11),
(83, 8, 'created_at', 'timestamp', 'Createted', 0, 1, 1, 0, 0, 0, '{}', 23),
(84, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 24),
(85, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 25),
(86, 8, 'series_belongsto_category_relationship', 'relationship', 'Category', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(93, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(94, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required:unique:universities\"}}', 2),
(95, 10, 'description', 'rich_text_box', 'Description', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 6),
(96, 10, 'head_professor_id', 'select_dropdown', 'Head Professor', 0, 1, 1, 1, 1, 1, '{}', 3),
(97, 10, 'banner', 'image', 'Banner', 1, 0, 1, 1, 1, 1, '{}', 7),
(98, 10, 'region', 'text', 'Region', 0, 1, 1, 1, 1, 1, '{}', 5),
(99, 10, 'created_at', 'timestamp', 'Joined', 0, 1, 1, 0, 0, 0, '{}', 8),
(100, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(101, 10, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
(102, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(103, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2),
(104, 11, 'head_professor_id', 'select_dropdown', 'Head Professor', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3),
(105, 11, 'description', 'rich_text_box', 'Description', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 7),
(106, 11, 'banner', 'image', 'Banner', 0, 0, 1, 1, 1, 1, '{}', 8),
(107, 11, 'university_id', 'select_dropdown', 'University', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5),
(108, 11, 'created_at', 'timestamp', 'Joined', 0, 1, 1, 0, 0, 0, '{}', 9),
(109, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(110, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 11),
(111, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(113, 12, 'faculty_id', 'select_dropdown', 'Faculty', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5),
(114, 12, 'university_id', 'select_dropdown', 'University', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3),
(115, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2),
(116, 12, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 9),
(117, 12, 'banner', 'image', 'Banner', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 10),
(118, 12, 'created_at', 'timestamp', 'Joined', 0, 1, 1, 0, 0, 0, '{}', 11),
(119, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(120, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 13),
(121, 12, 'head_professor_id', 'select_dropdown', 'Head Professor', 1, 1, 1, 1, 1, 1, '{}', 7),
(122, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(123, 13, 'number', 'number', 'Number', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|min:1\"}}', 2),
(125, 13, 'department_id', 'select_dropdown', 'Department', 1, 0, 0, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 7),
(126, 13, 'faculty_id', 'select_dropdown', 'Faculty', 1, 0, 0, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5),
(128, 13, 'created_at', 'timestamp', 'Joined', 0, 0, 0, 0, 0, 0, '{}', 12),
(129, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(130, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 14),
(131, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(132, 14, 'email', 'text', 'Email', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"unique:professors\"}}', 3),
(133, 14, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2),
(134, 14, 'profile_picture', 'image', 'Profile Picture', 0, 0, 1, 1, 1, 1, '{}', 13),
(135, 14, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 1, '{}', 4),
(136, 14, 'bio', 'rich_text_box', 'Bio', 0, 0, 1, 1, 1, 1, '{}', 14),
(137, 14, 'university_id', 'select_dropdown', 'University', 0, 1, 1, 1, 1, 1, '{}', 5),
(138, 14, 'department_id', 'select_dropdown', 'Department', 0, 1, 1, 1, 1, 1, '{}', 9),
(139, 14, 'faculty_id', 'select_dropdown', 'Faculty', 0, 1, 1, 1, 1, 1, '{}', 7),
(140, 14, 'gender', 'select_dropdown', 'Gender', 0, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"0\":\"Female\",\"1\":\"Male\"}}', 12),
(141, 14, 'nationality', 'select_dropdown', 'Nationality', 0, 0, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"Egyptian\"}}', 11),
(142, 14, 'created_at', 'timestamp', 'Joined', 0, 0, 1, 0, 0, 0, '{}', 15),
(143, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
(144, 14, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 17),
(146, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(147, 15, 'email', 'text', 'Email', 0, 0, 1, 1, 1, 1, '{}', 3),
(148, 15, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(149, 15, 'profile_picture', 'image', 'Profile Picture', 0, 0, 1, 1, 1, 1, '{}', 11),
(150, 15, 'faculty_id', 'select_dropdown', 'Faculty', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 6),
(151, 15, 'university_id', 'select_dropdown', 'University', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 4),
(152, 15, 'department_id', 'select_dropdown', 'Department', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 8),
(153, 15, 'gender', 'select_dropdown', 'Gender', 0, 0, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"0\":\"Female\",\"1\":\"Male\"}}', 10),
(154, 10, 'university_hasmany_faculty_relationship', 'relationship', 'Faculties', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\Faculty\",\"table\":\"faculties\",\"type\":\"hasMany\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(155, 10, 'university_hasmany_department_relationship', 'relationship', 'Departments', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\Department\",\"table\":\"departments\",\"type\":\"hasMany\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(157, 10, 'university_hasmany_professor_relationship', 'relationship', 'Professors', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"hasMany\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(158, 10, 'university_hasmany_demonstrator_relationship', 'relationship', 'demonstrators', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Demonstrator\",\"table\":\"demonstrators\",\"type\":\"hasMany\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(159, 10, 'university_hasmany_student_relationship', 'relationship', 'students', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"hasMany\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(160, 14, 'professor_belongsto_university_relationship', 'relationship', 'University', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\University\",\"table\":\"universities\",\"type\":\"belongsTo\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(161, 14, 'professor_belongsto_faculty_relationship', 'relationship', 'Faculty', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\Faculty\",\"table\":\"faculties\",\"type\":\"belongsTo\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(162, 14, 'professor_belongsto_department_relationship', 'relationship', 'Department', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(163, 14, 'professor_hasmany_series_relationship', 'relationship', 'Series', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Materials\\\\Series\",\"table\":\"series\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 18),
(164, 10, 'university_belongsto_professor_relationship', 'relationship', 'Head Professor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"belongsTo\",\"column\":\"head_professor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(165, 11, 'faculty_hasmany_professor_relationship', 'relationship', 'Professors', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"hasMany\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(166, 11, 'faculty_belongsto_professor_relationship', 'relationship', 'Head Professor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"belongsTo\",\"column\":\"head_professor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(167, 11, 'faculty_belongsto_university_relationship', 'relationship', 'university', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\University\",\"table\":\"universities\",\"type\":\"belongsTo\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(168, 11, 'faculty_hasmany_department_relationship', 'relationship', 'Departments', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\Department\",\"table\":\"departments\",\"type\":\"hasMany\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(170, 11, 'faculty_hasmany_student_relationship', 'relationship', 'Students', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"hasMany\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(171, 11, 'faculty_hasmany_demonstrator_relationship', 'relationship', 'Demonstrators', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Demonstrator\",\"table\":\"demonstrators\",\"type\":\"hasMany\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(172, 12, 'department_belongsto_university_relationship', 'relationship', 'University', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\University\",\"table\":\"universities\",\"type\":\"belongsTo\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(173, 12, 'department_belongsto_professor_relationship', 'relationship', 'Head Professor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"belongsTo\",\"column\":\"head_professor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(174, 12, 'department_belongsto_faculty_relationship', 'relationship', 'Faculty', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Faculty\",\"table\":\"faculties\",\"type\":\"belongsTo\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(175, 12, 'department_hasmany_section_relationship', 'relationship', 'Sections', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\Section\",\"table\":\"sections\",\"type\":\"hasMany\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"number\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(177, 12, 'department_hasmany_demonstrator_relationship', 'relationship', 'Demonstrators', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Demonstrator\",\"table\":\"demonstrators\",\"type\":\"hasMany\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(178, 12, 'department_hasmany_professor_relationship', 'relationship', 'Professors', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"hasMany\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(179, 12, 'department_hasmany_student_relationship', 'relationship', 'Students', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"hasMany\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(180, 15, 'demonstrator_belongsto_university_relationship', 'relationship', 'University', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\University\",\"table\":\"universities\",\"type\":\"belongsTo\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(181, 15, 'demonstrator_belongsto_faculty_relationship', 'relationship', 'Faculty', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Faculty\",\"table\":\"faculties\",\"type\":\"belongsTo\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(182, 15, 'demonstrator_belongsto_department_relationship', 'relationship', 'Department', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(185, 13, 'section_belongsto_faculty_relationship', 'relationship', 'Faculty', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Faculty\",\"table\":\"faculties\",\"type\":\"belongsTo\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(186, 13, 'section_belongsto_department_relationship', 'relationship', 'Department', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(188, 13, 'section_hasmany_student_relationship', 'relationship', 'Students', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(189, 5, 'student_belongsto_university_relationship', 'relationship', 'University', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\University\",\"table\":\"universities\",\"type\":\"belongsTo\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(190, 5, 'student_belongsto_faculty_relationship', 'relationship', 'Faculty', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Faculty\",\"table\":\"faculties\",\"type\":\"belongsTo\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(192, 5, 'student_belongsto_department_relationship', 'relationship', 'Department', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(194, 5, 'student_belongsto_level_relationship', 'relationship', 'Level', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Level\",\"table\":\"levels\",\"type\":\"belongsTo\",\"column\":\"level_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(195, 5, 'student_belongstomany_series_relationship', 'relationship', 'Enrolled Series', 0, 0, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Materials\\\\Series\",\"table\":\"series\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"students_series\",\"pivot\":\"1\",\"taggable\":\"on\"}', 28),
(196, 5, 'level_id', 'select_dropdown', 'Level', 0, 1, 1, 1, 1, 1, '{}', 15),
(197, 13, 'description', 'text', 'Description:Number - Level - Department - Faculty - University', 0, 0, 0, 1, 1, 1, '{}', 11),
(198, 7, 'category_belongsto_category_relationship', 'relationship', 'Parent', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(199, 7, 'category_belongsto_user_relationship', 'relationship', 'Creator', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"creator_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(200, 7, 'category_hasmany_series_relationship', 'relationship', 'Series', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Materials\\\\Series\",\"table\":\"series\",\"type\":\"hasMany\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(201, 13, 'level_id', 'select_dropdown', 'Level', 1, 0, 0, 1, 1, 1, '{}', 9),
(202, 13, 'section_belongsto_level_relationship', 'relationship', 'Level', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Level\",\"table\":\"levels\",\"type\":\"belongsTo\",\"column\":\"level_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(206, 8, 'banner', 'image', 'Banner', 0, 0, 1, 1, 1, 1, '{}', 26),
(208, 8, 'series_belongsto_university_relationship', 'relationship', 'University', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\University\",\"table\":\"universities\",\"type\":\"belongsTo\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(209, 8, 'series_belongsto_faculty_relationship', 'relationship', 'Faculty', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Faculty\",\"table\":\"faculties\",\"type\":\"belongsTo\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(214, 8, 'series_belongstomany_student_relationship', 'relationship', 'Enrolled Students', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"students_series\",\"pivot\":\"1\",\"taggable\":\"on\"}', 34),
(215, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(216, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(217, 15, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 11),
(227, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(228, 20, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(229, 20, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(230, 20, 'professor_id', 'select_dropdown', 'Professor', 0, 1, 1, 1, 1, 1, '{}', 3),
(232, 20, 'video_url', 'text', 'Video', 0, 0, 1, 1, 1, 1, '{}', 7),
(233, 20, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 10),
(234, 20, 'updated_at', 'timestamp', 'Updated', 0, 0, 1, 0, 0, 0, '{}', 11),
(235, 20, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 12),
(239, 20, 'lecture_belongsto_professor_relationship', 'relationship', 'Professor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"belongsTo\",\"column\":\"professor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(240, 20, 'lecture_belongsto_series_relationship', 'relationship', 'Series', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\SeriesVersion\",\"table\":\"series_versions\",\"type\":\"belongsTo\",\"column\":\"series_version_id\",\"key\":\"id\",\"label\":\"year\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(241, 20, 'lecture_hasmany_handwriting_relationship', 'relationship', 'Hand-Writings', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Materials\\\\Handwriting\",\"table\":\"handwritings\",\"type\":\"hasMany\",\"column\":\"lecture_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(242, 21, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(243, 21, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(244, 21, 'demonstrator_id', 'select_dropdown', 'Demonstrator', 0, 1, 1, 1, 1, 1, '{}', 3),
(246, 21, 'lecture_id', 'select_dropdown', 'Lecture', 0, 1, 1, 1, 1, 1, '{}', 5),
(247, 21, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(248, 21, 'video_url', 'text', 'Video Url', 0, 0, 1, 1, 1, 1, '{}', 7),
(249, 21, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 10),
(250, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(251, 21, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 12),
(252, 21, 'lecture_section_belongsto_demonstrator_relationship', 'relationship', 'Demonstrator', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Demonstrator\",\"table\":\"demonstrators\",\"type\":\"belongsTo\",\"column\":\"demonstrator_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(254, 21, 'lecture_section_belongsto_lecture_relationship', 'relationship', 'Lecture', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\Lecture\",\"table\":\"lectures\",\"type\":\"belongsTo\",\"column\":\"lecture_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(255, 20, 'lecture_hasmany_lecture_section_relationship', 'relationship', 'lecture_sections', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Materials\\\\LectureSection\",\"table\":\"lecture_sections\",\"type\":\"hasMany\",\"column\":\"lecture_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(256, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(257, 22, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(258, 22, 'creator', 'text', 'Creator', 0, 1, 1, 1, 1, 1, '{}', 3),
(260, 22, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 7),
(261, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(262, 22, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(263, 22, 'part_belongsto_series_relationship', 'relationship', 'Series', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\SeriesVersion\",\"table\":\"series_versions\",\"type\":\"belongsTo\",\"column\":\"series_version_id\",\"key\":\"id\",\"label\":\"year\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(264, 22, 'url', 'file', 'File', 0, 0, 1, 1, 1, 1, '{}', 6),
(265, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(266, 23, 'professor_id', 'select_dropdown', 'Professor', 0, 1, 1, 1, 1, 1, '{}', 2),
(268, 23, 'faculty_id', 'select_dropdown', 'Faculty', 0, 1, 1, 1, 1, 1, '{}', 7),
(269, 23, 'university_id', 'select_dropdown', 'University', 0, 1, 1, 1, 1, 1, '{}', 9),
(270, 23, 'year', 'text', 'Year', 0, 1, 1, 1, 1, 1, '{}', 4),
(271, 23, 'url', 'file', 'File', 0, 0, 1, 1, 1, 1, '{}', 11),
(272, 23, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 12),
(273, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(274, 23, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 14),
(275, 23, 'exam_belongsto_series_relationship', 'relationship', 'Series', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\SeriesVersion\",\"table\":\"series_versions\",\"type\":\"belongsTo\",\"column\":\"series_version_id\",\"key\":\"id\",\"label\":\"year\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(276, 23, 'exam_belongsto_professor_relationship', 'relationship', 'Professor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"belongsTo\",\"column\":\"professor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(277, 23, 'exam_belongsto_faculty_relationship', 'relationship', 'Faculty', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\Faculty\",\"table\":\"faculties\",\"type\":\"belongsTo\",\"column\":\"faculty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(278, 23, 'exam_belongsto_university_relationship', 'relationship', 'University', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Structure\\\\University\",\"table\":\"universities\",\"type\":\"belongsTo\",\"column\":\"university_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(279, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(280, 24, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(281, 24, 'creator', 'text', 'Creator', 0, 1, 1, 1, 1, 1, '{}', 3),
(283, 24, 'url', 'file', 'File', 0, 0, 1, 1, 1, 1, '{}', 6),
(284, 24, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(285, 24, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 8),
(286, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(287, 24, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
(288, 24, 'book_belongsto_series_relationship', 'relationship', 'Series', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\SeriesVersion\",\"table\":\"series_versions\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"series_book\",\"pivot\":\"1\",\"taggable\":\"on\"}', 5),
(289, 20, 'slides', 'file', 'Slides', 0, 0, 1, 1, 1, 1, '{}', 8),
(290, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(291, 25, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(293, 25, 'url', 'text', 'Url', 0, 0, 1, 1, 1, 1, '{}', 5),
(294, 25, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 6),
(295, 25, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 7),
(296, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(297, 25, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(298, 25, 'recommendation_belongsto_series_relationship', 'relationship', 'Series', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\SeriesVersion\",\"table\":\"series_versions\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"year\",\"pivot_table\":\"series_recommendations\",\"pivot\":\"1\",\"taggable\":\"on\"}', 4),
(313, 21, 'url', 'file', 'File', 0, 0, 1, 1, 1, 1, '{}', 8),
(314, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(315, 26, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(316, 26, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, '{}', 3),
(317, 26, 'creator_id', 'select_dropdown', 'Creator', 0, 1, 1, 1, 1, 1, '{}', 4),
(318, 26, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 6),
(319, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(320, 26, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 8),
(321, 26, 'channel_belongsto_user_relationship', 'relationship', 'Creator', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"creator_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(322, 26, 'channel_belongstomany_user_relationship', 'relationship', 'Admins', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"channels_admins\",\"pivot\":\"1\",\"taggable\":\"on\"}', 9),
(323, 26, 'channel_belongstomany_student_relationship', 'relationship', 'Subscribers', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"channels_subscribers\",\"pivot\":\"1\",\"taggable\":\"on\"}', 10),
(324, 5, 'student_belongstomany_channel_relationship', 'relationship', 'Subscribed Channels', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Channel\",\"table\":\"channels\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"channels_subscribers\",\"pivot\":\"1\",\"taggable\":\"on\"}', 29),
(325, 1, 'user_belongstomany_channel_relationship', 'relationship', 'Managed Channels', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Channel\",\"table\":\"channels\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"channels_admins\",\"pivot\":\"1\",\"taggable\":\"on\"}', 13),
(326, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(327, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(328, 30, 'lecture_id', 'select_dropdown', 'Lecture', 0, 1, 1, 1, 1, 1, '{}', 5),
(329, 30, 'creator_id', 'select_dropdown', 'Creator', 0, 1, 1, 1, 1, 1, '{}', 3),
(330, 30, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(331, 30, 'url', 'file', 'File', 0, 0, 1, 1, 1, 1, '{}', 7),
(332, 30, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 8),
(333, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(334, 30, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
(335, 30, 'handwriting_belongsto_lecture_relationship', 'relationship', 'Lecture', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\Lecture\",\"table\":\"lectures\",\"type\":\"belongsTo\",\"column\":\"lecture_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(336, 30, 'handwriting_belongsto_student_relationship', 'relationship', 'Creator', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"creator_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(346, 31, 'channels_notification_belongsto_user_relationship', 'relationship', 'Creator', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"creator_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(347, 31, 'channels_notification_belongsto_channel_relationship', 'relationship', 'Channel', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Channel\",\"table\":\"channels\",\"type\":\"belongsTo\",\"column\":\"channel_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(348, 26, 'channel_hasmany_channels_notification_relationship', 'relationship', 'Notifications', 0, 0, 0, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\ChannelsNotification\",\"table\":\"channels_notifications\",\"type\":\"hasMany\",\"column\":\"channel_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(349, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(350, 32, 'sender_id', 'select_dropdown', 'Sender', 0, 1, 1, 1, 1, 1, '{}', 2),
(351, 32, 'reciever_id', 'select_dropdown', 'Reciever', 0, 1, 1, 1, 1, 1, '{}', 4),
(352, 32, 'accept', 'checkbox', 'Accept Connection', 0, 1, 1, 1, 1, 1, '{\"on\":\"accepted\",\"off\":\"Not yet\",\"checked\":\"\"}', 6),
(353, 32, 'block', 'checkbox', 'Block Connection', 0, 1, 1, 1, 1, 1, '{\"on\":\"Blocked\",\"off\":\"Not\",\"checked\":\"\"}', 7),
(354, 32, 'created_at', 'timestamp', 'Created', 0, 1, 0, 0, 0, 0, '{}', 8),
(355, 32, 'updated_at', 'timestamp', 'Accepted', 0, 0, 0, 0, 0, 0, '{}', 9),
(356, 32, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
(357, 32, 'connection_belongsto_student_relationship', 'relationship', 'Sender', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"sender_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(358, 32, 'connection_belongsto_student_relationship_1', 'relationship', 'Reciever', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"reciever_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(359, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(361, 34, 'group_id', 'select_dropdown', 'Group', 0, 1, 1, 1, 1, 1, '{}', 4),
(362, 34, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 6),
(363, 34, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(364, 34, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 8),
(365, 34, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(366, 34, 'conversation_belongstomany_student_relationship', 'relationship', 'Students', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"conversations_students\",\"pivot\":\"1\",\"taggable\":\"on\"}', 9),
(367, 34, 'conversation_belongsto_group_relationship', 'relationship', 'Group', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Group\",\"table\":\"groups\",\"type\":\"belongsTo\",\"column\":\"group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(368, 34, 'conversation_hasmany_message_relationship', 'relationship', 'Messages', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Message\",\"table\":\"messages\",\"type\":\"hasMany\",\"column\":\"conversation_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(369, 35, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(370, 35, 'sender_id', 'select_dropdown', 'Sender', 0, 1, 1, 1, 1, 1, '{}', 5),
(371, 35, 'reciever_id', 'select_dropdown', 'Reciever', 0, 1, 1, 1, 1, 1, '{}', 7),
(372, 35, 'conversation_id', 'select_dropdown', 'Conversation Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(373, 35, 'message', 'text_area', 'Message', 0, 0, 1, 1, 1, 1, '{}', 2),
(374, 35, 'media_url', 'file', 'Media', 0, 0, 1, 1, 1, 1, '{}', 3),
(375, 35, 'media_type', 'select_dropdown', 'Media Type', 0, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"image\",\"2\":\"video\",\"3\":\"audio\"}}', 4),
(376, 35, 'delete_for_me', 'text', 'Delete For Me', 0, 0, 0, 0, 0, 0, '{}', 11),
(377, 35, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 12),
(378, 35, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(379, 35, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 14),
(380, 35, 'message_belongsto_student_relationship', 'relationship', 'Sender', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"sender_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(382, 35, 'message_belongsto_conversation_relationship', 'relationship', 'Conversation', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Conversation\",\"table\":\"conversations\",\"type\":\"belongsTo\",\"column\":\"conversation_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(383, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(384, 36, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(385, 36, 'creator_id', 'select_dropdown', 'Creator', 0, 1, 1, 1, 1, 1, '{}', 3),
(386, 36, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 5),
(387, 36, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(388, 36, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 7),
(389, 36, 'group_belongsto_student_relationship', 'relationship', 'Creator', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"creator_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(390, 36, 'group_belongstomany_student_relationship', 'relationship', 'Admins', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"groups_admins\",\"pivot\":\"1\",\"taggable\":\"on\"}', 8),
(391, 36, 'group_belongstomany_student_relationship_1', 'relationship', 'Members', 0, 0, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"groups_members\",\"pivot\":\"1\",\"taggable\":\"on\"}', 10),
(392, 36, 'group_hasmany_conversation_relationship', 'relationship', 'Conversations', 0, 0, 1, 1, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Conversation\",\"table\":\"conversations\",\"type\":\"hasMany\",\"column\":\"group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(393, 5, 'student_belongstomany_conversation_relationship', 'relationship', 'Conversations', 0, 0, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Conversation\",\"table\":\"conversations\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"conversations_students\",\"pivot\":\"1\",\"taggable\":\"on\"}', 30),
(394, 5, 'student_belongstomany_group_relationship', 'relationship', 'Managed Groups', 0, 0, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Group\",\"table\":\"groups\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"groups_admins\",\"pivot\":\"1\",\"taggable\":\"on\"}', 31),
(395, 5, 'student_belongstomany_group_relationship_1', 'relationship', 'Subscribed Groups', 0, 0, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Group\",\"table\":\"groups\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"groups_members\",\"pivot\":\"1\",\"taggable\":\"on\"}', 32),
(398, 40, 'id', 'number', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(399, 40, 'key', 'text', 'Key', 1, 1, 1, 1, 1, 1, '{}', 2),
(400, 40, 'table_name', 'text', 'Table Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(401, 40, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 4),
(402, 40, 'updated_at', 'timestamp', 'Updated', 0, 0, 0, 0, 0, 0, '{}', 5),
(403, 32, 'connection_belongsto_student_relationship_2', 'relationship', 'Bloker', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"blocker_id\",\"key\":\"id\",\"label\":\"username\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(404, 32, 'blocker_id', 'select_dropdown', 'Blocker', 0, 1, 1, 1, 1, 1, '{}', 9),
(405, 5, 'username_ar', 'text', 'Name Arabic', 0, 1, 1, 1, 1, 1, '{}', 5),
(406, 5, 'section', 'number', 'Section', 0, 0, 1, 1, 1, 1, '{}', 11),
(407, 5, 'term', 'select_dropdown', 'Term', 0, 0, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"First Term\",\"1\":\"Second Term\"}}', 13),
(408, 41, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(409, 41, 'name', 'text', 'Name', 1, 0, 1, 1, 1, 0, '{}', 2),
(410, 41, 'professor_id', 'select_dropdown', 'Professor', 1, 1, 1, 1, 1, 0, '{}', 3),
(411, 41, 'department_id', 'select_dropdown', 'Department', 1, 1, 1, 1, 1, 0, '{}', 4),
(412, 41, 'created_at', 'timestamp', 'Created', 0, 1, 1, 0, 0, 0, '{}', 5),
(413, 41, 'updated_at', 'timestamp', 'Updated', 0, 0, 1, 0, 0, 0, '{}', 6),
(414, 41, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 7),
(415, 41, 'level_id', 'select_dropdown', 'Level', 0, 1, 1, 1, 1, 1, '{}', 8),
(416, 41, 'regular_lecture_day', 'text', 'Regular Lecture Day', 0, 0, 1, 1, 1, 1, '{}', 9),
(417, 41, 'regular_lecture_day_2', 'text', 'Regular Lecture Day 2', 0, 0, 1, 1, 1, 1, '{}', 10),
(418, 41, 'regular_section_day', 'text', 'Regular Section Day', 0, 0, 1, 1, 1, 1, '{}', 11),
(419, 41, 'regular_section_day_2', 'text', 'Regular Section Day 2', 0, 0, 1, 1, 1, 1, '{}', 12),
(420, 41, 'regular_lecture_time', 'text', 'Regular Lecture Time', 0, 0, 1, 1, 1, 1, '{}', 13),
(421, 41, 'regular_lecture_time_2', 'text', 'Regular Lecture Time 2', 0, 0, 1, 1, 1, 1, '{}', 14),
(422, 41, 'regular_section_time', 'text', 'Regular Section Time', 0, 0, 1, 1, 1, 1, '{}', 15),
(423, 41, 'regular_section_time_2', 'text', 'Regular Section Time 2', 0, 0, 1, 1, 1, 1, '{}', 16),
(424, 41, 'term', 'select_dropdown', 'Term', 0, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"First Term\",\"1\":\"Second Term\"}}', 17),
(425, 41, 'series_id', 'select_dropdown', 'Series', 0, 0, 1, 1, 1, 1, '{}', 18),
(426, 41, 'year', 'text', 'Year', 0, 1, 1, 1, 1, 1, '{}', 19),
(427, 41, 'series_version_belongsto_level_relationship', 'relationship', 'level', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\Level\",\"table\":\"levels\",\"type\":\"belongsTo\",\"column\":\"level_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 20),
(428, 41, 'series_version_belongsto_professor_relationship', 'relationship', 'Professor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Professor\",\"table\":\"professors\",\"type\":\"belongsTo\",\"column\":\"professor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 21),
(429, 41, 'series_version_belongsto_department_relationship', 'relationship', 'Department', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Structure\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 22),
(430, 41, 'series_version_belongsto_series_relationship', 'relationship', 'Series', 0, 0, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Materials\\\\Series\",\"table\":\"series\",\"type\":\"belongsTo\",\"column\":\"series_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 23),
(431, 41, 'series_version_belongstomany_recommendation_relationship', 'relationship', 'Recommendations', 0, 0, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\Materials\\\\Recommendation\",\"table\":\"recommendations\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"series_recommendations\",\"pivot\":\"1\",\"taggable\":\"on\"}', 24),
(432, 41, 'series_version_belongstomany_book_relationship', 'relationship', 'Books', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\Book\",\"table\":\"books\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"series_book\",\"pivot\":\"1\",\"taggable\":\"on\"}', 25),
(433, 41, 'series_version_hasmany_lecture_relationship', 'relationship', 'Lectures', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\Lecture\",\"table\":\"lectures\",\"type\":\"hasMany\",\"column\":\"series_version_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 26);
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(434, 41, 'series_version_hasone_exam_relationship', 'relationship', 'Exams', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\Exam\",\"table\":\"exams\",\"type\":\"hasOne\",\"column\":\"series_version_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 27),
(435, 41, 'series_version_hasone_part_relationship', 'relationship', 'Parts', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\Part\",\"table\":\"parts\",\"type\":\"hasOne\",\"column\":\"series_version_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 28),
(436, 8, 'series_hasmany_series_version_relationship', 'relationship', 'Version', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Materials\\\\SeriesVersion\",\"table\":\"series_versions\",\"type\":\"hasMany\",\"column\":\"series_id\",\"key\":\"id\",\"label\":\"year\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 35),
(437, 5, 'options', 'text', 'Options', 0, 0, 0, 0, 0, 0, '{}', 18),
(438, 23, 'series_version_id', 'text', 'Series Version Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(439, 23, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 11),
(440, 20, 'series_version_id', 'text', 'Series Version Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(441, 22, 'series_version_id', 'text', 'Series Version Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(442, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(443, 31, 'content', 'text', 'Content', 0, 1, 1, 1, 1, 1, '{}', 2),
(444, 31, 'media_url', 'file', 'Media Url', 0, 0, 1, 1, 1, 1, '{}', 3),
(445, 31, 'media_type', 'select_dropdown', 'Media Type', 0, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"image\",\"2\":\"video\",\"3\":\"audio\"}}', 4),
(446, 31, 'creator_id', 'text', 'Creator Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(447, 31, 'channel_id', 'text', 'Channel Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(448, 31, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(449, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(450, 31, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(451, 5, 'student_belongstomany_channel_relationship_1', 'relationship', 'Managed Channels', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Members\\\\Students\\\\Socialization\\\\Channel\",\"table\":\"channels\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"channels_admins\",\"pivot\":\"1\",\"taggable\":\"on\"}', 33);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2019-02-28 14:14:43', '2019-03-02 21:38:07'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-02-28 14:14:43', '2019-02-28 14:14:43'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2019-02-28 14:14:43', '2019-02-28 15:26:07'),
(5, 'students', 'students', 'Students', 'Students', 'voyager-group', 'App\\Models\\Members\\Students\\Student', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"username\",\"order_direction\":\"desc\",\"default_search_key\":null}', '2019-02-28 15:28:11', '2019-08-15 06:17:57'),
(7, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'App\\Models\\Structure\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":\"name\"}', '2019-02-28 17:02:35', '2019-08-14 18:12:56'),
(8, 'series', 'series', 'Series', 'Series', 'voyager-logbook', 'App\\Models\\Materials\\Series', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-01 05:10:25', '2019-08-14 18:40:55'),
(10, 'universities', 'universities', 'University', 'Universities', 'voyager-study', 'App\\Models\\Structure\\University', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"desc\",\"default_search_key\":null}', '2019-03-01 06:38:15', '2019-08-14 18:14:38'),
(11, 'faculties', 'faculties', 'Faculty', 'Faculties', 'voyager-company', 'App\\Models\\Structure\\Faculty', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"desc\",\"default_search_key\":\"name\"}', '2019-03-01 06:45:17', '2019-08-14 18:17:04'),
(12, 'departments', 'departments', 'Department', 'Departments', 'voyager-tag', 'App\\Models\\Structure\\Department', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"desc\",\"default_search_key\":\"name\"}', '2019-03-01 07:00:55', '2019-08-14 18:18:51'),
(13, 'sections', 'sections', 'Section', 'Sections', 'voyager-edit', 'App\\Models\\Structure\\Section', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"number\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-01 07:12:02', '2019-08-14 18:20:20'),
(14, 'professors', 'professors', 'Professor', 'Professors', 'voyager-person', 'App\\Models\\Members\\Professor', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":\"name\"}', '2019-03-01 07:45:31', '2019-08-14 18:21:18'),
(15, 'demonstrators', 'demonstrators', 'Demonstrator', 'Demonstrators', 'voyager-group', 'App\\Models\\Members\\Demonstrator', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":\"id\"}', '2019-03-01 08:04:56', '2019-08-14 18:06:25'),
(20, 'lectures', 'lectures', 'Lecture', 'Lectures', 'voyager-puzzle', 'App\\Models\\Materials\\Lecture', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-02 16:49:53', '2019-08-14 18:33:19'),
(21, 'lecture_sections', 'lecture-sections', 'Sections', 'Lecture Sections', 'voyager-file-text', 'App\\Models\\Materials\\LectureSection', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-02 19:07:05', '2019-08-14 18:36:23'),
(22, 'parts', 'parts', 'Part', 'Parts', 'voyager-book', 'App\\Models\\Materials\\Part', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"creator\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-02 19:22:36', '2019-08-14 18:39:46'),
(23, 'exams', 'exams', 'Exam', 'Exams', 'voyager-edit', 'App\\Models\\Materials\\Exam', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"year\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-02 19:41:15', '2019-08-14 18:30:11'),
(24, 'books', 'books', 'Book', 'Books', 'voyager-book', 'App\\Models\\Materials\\Book', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-02 19:51:19', '2019-08-14 17:56:49'),
(25, 'recommendations', 'recommendations', 'Recommendation', 'Recommendations', 'voyager-thumbs-up', 'App\\Models\\Materials\\Recommendation', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-02 20:05:37', '2019-08-14 18:38:36'),
(26, 'channels', 'channels', 'Channel', 'Channels', 'voyager-chat', 'App\\Models\\Members\\Students\\Socialization\\Channel', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-02 21:25:56', '2019-08-15 06:18:37'),
(30, 'handwritings', 'handwritings', 'Handwriting', 'Handwritings', 'voyager-pen', 'App\\Models\\Materials\\Handwriting', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-03 00:48:17', '2019-08-14 18:30:52'),
(31, 'channels_notifications', 'channels-notifications', 'Channels Notification', 'Channels Notifications', 'voyager-lightbulb', 'App\\Models\\Members\\Students\\Socialization\\ChannelsNotification', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-03 01:26:04', '2019-08-15 04:59:56'),
(32, 'connections', 'connections', 'Connection', 'Connections', 'voyager-bolt', 'App\\Models\\Members\\Students\\Socialization\\Connection', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-03 01:40:13', '2019-08-15 05:16:27'),
(34, 'conversations', 'conversations', 'Conversation', 'Conversations', 'voyager-bubble-hear', 'App\\Models\\Members\\Students\\Socialization\\Conversation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-03 02:18:04', '2019-08-14 18:44:43'),
(35, 'messages', 'messages', 'Message', 'Messages', 'voyager-mail', 'App\\Models\\Members\\Students\\Socialization\\Message', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-03 02:34:09', '2019-08-14 18:46:03'),
(36, 'groups', 'groups', 'Group', 'Groups', 'voyager-group', 'App\\Models\\Members\\Students\\Socialization\\Group', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-03 02:40:28', '2019-08-15 05:18:08'),
(40, 'permissions', 'permissions', 'Permission', 'Permissions', 'voyager-pen', 'App\\Models\\Permission', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-09 12:17:31', '2019-03-09 12:17:31'),
(41, 'series_versions', 'series-versions', 'Series Version', 'Series Versions', 'voyager-check', 'App\\Models\\Materials\\SeriesVersion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-14 07:50:51', '2019-08-14 08:16:53');

-- --------------------------------------------------------

--
-- Table structure for table `demonstrators`
--

CREATE TABLE `demonstrators` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'demonstrators\\default.jpg',
  `faculty_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `demonstrators`
--

INSERT INTO `demonstrators` (`id`, `email`, `name`, `profile_picture`, `faculty_id`, `university_id`, `department_id`, `gender`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'hello3@gmail.com', 'Demonstrator One', 'demonstrators\\March2019\\U8a8JVdZm7ZVxKMAMiov.png', 1, 1, 1, 1, '2019-03-01 09:51:23', '2019-03-01 09:51:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `head_professor_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `head_professor_id`, `faculty_id`, `university_id`, `name`, `description`, `banner`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 1, 'Computer Science and Control Systems', '<h1>Computer Science and Control Systems</h1>', 'departments\\March2019\\gaRDI4KsHgIrS0O5Wj50.jpg', '2019-03-01 09:43:25', '2019-03-01 09:43:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(10) UNSIGNED NOT NULL,
  `professor_id` int(11) DEFAULT NULL,
  `series_version_id` int(11) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `professor_id`, `series_version_id`, `faculty_id`, `university_id`, `year`, `url`, `created_at`, `updated_at`, `deleted_at`, `name`) VALUES
(1, 3, 1, 1, 1, 2016, '[{\"download_link\":\"exams\\\\March2019\\\\WrBGPbh1qCrUXQo4sO6E.pdf\",\"original_name\":\"daleel.pdf\"}]', '2019-03-02 19:45:28', '2019-03-02 19:45:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head_professor_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `name`, `head_professor_id`, `description`, `banner`, `university_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Faculty Of Engineering', 3, '<h1>Faculty Of Engineering</h1>', 'faculties\\March2019\\Unt9825XQxTKxDHShviQ.jpg', 1, '2019-03-01 09:23:11', '2019-03-01 09:23:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `creator_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hello Group 2', 2, '2019-03-03 02:49:59', '2019-08-18 21:43:37', NULL),
(2, 'Sally Mohammed', NULL, '2019-03-04 00:32:43', '2019-03-04 00:32:43', NULL),
(3, 'Hello Group', 2, '2019-08-18 02:34:40', '2019-08-18 02:34:40', NULL),
(4, 'Hello Group', 2, '2019-08-18 02:35:21', '2019-08-18 02:35:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups_admins`
--

CREATE TABLE `groups_admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups_admins`
--

INSERT INTO `groups_admins` (`id`, `student_id`, `group_id`, `created_at`) VALUES
(1, 2, 1, NULL),
(2, 2, 3, NULL),
(3, 2, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups_members`
--

CREATE TABLE `groups_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups_members`
--

INSERT INTO `groups_members` (`id`, `student_id`, `group_id`, `created_at`) VALUES
(3, 2, 2, NULL),
(4, 3, 2, NULL),
(5, 2, 3, NULL),
(6, 2, 4, NULL),
(15, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `handwritings`
--

CREATE TABLE `handwritings` (
  `id` int(10) UNSIGNED NOT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `handwritings`
--

INSERT INTO `handwritings` (`id`, `lecture_id`, `creator_id`, `name`, `url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 'Hello World', '[{\"download_link\":\"handwritings\\\\March2019\\\\DxzRP6pBUcqcuDjJP5ns.pdf\",\"original_name\":\"daleel.pdf\"}]', '2019-03-02 17:07:20', '2019-03-02 17:07:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `professor_id` int(11) DEFAULT NULL,
  `series_version_id` int(11) DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slides` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`id`, `name`, `description`, `professor_id`, `series_version_id`, `video_url`, `created_at`, `updated_at`, `deleted_at`, `slides`) VALUES
(1, 'Hello World', NULL, 3, 1, 'https://www.youtube.com/playlist?list=PLF8OvnCBlEY2GHEx5-5xzYRlNYq-p-jy_', '2019-03-02 17:06:39', '2019-03-02 20:02:31', NULL, '[{\"download_link\":\"lectures\\\\March2019\\\\1c1o6pRUbdUaHJNbgWwf.pdf\",\"original_name\":\"daleel.pdf\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `lecture_sections`
--

CREATE TABLE `lecture_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demonstrator_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lecture_sections`
--

INSERT INTO `lecture_sections` (`id`, `name`, `demonstrator_id`, `url`, `lecture_id`, `description`, `video_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Ahmed Yousef', 1, '[{\"download_link\":\"lecture-sections\\\\March2019\\\\FvcTC2YnRqwORvyB9577.pdf\",\"original_name\":\"Tables - Second Term.pdf\"}]', 1, NULL, 'https://www.youtube.com/playlist?list=PLF8OvnCBlEY2GHEx5-5xzYRlNYq-p-jy_', '2019-03-16 23:55:25', '2019-03-16 23:55:25', NULL),
(5, 'Demo Sections', 1, NULL, 1, NULL, NULL, '2019-03-17 15:55:41', '2019-03-17 15:55:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'preparatory', '2019-03-01 06:24:26', '2019-03-01 06:24:26'),
(2, 'Level 100', '2019-03-01 06:25:30', '2019-03-01 06:25:30'),
(3, 'Level 200', '2019-03-01 06:25:47', '2019-03-01 06:25:47'),
(4, 'Level 300', '2019-03-01 06:25:57', '2019-03-01 06:25:57'),
(5, 'Level 400', '2019-03-01 06:26:05', '2019-03-01 06:26:15'),
(6, 'Level 500', '2019-05-09 08:55:20', '2019-05-09 08:55:20'),
(7, 'Level 600', '2019-05-09 08:55:35', '2019-05-09 08:55:35'),
(8, 'Level 700', '2019-05-09 08:55:51', '2019-05-09 08:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-02-28 14:14:45', '2019-02-28 14:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-02-28 14:14:45', '2019-02-28 14:14:45', 'voyager.dashboard', NULL),
(2, 1, 'Media Manager', '', '_self', 'voyager-images', '#000000', NULL, 7, '2019-02-28 14:14:45', '2019-08-14 08:13:41', 'voyager.media.index', 'null'),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 14, 1, '2019-02-28 14:14:45', '2019-02-28 16:32:08', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 14, 2, '2019-02-28 14:14:45', '2019-02-28 16:32:08', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2019-02-28 14:14:46', '2019-08-14 08:13:41', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-02-28 14:14:46', '2019-03-02 17:12:46', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-02-28 14:14:46', '2019-03-03 02:45:51', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-02-28 14:14:46', '2019-03-03 02:45:51', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-02-28 14:14:46', '2019-03-03 02:45:51', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2019-02-28 14:14:46', '2019-08-14 08:13:41', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-02-28 14:14:50', '2019-03-03 02:45:51', 'voyager.hooks', NULL),
(13, 1, 'Students', '', '_self', 'voyager-group', NULL, 23, 2, '2019-02-28 15:28:12', '2019-08-14 08:13:37', 'voyager.students.index', NULL),
(14, 1, 'Authorization', '', '_self', 'voyager-people', '#000000', NULL, 2, '2019-02-28 16:31:48', '2019-03-09 12:37:24', NULL, ''),
(15, 1, 'Categories', '', '_self', 'voyager-categories', '#000000', 16, 1, '2019-02-28 17:02:35', '2019-02-28 17:10:37', 'voyager.categories.index', 'null'),
(16, 1, 'Structure', '', '_self', 'voyager-study', '#000000', NULL, 3, '2019-02-28 17:09:50', '2019-08-17 15:16:04', NULL, ''),
(17, 1, 'Series', '', '_self', 'voyager-logbook', '#000000', 26, 1, '2019-03-01 05:10:25', '2019-03-01 16:39:15', 'voyager.series.index', 'null'),
(19, 1, 'Universities', '', '_self', 'voyager-study', '#000000', 16, 2, '2019-03-01 06:38:16', '2019-08-14 08:13:27', 'voyager.universities.index', 'null'),
(20, 1, 'Faculties', '', '_self', 'voyager-company', NULL, 16, 3, '2019-03-01 06:45:17', '2019-08-14 08:13:27', 'voyager.faculties.index', NULL),
(21, 1, 'Departments', '', '_self', 'voyager-tag', NULL, 16, 4, '2019-03-01 07:00:55', '2019-08-14 08:13:27', 'voyager.departments.index', NULL),
(22, 1, 'Sections', '', '_self', 'voyager-edit', NULL, 16, 5, '2019-03-01 07:12:02', '2019-08-14 08:13:27', 'voyager.sections.index', NULL),
(23, 1, 'Members', '', '_self', 'voyager-people', '#000000', NULL, 4, '2019-03-01 07:13:29', '2019-08-17 15:15:56', NULL, ''),
(24, 1, 'Professors', '', '_self', 'voyager-group', '#000000', 23, 1, '2019-03-01 07:45:31', '2019-03-01 08:11:56', 'voyager.professors.index', 'null'),
(25, 1, 'Demonstrators', '', '_self', 'voyager-group', NULL, 23, 3, '2019-03-01 08:04:57', '2019-08-14 08:13:37', 'voyager.demonstrators.index', NULL),
(26, 1, 'Materials', '', '_self', 'voyager-upload', '#000000', NULL, 5, '2019-03-01 16:38:08', '2019-03-09 12:37:05', NULL, ''),
(30, 1, 'Handwritings', '', '_self', 'voyager-pen', '#000000', 26, 5, '2019-03-02 16:43:25', '2019-08-14 08:13:40', 'voyager.handwritings.index', 'null'),
(31, 1, 'Lectures', '', '_self', 'voyager-puzzle', NULL, 26, 3, '2019-03-02 16:49:54', '2019-08-14 08:13:43', 'voyager.lectures.index', NULL),
(32, 1, 'Sections', '', '_self', 'voyager-file-text', '#000000', 26, 4, '2019-03-02 19:07:06', '2019-08-14 08:13:40', 'voyager.lecture-sections.index', 'null'),
(33, 1, 'Parts', '', '_self', 'voyager-book', NULL, 26, 6, '2019-03-02 19:22:37', '2019-08-14 08:13:40', 'voyager.parts.index', NULL),
(34, 1, 'Exams', '', '_self', 'voyager-edit', NULL, 26, 7, '2019-03-02 19:41:16', '2019-08-14 08:13:40', 'voyager.exams.index', NULL),
(35, 1, 'Books', '', '_self', 'voyager-study', NULL, 26, 8, '2019-03-02 19:51:19', '2019-08-14 08:13:41', 'voyager.books.index', NULL),
(36, 1, 'Recommendations', '', '_self', 'voyager-thumbs-up', NULL, 26, 10, '2019-03-02 20:05:38', '2019-08-14 08:13:41', 'voyager.recommendations.index', NULL),
(37, 1, 'Channels', '', '_self', 'voyager-chat', '#000000', 38, 1, '2019-03-02 21:25:56', '2019-03-02 21:33:18', 'voyager.channels.index', 'null'),
(38, 1, 'Socialization', '', '_self', 'voyager-bubble', '#000000', NULL, 6, '2019-03-02 21:32:58', '2019-08-14 08:13:41', NULL, ''),
(41, 1, 'Channels Notifications', '', '_self', 'voyager-lightbulb', NULL, 38, 2, '2019-03-03 01:26:04', '2019-03-03 01:30:36', 'voyager.channels-notifications.index', NULL),
(42, 1, 'Connections', '', '_self', 'voyager-bolt', NULL, 38, 3, '2019-03-03 01:40:14', '2019-03-03 02:45:50', 'voyager.connections.index', NULL),
(44, 1, 'Conversations', '', '_self', 'voyager-bubble-hear', NULL, 38, 5, '2019-03-03 02:18:05', '2019-03-03 02:46:07', 'voyager.conversations.index', NULL),
(45, 1, 'Messages', '', '_self', 'voyager-mail', NULL, 26, 9, '2019-03-03 02:34:09', '2019-08-14 08:13:41', 'voyager.messages.index', NULL),
(46, 1, 'Groups', '', '_self', 'voyager-group', NULL, 38, 4, '2019-03-03 02:40:28', '2019-03-03 02:46:05', 'voyager.groups.index', NULL),
(47, 1, 'Permissions', '', '_self', 'voyager-pen', NULL, 14, 3, '2019-03-09 12:17:32', '2019-03-09 12:37:05', 'voyager.permissions.index', NULL),
(48, 1, 'Series Versions', '', '_self', 'voyager-check', '#000000', 26, 2, '2019-08-14 07:50:52', '2019-08-14 08:14:00', 'voyager.series-versions.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `media_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` int(11) DEFAULT NULL,
  `delete_for_me` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `conversation_id`, `message`, `media_url`, `media_type`, `delete_for_me`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 'Totam omnis consequa', '[{\"download_link\":\"messages\\\\March2019\\\\SJJPumfUBxSEpLJHZ9sk.png\",\"original_name\":\"cookbook_app_ui_design_tubik_2x.png\"}]', 3, 0, '2019-03-03 02:55:13', '2019-03-03 02:55:13', NULL),
(2, 3, 1, 'Expedita earum in id', '[{\"download_link\":\"messages\\\\March2019\\\\ebuI0ioIJgEpo3Ifd2y4.png\",\"original_name\":\"babysitter_2x.png\"}]', 2, 0, '2019-03-03 02:55:30', '2019-03-03 02:58:10', NULL),
(3, 2, NULL, 'Hello world', NULL, NULL, 0, '2019-08-17 15:34:26', '2019-08-17 15:34:26', NULL),
(4, 2, 1, 'Hello world', NULL, NULL, 0, '2019-08-17 15:35:18', '2019-08-17 15:35:18', NULL),
(6, 2, 1, 'Hello world', NULL, NULL, 1, '2019-08-17 16:35:10', '2019-08-17 16:46:25', NULL),
(7, 2, 1, 'Hello world', NULL, NULL, 1, '2019-08-17 16:35:11', '2019-08-17 16:44:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(12, '2016_06_01_000004_create_oauth_clients_table', 1),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(14, '2016_10_21_190000_create_roles_table', 1),
(15, '2016_10_21_190000_create_settings_table', 1),
(16, '2016_11_30_135954_create_permission_table', 1),
(17, '2016_11_30_141208_create_permission_role_table', 1),
(18, '2016_12_26_201236_data_types__add__server_side', 1),
(19, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(20, '2017_01_14_005015_create_translations_table', 1),
(21, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(22, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(23, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(24, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(25, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(26, '2017_08_05_000000_add_group_to_settings_table', 1),
(27, '2017_11_26_013050_add_user_role_relationship', 1),
(28, '2017_11_26_015000_create_user_roles_table', 1),
(29, '2018_03_11_000000_add_user_settings', 1),
(30, '2018_03_14_000000_add_details_to_data_types_table', 1),
(31, '2018_03_16_000000_make_settings_value_nullable', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0a919fb86aba64d4dea08e4c7f55f00ad65ff8abeb3edd56d076bddea066bb43bf18ce4426378f54', 23, 2, NULL, '[]', 0, '2019-05-11 00:14:36', '2019-05-11 00:14:36', '2020-05-11 02:14:36'),
('466a8ac0e3b09bdafafa02768cba3c38b64cd33e844ca10e92a69069133329bf9e5856a28d2f547d', 23, 2, NULL, '[]', 0, '2019-05-09 19:58:22', '2019-05-09 19:58:22', '2020-05-09 21:58:22'),
('537455ee7744e0a6b9ca063232efad2a8d4c94fdeca79e94422f76f7f623a0807d1e547ff0686b0e', 23, 2, NULL, '[]', 0, '2019-05-09 17:44:14', '2019-05-09 17:44:14', '2020-05-09 19:44:14'),
('577a59ae3e71f755b246da451f2280e8c841c67e559e08f9ca11e13c819783064a50f861773bae74', 23, 2, NULL, '[]', 0, '2019-05-11 01:17:24', '2019-05-11 01:17:24', '2020-05-11 03:17:24'),
('642cee100d2244c16a241d9d23cc2144a49ba68c96d47a390717c9641b81325f4d69250d0de06bbb', 19, 2, NULL, '[]', 0, '2019-03-16 09:48:29', '2019-03-16 09:48:29', '2020-03-16 02:48:29'),
('77f361d51c6d89bcbf209e0a78c4f167223c5db62bc2f50ce3215dbfde9332e696001efcaaac16d3', 2, 2, NULL, '[]', 0, '2019-08-14 05:27:22', '2019-08-14 05:27:22', '2020-08-14 07:27:22'),
('91c00e42c3a509dcbcf331105c869e8faa1ba5f9a3a7f554fb0fd6b524fb94f53a752772641112f0', 2, 2, NULL, '[]', 0, '2019-03-16 09:50:18', '2019-03-16 09:50:18', '2020-03-16 02:50:18'),
('9a3b3eb08cecb255303eccef7b1813448399082a31bdd3faa19fff57454707c2ae8e1ff6fab331ae', 23, 2, NULL, '[]', 0, '2019-05-09 19:58:33', '2019-05-09 19:58:33', '2020-05-09 21:58:33'),
('9ca07feba2a0082f2452c7092161e8e5c861ca3b9a089affe6945c3da8d7298dfdcb66121dfc70e6', 24, 2, NULL, '[]', 0, '2019-08-14 04:59:14', '2019-08-14 04:59:14', '2020-08-14 06:59:14'),
('a75c2c8d0855e3ea1c0cc22d30f24a97fd1141d5a621ccb5200b5daf7b126f5730a41bc2b8d775f3', 24, 2, NULL, '[]', 0, '2019-08-14 05:03:55', '2019-08-14 05:03:55', '2020-08-14 07:03:55'),
('a7fe88602bb0ca0169d8491b9d2dd5fc2019fceeae36d82ebff39836059c2d26094fd00e52d44b93', 18, 2, NULL, '[]', 0, '2019-03-06 03:14:02', '2019-03-06 03:14:02', '2020-03-05 19:14:02'),
('b7c7627a400057539deecbd030b122c7ea41ffed45d6911aa00d4f6ad577c739700a5bb2325ae5d8', 25, 2, NULL, '[]', 0, '2019-08-14 05:24:01', '2019-08-14 05:24:01', '2020-08-14 07:24:01'),
('fef85af062802520c7f3c1c26b60b856d629744f52bb78bcfb134db08f2a4157552093f7711ef6ee', 18, 2, NULL, '[]', 0, '2019-03-09 08:25:43', '2019-03-09 08:25:43', '2020-03-09 00:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'aCGTo0M4WstRlPp5t97Ci9l4KbQ0sfWdAVwl9yw8', 'http://localhost', 1, 0, 0, '2019-03-06 03:04:47', '2019-03-06 03:04:47'),
(2, NULL, 'Laravel Password Grant Client', 'InyRQkEdYmXHksyDUwrYT5XrHIxFORMvzXGOs90b', 'http://localhost', 0, 1, 0, '2019-03-06 03:04:47', '2019-03-06 03:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-03-06 03:04:47', '2019-03-06 03:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('14020d4df06ef8c5cd70b1514f9961639f8e44089df4bb5e99dd509dc40999e8da75168fbec8a520', 'a7fe88602bb0ca0169d8491b9d2dd5fc2019fceeae36d82ebff39836059c2d26094fd00e52d44b93', 0, '2020-03-05 19:14:02'),
('2f118e3fae96b10232a57ca052cde26b796657a1b9860eeb3590747758d1bdd0042a5f66c140ab5b', 'b7c7627a400057539deecbd030b122c7ea41ffed45d6911aa00d4f6ad577c739700a5bb2325ae5d8', 0, '2020-08-14 07:24:01'),
('400792b30983b948d12f98f97870ec7554989175a090aaaddcf5c1b7204b7dd81af8e6387f11e8f9', 'a75c2c8d0855e3ea1c0cc22d30f24a97fd1141d5a621ccb5200b5daf7b126f5730a41bc2b8d775f3', 0, '2020-08-14 07:03:55'),
('43b9659eb5613f6c4ce919d80d5d750dcb31754fd0404a65cf183a935d2e2f50637e938c79b3436f', '0a919fb86aba64d4dea08e4c7f55f00ad65ff8abeb3edd56d076bddea066bb43bf18ce4426378f54', 0, '2020-05-11 02:14:36'),
('631554aa28cb1895f7380824a5d746d9ee4142f2e50bedb5d904e9cd4ae99570bbff8dcf56de755f', '642cee100d2244c16a241d9d23cc2144a49ba68c96d47a390717c9641b81325f4d69250d0de06bbb', 0, '2020-03-16 02:48:29'),
('859eb1624caa466a172f6dd553ef734eb73e42d0bd61db8dca4999a79477b2289a93a507d55d4e5b', '466a8ac0e3b09bdafafa02768cba3c38b64cd33e844ca10e92a69069133329bf9e5856a28d2f547d', 0, '2020-05-09 21:58:22'),
('93197f5ebfa68e008458a581e6f1dc89a310f784c5c7dd4a746c4b5d5264ccfe1c7840fe960c0eac', '91c00e42c3a509dcbcf331105c869e8faa1ba5f9a3a7f554fb0fd6b524fb94f53a752772641112f0', 0, '2020-03-16 02:50:18'),
('d3b3767bcae54008e41735cf65eca40a3824caaa80c6db765e72eafb7586350ee182b7e4bfe241af', 'fef85af062802520c7f3c1c26b60b856d629744f52bb78bcfb134db08f2a4157552093f7711ef6ee', 0, '2020-03-09 00:25:44'),
('da49430cf3a616d6c207f91c86f3d98761e5d8ef0ba109db93a1e1b98c498a0135379cffd295fb38', '577a59ae3e71f755b246da451f2280e8c841c67e559e08f9ca11e13c819783064a50f861773bae74', 0, '2020-05-11 03:17:24'),
('df0d5b425e639a0fdc43488f2358ea1c30bc63c1571b3a11a9fca9276f18d3a53643fccde69b2f62', '537455ee7744e0a6b9ca063232efad2a8d4c94fdeca79e94422f76f7f623a0807d1e547ff0686b0e', 0, '2020-05-09 19:44:14'),
('df25600e7bcf98e2ab7bee2a035b609e02f1dd2c67eb912d6d6336f726a397b6a940ff011df1ab81', '9a3b3eb08cecb255303eccef7b1813448399082a31bdd3faa19fff57454707c2ae8e1ff6fab331ae', 0, '2020-05-09 21:58:33'),
('ec97f95f50d327366ba21cda7882fb00ebe04f26d02dc495c7ea9338e94451c6124cd44d4db2d7c2', '9ca07feba2a0082f2452c7092161e8e5c861ca3b9a089affe6945c3da8d7298dfdcb66121dfc70e6', 0, '2020-08-14 06:59:14'),
('f5e3a54274299ce418e0c6e991d96ce9284c0fd85692bfb403e108e87d8386a5ffcfb18410e564af', '77f361d51c6d89bcbf209e0a78c4f167223c5db62bc2f50ce3215dbfde9332e696001efcaaac16d3', 0, '2020-08-14 07:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `series_version_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`id`, `name`, `creator`, `series_version_id`, `created_at`, `updated_at`, `deleted_at`, `url`) VALUES
(1, 'Hello World  Part', 'Students', 1, '2019-03-02 19:26:56', '2019-03-02 19:26:56', NULL, '[{\"download_link\":\"parts\\\\March2019\\\\uD3URLCQ7pjGORqCsOs0.pdf\",\"original_name\":\"daleel.pdf\"}]'),
(2, 'part', 'Students', 1, '2019-03-04 00:26:56', '2019-03-04 00:26:56', NULL, '[{\"download_link\":\"parts\\\\March2019\\\\gOS4Bipcw4Do31WmjTON.jpg\",\"original_name\":\"eugene-chystiakov-1381895-unsplash.jpg\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-02-28 14:14:46', '2019-02-28 14:14:46'),
(2, 'browse_bread', NULL, '2019-02-28 14:14:46', '2019-02-28 14:14:46'),
(3, 'browse_database', NULL, '2019-02-28 14:14:46', '2019-02-28 14:14:46'),
(4, 'browse_media', NULL, '2019-02-28 14:14:46', '2019-02-28 14:14:46'),
(5, 'browse_compass', NULL, '2019-02-28 14:14:46', '2019-02-28 14:14:46'),
(6, 'browse_menus', 'menus', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(7, 'read_menus', 'menus', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(8, 'edit_menus', 'menus', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(9, 'add_menus', 'menus', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(10, 'delete_menus', 'menus', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(11, 'browse_roles', 'roles', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(12, 'read_roles', 'roles', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(13, 'edit_roles', 'roles', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(14, 'add_roles', 'roles', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(15, 'delete_roles', 'roles', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(16, 'browse_users', 'users', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(17, 'read_users', 'users', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(18, 'edit_users', 'users', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(19, 'add_users', 'users', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(20, 'delete_users', 'users', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(21, 'browse_settings', 'settings', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(22, 'read_settings', 'settings', '2019-02-28 14:14:47', '2019-02-28 14:14:47'),
(23, 'edit_settings', 'settings', '2019-02-28 14:14:48', '2019-02-28 14:14:48'),
(24, 'add_settings', 'settings', '2019-02-28 14:14:48', '2019-02-28 14:14:48'),
(25, 'delete_settings', 'settings', '2019-02-28 14:14:48', '2019-02-28 14:14:48'),
(26, 'browse_hooks', NULL, '2019-02-28 14:14:50', '2019-02-28 14:14:50'),
(27, 'browse_students', 'students', '2019-02-28 15:28:11', '2019-02-28 15:28:11'),
(28, 'read_students', 'students', '2019-02-28 15:28:11', '2019-02-28 15:28:11'),
(29, 'edit_students', 'students', '2019-02-28 15:28:11', '2019-02-28 15:28:11'),
(30, 'add_students', 'students', '2019-02-28 15:28:11', '2019-02-28 15:28:11'),
(31, 'delete_students', 'students', '2019-02-28 15:28:11', '2019-02-28 15:28:11'),
(32, 'browse_categories', 'categories', '2019-02-28 17:02:35', '2019-02-28 17:02:35'),
(33, 'read_categories', 'categories', '2019-02-28 17:02:35', '2019-02-28 17:02:35'),
(34, 'edit_categories', 'categories', '2019-02-28 17:02:35', '2019-02-28 17:02:35'),
(35, 'add_categories', 'categories', '2019-02-28 17:02:35', '2019-02-28 17:02:35'),
(36, 'delete_categories', 'categories', '2019-02-28 17:02:35', '2019-02-28 17:02:35'),
(37, 'browse_series', 'series', '2019-03-01 05:10:25', '2019-03-01 05:10:25'),
(38, 'read_series', 'series', '2019-03-01 05:10:25', '2019-03-01 05:10:25'),
(39, 'edit_series', 'series', '2019-03-01 05:10:25', '2019-03-01 05:10:25'),
(40, 'add_series', 'series', '2019-03-01 05:10:25', '2019-03-01 05:10:25'),
(41, 'delete_series', 'series', '2019-03-01 05:10:25', '2019-03-01 05:10:25'),
(47, 'browse_universities', 'universities', '2019-03-01 06:38:15', '2019-03-01 06:38:15'),
(48, 'read_universities', 'universities', '2019-03-01 06:38:15', '2019-03-01 06:38:15'),
(49, 'edit_universities', 'universities', '2019-03-01 06:38:15', '2019-03-01 06:38:15'),
(50, 'add_universities', 'universities', '2019-03-01 06:38:15', '2019-03-01 06:38:15'),
(51, 'delete_universities', 'universities', '2019-03-01 06:38:15', '2019-03-01 06:38:15'),
(52, 'browse_faculties', 'faculties', '2019-03-01 06:45:17', '2019-03-01 06:45:17'),
(53, 'read_faculties', 'faculties', '2019-03-01 06:45:17', '2019-03-01 06:45:17'),
(54, 'edit_faculties', 'faculties', '2019-03-01 06:45:17', '2019-03-01 06:45:17'),
(55, 'add_faculties', 'faculties', '2019-03-01 06:45:17', '2019-03-01 06:45:17'),
(56, 'delete_faculties', 'faculties', '2019-03-01 06:45:17', '2019-03-01 06:45:17'),
(57, 'browse_departments', 'departments', '2019-03-01 07:00:55', '2019-03-01 07:00:55'),
(58, 'read_departments', 'departments', '2019-03-01 07:00:55', '2019-03-01 07:00:55'),
(59, 'edit_departments', 'departments', '2019-03-01 07:00:55', '2019-03-01 07:00:55'),
(60, 'add_departments', 'departments', '2019-03-01 07:00:55', '2019-03-01 07:00:55'),
(61, 'delete_departments', 'departments', '2019-03-01 07:00:55', '2019-03-01 07:00:55'),
(62, 'browse_sections', 'sections', '2019-03-01 07:12:02', '2019-03-01 07:12:02'),
(63, 'read_sections', 'sections', '2019-03-01 07:12:02', '2019-03-01 07:12:02'),
(64, 'edit_sections', 'sections', '2019-03-01 07:12:02', '2019-03-01 07:12:02'),
(65, 'add_sections', 'sections', '2019-03-01 07:12:02', '2019-03-01 07:12:02'),
(66, 'delete_sections', 'sections', '2019-03-01 07:12:02', '2019-03-01 07:12:02'),
(67, 'browse_professors', 'professors', '2019-03-01 07:45:31', '2019-03-01 07:45:31'),
(68, 'read_professors', 'professors', '2019-03-01 07:45:31', '2019-03-01 07:45:31'),
(69, 'edit_professors', 'professors', '2019-03-01 07:45:31', '2019-03-01 07:45:31'),
(70, 'add_professors', 'professors', '2019-03-01 07:45:31', '2019-03-01 07:45:31'),
(71, 'delete_professors', 'professors', '2019-03-01 07:45:31', '2019-03-01 07:45:31'),
(72, 'browse_demonstrators', 'demonstrators', '2019-03-01 08:04:57', '2019-03-01 08:04:57'),
(73, 'read_demonstrators', 'demonstrators', '2019-03-01 08:04:57', '2019-03-01 08:04:57'),
(74, 'edit_demonstrators', 'demonstrators', '2019-03-01 08:04:57', '2019-03-01 08:04:57'),
(75, 'add_demonstrators', 'demonstrators', '2019-03-01 08:04:57', '2019-03-01 08:04:57'),
(76, 'delete_demonstrators', 'demonstrators', '2019-03-01 08:04:57', '2019-03-01 08:04:57'),
(97, 'browse_lectures', 'lectures', '2019-03-02 16:49:54', '2019-03-02 16:49:54'),
(98, 'read_lectures', 'lectures', '2019-03-02 16:49:54', '2019-03-02 16:49:54'),
(99, 'edit_lectures', 'lectures', '2019-03-02 16:49:54', '2019-03-02 16:49:54'),
(100, 'add_lectures', 'lectures', '2019-03-02 16:49:54', '2019-03-02 16:49:54'),
(101, 'delete_lectures', 'lectures', '2019-03-02 16:49:54', '2019-03-02 16:49:54'),
(102, 'browse_lecture_sections', 'lecture_sections', '2019-03-02 19:07:05', '2019-03-02 19:07:05'),
(103, 'read_lecture_sections', 'lecture_sections', '2019-03-02 19:07:05', '2019-03-02 19:07:05'),
(104, 'edit_lecture_sections', 'lecture_sections', '2019-03-02 19:07:05', '2019-03-02 19:07:05'),
(105, 'add_lecture_sections', 'lecture_sections', '2019-03-02 19:07:05', '2019-03-02 19:07:05'),
(106, 'delete_lecture_sections', 'lecture_sections', '2019-03-02 19:07:05', '2019-03-02 19:07:05'),
(107, 'browse_parts', 'parts', '2019-03-02 19:22:37', '2019-03-02 19:22:37'),
(108, 'read_parts', 'parts', '2019-03-02 19:22:37', '2019-03-02 19:22:37'),
(109, 'edit_parts', 'parts', '2019-03-02 19:22:37', '2019-03-02 19:22:37'),
(110, 'add_parts', 'parts', '2019-03-02 19:22:37', '2019-03-02 19:22:37'),
(111, 'delete_parts', 'parts', '2019-03-02 19:22:37', '2019-03-02 19:22:37'),
(112, 'browse_exams', 'exams', '2019-03-02 19:41:16', '2019-03-02 19:41:16'),
(113, 'read_exams', 'exams', '2019-03-02 19:41:16', '2019-03-02 19:41:16'),
(114, 'edit_exams', 'exams', '2019-03-02 19:41:16', '2019-03-02 19:41:16'),
(115, 'add_exams', 'exams', '2019-03-02 19:41:16', '2019-03-02 19:41:16'),
(116, 'delete_exams', 'exams', '2019-03-02 19:41:16', '2019-03-02 19:41:16'),
(117, 'browse_books', 'books', '2019-03-02 19:51:19', '2019-03-02 19:51:19'),
(118, 'read_books', 'books', '2019-03-02 19:51:19', '2019-03-02 19:51:19'),
(119, 'edit_books', 'books', '2019-03-02 19:51:19', '2019-03-02 19:51:19'),
(120, 'add_books', 'books', '2019-03-02 19:51:19', '2019-03-02 19:51:19'),
(121, 'delete_books', 'books', '2019-03-02 19:51:19', '2019-03-02 19:51:19'),
(122, 'browse_recommendations', 'recommendations', '2019-03-02 20:05:38', '2019-03-02 20:05:38'),
(123, 'read_recommendations', 'recommendations', '2019-03-02 20:05:38', '2019-03-02 20:05:38'),
(124, 'edit_recommendations', 'recommendations', '2019-03-02 20:05:38', '2019-03-02 20:05:38'),
(125, 'add_recommendations', 'recommendations', '2019-03-02 20:05:38', '2019-03-02 20:05:38'),
(126, 'delete_recommendations', 'recommendations', '2019-03-02 20:05:38', '2019-03-02 20:05:38'),
(127, 'browse_channels', 'channels', '2019-03-02 21:25:56', '2019-03-02 21:25:56'),
(128, 'read_channels', 'channels', '2019-03-02 21:25:56', '2019-03-02 21:25:56'),
(129, 'edit_channels', 'channels', '2019-03-02 21:25:56', '2019-03-02 21:25:56'),
(130, 'add_channels', 'channels', '2019-03-02 21:25:56', '2019-03-02 21:25:56'),
(131, 'delete_channels', 'channels', '2019-03-02 21:25:56', '2019-03-02 21:25:56'),
(132, 'browse_handwritings', 'handwritings', '2019-03-03 00:24:15', '2019-03-03 00:24:15'),
(133, 'read_handwritings', 'handwritings', '2019-03-03 00:24:15', '2019-03-03 00:24:15'),
(134, 'edit_handwritings', 'handwritings', '2019-03-03 00:24:15', '2019-03-03 00:24:15'),
(135, 'add_handwritings', 'handwritings', '2019-03-03 00:24:16', '2019-03-03 00:24:16'),
(136, 'delete_handwritings', 'handwritings', '2019-03-03 00:24:16', '2019-03-03 00:24:16'),
(147, 'browse_channels_notifications', 'channels_notifications', '2019-03-03 01:26:04', '2019-03-03 01:26:04'),
(148, 'read_channels_notifications', 'channels_notifications', '2019-03-03 01:26:04', '2019-03-03 01:26:04'),
(149, 'edit_channels_notifications', 'channels_notifications', '2019-03-03 01:26:04', '2019-03-03 01:26:04'),
(150, 'add_channels_notifications', 'channels_notifications', '2019-03-03 01:26:04', '2019-03-03 01:26:04'),
(151, 'delete_channels_notifications', 'channels_notifications', '2019-03-03 01:26:04', '2019-03-03 01:26:04'),
(152, 'browse_connections', 'connections', '2019-03-03 01:40:14', '2019-03-03 01:40:14'),
(153, 'read_connections', 'connections', '2019-03-03 01:40:14', '2019-03-03 01:40:14'),
(154, 'edit_connections', 'connections', '2019-03-03 01:40:14', '2019-03-03 01:40:14'),
(155, 'add_connections', 'connections', '2019-03-03 01:40:14', '2019-03-03 01:40:14'),
(156, 'delete_connections', 'connections', '2019-03-03 01:40:14', '2019-03-03 01:40:14'),
(162, 'browse_conversations', 'conversations', '2019-03-03 02:18:04', '2019-03-03 02:18:04'),
(163, 'read_conversations', 'conversations', '2019-03-03 02:18:05', '2019-03-03 02:18:05'),
(164, 'edit_conversations', 'conversations', '2019-03-03 02:18:05', '2019-03-03 02:18:05'),
(165, 'add_conversations', 'conversations', '2019-03-03 02:18:05', '2019-03-03 02:18:05'),
(166, 'delete_conversations', 'conversations', '2019-03-03 02:18:05', '2019-03-03 02:18:05'),
(167, 'browse_messages', 'messages', '2019-03-03 02:34:09', '2019-03-03 02:34:09'),
(168, 'read_messages', 'messages', '2019-03-03 02:34:09', '2019-03-03 02:34:09'),
(169, 'edit_messages', 'messages', '2019-03-03 02:34:09', '2019-03-03 02:34:09'),
(170, 'add_messages', 'messages', '2019-03-03 02:34:09', '2019-03-03 02:34:09'),
(171, 'delete_messages', 'messages', '2019-03-03 02:34:09', '2019-03-03 02:34:09'),
(172, 'browse_groups', 'groups', '2019-03-03 02:40:28', '2019-03-03 02:40:28'),
(173, 'read_groups', 'groups', '2019-03-03 02:40:28', '2019-03-03 02:40:28'),
(174, 'edit_groups', 'groups', '2019-03-03 02:40:28', '2019-03-03 02:40:28'),
(175, 'add_groups', 'groups', '2019-03-03 02:40:28', '2019-03-03 02:40:28'),
(176, 'delete_groups', 'groups', '2019-03-03 02:40:28', '2019-03-03 02:40:28'),
(177, 'browse_permissions', 'permissions', '2019-03-09 12:17:32', '2019-03-09 12:17:32'),
(178, 'read_permissions', 'permissions', '2019-03-09 12:17:32', '2019-03-09 12:17:32'),
(179, 'edit_permissions', 'permissions', '2019-03-09 12:17:32', '2019-03-09 12:17:32'),
(180, 'add_permissions', 'permissions', '2019-03-09 12:17:32', '2019-03-09 12:17:32'),
(181, 'delete_permissions', 'permissions', '2019-03-09 12:17:32', '2019-03-09 12:17:32'),
(182, 'browse_series_versions', 'series_versions', '2019-08-14 07:50:52', '2019-08-14 07:50:52'),
(183, 'read_series_versions', 'series_versions', '2019-08-14 07:50:52', '2019-08-14 07:50:52'),
(184, 'edit_series_versions', 'series_versions', '2019-08-14 07:50:52', '2019-08-14 07:50:52'),
(185, 'add_series_versions', 'series_versions', '2019-08-14 07:50:52', '2019-08-14 07:50:52'),
(186, 'delete_series_versions', 'series_versions', '2019-08-14 07:50:52', '2019-08-14 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(32, 4),
(33, 1),
(33, 3),
(33, 4),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(37, 4),
(38, 1),
(38, 3),
(38, 4),
(39, 1),
(39, 3),
(40, 1),
(40, 3),
(41, 1),
(41, 3),
(47, 1),
(47, 3),
(47, 4),
(48, 1),
(48, 3),
(48, 4),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(52, 4),
(53, 1),
(53, 3),
(53, 4),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 1),
(56, 3),
(57, 1),
(57, 3),
(57, 4),
(58, 1),
(58, 3),
(58, 4),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(62, 1),
(62, 3),
(62, 4),
(63, 1),
(63, 3),
(63, 4),
(64, 1),
(64, 3),
(64, 4),
(65, 1),
(65, 3),
(65, 4),
(66, 1),
(66, 3),
(66, 4),
(67, 1),
(67, 3),
(67, 4),
(68, 1),
(68, 3),
(68, 4),
(69, 1),
(69, 3),
(70, 1),
(70, 3),
(71, 1),
(71, 3),
(72, 1),
(72, 3),
(72, 4),
(73, 1),
(73, 3),
(73, 4),
(74, 1),
(74, 3),
(75, 1),
(75, 3),
(76, 1),
(76, 3),
(97, 1),
(97, 3),
(97, 4),
(98, 1),
(98, 3),
(98, 4),
(99, 1),
(99, 3),
(99, 4),
(100, 1),
(100, 3),
(100, 4),
(101, 1),
(101, 3),
(101, 4),
(102, 1),
(102, 3),
(102, 4),
(103, 1),
(103, 3),
(103, 4),
(104, 1),
(104, 3),
(104, 4),
(105, 1),
(105, 3),
(105, 4),
(106, 1),
(106, 3),
(106, 4),
(107, 1),
(107, 3),
(107, 4),
(108, 1),
(108, 3),
(108, 4),
(109, 1),
(109, 3),
(109, 4),
(110, 1),
(110, 3),
(110, 4),
(111, 1),
(111, 3),
(111, 4),
(112, 1),
(112, 3),
(112, 4),
(113, 1),
(113, 3),
(113, 4),
(114, 1),
(114, 3),
(114, 4),
(115, 1),
(115, 3),
(115, 4),
(116, 1),
(116, 3),
(116, 4),
(117, 1),
(117, 3),
(117, 4),
(118, 1),
(118, 3),
(118, 4),
(119, 1),
(119, 3),
(119, 4),
(120, 1),
(120, 3),
(120, 4),
(121, 1),
(121, 3),
(121, 4),
(122, 1),
(122, 3),
(123, 1),
(123, 3),
(124, 1),
(124, 3),
(125, 1),
(125, 3),
(126, 1),
(126, 3),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(132, 3),
(132, 4),
(133, 1),
(133, 3),
(133, 4),
(134, 1),
(134, 3),
(134, 4),
(135, 1),
(135, 3),
(135, 4),
(136, 1),
(136, 3),
(136, 4),
(147, 1),
(147, 3),
(148, 1),
(148, 3),
(149, 1),
(149, 3),
(150, 1),
(150, 3),
(151, 1),
(151, 3),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(182, 3),
(182, 4),
(183, 1),
(183, 3),
(183, 4),
(184, 1),
(184, 3),
(184, 4),
(185, 1),
(185, 3),
(185, 4),
(186, 1),
(186, 3),
(186, 4);

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'professors\\default.jpg',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `university_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT '1',
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`id`, `email`, `name`, `profile_picture`, `password`, `bio`, `university_id`, `department_id`, `faculty_id`, `gender`, `nationality`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'head@mans.com', 'Head Professor', 'professors\\March2019\\Qb1QusoFw3jM02IMylc0.png', '$2y$10$B.XxNie3LLXVu5H8LozVJOfuqkimvNYKmVG3ht.GfWB/8GbtLEPGm', '<h1>Head Professor</h1>', 1, 1, 1, 1, '1', '2019-03-01 08:34:30', '2019-03-01 09:43:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recommendations`
--

INSERT INTO `recommendations` (`id`, `name`, `url`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Recommend That', 'https://cso.gov.eg/NetServices?ServiceId=1', NULL, '2019-03-02 20:08:25', '2019-03-02 20:08:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'Super Administrator', '2019-02-28 14:14:46', '2019-03-02 20:37:30'),
(3, 'admin', 'Administrator', '2019-03-02 20:38:51', '2019-03-02 20:38:51'),
(4, 'coordinator', 'Coordinator', '2019-03-02 20:39:17', '2019-03-02 20:39:17');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `number`, `department_id`, `faculty_id`, `level_id`, `created_at`, `updated_at`, `deleted_at`, `description`) VALUES
(4, 1, 1, 1, 3, '2019-03-01 12:00:26', '2019-03-01 12:04:32', NULL, '1 - Level 200 - Computer Science and Control Systems - Faculty of Engineering - Mansoura University'),
(5, 2, 1, 1, 3, '2019-03-01 12:00:53', '2019-03-01 12:04:44', NULL, '2 - Level 200 - Computer Science and Control Systems - Faculty of Engineering - Mansoura University'),
(6, 3, 1, 1, 3, '2019-03-01 12:01:18', '2019-03-01 12:04:56', NULL, '3 - Level 200 - Computer Science and Control Systems - Faculty of Engineering - Mansoura University');

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `name`, `description`, `category_id`, `university_id`, `faculty_id`, `created_at`, `updated_at`, `deleted_at`, `banner`) VALUES
(1, 'Introduction to Probability - The Science of Uncertainty', '<p>fdsdf</p>', 2, 1, 1, '2019-03-01 06:05:57', '2019-03-02 20:35:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `series_book`
--

CREATE TABLE `series_book` (
  `id` int(10) UNSIGNED NOT NULL,
  `series_version_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `series_book`
--

INSERT INTO `series_book` (`id`, `series_version_id`, `book_id`, `created_at`) VALUES
(1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `series_recommendations`
--

CREATE TABLE `series_recommendations` (
  `id` int(10) UNSIGNED NOT NULL,
  `series_version_id` int(11) DEFAULT NULL,
  `recommendation_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `series_recommendations`
--

INSERT INTO `series_recommendations` (`id`, `series_version_id`, `recommendation_id`, `created_at`) VALUES
(1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `series_versions`
--

CREATE TABLE `series_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `professor_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `regular_lecture_day` int(11) DEFAULT NULL,
  `regular_lecture_day_2` int(11) DEFAULT NULL,
  `regular_section_day` int(11) DEFAULT NULL,
  `regular_section_day_2` int(11) DEFAULT NULL,
  `regular_lecture_time` time DEFAULT NULL,
  `regular_lecture_time_2` time DEFAULT NULL,
  `regular_section_time` time DEFAULT NULL,
  `regular_section_time_2` time DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `series_versions`
--

INSERT INTO `series_versions` (`id`, `professor_id`, `department_id`, `created_at`, `updated_at`, `deleted_at`, `level_id`, `regular_lecture_day`, `regular_lecture_day_2`, `regular_section_day`, `regular_section_day_2`, `regular_lecture_time`, `regular_lecture_time_2`, `regular_section_time`, `regular_section_time_2`, `term`, `series_id`, `year`) VALUES
(1, 3, 1, '2019-03-01 06:05:57', '2019-08-14 08:21:34', NULL, 3, 1, 5, 3, 0, '10:00:00', '12:00:00', '10:00:00', NULL, 0, 1, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\August2019\\nXNeFaf4fRT2DJTd7RIh.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'StudentMate', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to StudentMate. Student Resources Management System', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `university_id` int(11) DEFAULT '1',
  `faculty_id` int(11) DEFAULT '1',
  `department_id` int(11) DEFAULT '1',
  `section` tinyint(4) DEFAULT '1',
  `level_id` int(11) DEFAULT '2',
  `term` tinyint(4) DEFAULT '0',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `options` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '{ 	"username": true, 	"name_arabic": true, 	"university": true, 	"faculty": true, 	"department": true, 	"level": true, 	"section": false, 	"term_no": false, 	"gender": true, 	"email": false, 	"phone_number": false }'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `username`, `password`, `email`, `username_ar`, `card_id`, `university_id`, `faculty_id`, `department_id`, `section`, `level_id`, `term`, `phone`, `gender`, `created_at`, `updated_at`, `deleted_at`, `options`) VALUES
(2, 'Ahmed Yousef', '$2y$10$CxBz5g872.14pmUu5pqbzuKg1yl7iYrqo9bx91fDuJIy2vaI6iSCa', 'ahmedyousef@gmail.com', 'أحمد يوسف', '12365478', 1, 1, 1, 4, 3, 0, '0155251332', 1, '2019-02-28 16:16:58', '2019-08-14 06:29:06', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(3, 'Sally', '$2y$10$HDP2ATBM1khOrsM.CUuMDeY9kQvwyVZvLpUu8oBBr1uCP/6Ngj6Lq', 'Sally@gmail.com', 'سالي محمد', '1000456798', 1, 1, 1, 4, 3, 0, NULL, 0, '2019-03-01 17:25:42', '2019-03-01 18:01:08', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(4, 'Sally', '$2y$10$HDP2ATBM1khOrsM.CUuMDeY9kQvwyVZvLpUu8oBBr1uCP/6Ngj6Lq', 'Sally@gmail.com', 'سالي محمد', '1000456798', 1, 1, 1, 4, 3, 0, NULL, 0, '2019-03-01 17:25:42', '2019-03-01 18:01:08', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(5, 'Ahmed Yousef', '$2y$10$99/DlUoUvefA8xKL.ZIhbeOPQt1be6vznYSbaY.LFJ8r10rAByXdS', 'ahmedyousefarnous@gmail.com', 'أحمد يوسف مصطفي عرنوس', '10001234569', 1, 1, 1, 4, 3, 0, '01552516332', 1, '2019-02-28 16:16:58', '2019-03-01 12:05:32', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(6, 'Sally', '$2y$10$HDP2ATBM1khOrsM.CUuMDeY9kQvwyVZvLpUu8oBBr1uCP/6Ngj6Lq', 'Sally@gmail.com', 'سالي محمد', '1000456798', 1, 1, 1, 4, 3, 0, NULL, 0, '2019-03-01 17:25:42', '2019-03-01 18:01:08', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(7, 'Sally', '$2y$10$HDP2ATBM1khOrsM.CUuMDeY9kQvwyVZvLpUu8oBBr1uCP/6Ngj6Lq', 'Sally@gmail.com', 'سالي محمد', '1000456798', 1, 1, 1, 4, 3, 0, NULL, 0, '2019-03-01 17:25:42', '2019-03-01 18:01:08', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(8, 'Ahmed Yousef', '$2y$10$99/DlUoUvefA8xKL.ZIhbeOPQt1be6vznYSbaY.LFJ8r10rAByXdS', 'ahmedyousefarnous@gmail.com', 'أحمد يوسف مصطفي عرنوس', '10001234569', 1, 1, 1, 4, 3, 0, '01552516332', 1, '2019-02-28 16:16:58', '2019-03-01 12:05:32', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(9, 'Sally', '$2y$10$HDP2ATBM1khOrsM.CUuMDeY9kQvwyVZvLpUu8oBBr1uCP/6Ngj6Lq', 'Sally@gmail.com', 'سالي محمد', '1000456798', 1, 1, 1, 4, 3, 0, NULL, 0, '2019-03-01 17:25:42', '2019-03-01 18:01:08', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(10, 'Sally', '$2y$10$HDP2ATBM1khOrsM.CUuMDeY9kQvwyVZvLpUu8oBBr1uCP/6Ngj6Lq', 'Sally@gmail.com', 'سالي محمد', '1000456798', 1, 1, 1, 4, 3, 0, NULL, 0, '2019-03-01 17:25:42', '2019-03-01 18:01:08', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(11, 'Ahmed Yousef', '$2y$10$99/DlUoUvefA8xKL.ZIhbeOPQt1be6vznYSbaY.LFJ8r10rAByXdS', 'ahmedyousefarnous@gmail.com', 'أحمد يوسف مصطفي عرنوس', '10001234569', 1, 1, 1, 4, 3, 0, '01552516332', 1, '2019-02-28 16:16:58', '2019-03-01 12:05:32', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(12, 'Ahmed Yousef', '$2y$10$99/DlUoUvefA8xKL.ZIhbeOPQt1be6vznYSbaY.LFJ8r10rAByXdS', 'ahmedyousefarnous@gmail.com', 'أحمد يوسف مصطفي عرنوس', '10001234569', 1, 1, 1, 4, 3, 0, '01552516332', 1, '2019-02-28 16:16:58', '2019-03-01 12:05:32', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(13, 'Sally', '$2y$10$HDP2ATBM1khOrsM.CUuMDeY9kQvwyVZvLpUu8oBBr1uCP/6Ngj6Lq', 'Sally@gmail.com', 'سالي محمد', '1000456798', 1, 1, 1, 4, 3, 0, NULL, 0, '2019-03-01 17:25:42', '2019-03-01 18:01:08', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(14, 'Sally', '$2y$10$HDP2ATBM1khOrsM.CUuMDeY9kQvwyVZvLpUu8oBBr1uCP/6Ngj6Lq', 'Sally@gmail.com', 'سالي محمد', '1000456798', 1, 1, 1, 4, 3, 0, NULL, 0, '2019-03-01 17:25:42', '2019-03-01 18:01:08', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(15, 'Ahmed Yousef', '$2y$10$99/DlUoUvefA8xKL.ZIhbeOPQt1be6vznYSbaY.LFJ8r10rAByXdS', 'ahmedyousefarnous@gmail.com', 'أحمد يوسف مصطفي عرنوس', '10001234569', 1, 1, 1, 4, 3, 0, '01552516332', 1, '2019-02-28 16:16:58', '2019-03-01 12:05:32', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(18, 'AhmedYousef', '$2y$10$miXq0ij7y9vvEXIMX66rT.LDevg/e0l5tcCmiwCvHpcYdCfAgKiua', 'ahmedgozif456@gmail.com', NULL, NULL, 1, 1, 1, NULL, 2, 0, NULL, 1, '2019-03-06 02:28:22', '2019-03-09 09:31:02', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(19, 'AhmedYousef', '$2y$10$CJTql4hT2DJFe3Do72hY6Oe92wXPEfj3sSh/jaqqwKxmuMimOoDiu', 'ahmedgozif@gmail.com', NULL, NULL, 1, 1, 1, 1, 2, 0, NULL, 1, '2019-03-06 02:30:22', '2019-03-06 02:30:22', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(20, 'AhmedYousef', '$2y$10$neogVGx57Nbcxcf9ScjFgOb8anv.BZ6sfitFQcPyH5.Wqw4QMv/1C', 'ahmedgozif@gmail.com', 'أحمد يوسف', NULL, 1, 1, 1, 1, 2, 0, NULL, 1, '2019-03-06 02:31:53', '2019-03-06 02:31:53', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(21, 'AhmedYousef', '$2y$10$xpbYY3/.B6WGoVXpH1SyZuVttRAtdrKHHnjtzZj9x1BPYZo7ZpGlS', 'ahmedgozif@gmail.com', 'أحمد يوسف', NULL, 1, 1, 1, 1, 2, 0, NULL, 1, '2019-03-06 02:34:11', '2019-03-06 02:34:11', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(22, 'AhmedYousef', '$2y$10$uleV2CWljib92WUaYWK8Q.QKFUJ1Nf7K2kcMp0r0vOIns.Me/J8AG', 'ahmedgozif2@gmail.com', 'أحمد يوسف', NULL, 1, 1, 1, 1, 2, 0, NULL, 1, '2019-03-09 08:19:42', '2019-03-09 08:19:42', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(23, 'Ahmed Arnous', '$2y$10$Gw/ogBVmwhEjcHNRDvQVs.8kigGmL9EBl.PvSSiijjcOEYN..5yca', 'ahmedgozif25@gmail.com', 'sadsadsdadsaasd', '535534', 1, 2, 3, 2, 3, 0, NULL, 0, '2019-05-09 17:38:07', '2019-05-11 03:28:29', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(24, 'ahmed123465', '$2y$10$jOzZ7LbEsOXoAVFOcYpxcOE85.peJhV2ucO.JWUUGvl5JQiIezc.O', 'ahmed@gmail.com', NULL, NULL, 1, 1, 1, 1, 2, 0, NULL, 1, '2019-05-13 20:44:35', '2019-05-13 20:44:35', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(25, 'ahmed123465', '$2y$10$L4WOPlkXtW.6WC5c6NWVoOl444oK4SEu69Y8ZPfRcMNHgBti25zvW', 'ahmed12356@gmail.com', NULL, NULL, 1, 1, 1, 1, 2, 0, NULL, 1, '2019-08-14 05:22:34', '2019-08-14 05:22:34', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }'),
(26, 'ahmed12346nbv5', '$2y$10$/cQeTS60BL1rR4s/c9sKjeOxpsVU9HMLkjIF2EWXF1nERqgiI1CPq', 'ahmed123@gmail.com', NULL, NULL, 1, 1, 1, 1, 2, 0, NULL, 1, '2019-08-14 05:29:34', '2019-08-14 05:29:34', NULL, '{ 	\"username\": true, 	\"name_arabic\": true, 	\"university\": true, 	\"faculty\": true, 	\"department\": true, 	\"level\": true, 	\"section\": false, 	\"term_no\": false, 	\"card_id\": false, 	\"gender\": true, 	\"email\": false, 	\"phone_number\": false }');

-- --------------------------------------------------------

--
-- Table structure for table `students_series`
--

CREATE TABLE `students_series` (
  `student_id` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students_series`
--

INSERT INTO `students_series` (`student_id`, `series_id`, `id`) VALUES
(2, 1, 1),
(3, 1, 3),
(18, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `head_professor_id` int(11) DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `name`, `description`, `head_professor_id`, `banner`, `region`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mansoura University', '<h1>Mansoura University</h1>', 3, 'universities\\March2019\\WSbaj7AsxhlLToda4mWk.jpg', 'Egypt', '2019-03-01 08:28:51', '2019-03-01 08:45:46', NULL),
(2, 'Ain Shams University', '<p>fsa</p>', 3, 'universities\\August2019\\yAUoAK12NxJ3rUa810ST.png', 'Egypt', '2019-08-14 06:50:28', '2019-08-14 06:50:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ahmed Yousef', 'ahmedyousefarnous@gmail.com', 'users\\February2019\\zVUzfy9g5opwE78Rauo3.jpg', NULL, '$2y$10$RWixB9pYfkiqJ4LKRg1qK.PfWvP8Giu9LQP96/UnaWCPIDA2A78uS', '1oxlPe2lxv3f4M2EIB23XP8R8iG8H4HshmYvlB9JcROkSvKpnd30MFgcCX7x', '{\"locale\":\"en\"}', '2019-02-28 14:19:57', '2019-03-01 06:29:59'),
(2, 3, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$FLrj8fjC9I6kuzLmI29F7OF0Es4hAxL9Yoceeypc4selI/kJkkOOO', 'LjmpRmnPsfUwACXE1qke6liuOqQMKGtsmyohuF63QJJonIKpc32eFco7BRWx', '{\"locale\":\"en\"}', '2019-03-02 20:41:20', '2019-03-02 20:41:20'),
(3, 4, 'coordinator', 'coordinator@coordinator.com', 'users/default.png', NULL, '$2y$10$eSVRunT3IV5LAyhqAxkG6.i90r4GROXSYufSc.JjPr02TMeRiFRS.', 'ejDX9X1cFQLnroUG6shh29yb8xysVMwB2bxHCAfcQ7taYC9k4su4b82P07fX', '{\"locale\":\"en\"}', '2019-03-02 20:50:35', '2019-03-02 20:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channels_admins`
--
ALTER TABLE `channels_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channels_notifications`
--
ALTER TABLE `channels_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channels_subscribers`
--
ALTER TABLE `channels_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations_students`
--
ALTER TABLE `conversations_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `demonstrators`
--
ALTER TABLE `demonstrators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_admins`
--
ALTER TABLE `groups_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_members`
--
ALTER TABLE `groups_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `handwritings`
--
ALTER TABLE `handwritings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecture_sections`
--
ALTER TABLE `lecture_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series_book`
--
ALTER TABLE `series_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series_recommendations`
--
ALTER TABLE `series_recommendations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series_versions`
--
ALTER TABLE `series_versions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_series`
--
ALTER TABLE `students_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_assign_series_student_id_index` (`student_id`),
  ADD KEY `student_assign_series_series_id_index` (`series_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `channels_admins`
--
ALTER TABLE `channels_admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `channels_notifications`
--
ALTER TABLE `channels_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `channels_subscribers`
--
ALTER TABLE `channels_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `connections`
--
ALTER TABLE `connections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `conversations_students`
--
ALTER TABLE `conversations_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `demonstrators`
--
ALTER TABLE `demonstrators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `groups_admins`
--
ALTER TABLE `groups_admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `groups_members`
--
ALTER TABLE `groups_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `handwritings`
--
ALTER TABLE `handwritings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lecture_sections`
--
ALTER TABLE `lecture_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `series_book`
--
ALTER TABLE `series_book`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `series_recommendations`
--
ALTER TABLE `series_recommendations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `series_versions`
--
ALTER TABLE `series_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `students_series`
--
ALTER TABLE `students_series`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
