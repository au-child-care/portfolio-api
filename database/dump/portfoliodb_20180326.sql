-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 25, 2019 at 05:46 PM
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
CREATE DATABASE IF NOT EXISTS `portfoliodb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `portfoliodb`;

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(9, 'hello', 'world', 'yeah', 'hello@world.com', '', 'hello', b'0', b'1', '2019-03-17 11:56:54', '2019-03-24 14:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`id`, `first_name`, `last_name`, `nickname`, `birthday`, `group`, `last_observation_activity`, `last_milestone_activity`, `last_teachingplan_activity`, `active`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 'James', 'Dell', 'James', '2017-08-10', 'Senior Babies', NULL, NULL, NULL, b'0', b'0', '2019-03-17 17:47:48', '2019-03-24 19:02:48'),
(2, 'Annabella', 'Whitehouse', 'Anna', '2017-07-27', 'Toddlers', '2019-03-16 00:00:00', '2019-03-15 00:00:00', NULL, b'0', b'0', '2019-03-19 01:44:45', '2019-03-24 16:13:35'),
(3, 'Irfan', 'Valentine', 'Irfan', '2016-03-01', 'Juniors', '2019-03-24 03:27:40', '2019-03-11 00:00:00', '2019-04-19 00:00:00', b'1', b'0', '2019-03-19 01:45:04', '2019-03-24 14:52:52'),
(4, 'Evie', 'Colley', 'Eve', '2019-02-08', 'Babies', '2019-03-24 15:09:01', '2019-03-06 00:00:00', NULL, b'0', b'0', '2019-03-19 01:45:25', '2019-03-24 14:53:37'),
(5, 'Arbaaz', 'Harrington', 'Arbie', '2015-03-17', 'Kinders', '2019-03-15 00:00:00', NULL, '2019-03-04 00:00:00', b'0', b'0', '2019-03-19 01:55:04', '2019-03-24 14:53:53'),
(6, 'asd', 'dsa', 'das', '2019-03-06', 'Babies', NULL, NULL, '2019-03-06 00:00:00', b'0', b'1', '2019-03-20 06:23:22', '2019-03-20 06:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `educators`
--

CREATE TABLE `educators` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educators`
--

