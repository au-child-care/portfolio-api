-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 28, 2019 at 02:11 PM
-- Server version: 5.7.25-log
-- PHP Version: 7.1.9

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

DROP TABLE IF EXISTS `administrators`;
CREATE TABLE `administrators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

DROP TABLE IF EXISTS `children`;
CREATE TABLE `children` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(150) DEFAULT NULL,
  `birthday` date NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `educators`
--

DROP TABLE IF EXISTS `educators`;
CREATE TABLE `educators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `educators_assignment`
--

DROP TABLE IF EXISTS `educators_assignment`;
CREATE TABLE `educators_assignment` (
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
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

DROP TABLE IF EXISTS `milestones`;
CREATE TABLE `milestones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `age_group` varchar(100) NOT NULL,
  `developmental_area` varchar(100) NOT NULL,
  `observation` varchar(150) NOT NULL,
  `outcome_id` smallint(5) UNSIGNED NOT NULL,
  `comments` text,
  `date_tracked` date NOT NULL,
  `published` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `observations`
--

DROP TABLE IF EXISTS `observations`;
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

-- --------------------------------------------------------

--
-- Table structure for table `parents_guardians`
--

DROP TABLE IF EXISTS `parents_guardians`;
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

-- --------------------------------------------------------

--
-- Table structure for table `parents_guardians_assignment`
--

DROP TABLE IF EXISTS `parents_guardians_assignment`;
CREATE TABLE `parents_guardians_assignment` (
  `parentguardian_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teaching_plans`
--

DROP TABLE IF EXISTS `teaching_plans`;
CREATE TABLE `teaching_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `details` text NOT NULL,
  `target_outcome_id` smallint(5) UNSIGNED DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD KEY `children_last_activity_idx` (`last_activity`,`level`,`active`,`deleted`,`birthday`) USING BTREE,
  ADD KEY `children_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE;

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `milestone_educator_id_idx` (`educator_id`,`child_id`,`published`,`deleted`,`date_tracked`) USING BTREE,
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
-- Indexes for table `teaching_plans`
--
ALTER TABLE `teaching_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaching_plans_child_id_idx` (`child_id`,`educator_id`,`target_outcome_id`,`target_date`,`deleted`,`published`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `educators`
--
ALTER TABLE `educators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `observations`
--
ALTER TABLE `observations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parents_guardians`
--
ALTER TABLE `parents_guardians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teaching_plans`
--
ALTER TABLE `teaching_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
