-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Apr 07, 2019 at 04:19 PM
-- Server version: 5.7.25
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfoliodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
CREATE TABLE IF NOT EXISTS `administrators` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administrators_active_idx` (`active`,`deleted`) USING BTREE,
  KEY `administrators_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  KEY `administrators_email_idx` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `first_name`, `last_name`, `nickname`, `email`, `contact_number`, `password`, `active`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 'Ma. Joie Malynne', 'Sardez', 'Joie', 'joiesardez@yahoo.com', '04XXXXXXXX', 'xxxxx', b'1', b'0', '2019-03-16 12:12:00', '2019-03-24 14:57:29'),
(2, 'Jane', 'Doe', 'JD11', 'jane@doe.net', '04YYYYYYYZ', '12311', b'1', b'1', '2019-03-17 12:12:00', '2019-03-24 14:57:20'),
(3, 'dasad', '3312', 'ads', 'a@b.com', '312', 'daad', NULL, b'1', NULL, '2019-03-17 13:33:56'),
(4, 'dfgdfgdf', 'gdfgd', 'gdfgdf', 'a@c.com', '321312', 'swdadq', b'0', b'1', '2019-03-16 15:00:01', '2019-03-17 13:34:04'),
(5, 'dadas', 'dasdas', 'dasas', '2asd@cvd.com', '1232', 'asdas', b'0', b'1', '2019-03-16 15:13:51', '2019-03-17 15:17:23'),
(6, 'aaaaa', 'aaaaaaaaaaaaaa', 'aaa', 'a@a.com', '123123131132', 'aaaaaaaaa', b'0', b'1', '2019-03-17 02:26:27', '2019-03-24 14:57:13'),
(7, 'Jane', 'Done', 'JD', 'jane@doe.com', '04YYYYYYYY', 'yyyyy', b'1', b'0', '2019-03-17 12:12:00', '2019-03-17 12:12:00'),
(8, 'rewrwe', 'rwerwe', 'dasa', 'a@bb.com', '1111', '31312', b'0', b'1', '2019-03-17 03:26:04', '2019-03-24 14:57:35'),
(9, 'hello', 'world', 'yeah', 'hello@world.com', '', 'hello', b'0', b'1', '2019-03-17 11:56:54', '2019-03-24 14:57:39'),
(10, 'hello', 'test', '', 'a111@b.com', '12331221', 'abc123', b'0', b'0', '2019-04-06 01:05:13', '2019-04-06 01:05:13'),
(11, 'aaa hey', 'yeah yo', 'arfa', 's@d.com', '12321312', '1234a', b'0', b'1', '2019-04-06 01:10:51', '2019-04-06 01:36:53'),
(12, 'asdass', 'assa', 'aaa', '12asad@da.com', '', 'qw121', b'0', b'1', '2019-04-06 01:18:25', '2019-04-06 01:24:08'),
(13, 'asdda', 'adsa', 'a', '1as@c.com', '', 'asas121', b'0', b'1', '2019-04-06 01:20:09', '2019-04-06 01:20:46'),
(14, 'dasadas', 'dasdaads', '', 'a@b.com', '', '1sas', b'1', b'1', '2019-04-06 02:33:20', '2019-04-06 02:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

DROP TABLE IF EXISTS `children`;
CREATE TABLE IF NOT EXISTS `children` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(150) DEFAULT NULL,
  `birthday` date NOT NULL,
  `group` varchar(50) DEFAULT NULL,
  `last_observation_activity` datetime DEFAULT NULL,
  `last_milestone_activity` datetime DEFAULT NULL,
  `last_teachingplan_activity` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `children_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  KEY `children_last_activity_idx` (`group`,`active`,`deleted`,`birthday`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`id`, `first_name`, `last_name`, `nickname`, `birthday`, `group`, `last_observation_activity`, `last_milestone_activity`, `last_teachingplan_activity`, `active`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 'James', 'Dell', 'James', '2017-08-10', 'Senior Babies', NULL, '2019-03-22 00:00:00', '2019-04-16 00:00:00', b'0', b'0', '2019-03-17 17:47:48', '2019-03-24 19:02:48'),
(2, 'Annabella', 'Whitehouse', 'Anna', '2017-02-27', 'Toddlers', '2019-04-05 00:00:00', '2019-03-15 00:00:00', '2019-03-22 00:00:00', b'0', b'0', '2019-03-19 01:44:45', '2019-03-24 16:13:35'),
(3, 'Irfan', 'Valentine', 'Irfan', '2016-03-01', 'Juniors', '2019-03-24 03:27:40', '2019-04-12 00:00:00', '2019-04-19 00:00:00', b'1', b'0', '2019-03-19 01:45:04', '2019-03-24 14:52:52'),
(4, 'Evie', 'Colley', 'Eve', '2019-02-08', 'Babies', '2019-03-15 00:00:00', '2019-04-13 00:00:00', '2019-03-16 00:00:00', b'0', b'0', '2019-03-19 01:45:25', '2019-03-24 14:53:37'),
(5, 'Arbaaz', 'Harrington', 'Arbie', '2015-03-17', 'Kinders', '2019-03-15 00:00:00', NULL, '2019-03-16 00:00:00', b'0', b'0', '2019-03-19 01:55:04', '2019-03-24 14:53:53'),
(8, 'aaa', 'aaa', 'aaa', '2019-03-03', 'Juniors', '2019-02-13 00:00:00', NULL, NULL, b'1', b'1', '2019-03-27 05:11:28', '2019-03-27 05:25:15'),
(9, 'xddd', 'dddd', 'ddsfd', '2019-03-15', 'Toddlers', NULL, '2019-04-18 00:00:00', NULL, b'0', b'0', '2019-03-30 09:44:38', '2019-03-30 09:44:38'),
(10, 'gdfgdfaaaa', 'gdfaaaa', '', '2019-01-02', 'Babies', NULL, NULL, NULL, b'1', b'1', '2019-04-06 23:03:39', '2019-04-06 23:04:24'),
(11, 'adasdasedited', 'dasdassdffsd', '', '2019-04-13', 'Babies', NULL, NULL, NULL, b'1', b'1', '2019-04-07 17:27:50', '2019-04-07 17:31:07'),
(12, 'das', 'dadasas', '', '2019-04-20', 'Juniors', NULL, NULL, NULL, b'0', b'0', '2019-04-07 17:31:26', '2019-04-07 17:31:26'),
(13, 'aaaaaaa', 'vvvvvvvvvvvv', '', '2019-04-16', 'Toddlers', NULL, NULL, NULL, b'0', b'1', '2019-04-07 17:32:26', '2019-04-07 17:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `educators`
--

DROP TABLE IF EXISTS `educators`;
CREATE TABLE IF NOT EXISTS `educators` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `last_observation_activity` datetime DEFAULT NULL,
  `last_milestone_activity` datetime DEFAULT NULL,
  `last_teachingplan_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `educators_active_idx` (`active`,`deleted`) USING BTREE,
  KEY `educators_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  KEY `educators_email_idx` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educators`
--

INSERT INTO `educators` (`id`, `first_name`, `last_name`, `nickname`, `email`, `contact_number`, `password`, `active`, `deleted`, `last_observation_activity`, `last_milestone_activity`, `last_teachingplan_activity`, `date_created`, `date_modified`) VALUES
(1, 'Karishma', 'Connolly', 'Kari', 'kari.connolly@gmail.com', '01156146', 'dsadasdsa', b'1', b'0', '2019-04-05 00:00:00', '2019-04-18 00:00:00', '2019-04-16 00:00:00', '2019-03-17 15:13:31', '2019-04-02 03:44:24'),
(2, 'Macy', 'Vang', 'Macy', 'macy.vang@gmail.com', '0151', '321312', b'0', b'0', '2019-03-24 15:07:43', NULL, '2019-04-19 00:00:00', '2019-03-17 15:16:09', '2019-03-24 20:40:37'),
(3, 'sddsa', 'dasdas', 'das', 'da@asdas.com', '5353534', '312312', b'0', b'1', NULL, NULL, NULL, '2019-03-19 23:09:52', '2019-03-19 23:12:27'),
(4, 'das', 'assa', 'sa', 'das@b.com', '2313321', 'dasdas', b'1', b'1', NULL, NULL, NULL, '2019-03-19 23:11:35', '2019-03-19 23:13:18'),
(5, 'dasd', 'sdas', 'das', 'das@sa.com', '321321', 'dsadas', b'0', b'1', NULL, NULL, NULL, '2019-03-27 05:27:19', '2019-03-27 05:29:49'),
(6, 'aaa', 'adasdasd', '', 'a@b.com', '312321312', '123312a', b'1', b'0', NULL, NULL, NULL, '2019-04-06 01:45:42', '2019-04-06 02:10:51'),
(7, 'fdsfsdfs', 'fdsfs', '', 'a@b1.com', '', '12sa', b'0', b'0', NULL, NULL, NULL, '2019-04-06 02:08:36', '2019-04-06 02:08:36'),
(8, 'asdda', 'dasdad', '', 'a@b2.com', '', '31132aaa', b'1', b'0', NULL, NULL, NULL, '2019-04-06 02:10:21', '2019-04-06 02:10:30'),
(9, 'meh', 'as', 'asdas', 's@c.com', '12345678', '312aas1', b'1', b'0', NULL, NULL, NULL, '2019-04-06 02:13:59', '2019-04-06 02:49:27'),
(10, 'dasdasd', 'dasdaads', '', 'das@sa.com', '', '123qa', b'0', b'0', NULL, NULL, NULL, '2019-04-06 02:49:07', '2019-04-06 02:49:07'),
(11, 'adaasd', 'dasdasads', '', 'das@saa.com', '123212321123', 'as12', b'0', b'0', NULL, NULL, NULL, '2019-04-06 02:54:42', '2019-04-06 02:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `educators_assignment`
--

DROP TABLE IF EXISTS `educators_assignment`;
CREATE TABLE IF NOT EXISTS `educators_assignment` (
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`educator_id`,`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educators_assignment`
--

INSERT INTO `educators_assignment` (`educator_id`, `child_id`) VALUES
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 4),
(6, 2),
(6, 4),
(6, 9),
(7, 1),
(7, 2),
(7, 9),
(8, 4),
(8, 5),
(9, 1),
(9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `feedback` text NOT NULL,
  `giver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `giver_role` varchar(50) DEFAULT NULL,
  `giver_name` varchar(250) DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_child_id_idx` (`child_id`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `child_id`, `feedback`, `giver_id`, `giver_role`, `giver_name`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 1, 'Thank you for all the hardwork', 0, 'Parent / Guardian', 'Joie Sardez', b'0', '2019-04-05 00:00:00', '2019-04-05 00:00:00'),
(2, 1, 'You\'re welcome!', 0, 'Educator', 'Edu Cator', b'0', '2019-04-06 00:00:00', '2019-04-06 00:00:00'),
(3, 2, 'testing lang', 1, 'Administrator', 'test user', b'0', '2019-04-07 21:01:11', '2019-04-07 21:01:11'),
(4, 1, 'yeah', 1, 'Administrator', 'test user', b'1', '2019-04-07 21:01:27', '2019-04-07 21:01:27'),
(5, 1, 'again test', 1, 'Administrator', 'test user', b'1', '2019-04-07 21:01:38', '2019-04-07 21:01:38'),
(6, 1, 'hellow', 1, 'Administrator', 'test user', b'1', '2019-04-07 21:05:15', '2019-04-07 21:05:15'),
(7, 1, 'testing', 1, 'Administrator', 'test user', b'0', '2019-04-07 23:36:46', '2019-04-07 23:36:46'),
(8, 1, 'bloop', 1, 'Administrator', 'test user', b'1', '2019-04-07 23:37:47', '2019-04-07 23:37:47'),
(9, 1, 'bloop1', 1, 'Administrator', 'test user', b'1', '2019-04-07 23:39:19', '2019-04-07 23:39:19'),
(10, 1, 'yeyeye', 1, 'Administrator', 'test user', b'0', '2019-04-07 23:41:54', '2019-04-07 23:41:54'),
(11, 1, 'yeyeyeyep', 1, 'Administrator', 'test user', b'0', '2019-04-07 23:43:05', '2019-04-07 23:43:05'),
(12, 1, 'yeyeyeyep', 1, 'Administrator', 'test user', b'0', '2019-04-07 23:44:33', '2019-04-07 23:44:33'),
(13, 1, 'meh', 1, 'Administrator', 'test user', b'0', '2019-04-07 23:45:13', '2019-04-07 23:45:13'),
(14, 2, 'test 1234', 1, 'Administrator', 'test user', b'0', '2019-04-07 23:46:33', '2019-04-07 23:46:33'),
(15, 2, 'test 1234', 1, 'Administrator', 'test user', b'0', '2019-04-07 23:47:17', '2019-04-07 23:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
CREATE TABLE IF NOT EXISTS `milestones` (
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `age_group` varchar(50) NOT NULL,
  `developmental_area` varchar(50) NOT NULL,
  `observation` varchar(200) NOT NULL,
  `outcome_id` smallint(5) UNSIGNED NOT NULL,
  `date_tracked` date NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  KEY `milestone_educator_id_idx` (`educator_id`,`child_id`,`date_tracked`) USING BTREE,
  KEY `milestone_age_group_idx` (`age_group`,`developmental_area`,`observation`,`outcome_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`child_id`, `age_group`, `developmental_area`, `observation`, `outcome_id`, `date_tracked`, `educator_id`) VALUES
(1, 'Birth to 4 months', 'Physical', 'squirms, arms wave, legs move up and down', 3, '2019-02-28', 1),
(1, '8 to 12 months', 'Emotional', 'actively seeks to be next to parent or principal caregiver', 3, '2019-03-06', 1),
(1, '1 to 2 years', 'Cognitive', 'points to objects when named', 2, '2019-03-22', 1),
(1, '2 to 3 years', 'Language', 'uses two or three words together, e.g. “go potty now”', 3, '2019-03-05', 1),
(2, 'Birth to 4 months', 'Physical', 'moves whole body', 3, '2019-03-14', 2),
(2, 'Birth to 4 months', 'Physical', 'squirms, arms wave, legs move up and down', 2, '2019-03-15', 1),
(2, '4 to 8 months', 'Social', 'responds to own name', 2, '2019-03-06', 1),
(2, '8 to 12 months', 'Emotional', 'actively seeks to be next to parent or principal caregiver', 4, '2019-03-13', 1),
(2, '1 to 2 years', 'Cognitive', 'repeats actions that lead to interesting/predictable results, e.g. bangs spoon on saucepan', 2, '2019-03-01', 1),
(2, '2 to 3 years', 'Language', '‘explosion’ of vocabulary and use of correct grammatical forms of language', 2, '2019-02-28', 1),
(2, '3 to 5 years', 'Seek advice', 'has speech fluency problems or stammering', 3, '2019-02-26', 1),
(4, 'Birth to 4 months', 'Physical', 'moves whole body', 0, '2019-03-06', 1),
(4, '3 to 5 years', 'Seek advice', 'is not understood by others', 2, '2019-04-13', 1),
(4, '3 to 5 years', 'Seek advice', 'has speech fluency problems or stammering', 2, '2019-04-11', 1),
(9, '3 to 5 years', 'Seek advice', 'has speech fluency problems or stammering', 2, '2019-04-18', 1),
(3, 'Birth to 4 months', 'Physical', 'moves whole body', 3, '2019-04-12', 1),
(3, 'Birth to 4 months', 'Physical', 'squirms, arms wave, legs move up and down', 5, '2019-04-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `notification_for` varchar(100) DEFAULT NULL,
  `target_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_name` varchar(250) DEFAULT NULL,
  `giver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `giver_role` varchar(50) DEFAULT NULL,
  `giver_name` varchar(250) DEFAULT NULL,
  `recipient_id` bigint(20) UNSIGNED DEFAULT NULL,
  `recipient_role` varchar(50) DEFAULT NULL,
  `marked_read` bit(1) DEFAULT b'0',
  `deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_recipient_idx` (`recipient_id`,`recipient_role`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notification_for`, `target_id`, `child_id`, `child_name`, `giver_id`, `giver_role`, `giver_name`, `recipient_id`, `recipient_role`, `marked_read`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 'Feedback', 1, 1, 'James', 1, 'Administrator', 'test user', 2, 'Educator', b'1', b'1', '2019-04-07 23:45:13', '2019-04-08 02:15:52'),
(2, 'Feedback', 1, 1, 'James', 1, 'Administrator', 'test user', 7, 'Educator', b'0', b'0', '2019-04-07 23:45:13', '2019-04-07 23:45:13'),
(3, 'Feedback', 1, 1, 'James', 1, 'Administrator', 'test user', 9, 'Educator', b'0', b'0', '2019-04-07 23:45:13', '2019-04-07 23:45:13'),
(4, 'Feedback', 2, 2, 'Annabella', 1, 'Administrator', 'test user', 1, 'Parent / Guardian', b'0', b'0', '2019-04-07 23:46:33', '2019-04-07 23:46:33'),
(6, 'Feedback', 2, 2, 'Annabella', 1, 'Administrator', 'test user', 1, 'Parent / Guardian', b'0', b'0', '2019-04-07 23:47:17', '2019-04-07 23:47:17'),
(7, 'Feedback', 2, 2, 'Annabella', 1, 'Administrator', 'test user', 2, 'Educator', b'0', b'1', '2019-04-07 23:47:17', '2019-04-08 02:15:41'),
(8, 'Feedback', 2, 2, 'Annabella', 1, 'Administrator', 'test user', 6, 'Educator', b'0', b'0', '2019-04-07 23:47:17', '2019-04-07 23:47:17'),
(9, 'Feedback', 2, 2, 'Annabella', 1, 'Administrator', 'test user', 7, 'Educator', b'0', b'0', '2019-04-07 23:47:17', '2019-04-07 23:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `observations`
--

DROP TABLE IF EXISTS `observations`;
CREATE TABLE IF NOT EXISTS `observations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `observation` text NOT NULL,
  `outcome_id` smallint(5) UNSIGNED NOT NULL,
  `date_tracked` date NOT NULL,
  `published` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `observations_educator_id_idx` (`educator_id`,`child_id`,`outcome_id`,`date_tracked`,`published`,`deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observations`
--

INSERT INTO `observations` (`id`, `educator_id`, `child_id`, `observation`, `outcome_id`, `date_tracked`, `published`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 1, 1, 'he good', 2, '2019-03-13', b'1', b'0', '2019-03-14 00:00:00', '2019-03-23 20:30:34'),
(2, 0, 3, 'he good\nyeah!', 3, '2019-03-08', b'0', b'1', '2019-03-23 19:35:53', '2019-03-24 00:32:44'),
(3, 0, 2, 'yeah', 4, '2019-03-22', b'1', b'0', '2019-03-23 19:52:19', '2019-03-23 20:30:44'),
(4, 1, 5, 'He openly express his feelings and ideas in his interactions with other children. He also responded to ideas and suggestions from others.', 1, '2019-03-15', b'0', b'0', '2019-03-23 21:54:57', '2019-03-24 19:59:06'),
(5, 1, 2, 'for baby 2', 2, '2019-03-16', b'1', b'0', '2019-03-23 22:01:47', '2019-03-30 17:12:28'),
(11, 1, 5, 'ddas ascew aaa', 5, '2019-03-15', b'1', b'0', '2019-03-28 23:00:50', '2019-03-28 23:26:50'),
(13, 1, 4, 'aaaa', 5, '2019-03-15', b'0', b'1', '2019-03-29 00:36:39', '2019-03-29 00:53:34'),
(14, 1, 1, 'dadadads', 4, '2019-03-23', b'1', b'1', '2019-03-29 01:12:15', '2019-03-29 01:13:22'),
(15, 1, 2, 'fsdfd', 2, '2019-04-05', b'0', b'1', '2019-04-06 23:38:04', '2019-04-06 23:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `parents_guardians`
--

DROP TABLE IF EXISTS `parents_guardians`;
CREATE TABLE IF NOT EXISTS `parents_guardians` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `type` varchar(15) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parents_guardians_active_idx` (`active`,`deleted`,`type`) USING BTREE,
  KEY `parents_guardians_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  KEY `parents_guardians_index` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents_guardians`
--

INSERT INTO `parents_guardians` (`id`, `first_name`, `last_name`, `nickname`, `email`, `password`, `contact_number`, `type`, `active`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 'Huzaifah', 'Harrington', 'Zai', 'zai.harrington@gmail.com', 'fniouhi', '02312321', 'Parent', b'1', b'0', '2019-03-17 16:53:41', '2019-03-31 17:49:47'),
(2, 'adsdsadas', 'wqeqweqw', '12312', 's@f.com', 'asdasd', '32312312', 'Guardian', b'0', b'1', '2019-03-20 06:57:52', '2019-03-20 07:00:16'),
(4, 'dsas', 'das', 'dasd', 'a@b.com', 'sadas', '321312', 'Guardian', b'1', b'1', '2019-03-27 05:36:39', '2019-03-27 05:38:08'),
(5, 'sddas', 'fsdfs', 'mrh', 's@f.com', 'dsdfs12', '', 'Guardian', b'1', b'1', '2019-04-06 03:05:08', '2019-04-06 03:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `parents_guardians_assignment`
--

DROP TABLE IF EXISTS `parents_guardians_assignment`;
CREATE TABLE IF NOT EXISTS `parents_guardians_assignment` (
  `parentguardian_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`parentguardian_id`,`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents_guardians_assignment`
--

INSERT INTO `parents_guardians_assignment` (`parentguardian_id`, `child_id`) VALUES
(1, 2),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stats_all`
--

DROP TABLE IF EXISTS `stats_all`;
CREATE TABLE IF NOT EXISTS `stats_all` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_milestones` int(11) NOT NULL DEFAULT '0',
  `total_observations` int(11) NOT NULL DEFAULT '0',
  `total_itps` int(11) NOT NULL DEFAULT '0',
  `total_itps_open` int(11) NOT NULL DEFAULT '0',
  `total_parents_guardians` int(11) NOT NULL DEFAULT '0',
  `total_parents` int(11) NOT NULL DEFAULT '0',
  `total_guardians` int(11) NOT NULL DEFAULT '0',
  `total_children` int(11) NOT NULL DEFAULT '0',
  `total_babies` int(11) NOT NULL DEFAULT '0',
  `total_senior_babies` int(11) NOT NULL DEFAULT '0',
  `total_toddlers` int(11) NOT NULL DEFAULT '0',
  `total_juniors` int(11) NOT NULL DEFAULT '0',
  `total_kinders` int(11) NOT NULL DEFAULT '0',
  `total_educators` int(11) NOT NULL DEFAULT '0',
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_all`
--

INSERT INTO `stats_all` (`id`, `total_milestones`, `total_observations`, `total_itps`, `total_itps_open`, `total_parents_guardians`, `total_parents`, `total_guardians`, `total_children`, `total_babies`, `total_senior_babies`, `total_toddlers`, `total_juniors`, `total_kinders`, `total_educators`, `last_update_mode`, `date_modified`) VALUES
(1, 18, 5, 3, 1, 1, 1, 0, 7, 1, 1, 2, 2, 1, 8, 'Event', '2019-04-07 17:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `stats_children`
--

DROP TABLE IF EXISTS `stats_children`;
CREATE TABLE IF NOT EXISTS `stats_children` (
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `total_milestones` int(11) NOT NULL DEFAULT '0',
  `total_observations` int(11) NOT NULL DEFAULT '0',
  `total_itps` int(11) NOT NULL DEFAULT '0',
  `total_itps_open` int(11) NOT NULL DEFAULT '0',
  `total_milestones_physical` int(11) NOT NULL DEFAULT '0',
  `total_milestones_social` int(11) NOT NULL DEFAULT '0',
  `total_milestones_emotional` int(11) NOT NULL DEFAULT '0',
  `total_milestones_cognitive` int(11) NOT NULL DEFAULT '0',
  `total_milestones_language` int(11) NOT NULL DEFAULT '0',
  `total_milestones_seek_advice` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome1` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome2` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome3` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome4` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome5` int(11) NOT NULL DEFAULT '0',
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_children`
--

INSERT INTO `stats_children` (`child_id`, `total_milestones`, `total_observations`, `total_itps`, `total_itps_open`, `total_milestones_physical`, `total_milestones_social`, `total_milestones_emotional`, `total_milestones_cognitive`, `total_milestones_language`, `total_milestones_seek_advice`, `total_observations_outcome1`, `total_observations_outcome2`, `total_observations_outcome3`, `total_observations_outcome4`, `total_observations_outcome5`, `last_update_mode`, `date_modified`) VALUES
(1, 4, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 'Event', '2019-04-06 23:51:30'),
(2, 7, 2, 0, 0, 2, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 'Event', '2019-04-06 23:38:09'),
(3, 3, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Event', '2019-04-06 13:21:15'),
(4, 3, 0, 2, 1, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 'FullUpdate', '2019-04-03 14:27:37'),
(5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'FullUpdate', '2019-04-03 14:27:37'),
(9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'FullUpdate', '2019-04-03 14:27:37'),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Event', '2019-04-06 12:03:54'),
(11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Event', '2019-04-07 07:30:43'),
(13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Event', '2019-04-07 07:32:26');

-- --------------------------------------------------------

--
-- Table structure for table `stats_children_milestones_pending`
--

DROP TABLE IF EXISTS `stats_children_milestones_pending`;
CREATE TABLE IF NOT EXISTS `stats_children_milestones_pending` (
  `child_id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `current_group` varchar(50) NOT NULL,
  `current_age_group` varchar(50) NOT NULL,
  `pending_milestones` text NOT NULL,
  `total` int(11) NOT NULL,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_children_milestones_pending`
--

INSERT INTO `stats_children_milestones_pending` (`child_id`, `name`, `current_group`, `current_age_group`, `pending_milestones`, `total`, `last_update_mode`, `date_modified`) VALUES
(1, 'James Dell', 'Senior Babies', '1 to 2 years', 'Physical: 17, Social: 3, Emotional: 5, Cognitive: 12, Language: 6', 43, 'FullUpdate', '2019-04-03 14:27:37'),
(2, 'Annabella Whitehouse', 'Toddlers', '2 to 3 years', 'Physical: 16, Social: 4, Emotional: 5, Cognitive: 13, Language: 9', 47, 'FullUpdate', '2019-04-03 14:27:37'),
(3, 'Irfan Valentine', 'Juniors', '3 to 5 years', 'Physical: 17, Social: 5, Emotional: 7, Cognitive: 17, Language: 10', 56, 'FullUpdate', '2019-04-03 14:27:37'),
(4, 'Evie Colley', 'Babies', 'Birth to 4 months', 'Physical: 12, Social: 5, Emotional: 4, Cognitive: 7, Language: 7', 35, 'FullUpdate', '2019-04-03 14:27:37'),
(5, 'Arbaaz Harrington', 'Kinders', '3 to 5 years', 'Physical: 17, Social: 5, Emotional: 7, Cognitive: 17, Language: 10', 56, 'FullUpdate', '2019-04-03 14:27:37'),
(9, 'xddd dddd', 'Toddlers', 'Birth to 4 months', 'Physical: 12, Social: 5, Emotional: 4, Cognitive: 7, Language: 7', 35, 'FullUpdate', '2019-04-03 14:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `stats_children_observations_due`
--

DROP TABLE IF EXISTS `stats_children_observations_due`;
CREATE TABLE IF NOT EXISTS `stats_children_observations_due` (
  `child_id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `group` varchar(50) NOT NULL,
  `last_observation` date DEFAULT NULL,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_children_observations_due`
--

INSERT INTO `stats_children_observations_due` (`child_id`, `name`, `group`, `last_observation`, `last_update_mode`, `date_modified`) VALUES
(1, 'James Dell', 'Senior Babies', NULL, 'FullUpdate', '2019-04-03 14:27:37'),
(9, 'xddd dddd', 'Toddlers', NULL, 'FullUpdate', '2019-04-03 14:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `stats_children_seek_advice`
--

DROP TABLE IF EXISTS `stats_children_seek_advice`;
CREATE TABLE IF NOT EXISTS `stats_children_seek_advice` (
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `current_group` varchar(50) NOT NULL,
  `milestone_age_group` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_children_seek_advice`
--

INSERT INTO `stats_children_seek_advice` (`child_id`, `name`, `current_group`, `milestone_age_group`, `count`, `last_update_mode`, `date_modified`) VALUES
(2, 'Annabella Whitehouse', 'Toddlers', '3 to 5 years', 1, 'FullUpdate', '2019-04-03 14:27:37'),
(4, 'Evie Colley', 'Babies', '3 to 5 years', 2, 'FullUpdate', '2019-04-03 14:27:37'),
(9, 'xddd dddd', 'Toddlers', '3 to 5 years', 1, 'FullUpdate', '2019-04-03 14:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `stats_educators`
--

DROP TABLE IF EXISTS `stats_educators`;
CREATE TABLE IF NOT EXISTS `stats_educators` (
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `total_milestones` int(11) NOT NULL DEFAULT '0',
  `total_observations` int(11) NOT NULL DEFAULT '0',
  `total_observations_unpublished` int(11) NOT NULL DEFAULT '0',
  `total_itps` int(11) NOT NULL DEFAULT '0',
  `total_itps_open` int(11) NOT NULL DEFAULT '0',
  `total_children` int(11) NOT NULL DEFAULT '0',
  `total_milestones_physical` int(11) NOT NULL DEFAULT '0',
  `total_milestones_social` int(11) NOT NULL DEFAULT '0',
  `total_milestones_emotional` int(11) NOT NULL DEFAULT '0',
  `total_milestones_cognitive` int(11) NOT NULL DEFAULT '0',
  `total_milestones_language` int(11) NOT NULL DEFAULT '0',
  `total_milestones_seek_advice` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome1` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome2` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome3` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome4` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome5` int(11) NOT NULL DEFAULT '0',
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`educator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_educators`
--

INSERT INTO `stats_educators` (`educator_id`, `total_milestones`, `total_observations`, `total_observations_unpublished`, `total_itps`, `total_itps_open`, `total_children`, `total_milestones_physical`, `total_milestones_social`, `total_milestones_emotional`, `total_milestones_cognitive`, `total_milestones_language`, `total_milestones_seek_advice`, `total_observations_outcome1`, `total_observations_outcome2`, `total_observations_outcome3`, `total_observations_outcome4`, `total_observations_outcome5`, `last_update_mode`, `date_modified`) VALUES
(1, 17, 4, 0, 2, 1, 2, 5, 1, 3, 2, 2, 4, 0, 0, 0, 0, 0, 'Event', '2019-04-06 13:21:15'),
(2, 1, 0, 0, 1, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'FullUpdate', '2019-04-03 14:27:37'),
(6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Event', '2019-04-05 15:10:40'),
(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Event', '2019-04-05 15:10:55'),
(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Event', '2019-04-05 15:49:19'),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Event', '2019-04-05 15:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `stats_educators_tracking`
--

DROP TABLE IF EXISTS `stats_educators_tracking`;
CREATE TABLE IF NOT EXISTS `stats_educators_tracking` (
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `groups_handled` varchar(250) NOT NULL,
  `total_children` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_children_seeking_advice` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_children_milestones_pending` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_children_observations_due` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_milestones` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_observations` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_itps` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_educators_tracking`
--

INSERT INTO `stats_educators_tracking` (`educator_id`, `name`, `groups_handled`, `total_children`, `total_children_seeking_advice`, `total_children_milestones_pending`, `total_children_observations_due`, `total_milestones`, `total_observations`, `total_itps`, `last_update_mode`, `date_modified`) VALUES
(1, 'Karishma Connolly', 'Juniors, Kinders', 2, 0, 2, 0, 15, 4, 2, 'FullUpdate', '2019-04-03 14:27:37'),
(2, 'Macy Vang', 'Senior Babies, Toddlers, Babies', 3, 2, 3, 1, 1, 0, 1, 'FullUpdate', '2019-04-03 14:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `teaching_plans`
--

DROP TABLE IF EXISTS `teaching_plans`;
CREATE TABLE IF NOT EXISTS `teaching_plans` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `target_outcome_id` smallint(5) UNSIGNED DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `done` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teaching_plans_child_id_idx` (`child_id`,`educator_id`,`target_outcome_id`,`target_date`,`deleted`,`done`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaching_plans`
--

INSERT INTO `teaching_plans` (`id`, `educator_id`, `child_id`, `title`, `details`, `target_outcome_id`, `target_date`, `done`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 2, 3, 'Teach him', 'teach him yeah!', 2, '2019-04-19', b'1', b'0', '2019-03-22 00:00:00', '2019-03-24 20:33:14'),
(2, 1, 4, 'Do this and that', 'Do this and that :)', 3, '2019-06-26', b'0', b'0', '2019-03-24 02:20:37', '2019-03-24 15:09:00'),
(3, 1, 2, 'hey', 'yo', 3, '2019-03-22', b'0', b'1', '2019-03-27 06:46:53', '2019-03-27 06:52:08'),
(4, 1, 4, 'ewqeqw', 'eqweqw', 3, '2019-03-16', b'1', b'0', '2019-03-28 23:36:00', '2019-03-28 23:37:59'),
(5, 1, 3, 'dsadadas', 'dasdsadsadadas', 2, '2019-03-16', b'1', b'1', '2019-03-29 01:03:13', '2019-03-29 01:04:31'),
(6, 1, 1, 'adsaddas', '1211', 3, '2019-04-16', b'0', b'1', '2019-04-06 23:50:56', '2019-04-06 23:51:30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