INSERT INTO `educators` (`id`, `first_name`, `last_name`, `nickname`, `email`, `contact_number`, `password`, `active`, `deleted`, `last_observation_activity`, `last_milestone_activity`, `last_teachingplan_activity`, `date_created`, `date_modified`) VALUES
(1, 'Karishma', 'Connolly', 'Kari', 'kari.connolly@gmail.com', '01156146', 'dsadasdsa', b'1', b'0', '2019-03-16 00:00:00', '2019-03-15 00:00:00', NULL, '2019-03-17 15:13:31', '2019-03-24 20:39:27'),
(2, 'Macy', 'Vang', 'Macy', 'macy.vang@gmail.com', '0151', '321312', b'0', b'0', '2019-03-24 15:07:43', NULL, '2019-04-19 00:00:00', '2019-03-17 15:16:09', '2019-03-24 20:40:37'),
(3, 'sddsa', 'dasdas', 'das', 'da@asdas.com', '5353534', '312312', b'0', b'1', NULL, NULL, NULL, '2019-03-19 23:09:52', '2019-03-19 23:12:27'),
(4, 'das', 'assa', 'sa', 'das@b.com', '2313321', 'dasdas', b'1', b'1', NULL, NULL, NULL, '2019-03-19 23:11:35', '2019-03-19 23:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `educators_assignment`
--

CREATE TABLE `educators_assignment` (
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educators_assignment`
--

INSERT INTO `educators_assignment` (`educator_id`, `child_id`) VALUES
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `feedback` text NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `educator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `age_group` varchar(50) NOT NULL,
  `developmental_area` varchar(50) NOT NULL,
  `observation` varchar(200) NOT NULL,
  `outcome_id` smallint(5) UNSIGNED NOT NULL,
  `date_tracked` date NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`child_id`, `age_group`, `developmental_area`, `observation`, `outcome_id`, `date_tracked`, `educator_id`) VALUES
(3, '8 to 12 months', 'Emotional', 'shows signs of anxiety or stress if parent goes away', 3, '2019-03-13', 1),
(5, '8 to 12 months', 'Emotional', 'hellow', 3, '2019-03-16', 1),
(2, 'Birth to 4 months', 'Physical', 'moves whole body', 3, '2019-03-14', 2),
(2, 'Birth to 4 months', 'Physical', 'squirms, arms wave, legs move up and down', 2, '2019-03-15', 1),
(2, '4 to 8 months', 'Social', 'responds to own name', 2, '2019-03-06', 1),
(2, '8 to 12 months', 'Emotional', 'actively seeks to be next to parent or principal caregiver', 4, '2019-03-13', 1),
(2, '1 to 2 years', 'Cognitive', 'repeats actions that lead to interesting/predictable results, e.g. bangs spoon on saucepan', 2, '2019-03-01', 1),
(2, '2 to 3 years', 'Language', '‘explosion’ of vocabulary and use of correct grammatical forms of language', 2, '2019-02-28', 1),
(2, '3 to 5 years', 'Seek advice', 'has speech fluency problems or stammering', 3, '2019-02-26', 1),
(4, 'Birth to 4 months', 'Physical', 'moves whole body', 0, '2019-03-06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `observations`
--

CREATE TABLE `observations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `observation` text NOT NULL,
  `outcome_id` smallint(5) UNSIGNED NOT NULL,
  `date_tracked` date NOT NULL,
  `published` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observations`
--

INSERT INTO `observations` (`id`, `educator_id`, `child_id`, `observation`, `outcome_id`, `date_tracked`, `published`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 1, 1, 'he good', 2, '2019-03-13', b'1', b'0', '2019-03-14 00:00:00', '2019-03-23 20:30:34'),
(2, 0, 3, 'he good\nyeah!', 3, '2019-03-08', b'0', b'1', '2019-03-23 19:35:53', '2019-03-24 00:32:44'),
(3, 0, 2, 'yeah', 4, '2019-03-22', b'1', b'0', '2019-03-23 19:52:19', '2019-03-23 20:30:44'),
(4, 1, 5, 'He openly express his feelings and ideas in his interactions with other children. He also responded to ideas and suggestions from others.', 1, '2019-03-15', b'0', b'0', '2019-03-23 21:54:57', '2019-03-24 19:59:06'),
(5, 1, 2, 'for baby 2', 2, '2019-03-16', b'1', b'0', '2019-03-23 22:01:47', '2019-03-24 20:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `parents_guardians`
--

CREATE TABLE `parents_guardians` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents_guardians`
--

INSERT INTO `parents_guardians` (`id`, `first_name`, `last_name`, `nickname`, `email`, `password`, `contact_number`, `type`, `active`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 'Huzaifah', 'Harrington', 'Zai', 'zai.harrington@gmail.com', 'fniouhi', '02312321', 'Parent', b'1', b'0', '2019-03-17 16:53:41', '2019-03-24 15:02:34'),
(2, 'adsdsadas', 'wqeqweqw', '12312', 's@f.com', 'asdasd', '32312312', 'Guardian', b'0', b'1', '2019-03-20 06:57:52', '2019-03-20 07:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `parents_guardians_assignment`
--

CREATE TABLE `parents_guardians_assignment` (
  `parentguardian_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents_guardians_assignment`
--

INSERT INTO `parents_guardians_assignment` (`parentguardian_id`, `child_id`) VALUES
(1, 3),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stats_all`
--

CREATE TABLE `stats_all` (
  `total_milestones` int(11) NOT NULL DEFAULT '0',
  `total_observations` int(11) NOT NULL DEFAULT '0',
  `total_itps` int(11) NOT NULL DEFAULT '0',
  `total_itps_open` int(11) NOT NULL DEFAULT '0',
  `total_parents_guardians` int(11) NOT NULL DEFAULT '0',
  `total_parents` int(11) NOT NULL DEFAULT '0',
  `total_guardians` int(11) NOT NULL DEFAULT '0',
  `total_parents_guardians_babies` int(11) NOT NULL DEFAULT '0',
  `total_parents_guardians_senior_babies` int(11) NOT NULL DEFAULT '0',
  `total_parents_guardians_toddlers` int(11) NOT NULL DEFAULT '0',
  `total_parents_guardians_juniors` int(11) NOT NULL DEFAULT '0',
  `total_parents_guardians_kinders` int(11) NOT NULL DEFAULT '0',
  `total_children` int(11) NOT NULL DEFAULT '0',
  `total_babies` int(11) NOT NULL DEFAULT '0',
  `total_senior_babies` int(11) NOT NULL DEFAULT '0',
  `total_toddlers` int(11) NOT NULL DEFAULT '0',
  `total_juniors` int(11) NOT NULL DEFAULT '0',
  `total_kinders` int(11) NOT NULL DEFAULT '0',
  `total_educators` int(11) NOT NULL DEFAULT '0',
  `total_educators_babies` int(11) NOT NULL DEFAULT '0',
  `total_educators_senior_babies` int(11) NOT NULL DEFAULT '0',
  `total_educators_toddlers` int(11) NOT NULL DEFAULT '0',
  `total_educators_juniors` int(11) NOT NULL DEFAULT '0',
  `total_educators_kinders` int(11) NOT NULL DEFAULT '0',
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stats_children`
--

CREATE TABLE `stats_children` (
  `child_id` bigint(20) NOT NULL,
  `total_milestones` int(11) NOT NULL DEFAULT '0',
  `total_observations` int(11) NOT NULL DEFAULT '0',
  `total_itps` int(11) NOT NULL DEFAULT '0',
  `total_itps_open` int(11) NOT NULL DEFAULT '0',
  `total_milestones_physical` int(11) NOT NULL DEFAULT '0',
  `total_milestones_social` int(11) NOT NULL DEFAULT '0',
  `total_milestones_emotional` int(11) NOT NULL DEFAULT '0',
  `total_milestones_cognitive` int(11) NOT NULL DEFAULT '0',
  `total_milestones_Language` int(11) NOT NULL DEFAULT '0',
  `total_milestones_seek_advice` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome1` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome2` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome3` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome4` int(11) NOT NULL DEFAULT '0',
  `total_observations_outcome5` int(11) NOT NULL DEFAULT '0',
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stats_educators`
--

CREATE TABLE `stats_educators` (
  `educator_id` bigint(20) NOT NULL,
  `total_milestones` int(11) NOT NULL DEFAULT '0',
  `total_observations` int(11) NOT NULL DEFAULT '0',
  `total_itps` int(11) NOT NULL DEFAULT '0',
  `total_itps_open` int(11) NOT NULL DEFAULT '0',
  `total_children` int(11) NOT NULL DEFAULT '0',
  `total_babies` int(11) NOT NULL DEFAULT '0',
  `total_senior_babies` int(11) NOT NULL DEFAULT '0',
  `total_toddlers` int(11) NOT NULL DEFAULT '0',
  `total_juniors` int(11) NOT NULL DEFAULT '0',
  `total_kinders` int(11) NOT NULL DEFAULT '0',
  `total_milestones_physical` int(11) NOT NULL DEFAULT '0',
  `total_milestones_social` int(11) NOT NULL DEFAULT '0',
  `total_milestones_emotional` int(11) NOT NULL DEFAULT '0',
  `total_milestones_cognitive` int(11) NOT NULL DEFAULT '0',
  `total_milestones_Language` int(11) NOT NULL DEFAULT '0',
  `total_milestones_seek_advice` int(11) NOT NULL DEFAULT '0',
  `total_observation_outcome1` int(11) NOT NULL DEFAULT '0',
  `total_observation_outcome2` int(11) NOT NULL DEFAULT '0',
  `total_observation_outcome3` int(11) NOT NULL DEFAULT '0',
  `total_observation_outcome4` int(11) NOT NULL DEFAULT '0',
  `total_observation_outcome5` int(11) NOT NULL DEFAULT '0',
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teaching_plans`
--

CREATE TABLE `teaching_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `target_outcome_id` smallint(5) UNSIGNED DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `done` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaching_plans`
--

INSERT INTO `teaching_plans` (`id`, `educator_id`, `child_id`, `title`, `details`, `target_outcome_id`, `target_date`, `done`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 2, 3, 'Teach him', 'teach him yeah!', 2, '2019-04-19', b'1', b'0', '2019-03-22 00:00:00', '2019-03-24 20:33:14'),
(2, 1, 4, 'Do this and that', 'Do this and that :)', 3, '2019-06-26', b'1', b'0', '2019-03-24 02:20:37', '2019-03-24 15:09:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `administrator_un` (`email`),
  ADD KEY `administrators_active_idx` (`active`,`deleted`) USING BTREE,
  ADD KEY `administrators_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE;

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`id`),
  ADD KEY `children_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  ADD KEY `children_last_activity_idx` (`group`,`active`,`deleted`,`birthday`) USING BTREE;

--
-- Indexes for table `educators`
--
ALTER TABLE `educators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `educator_un` (`email`),
  ADD KEY `educators_active_idx` (`active`,`deleted`) USING BTREE,
  ADD KEY `educators_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE;

--
-- Indexes for table `educators_assignment`
--
ALTER TABLE `educators_assignment`
  ADD PRIMARY KEY (`educator_id`,`child_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_child_id_idx` (`child_id`,`parent_id`,`educator_id`,`administrator_id`,`published`,`deleted`) USING BTREE;

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD KEY `milestone_educator_id_idx` (`educator_id`,`child_id`,`date_tracked`) USING BTREE,
  ADD KEY `milestone_age_group_idx` (`age_group`,`developmental_area`,`observation`,`outcome_id`) USING BTREE;

--
-- Indexes for table `observations`
--
ALTER TABLE `observations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `observations_educator_id_idx` (`educator_id`,`child_id`,`outcome_id`,`date_tracked`,`published`,`deleted`) USING BTREE;

--
-- Indexes for table `parents_guardians`
--
ALTER TABLE `parents_guardians`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parents_guardians_un` (`email`),
  ADD KEY `parents_guardians_active_idx` (`active`,`deleted`,`type`) USING BTREE,
  ADD KEY `parents_guardians_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE;

--
-- Indexes for table `parents_guardians_assignment`
--
ALTER TABLE `parents_guardians_assignment`
  ADD PRIMARY KEY (`parentguardian_id`,`child_id`);

--
-- Indexes for table `stats_children`
--
ALTER TABLE `stats_children`
  ADD PRIMARY KEY (`child_id`);

--
-- Indexes for table `stats_educators`
--
ALTER TABLE `stats_educators`
  ADD PRIMARY KEY (`educator_id`);

--
-- Indexes for table `teaching_plans`
--
ALTER TABLE `teaching_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaching_plans_child_id_idx` (`child_id`,`educator_id`,`target_outcome_id`,`target_date`,`deleted`,`done`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `educators`
--
ALTER TABLE `educators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `observations`
--
ALTER TABLE `observations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parents_guardians`
--
ALTER TABLE `parents_guardians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teaching_plans`
--
ALTER TABLE `teaching_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
