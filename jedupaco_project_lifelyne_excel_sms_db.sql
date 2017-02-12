-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2017 at 11:52 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jedupaco_project_lifelyne_excel_sms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_assessment_timetable`
--

CREATE TABLE `tb_assessment_timetable` (
  `assessment_timetable_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `quota_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_batch`
--

CREATE TABLE `tb_batch` (
  `batch_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_class`
--

CREATE TABLE `tb_class` (
  `class_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `student_department_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(200) NOT NULL,
  `class_level_id` int(11) NOT NULL,
  `class_type_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class`
--

INSERT INTO `tb_class` (`class_id`, `school_id`, `student_department_id`, `name`, `code`, `class_level_id`, `class_type_id`, `date_created`) VALUES
(1, 1, 1, 'Junior Secondary School One (A)', 'J S S 1 A', 1, 1, '2016-11-21 13:45:00'),
(2, 1, 1, 'Junior Secondary School One (B)', 'J S S 1B', 1, 1, '2016-11-21 13:45:40'),
(3, 1, 1, 'J S S Two A', 'J S S 2 A', 2, 1, '2016-11-30 17:53:17'),
(4, 1, 1, 'Junior Sec Sch Two B', 'J S S 2B', 2, 1, '2016-12-23 20:33:27'),
(5, 1, 1, 'Junior Secondary School Three A', 'J S S 3A', 5, 1, '2016-12-31 01:00:31'),
(6, 1, 1, 'Junior Secondary School Three B', 'J S S 3 B', 5, 1, '2016-12-31 01:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_basic_subject`
--

CREATE TABLE `tb_class_basic_subject` (
  `class_basic_subject_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_basic_subject`
--

INSERT INTO `tb_class_basic_subject` (`class_basic_subject_id`, `school_id`, `class_id`, `subject_id`, `employee_id`, `date_created`) VALUES
(3, 1, 1, 0, 0, '2016-12-17 00:51:07'),
(4, 1, 1, 0, 0, '2016-12-17 08:56:25'),
(5, 1, 1, 0, 0, '2016-12-17 09:15:50'),
(6, 1, 1, 0, 0, '2016-12-17 09:20:52'),
(15, 1, 2, 0, 0, '2016-12-18 09:41:01'),
(20, 1, 2, 1, 2, '2016-12-21 11:20:41'),
(21, 1, 2, 2, 1, '2016-12-21 11:20:54'),
(26, 1, 4, 1, 2, '2016-12-28 09:01:56'),
(27, 1, 4, 2, 1, '2016-12-28 09:02:27'),
(30, 1, 3, 1, 2, '2016-12-30 09:20:11'),
(31, 1, 3, 2, 2, '2016-12-30 09:21:27'),
(32, 1, 3, 3, 2, '2016-12-30 09:21:50'),
(35, 1, 2, 3, 2, '2016-12-30 23:16:36'),
(42, 1, 6, 1, 2, '2016-12-31 23:06:37'),
(44, 1, 1, 4, 1, '2017-01-10 18:05:54'),
(46, 1, 2, 5, 1, '2017-01-10 18:07:44'),
(47, 1, 2, 6, 2, '2017-01-10 18:07:56'),
(49, 1, 4, 3, 2, '2017-01-11 06:51:29'),
(50, 1, 4, 4, 1, '2017-01-11 06:52:23'),
(51, 1, 4, 5, 2, '2017-01-11 06:52:55'),
(52, 1, 3, 4, 1, '2017-01-11 06:55:15'),
(53, 1, 3, 5, 1, '2017-01-11 06:55:26'),
(57, 1, 5, 1, 2, '2017-01-11 09:03:42'),
(58, 1, 5, 2, 2, '2017-01-11 09:04:04'),
(59, 1, 5, 3, 2, '2017-01-11 09:04:10'),
(60, 1, 5, 4, 1, '2017-01-11 09:04:16'),
(61, 1, 5, 5, 1, '2017-01-11 09:04:23'),
(62, 1, 1, 1, 2, '2017-01-11 14:40:35'),
(64, 1, 1, 3, 2, '2017-01-24 16:45:42'),
(65, 1, 1, 5, 1, '2017-01-24 16:45:51'),
(66, 1, 1, 2, 1, '2017-01-24 16:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_designation`
--

CREATE TABLE `tb_class_designation` (
  `class_designation_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_designation`
--

INSERT INTO `tb_class_designation` (`class_designation_id`, `school_id`, `name`, `date_created`) VALUES
(1, 1, 'Default', '2017-01-12 18:02:49'),
(2, 1, 'Desig_2', '2017-01-12 18:15:23'),
(3, 1, 'Desig_3', '2017-02-12 01:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_designation_structure`
--

CREATE TABLE `tb_class_designation_structure` (
  `class_designation_structure_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `class_designation_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `min_score` double NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_designation_structure`
--

INSERT INTO `tb_class_designation_structure` (`class_designation_structure_id`, `school_id`, `class_designation_id`, `name`, `min_score`, `date_created`, `date_modified`, `description`) VALUES
(1, 1, 1, 'First Class', 70, '2017-01-12 18:14:39', '0000-00-00 00:00:00', 'First Class'),
(2, 1, 1, 'Second Class Upper', 60, '2017-01-12 18:15:04', '0000-00-00 00:00:00', 'Second Class Upper Students'),
(3, 1, 2, 'Upper Students', 70, '2017-02-12 01:24:50', '0000-00-00 00:00:00', 'Upper Students');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_level`
--

CREATE TABLE `tb_class_level` (
  `class_level_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `class_type_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_level`
--

INSERT INTO `tb_class_level` (`class_level_id`, `school_id`, `class_type_id`, `name`, `date_created`) VALUES
(1, 1, 1, 'J S S 1', '2016-11-21 13:43:43'),
(2, 1, 1, 'J S S 2', '2016-11-21 13:43:51'),
(3, 1, 2, 'S S S 1', '2016-11-21 13:44:02'),
(4, 1, 2, 'S S S 2', '2016-11-21 13:44:08'),
(5, 1, 1, 'J S S 3', '2016-12-23 20:31:44'),
(6, 1, 2, 'S S 3', '2016-12-23 20:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_period`
--

CREATE TABLE `tb_class_period` (
  `class_period_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `class_timing_set_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time NOT NULL,
  `is_break` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_period`
--

INSERT INTO `tb_class_period` (`class_period_id`, `school_id`, `class_timing_set_id`, `name`, `start_time`, `end_time`, `is_break`) VALUES
(1, 1, 1, 'Period 1', '07:00:00', '08:00:00', 0),
(2, 1, 1, 'Period 2', '08:00:00', '09:00:00', 0),
(3, 1, 1, 'Short Break', '09:00:00', '10:00:00', 1),
(4, 1, 1, 'Period 3', '11:00:00', '12:00:00', 0),
(5, 1, 1, 'Period 4', '11:00:00', '12:00:00', 0),
(6, 1, 1, 'Period 5', '12:00:00', '13:00:00', 0),
(7, 1, 2, 'Period 1', '07:00:00', '08:00:00', 0),
(8, 1, 3, 'Period 1', '06:00:00', '07:00:00', 0),
(9, 1, 3, 'Period 2', '07:00:00', '08:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_timetable`
--

CREATE TABLE `tb_class_timetable` (
  `class_timetable_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `weekday_id` int(11) NOT NULL,
  `class_period_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_timetable`
--

INSERT INTO `tb_class_timetable` (`class_timetable_id`, `class_id`, `school_id`, `weekday_id`, `class_period_id`, `subject_id`, `employee_id`, `date_created`) VALUES
(23, 1, 1, 2, 1, 1, 1, '0000-00-00 00:00:00'),
(24, 1, 1, 4, 1, 1, 1, '0000-00-00 00:00:00'),
(25, 1, 1, 4, 2, 1, 1, '0000-00-00 00:00:00'),
(26, 1, 1, 3, 2, 1, 1, '0000-00-00 00:00:00'),
(27, 1, 1, 5, 1, 1, 1, '0000-00-00 00:00:00'),
(28, 1, 1, 2, 2, 2, 3, '0000-00-00 00:00:00'),
(29, 1, 1, 3, 1, 2, 3, '0000-00-00 00:00:00'),
(30, 1, 1, 5, 2, 2, 3, '0000-00-00 00:00:00'),
(31, 1, 1, 6, 9, 2, 3, '0000-00-00 00:00:00'),
(32, 1, 1, 6, 8, 3, 4, '0000-00-00 00:00:00'),
(33, 1, 1, 5, 6, 3, 4, '0000-00-00 00:00:00'),
(34, 1, 1, 2, 4, 3, 4, '0000-00-00 00:00:00'),
(35, 1, 1, 3, 5, 3, 4, '0000-00-00 00:00:00'),
(36, 1, 1, 3, 6, 3, 4, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_timing_set`
--

CREATE TABLE `tb_class_timing_set` (
  `class_timing_set_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_timing_set`
--

INSERT INTO `tb_class_timing_set` (`class_timing_set_id`, `school_id`, `name`, `description`, `date_created`) VALUES
(1, 1, 'Default', NULL, '2016-12-31 00:27:59'),
(2, 1, 'Fridays', NULL, '2016-12-31 00:34:54'),
(3, 1, 'Weekends', NULL, '2017-02-11 09:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_type`
--

CREATE TABLE `tb_class_type` (
  `class_type_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_type`
--

INSERT INTO `tb_class_type` (`class_type_id`, `school_id`, `name`, `description`, `date_created`) VALUES
(1, 1, 'Junior Classes', '', '2016-11-21 13:42:42'),
(2, 1, 'Senior Classes', '', '2016-11-21 13:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `tb_country`
--

CREATE TABLE `tb_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `currency_type` varchar(10) DEFAULT NULL,
  `time_zone_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee`
--

CREATE TABLE `tb_employee` (
  `employee_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `employee_number` varchar(30) NOT NULL,
  `employee_department_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `employee_position_id` int(11) DEFAULT NULL,
  `date_joined` date DEFAULT NULL,
  `employee_grade_level_id` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `student_department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee`
--

INSERT INTO `tb_employee` (`employee_id`, `school_id`, `user_id`, `employee_number`, `employee_department_id`, `employee_category_id`, `employee_position_id`, `date_joined`, `employee_grade_level_id`, `date_created`, `student_department_id`) VALUES
(1, 1, 4, 'OCA/E001', 1, 1, 1, '2005-07-07', 1, '2017-02-01 16:37:06', NULL),
(2, 1, 7, 'OCA/E002', 1, 1, 1, '2017-02-15', 1, '2017-02-09 09:14:10', NULL),
(3, 1, 8, 'OCA/E003', 1, 1, 3, '2017-02-15', 1, '2017-02-09 10:28:32', NULL),
(4, 1, 9, 'OCA/E004', 2, 2, 2, '2017-01-31', 2, '2017-02-09 10:32:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee_category`
--

CREATE TABLE `tb_employee_category` (
  `employee_category_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee_category`
--

INSERT INTO `tb_employee_category` (`employee_category_id`, `school_id`, `name`, `description`, `date_created`, `code`) VALUES
(1, 1, 'Teaching Staff', NULL, '2016-11-23 17:27:33', ''),
(2, 1, 'Non Teaching Staff', NULL, '2016-11-23 17:28:39', ''),
(3, 1, 'Library Staff', NULL, '2016-11-23 17:29:11', ''),
(4, 1, 'Kitchen Staff', NULL, '2016-12-23 20:42:55', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee_department`
--

CREATE TABLE `tb_employee_department` (
  `employee_department_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `is_ative` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee_department`
--

INSERT INTO `tb_employee_department` (`employee_department_id`, `school_id`, `name`, `date_created`, `is_ative`, `code`) VALUES
(1, 1, 'Academics', '2016-11-23 18:07:12', NULL, 'ACD'),
(2, 1, 'Sports', '2016-11-23 18:07:32', NULL, 'SPR');

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee_grade_level`
--

CREATE TABLE `tb_employee_grade_level` (
  `employee_grade_level_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee_grade_level`
--

INSERT INTO `tb_employee_grade_level` (`employee_grade_level_id`, `school_id`, `name`, `description`, `date_created`) VALUES
(1, 1, '5.0', 'Entry Level Grade', '2016-11-23 17:59:35'),
(2, 1, '5.5', 'After five years experience', '2016-11-23 18:01:35'),
(3, 1, '6.0', 'BSc with more than 5 years experience', '2016-11-23 18:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee_position`
--

CREATE TABLE `tb_employee_position` (
  `employee_position_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `employee_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee_position`
--

INSERT INTO `tb_employee_position` (`employee_position_id`, `school_id`, `name`, `description`, `date_created`, `date_modified`, `employee_category_id`) VALUES
(1, 1, 'Senior Teachers', 'Teachers with more than 10 years experience', '2016-11-23 17:30:40', '0000-00-00 00:00:00', 1),
(2, 1, 'Cooks', 'Staff that work in the kitchen', '2016-11-23 17:31:14', '0000-00-00 00:00:00', 2),
(3, 1, 'Junior Staff', 'Junior Staff', '2016-12-28 15:45:10', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee_subject`
--

CREATE TABLE `tb_employee_subject` (
  `employee_subject_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `quota_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_examination`
--

CREATE TABLE `tb_examination` (
  `examination_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `quota_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `weightage` float NOT NULL,
  `class_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_examination`
--

INSERT INTO `tb_examination` (`examination_id`, `school_id`, `session_id`, `quota_id`, `name`, `description`, `weightage`, `class_id`, `date_created`) VALUES
(1, 1, 1, 1, 'Test 1', 'First Test', 20, 1, '2017-01-13 13:39:41'),
(2, 1, 1, 1, 'Test 2', 'Second Test', 20, 1, '2017-01-13 13:40:09'),
(3, 1, 1, 2, 'First Test', 'First Periodic Test', 20, 1, '2017-01-13 14:14:42'),
(4, 1, 1, 1, 'Exam', 'Examinaion', 60, 1, '2017-01-13 14:21:44'),
(5, 1, 1, 2, 'Second Test', 'Second Periodic Test', 20, 1, '2017-01-13 14:31:09'),
(6, 1, 1, 2, 'Exam', 'Examinaion', 60, 1, '2017-01-13 14:33:27'),
(7, 1, 2, 4, 'C A 1', 'First C A', 0, 1, '2017-01-13 14:37:32'),
(8, 1, 1, 1, 'Test One', 'Test One', 40, 2, '2017-01-13 14:51:57'),
(9, 1, 1, 1, 'Test Two', 'Test Two', 60, 2, '2017-01-13 14:53:38'),
(10, 1, 1, 1, 'Practical', 'Practical', 0, 1, '2017-01-24 16:50:43'),
(11, 1, 1, 3, 'Test 1', 'First Test', 30, 1, '2017-01-27 11:40:53'),
(12, 1, 1, 3, 'Test 2', 'Second Test', 30, 1, '2017-01-27 11:41:04'),
(13, 1, 1, 3, 'Exam', 'Examination', 40, 1, '2017-01-27 11:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `tb_examination_group`
--

CREATE TABLE `tb_examination_group` (
  `examination_group_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `quota_id` int(11) NOT NULL,
  `grading_level_id` int(11) NOT NULL,
  `class_designation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_examination_group`
--

INSERT INTO `tb_examination_group` (`examination_group_id`, `school_id`, `class_id`, `quota_id`, `grading_level_id`, `class_designation_id`) VALUES
(1, 1, 1, 1, 2, 2),
(2, 1, 2, 1, 2, 1),
(3, 1, 1, 2, 1, 1),
(4, 1, 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_examination_timetable`
--

CREATE TABLE `tb_examination_timetable` (
  `examination_timetable_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `examination_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject` varchar(50) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  `max_score` float NOT NULL,
  `date_modified` datetime NOT NULL,
  `quota_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_examination_timetable`
--

INSERT INTO `tb_examination_timetable` (`examination_timetable_id`, `school_id`, `session_id`, `examination_id`, `subject_id`, `subject`, `start_time`, `end_time`, `date_created`, `max_score`, `date_modified`, `quota_id`) VALUES
(1, 1, 1, 1, 4, 'Chemistry', '2017-01-17 00:00:00', '2017-01-17 01:00:00', '0000-00-00 00:00:00', 50, '0000-00-00 00:00:00', 1),
(2, 1, 1, 1, 1, 'Mathematics', '2017-01-17 02:00:00', '2017-01-17 03:00:00', '0000-00-00 00:00:00', 100, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_grade_level_payroll`
--

CREATE TABLE `tb_grade_level_payroll` (
  `tb_grade_level_payroll_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `employee_grade_level_id` int(11) NOT NULL,
  `payroll_category_id` int(11) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_grading_level`
--

CREATE TABLE `tb_grading_level` (
  `grading_level_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_grading_level`
--

INSERT INTO `tb_grading_level` (`grading_level_id`, `school_id`, `name`, `date_created`) VALUES
(1, 1, 'Default', '2017-01-12 14:56:30'),
(2, 1, 'G Level_2', '2017-01-12 15:31:59'),
(3, 1, 'G Level_3', '2017-01-12 15:32:12'),
(4, 1, 'G Level_4', '2017-02-12 01:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `tb_grading_level_structure`
--

CREATE TABLE `tb_grading_level_structure` (
  `tb_grading_level_structure_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `grading_level_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `min_score` double NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_grading_level_structure`
--

INSERT INTO `tb_grading_level_structure` (`tb_grading_level_structure_id`, `school_id`, `grading_level_id`, `name`, `min_score`, `date_created`, `date_modified`, `description`) VALUES
(1, 1, 1, 'A', 70, '2017-01-12 15:24:17', '0000-00-00 00:00:00', 'Distinction'),
(2, 1, 1, 'B', 60, '2017-01-12 15:26:41', '0000-00-00 00:00:00', 'Good'),
(3, 1, 1, 'C', 50, '2017-01-12 16:09:50', '0000-00-00 00:00:00', 'Average'),
(4, 1, 2, 'A', 90, '2017-01-24 16:37:46', '0000-00-00 00:00:00', 'Excel'),
(5, 1, 4, 'A', 80, '2017-02-12 01:32:02', '0000-00-00 00:00:00', 'Excellent');

-- --------------------------------------------------------

--
-- Table structure for table `tb_grading_system`
--

CREATE TABLE `tb_grading_system` (
  `grading_system_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `grade_scale` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_module`
--

CREATE TABLE `tb_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `has_child` tinyint(1) NOT NULL,
  `parent_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_module`
--

INSERT INTO `tb_module` (`module_id`, `name`, `icon`, `position`, `url`, `has_child`, `parent_id`) VALUES
(1, 'Student', 'graduation', 1, 'students', 0, 0),
(2, 'Guardian', 'users', 2, 'parents', 0, 0),
(3, 'Employee', 'directions', 3, 'employees', 0, 0),
(4, 'Library', 'folder', 4, '', 0, 0),
(5, 'Event', 'calendar', 5, '', 0, 0),
(6, 'Timetable', 'book-open', 6, 'timetable', 0, 0),
(7, 'Result', 'docs', 8, '', 0, 0),
(8, 'Mail', 'envelope', 9, '', 0, 0),
(9, 'Settings', 'settings', 10, '', 1, 0),
(10, 'General', '', 11, 'general-settings', 1, 9),
(11, 'Basic Information', '', 12, '', 0, 10),
(12, 'Student Category', '', 13, '', 0, 10),
(13, 'Additional Details', '', 14, '', 0, 10),
(14, 'Update Password', '', 15, '', 0, 10),
(15, 'Academic ', '', 16, 'academic-settings', 1, 9),
(16, 'Department', '', 17, '', 0, 15),
(17, 'Class', '', 18, '', 0, 15),
(18, 'Quota', '', 19, '', 0, 15),
(19, 'Subject', '', 20, '', 0, 15),
(20, 'Class Timing Set', '', 21, '', 0, 15),
(21, 'Grading Level', '', 22, '', 0, 15),
(22, 'Class Designation', '', 23, '', 0, 15),
(23, 'Human Resource', '', 24, 'hr-settings', 1, 9),
(24, 'Department', '', 25, '', 0, 23),
(25, 'Position', '', 26, '', 0, 23),
(26, 'Grade Level', '', 27, '', 0, 23),
(27, 'User Privilege', '', 28, '', 0, 23),
(28, 'Examination', 'puzzle', 7, 'examination', 1, 0),
(29, 'Class Timetable', '', 0, 'timetable-class-timetable', 0, 6),
(30, 'Settings', '', 0, 'timetable-settings', 1, 6),
(31, 'Timetable', '', 0, 'examination-timetanle', 0, 28),
(32, 'Assessment', '', 0, 'examination-assessment', 0, 28),
(33, 'Settings', '', 0, 'examination-settings', 1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `tb_parent`
--

CREATE TABLE `tb_parent` (
  `parent_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `parent_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_parent`
--

INSERT INTO `tb_parent` (`parent_id`, `school_id`, `date_created`, `user_id`, `parent_number`) VALUES
(1, 1, '2017-02-01 16:24:25', 2, 'OCA/G001'),
(2, 1, '2017-02-01 16:47:25', 6, 'OCA/G002');

-- --------------------------------------------------------

--
-- Table structure for table `tb_payroll_category`
--

CREATE TABLE `tb_payroll_category` (
  `tb_payroll_category_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_quota`
--

CREATE TABLE `tb_quota` (
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(100) DEFAULT NULL,
  `quota_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_quota`
--

INSERT INTO `tb_quota` (`school_id`, `session_id`, `quota_id`, `name`, `start_time`, `end_time`, `description`, `date_created`) VALUES
(1, 1, 1, 'First Term', '2013-11-01', '2013-03-16', NULL, '2016-11-21 13:47:57'),
(1, 1, 2, 'Second Term', '2013-03-29', '2013-06-22', NULL, '2016-11-21 13:48:31'),
(1, 1, 3, 'Third Term', '2016-11-02', '2016-12-30', NULL, '2016-11-21 16:41:40'),
(1, 2, 4, 'Term 1', '2017-01-04', '2017-03-24', NULL, '2017-01-13 13:22:25'),
(1, 2, 5, 'Term 2', '2017-01-05', '2017-06-22', NULL, '2017-01-13 13:22:40');

-- --------------------------------------------------------

--
-- Table structure for table `tb_school`
--

CREATE TABLE `tb_school` (
  `school_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `code` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) NOT NULL,
  `phone1` varchar(100) NOT NULL,
  `phone2` varchar(100) NOT NULL,
  `status_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `auto_gen_student_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `website` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `auto_gen_employee_id` int(11) NOT NULL,
  `auto_gen_parent_id` int(11) NOT NULL,
  `motto` varchar(1000) NOT NULL,
  `unique_code` varchar(10) NOT NULL,
  `time_zone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_school`
--

INSERT INTO `tb_school` (`school_id`, `name`, `logo`, `code`, `date_created`, `address1`, `address2`, `phone1`, `phone2`, `status_id`, `country_id`, `state_id`, `language_id`, `auto_gen_student_id`, `email`, `website`, `password`, `auto_gen_employee_id`, `auto_gen_parent_id`, `motto`, `unique_code`, `time_zone_id`) VALUES
(1, 'Oxford College Abuja', 'badge.jpg', 'O C A', '0000-00-00 00:00:00', 'PO Box 80, Area 11, Garki', '', '08020803585', '08102937011', 0, 1, 1, 0, 0, 'info@oxfordcollege.com', 'www.oxfordcollege.com', 'd92c25d41fcd9f8ab35545ef34b1e7ed', 0, 0, 'Up And On', 'OCA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_session`
--

CREATE TABLE `tb_session` (
  `session_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `grading_system_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_session`
--

INSERT INTO `tb_session` (`session_id`, `school_id`, `grading_system_id`, `name`, `start_time`, `end_time`, `description`, `date_created`) VALUES
(1, 1, 1, '2013/2014 Session', '2016-11-01', '2017-12-02', '', '2016-11-21 13:46:33'),
(2, 1, 1, '2014/2015 Session', '2014-01-23', '2015-11-11', '', '2016-12-23 20:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_state`
--

CREATE TABLE `tb_state` (
  `id` int(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_state`
--

INSERT INTO `tb_state` (`id`, `name`, `country_id`) VALUES
(1, 'Abia', 1),
(2, 'Adamawa', 1),
(3, 'Akwa Ibom', 1),
(4, 'Anambra', 1),
(5, 'Bauchi', 1),
(6, 'Benue', 1),
(7, 'Borno', 1),
(8, 'Cross River', 1),
(9, 'Delta', 1),
(10, 'Gobe', 1),
(11, 'Enugu', 1),
(12, 'Bayelsa', 1),
(13, 'Ebonyi', 1),
(14, 'Edo', 1),
(15, 'Ekiti', 1),
(16, 'Imo', 1),
(17, 'Jigawa', 1),
(18, 'Kaduna', 1),
(19, 'Kano', 1),
(20, 'Katsina', 1),
(21, 'Kebbi', 1),
(22, 'Kogi', 1),
(23, 'Kwara', 1),
(24, 'Lagos', 1),
(25, 'Nasarawa', 1),
(26, 'Niger', 1),
(27, 'Ogun', 1),
(28, 'Ondo', 1),
(29, 'Osun', 1),
(30, 'Oyo', 1),
(31, 'Plateau', 1),
(32, 'Rivers', 1),
(33, 'Sokoto', 1),
(34, 'Taraba', 1),
(35, 'Yobe', 1),
(36, 'Zamfara', 1),
(37, 'FCT', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_student`
--

CREATE TABLE `tb_student` (
  `student_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `student_department_id` int(11) NOT NULL,
  `registration_number` varchar(100) NOT NULL,
  `admission_date` datetime NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `student_category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `parent_relationship` varchar(50) NOT NULL,
  `class_type_id` int(11) NOT NULL,
  `class_level_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_student`
--

INSERT INTO `tb_student` (`student_id`, `school_id`, `user_id`, `student_department_id`, `registration_number`, `admission_date`, `date_created`, `batch_id`, `student_category_id`, `parent_id`, `parent_relationship`, `class_type_id`, `class_level_id`, `class_id`) VALUES
(1, 1, 1, 1, 'OCA/16/001', '0000-00-00 00:00:00', '2017-02-01 16:24:25', 0, 1, 1, 'Father', 1, 1, 1),
(2, 1, 3, 1, 'OCA/16/002', '0000-00-00 00:00:00', '2017-02-01 16:32:38', 0, 1, 1, 'Father', 1, 1, 1),
(3, 1, 5, 1, 'OCA/16/003', '0000-00-00 00:00:00', '2017-02-01 16:47:25', 0, 1, 2, 'Sister', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_student_category`
--

CREATE TABLE `tb_student_category` (
  `student_category_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_student_category`
--

INSERT INTO `tb_student_category` (`student_category_id`, `school_id`, `name`, `description`, `date_created`, `code`) VALUES
(1, 1, 'Default', 'The default category for all students', '2016-11-22 13:04:15', 'DFT'),
(2, 1, 'Staff Kids', 'Children of staff', '2016-11-29 09:34:10', 'STK'),
(3, 1, 'Other States', 'Students from other states', '2016-12-23 20:26:37', 'OSS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_student_category_subject`
--

CREATE TABLE `tb_student_category_subject` (
  `student_category_subject_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `quota_id` int(11) DEFAULT NULL,
  `subject_category_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_student_department`
--

CREATE TABLE `tb_student_department` (
  `student_department_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `type_of_result` varchar(100) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_student_department`
--

INSERT INTO `tb_student_department` (`student_department_id`, `school_id`, `name`, `code`, `type_of_result`, `date_created`) VALUES
(1, 1, 'Default', 'DFT', NULL, '2016-11-21 13:51:44'),
(2, 1, 'Science', 'SCI', NULL, '2016-11-21 13:52:02'),
(3, 1, 'Arts', 'ART', NULL, '2016-11-21 13:52:16'),
(4, 1, 'Commercial', 'COMM', NULL, '2016-11-21 13:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subject`
--

CREATE TABLE `tb_subject` (
  `subject_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `credit_unit` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_subject`
--

INSERT INTO `tb_subject` (`subject_id`, `school_id`, `name`, `code`, `credit_unit`, `description`, `date_created`) VALUES
(1, 1, 'Mathematics', 'Math', NULL, 'Just figures', '2016-12-07 15:23:52'),
(2, 1, 'English Language', 'Eng', NULL, 'English Language', '2016-12-07 15:25:31'),
(3, 1, 'Physics', 'Phy', NULL, 'Physics science', '2016-12-07 15:32:20'),
(4, 1, 'Chemistry', 'Chem', NULL, 'Chemistry Science', '2016-12-07 15:33:08'),
(5, 1, 'Biology', 'BIO', NULL, 'Study of life', '2016-12-23 20:41:04'),
(6, 1, 'Agricultural Science', 'AGRIC', NULL, 'Agricultural Science', '2016-12-28 09:03:27'),
(7, 1, 'Fine Arts', 'ART', NULL, 'Drawing', '2017-01-11 07:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subject_assessment_timetable`
--

CREATE TABLE `tb_subject_assessment_timetable` (
  `subject_assessment_timetable_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `assessment_timetable_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_subject_category`
--

CREATE TABLE `tb_subject_category` (
  `subject_category_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_time_zone`
--

CREATE TABLE `tb_time_zone` (
  `time_zone_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `othernames` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` datetime NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone1` varchar(50) NOT NULL,
  `phone2` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `privilege_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `firstname`, `lastname`, `othernames`, `username`, `password`, `is_active`, `school_id`, `gender`, `dob`, `marital_status`, `state_id`, `address`, `city`, `phone1`, `phone2`, `email`, `photo`, `privilege_id`) VALUES
(1, 'Bill', 'Gates', 'Simeon', 'OCA/16/001', 'd92c25d41fcd9f8ab35545ef34b1e7ed', 0, 1, 'Male', '1991-07-17 00:00:00', '', 14, '10 Somewhere in Akoka', 'Akoka', '0803475757', '', 'billgates@gmail.com', 'passport_photo3.jpg', 0),
(2, 'Mr Bill', '', '', 'OCA/G001', '1a3bcdc0c70ccb4d0f54b23cd4aee93b', 0, 1, NULL, '0000-00-00 00:00:00', '', NULL, '10 Somewhere in Akoka', '', '08034657876', '', 'bill@gmail.com', '', 0),
(3, 'Bill', 'Bezos', 'John', 'OCA/16/002', 'd92c25d41fcd9f8ab35545ef34b1e7ed', 0, 1, 'Male', '1995-07-13 00:00:00', '', 1, '10 Somewhere in Akoka', 'Akoka', '0803475757', '', 'besoz@gmail.com', '4.jpg', 0),
(4, 'Mark', 'Zuckerberg', 'Elliot', 'OCA/E001', 'b82a9a13f4651e9abcbde90cd24ce2cb', 0, 1, 'Male', '1940-06-26 00:00:00', '', 19, '12 Somewhere in Kano', 'Muda', '0803475757', '', 'mark@gmail.com', '1018px-James_Gosling_20081.jpg', 7),
(5, 'Melinda', 'Besty', 'Elly', 'OCA/16/003', '428c841430ea18a70f7b06525d4b748a', 0, 1, 'Female', '2011-03-03 00:00:00', '', 18, '23B Melo Str, Kaduna', 'Kaduna', '08034275409', '', 'melinda@yahoo.com', '(_)_3FOLA_FLORISH_3_(_)(8)21.jpg', 0),
(6, 'Miss Wright', '', '', 'OCA/G002', 'ee5b4e08c69e19a7b1d425ad449da87d', 0, 1, NULL, '0000-00-00 00:00:00', '', NULL, '23B Melo Str, Kaduna', '', '08034657876', '', 'write@hotmail.com', '', 0),
(7, 'James', 'Gosling', '', 'OCA/E002', 'd52e32f3a96a64786814ae9b5279fbe5', 0, 1, 'Male', '2017-02-12 00:00:00', '', 1, 'FUTA', 'Akure', '08034275409', '', 'jamesgosling@gmail.com', '(_)_UGO(_)(1).jpg', 4),
(8, 'Desmond', 'Idiot', '', 'OCA/E003', 'a39e9eea66930fe0050d56a28bafab72', 0, 1, 'Male', '2017-02-14 00:00:00', '', 10, 'Somewhere in Ahila', 'Ahila', '08034275409', '', 'desmonidiot@yahoo.com', 'temmy(73).jpg', 5),
(9, 'Mickael', 'Jackson', '', 'OCA/E004', '4b503f9fdf97688234717f3c50dc8bb9', 0, 1, 'Male', '2017-02-08 00:00:00', '', 2, '10 Bala street', 'Yola', '08034275409', '', 'mickaeljackson@mail.com', '(_)_UGO(_)(1)1.jpg', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_additional_details`
--

CREATE TABLE `tb_user_additional_details` (
  `user_additional_detail_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_additional_field_id` int(11) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_additional_details`
--

INSERT INTO `tb_user_additional_details` (`user_additional_detail_id`, `school_id`, `user_id`, `user_additional_field_id`, `value`) VALUES
(1, 1, 11, 1, '50m'),
(2, 1, 11, 2, 'Group A'),
(3, 1, 11, 4, 'Christianity'),
(4, 1, 11, 5, 'RED'),
(5, 1, 13, 1, '45cm'),
(6, 1, 13, 2, 'Group O'),
(7, 1, 13, 4, 'Christianity'),
(8, 1, 13, 5, 'Grey'),
(10, 1, 21, 3, 'Zenith Bank'),
(11, 1, 22, 3, 'Diamond'),
(12, 1, 63, 1, ''),
(13, 1, 63, 4, ''),
(14, 1, 63, 5, ''),
(15, 1, 63, 7, 'O'),
(16, 1, 65, 1, ''),
(17, 1, 65, 4, ''),
(18, 1, 65, 5, ''),
(19, 1, 65, 7, 'O'),
(20, 1, 77, 1, ''),
(21, 1, 77, 4, ''),
(22, 1, 77, 5, ''),
(23, 1, 77, 7, 'O'),
(24, 1, 79, 1, ''),
(25, 1, 79, 4, ''),
(26, 1, 79, 5, ''),
(27, 1, 79, 7, 'O'),
(28, 1, 81, 1, ''),
(29, 1, 81, 4, ''),
(30, 1, 81, 5, ''),
(31, 1, 81, 7, 'O'),
(32, 1, 83, 1, ''),
(33, 1, 83, 4, ''),
(34, 1, 83, 5, ''),
(35, 1, 83, 7, 'O'),
(36, 1, 101, 1, ''),
(37, 1, 101, 4, ''),
(38, 1, 101, 5, ''),
(39, 1, 101, 7, 'O'),
(40, 1, 103, 1, ''),
(41, 1, 103, 4, ''),
(42, 1, 103, 5, ''),
(43, 1, 103, 7, 'O'),
(44, 1, 107, 1, ''),
(45, 1, 107, 4, ''),
(46, 1, 107, 5, ''),
(47, 1, 107, 7, 'O'),
(48, 1, 109, 3, ''),
(49, 1, 109, 6, ''),
(50, 1, 109, 8, ''),
(51, 1, 109, 9, ''),
(52, 1, 113, 3, ''),
(53, 1, 113, 6, ''),
(54, 1, 113, 8, ''),
(55, 1, 113, 9, ''),
(56, 1, 114, 1, ''),
(57, 1, 114, 4, ''),
(58, 1, 114, 5, ''),
(59, 1, 114, 7, ''),
(60, 1, 116, 1, ''),
(61, 1, 116, 4, ''),
(62, 1, 116, 5, ''),
(63, 1, 116, 7, ''),
(64, 1, 118, 1, ''),
(65, 1, 118, 4, ''),
(66, 1, 118, 5, ''),
(67, 1, 118, 7, ''),
(68, 1, 1, 1, '10m'),
(69, 1, 1, 4, 'Christianity'),
(70, 1, 1, 5, '120kg'),
(71, 1, 1, 7, 'O'),
(72, 1, 3, 1, '12cm'),
(73, 1, 3, 4, 'Christianity'),
(74, 1, 3, 5, '132kg'),
(75, 1, 3, 7, 'A+'),
(76, 1, 4, 3, 'GTB'),
(77, 1, 4, 6, 'Grey'),
(78, 1, 4, 8, '0987654321'),
(79, 1, 4, 9, '5652435467'),
(80, 1, 5, 1, '12m'),
(81, 1, 5, 4, 'Christianity'),
(82, 1, 5, 5, '56kg'),
(83, 1, 5, 7, 'B+'),
(84, 1, 7, 3, 'Ecobank'),
(85, 1, 7, 6, 'Red'),
(86, 1, 7, 8, '0987654321'),
(87, 1, 7, 9, '5652435467'),
(88, 1, 8, 3, 'Ecobank'),
(89, 1, 8, 6, 'Grey'),
(90, 1, 8, 8, '0987654321'),
(91, 1, 8, 9, '5652435467'),
(92, 1, 9, 3, 'Ecobank'),
(93, 1, 9, 6, 'Grey'),
(94, 1, 9, 8, '0987654321'),
(95, 1, 9, 9, '5652435467');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_additional_field`
--

CREATE TABLE `tb_user_additional_field` (
  `user_additional_field_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `required` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_additional_field`
--

INSERT INTO `tb_user_additional_field` (`user_additional_field_id`, `school_id`, `name`, `description`, `type`, `required`, `date_created`) VALUES
(1, 1, 'Height', 'The height of each student in cm', 'student', 0, '2016-11-22 15:00:56'),
(3, 1, 'Bank Name', 'Bank name of all our staff', 'employee', 0, '2016-11-22 15:02:29'),
(4, 1, 'Religion', 'The religion of student', 'student', 0, '2016-11-29 07:20:15'),
(5, 1, 'Weight', 'Weight of student', 'student', 0, '2016-12-23 20:29:06'),
(6, 1, 'Eye Color', 'Eye Color', 'employee', 0, '2016-12-23 20:48:40'),
(7, 1, 'Blood Group', 'Blood Group', 'student', 1, '2016-12-28 15:37:46'),
(8, 1, 'Acc No', 'Account Number', 'employee', 1, '2016-12-28 15:49:36'),
(9, 1, 'BVN No', 'Bank Verification No', 'employee', 1, '2016-12-30 13:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_privilege`
--

CREATE TABLE `tb_user_privilege` (
  `user_privilege_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_privilege`
--

INSERT INTO `tb_user_privilege` (`user_privilege_id`, `school_id`, `name`, `description`, `date_created`) VALUES
(1, 1, 'Student', '', '0000-00-00 00:00:00'),
(2, 1, 'Parent', '', '0000-00-00 00:00:00'),
(3, 1, 'Super Admin', '', '2017-01-31 12:18:06'),
(4, 1, 'Admin-1', '', '2017-01-31 12:27:20'),
(5, 1, 'Admin-2', '', '2017-01-31 12:27:30'),
(6, 1, 'Liberian', '', '2017-01-31 12:27:43'),
(7, 1, 'Class Teacher', '', '2017-01-31 12:31:00'),
(8, 1, 'Test', '', '2017-02-06 11:20:04'),
(9, 1, 'Test-2', '', '2017-02-11 07:09:59'),
(10, 1, 'Test-3', '', '2017-02-11 07:38:08'),
(11, 1, 'Test-4', '', '2017-02-12 01:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_privilege_module`
--

CREATE TABLE `tb_user_privilege_module` (
  `user_privilege_module_id` int(11) NOT NULL,
  `user_privilege_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `create` tinyint(1) NOT NULL,
  `update` tinyint(4) NOT NULL,
  `delete` tinyint(4) NOT NULL,
  `view` tinyint(4) NOT NULL,
  `print` tinyint(4) NOT NULL,
  `check_all` tinyint(1) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_privilege_module`
--

INSERT INTO `tb_user_privilege_module` (`user_privilege_module_id`, `user_privilege_id`, `module_id`, `school_id`, `create`, `update`, `delete`, `view`, `print`, `check_all`, `is_active`) VALUES
(1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1),
(3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1),
(4, 3, 4, 1, 1, 1, 1, 1, 1, 1, 1),
(5, 3, 5, 1, 1, 1, 1, 1, 1, 1, 1),
(6, 3, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(7, 3, 7, 1, 1, 1, 1, 1, 1, 1, 1),
(8, 3, 8, 1, 1, 1, 1, 1, 1, 1, 1),
(9, 3, 9, 1, 1, 1, 1, 1, 1, 1, 1),
(10, 3, 10, 1, 1, 1, 1, 1, 1, 1, 1),
(11, 3, 11, 1, 1, 1, 1, 1, 1, 1, 1),
(12, 3, 12, 1, 1, 1, 1, 1, 1, 1, 1),
(13, 3, 13, 1, 1, 1, 1, 1, 1, 1, 1),
(14, 3, 14, 1, 1, 1, 1, 1, 1, 1, 1),
(15, 3, 15, 1, 1, 1, 1, 1, 1, 1, 1),
(16, 3, 16, 1, 1, 1, 1, 1, 1, 1, 1),
(17, 3, 17, 1, 1, 1, 1, 1, 1, 1, 1),
(18, 3, 18, 1, 1, 1, 1, 1, 1, 1, 1),
(19, 3, 19, 1, 1, 1, 1, 1, 1, 1, 1),
(20, 3, 20, 1, 1, 1, 1, 1, 1, 1, 1),
(21, 3, 21, 1, 1, 1, 1, 1, 1, 1, 1),
(22, 3, 22, 1, 1, 1, 1, 1, 1, 1, 1),
(23, 3, 23, 1, 1, 1, 1, 1, 1, 1, 1),
(24, 3, 24, 1, 1, 1, 1, 1, 1, 1, 1),
(25, 3, 25, 1, 1, 1, 1, 1, 1, 1, 1),
(26, 3, 26, 1, 1, 1, 1, 1, 1, 1, 1),
(27, 3, 27, 1, 1, 1, 1, 1, 1, 1, 1),
(28, 4, 1, 1, 1, 1, 1, 1, 1, 1, 0),
(29, 4, 2, 1, 1, 1, 1, 1, 1, 1, 0),
(30, 4, 3, 1, 1, 1, 1, 1, 1, 1, 0),
(31, 4, 4, 1, 1, 1, 1, 1, 1, 1, 0),
(32, 4, 5, 1, 1, 1, 1, 1, 1, 1, 0),
(33, 4, 6, 1, 1, 1, 1, 1, 1, 1, 0),
(34, 4, 7, 1, 1, 1, 1, 1, 1, 1, 0),
(35, 4, 8, 1, 1, 1, 1, 1, 1, 1, 0),
(36, 4, 9, 1, 1, 1, 1, 1, 1, 1, 0),
(37, 4, 10, 1, 1, 1, 1, 1, 1, 1, 0),
(38, 4, 11, 1, 1, 1, 1, 1, 1, 1, 0),
(39, 4, 12, 1, 1, 1, 1, 1, 1, 1, 0),
(40, 4, 13, 1, 1, 1, 1, 1, 1, 1, 0),
(41, 4, 14, 1, 1, 1, 1, 1, 1, 1, 0),
(42, 4, 15, 1, 1, 1, 1, 1, 1, 1, 0),
(43, 4, 16, 1, 1, 1, 1, 1, 1, 1, 0),
(44, 4, 17, 1, 1, 1, 1, 1, 1, 1, 0),
(45, 4, 18, 1, 1, 1, 1, 1, 1, 1, 0),
(46, 4, 19, 1, 1, 1, 1, 1, 1, 1, 0),
(47, 4, 20, 1, 1, 1, 1, 1, 1, 1, 0),
(48, 4, 21, 1, 1, 1, 1, 1, 1, 1, 0),
(49, 4, 22, 1, 1, 1, 1, 1, 1, 1, 0),
(50, 4, 23, 1, 1, 1, 1, 1, 1, 1, 0),
(51, 4, 24, 1, 1, 1, 1, 1, 1, 1, 0),
(52, 4, 25, 1, 1, 1, 1, 1, 1, 1, 0),
(53, 4, 26, 1, 1, 1, 1, 1, 1, 1, 0),
(54, 4, 27, 1, 0, 0, 0, 0, 0, 1, 0),
(55, 5, 1, 1, 0, 0, 0, 0, 0, 0, 0),
(56, 5, 2, 1, 0, 0, 0, 0, 0, 0, 1),
(57, 5, 3, 1, 0, 0, 0, 0, 0, 0, 1),
(58, 5, 4, 1, 0, 0, 0, 0, 0, 0, 0),
(59, 5, 5, 1, 0, 0, 0, 0, 0, 0, 0),
(60, 5, 6, 1, 0, 0, 0, 0, 0, 0, 0),
(61, 5, 7, 1, 0, 0, 0, 0, 0, 0, 0),
(62, 5, 8, 1, 0, 0, 0, 0, 0, 0, 0),
(63, 5, 9, 1, 0, 0, 0, 0, 0, 0, 0),
(64, 5, 10, 1, 0, 0, 0, 0, 0, 0, 0),
(65, 5, 11, 1, 0, 0, 0, 0, 0, 0, 0),
(66, 5, 12, 1, 0, 0, 0, 0, 0, 0, 0),
(67, 5, 13, 1, 0, 0, 0, 0, 0, 0, 0),
(68, 5, 14, 1, 0, 0, 0, 0, 0, 0, 0),
(69, 5, 15, 1, 0, 0, 0, 0, 0, 0, 0),
(70, 5, 16, 1, 0, 0, 0, 0, 0, 0, 0),
(71, 5, 17, 1, 0, 0, 0, 0, 0, 0, 0),
(72, 5, 18, 1, 0, 0, 0, 0, 0, 0, 0),
(73, 5, 19, 1, 0, 0, 0, 0, 0, 0, 0),
(74, 5, 20, 1, 0, 0, 0, 0, 0, 0, 0),
(75, 5, 21, 1, 0, 0, 0, 0, 0, 0, 0),
(76, 5, 22, 1, 0, 0, 0, 0, 0, 0, 0),
(77, 5, 23, 1, 0, 0, 0, 0, 0, 0, 0),
(78, 5, 24, 1, 0, 0, 0, 0, 0, 0, 0),
(79, 5, 25, 1, 0, 0, 0, 0, 0, 0, 0),
(80, 5, 26, 1, 0, 0, 0, 0, 0, 0, 0),
(81, 5, 27, 1, 0, 0, 0, 0, 0, 0, 0),
(82, 6, 1, 1, 0, 0, 0, 1, 1, 0, 0),
(83, 6, 2, 1, 0, 0, 0, 0, 0, 0, 0),
(84, 6, 3, 1, 0, 0, 0, 1, 0, 0, 0),
(85, 6, 4, 1, 1, 1, 1, 1, 1, 0, 0),
(86, 6, 5, 1, 1, 1, 1, 1, 1, 0, 0),
(87, 6, 6, 1, 0, 0, 0, 0, 0, 0, 0),
(88, 6, 7, 1, 0, 0, 0, 0, 0, 0, 0),
(89, 6, 8, 1, 1, 1, 1, 1, 1, 0, 0),
(90, 6, 9, 1, 0, 0, 0, 0, 0, 0, 0),
(91, 6, 10, 1, 0, 0, 0, 0, 0, 0, 0),
(92, 6, 11, 1, 1, 1, 1, 1, 1, 0, 0),
(93, 6, 12, 1, 0, 0, 0, 0, 0, 0, 0),
(94, 6, 13, 1, 0, 0, 0, 0, 0, 0, 0),
(95, 6, 14, 1, 1, 1, 1, 1, 1, 0, 0),
(96, 6, 15, 1, 0, 0, 0, 0, 0, 0, 0),
(97, 6, 16, 1, 0, 0, 0, 0, 0, 0, 0),
(98, 6, 17, 1, 0, 0, 0, 0, 0, 0, 0),
(99, 6, 18, 1, 0, 0, 0, 0, 0, 0, 0),
(100, 6, 19, 1, 0, 0, 0, 0, 0, 0, 0),
(101, 6, 20, 1, 0, 0, 0, 0, 0, 0, 0),
(102, 6, 21, 1, 0, 0, 0, 0, 0, 0, 0),
(103, 6, 22, 1, 0, 0, 0, 0, 0, 0, 0),
(104, 6, 23, 1, 0, 0, 0, 0, 0, 0, 0),
(105, 6, 24, 1, 0, 0, 0, 0, 0, 0, 0),
(106, 6, 25, 1, 0, 0, 0, 0, 0, 0, 0),
(107, 6, 26, 1, 0, 0, 0, 0, 0, 0, 0),
(108, 6, 27, 1, 0, 0, 0, 0, 0, 0, 0),
(109, 7, 1, 1, 0, 0, 0, 1, 1, 0, 1),
(110, 7, 2, 1, 0, 0, 0, 1, 1, 0, 1),
(111, 7, 3, 1, 0, 0, 0, 0, 0, 0, 0),
(112, 7, 4, 1, 1, 1, 0, 1, 1, 0, 1),
(113, 7, 5, 1, 0, 0, 0, 1, 1, 0, 1),
(114, 7, 6, 1, 0, 0, 0, 1, 1, 0, 1),
(115, 7, 7, 1, 0, 0, 0, 1, 0, 0, 1),
(116, 7, 8, 1, 1, 1, 1, 1, 1, 0, 1),
(117, 7, 9, 1, 0, 0, 0, 1, 0, 0, 1),
(118, 7, 10, 1, 0, 0, 0, 1, 0, 0, 1),
(119, 7, 11, 1, 1, 1, 1, 1, 1, 0, 1),
(120, 7, 12, 1, 0, 0, 0, 0, 0, 0, 0),
(121, 7, 13, 1, 0, 0, 0, 0, 0, 0, 0),
(122, 7, 14, 1, 1, 1, 1, 1, 1, 0, 1),
(123, 7, 15, 1, 0, 0, 0, 0, 0, 0, 0),
(124, 7, 16, 1, 0, 0, 0, 0, 0, 0, 0),
(125, 7, 17, 1, 0, 0, 0, 0, 0, 0, 0),
(126, 7, 18, 1, 0, 0, 0, 0, 0, 0, 0),
(127, 7, 19, 1, 0, 0, 0, 0, 0, 0, 0),
(128, 7, 20, 1, 0, 0, 0, 0, 0, 0, 0),
(129, 7, 21, 1, 0, 0, 0, 0, 0, 0, 0),
(130, 7, 22, 1, 0, 0, 0, 0, 0, 0, 0),
(131, 7, 23, 1, 0, 0, 0, 0, 0, 0, 0),
(132, 7, 24, 1, 0, 0, 0, 0, 0, 0, 0),
(133, 7, 25, 1, 0, 0, 0, 0, 0, 0, 0),
(134, 7, 26, 1, 0, 0, 0, 0, 0, 0, 0),
(135, 7, 27, 1, 0, 0, 0, 0, 0, 0, 0),
(136, 8, 1, 1, 1, 0, 0, 0, 0, 0, 1),
(137, 8, 2, 1, 0, 0, 0, 1, 0, 0, 1),
(138, 8, 3, 1, 0, 0, 0, 1, 0, 0, 1),
(139, 8, 4, 1, 0, 0, 0, 0, 0, 0, 0),
(140, 8, 5, 1, 0, 0, 0, 0, 0, 0, 0),
(141, 8, 6, 1, 0, 0, 0, 0, 0, 0, 0),
(142, 8, 7, 1, 0, 0, 0, 0, 0, 0, 0),
(143, 8, 8, 1, 0, 0, 0, 0, 0, 0, 0),
(144, 8, 9, 1, 0, 0, 0, 1, 0, 0, 1),
(145, 8, 10, 1, 0, 0, 0, 1, 0, 0, 1),
(146, 8, 11, 1, 0, 0, 0, 0, 0, 0, 0),
(147, 8, 12, 1, 0, 0, 0, 0, 0, 0, 0),
(148, 8, 13, 1, 0, 0, 0, 0, 0, 0, 0),
(149, 8, 14, 1, 0, 0, 0, 0, 0, 0, 0),
(150, 8, 15, 1, 0, 0, 0, 1, 0, 0, 1),
(151, 8, 16, 1, 0, 0, 0, 0, 0, 0, 0),
(152, 8, 17, 1, 0, 0, 0, 0, 0, 0, 0),
(153, 8, 18, 1, 0, 0, 0, 0, 0, 0, 0),
(154, 8, 19, 1, 0, 0, 0, 0, 0, 0, 0),
(155, 8, 20, 1, 0, 0, 0, 0, 0, 0, 0),
(156, 8, 21, 1, 1, 0, 0, 1, 0, 0, 1),
(157, 8, 22, 1, 0, 0, 0, 0, 0, 0, 0),
(158, 8, 23, 1, 0, 0, 0, 0, 0, 0, 0),
(159, 8, 24, 1, 0, 0, 0, 0, 0, 0, 0),
(160, 8, 25, 1, 0, 0, 0, 0, 0, 0, 0),
(161, 8, 26, 1, 0, 0, 0, 0, 0, 0, 0),
(162, 8, 27, 1, 0, 0, 0, 0, 0, 0, 0),
(163, 3, 28, 1, 1, 0, 0, 0, 0, 0, 1),
(164, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(165, 9, 2, 1, 1, 1, 1, 1, 1, 1, 1),
(166, 9, 3, 1, 1, 1, 1, 1, 1, 1, 1),
(167, 9, 4, 1, 1, 1, 1, 1, 1, 1, 1),
(168, 9, 5, 1, 1, 1, 1, 1, 1, 1, 1),
(169, 9, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(170, 9, 7, 1, 1, 1, 1, 1, 1, 1, 1),
(171, 9, 8, 1, 1, 1, 1, 1, 1, 1, 1),
(172, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1),
(173, 9, 10, 1, 1, 1, 1, 1, 1, 1, 1),
(174, 9, 11, 1, 1, 1, 1, 1, 1, 1, 1),
(175, 9, 12, 1, 1, 1, 1, 1, 1, 1, 1),
(176, 9, 13, 1, 1, 1, 1, 1, 1, 1, 1),
(177, 9, 14, 1, 1, 1, 1, 1, 1, 1, 1),
(178, 9, 15, 1, 1, 1, 1, 1, 1, 1, 1),
(179, 9, 16, 1, 1, 1, 1, 1, 1, 1, 1),
(180, 9, 17, 1, 1, 1, 1, 1, 1, 1, 1),
(181, 9, 18, 1, 1, 1, 1, 1, 1, 1, 1),
(182, 9, 19, 1, 1, 1, 1, 1, 1, 1, 1),
(183, 9, 20, 1, 1, 1, 1, 1, 1, 1, 1),
(184, 9, 21, 1, 1, 1, 1, 1, 1, 1, 1),
(185, 9, 22, 1, 1, 1, 1, 1, 1, 1, 1),
(186, 9, 23, 1, 1, 1, 1, 1, 1, 1, 1),
(187, 9, 24, 1, 1, 1, 1, 1, 1, 1, 1),
(188, 9, 25, 1, 1, 1, 1, 1, 1, 1, 1),
(189, 9, 26, 1, 1, 1, 1, 1, 1, 1, 1),
(190, 9, 27, 1, 1, 1, 1, 1, 1, 1, 1),
(191, 9, 28, 1, 1, 1, 1, 1, 1, 1, 1),
(192, 9, 29, 1, 1, 1, 1, 1, 1, 1, 1),
(193, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(194, 10, 2, 1, 1, 1, 1, 1, 1, 1, 1),
(195, 10, 3, 1, 1, 1, 1, 1, 1, 1, 1),
(196, 10, 4, 1, 1, 1, 1, 1, 1, 1, 1),
(197, 10, 5, 1, 1, 1, 1, 1, 1, 1, 1),
(198, 10, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(199, 10, 7, 1, 1, 1, 1, 1, 1, 1, 1),
(200, 10, 8, 1, 1, 1, 1, 1, 1, 1, 1),
(201, 10, 9, 1, 1, 1, 1, 1, 1, 1, 1),
(202, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1),
(203, 10, 11, 1, 1, 1, 1, 1, 1, 1, 1),
(204, 10, 12, 1, 1, 1, 1, 1, 1, 1, 1),
(205, 10, 13, 1, 1, 1, 1, 1, 1, 1, 1),
(206, 10, 14, 1, 1, 1, 1, 1, 1, 1, 1),
(207, 10, 15, 1, 1, 1, 1, 1, 1, 1, 1),
(208, 10, 16, 1, 1, 1, 1, 1, 1, 1, 1),
(209, 10, 17, 1, 1, 1, 1, 1, 1, 1, 1),
(210, 10, 18, 1, 1, 1, 1, 1, 1, 1, 1),
(211, 10, 19, 1, 1, 1, 1, 1, 1, 1, 1),
(212, 10, 20, 1, 1, 1, 1, 1, 1, 1, 1),
(213, 10, 21, 1, 1, 1, 1, 1, 1, 1, 1),
(214, 10, 22, 1, 1, 1, 1, 1, 1, 1, 1),
(215, 10, 23, 1, 1, 1, 1, 1, 1, 1, 1),
(216, 10, 24, 1, 1, 1, 1, 1, 1, 1, 1),
(217, 10, 25, 1, 1, 1, 1, 1, 1, 1, 1),
(218, 10, 26, 1, 1, 1, 1, 1, 1, 1, 1),
(219, 10, 27, 1, 1, 1, 1, 1, 1, 1, 1),
(220, 10, 28, 1, 1, 1, 1, 1, 1, 1, 1),
(221, 10, 29, 1, 1, 1, 1, 1, 1, 1, 1),
(222, 10, 30, 1, 1, 1, 1, 1, 1, 1, 1),
(223, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(224, 11, 2, 1, 1, 1, 1, 1, 1, 1, 1),
(225, 11, 3, 1, 1, 1, 1, 1, 1, 1, 1),
(226, 11, 4, 1, 1, 1, 1, 1, 1, 1, 1),
(227, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1),
(228, 11, 6, 1, 1, 1, 1, 1, 1, 1, 1),
(229, 11, 7, 1, 1, 1, 1, 1, 1, 1, 1),
(230, 11, 8, 1, 1, 1, 1, 1, 1, 1, 1),
(231, 11, 9, 1, 1, 1, 1, 1, 1, 1, 1),
(232, 11, 10, 1, 1, 1, 1, 1, 1, 1, 1),
(233, 11, 11, 1, 1, 1, 1, 1, 1, 1, 1),
(234, 11, 12, 1, 1, 1, 1, 1, 1, 1, 1),
(235, 11, 13, 1, 1, 1, 1, 1, 1, 1, 1),
(236, 11, 14, 1, 1, 1, 1, 1, 1, 1, 1),
(237, 11, 15, 1, 1, 1, 1, 1, 1, 1, 1),
(238, 11, 16, 1, 1, 1, 1, 1, 1, 1, 1),
(239, 11, 17, 1, 1, 1, 1, 1, 1, 1, 1),
(240, 11, 18, 1, 1, 1, 1, 1, 1, 1, 1),
(241, 11, 19, 1, 1, 1, 1, 1, 1, 1, 1),
(242, 11, 20, 1, 1, 1, 1, 1, 1, 1, 1),
(243, 11, 21, 1, 1, 1, 1, 1, 1, 1, 1),
(244, 11, 22, 1, 1, 1, 1, 1, 1, 1, 1),
(245, 11, 23, 1, 1, 1, 1, 1, 1, 1, 1),
(246, 11, 24, 1, 1, 1, 1, 1, 1, 1, 1),
(247, 11, 25, 1, 1, 1, 1, 1, 1, 1, 1),
(248, 11, 26, 1, 1, 1, 1, 1, 1, 1, 1),
(249, 11, 27, 1, 1, 1, 1, 1, 1, 1, 1),
(250, 11, 28, 1, 1, 1, 1, 1, 1, 1, 1),
(251, 11, 29, 1, 1, 1, 1, 1, 1, 1, 1),
(252, 11, 30, 1, 1, 1, 1, 1, 1, 1, 1),
(253, 11, 31, 1, 1, 1, 1, 1, 1, 1, 1),
(254, 11, 32, 1, 1, 1, 1, 1, 1, 1, 1),
(255, 11, 33, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_weekday`
--

CREATE TABLE `tb_weekday` (
  `weekday_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_weekday`
--

INSERT INTO `tb_weekday` (`weekday_id`, `name`) VALUES
(1, 'Sunday'),
(2, 'Monday'),
(3, 'Tuesday'),
(4, 'Wednesday'),
(5, 'Thursday'),
(6, 'Friday'),
(7, 'Saturday');

-- --------------------------------------------------------

--
-- Table structure for table `tb_weekday_class_period`
--

CREATE TABLE `tb_weekday_class_period` (
  `weekday_class_period_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `weekday_id` int(11) DEFAULT NULL,
  `class_timing_id` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_weekday_class_period`
--

INSERT INTO `tb_weekday_class_period` (`weekday_class_period_id`, `school_id`, `weekday_id`, `class_timing_id`, `class_id`, `date_created`) VALUES
(29, 1, 2, 1, 4, '0000-00-00 00:00:00'),
(30, 1, 3, 1, 4, '0000-00-00 00:00:00'),
(31, 1, 4, 1, 4, '0000-00-00 00:00:00'),
(32, 1, 5, 1, 4, '0000-00-00 00:00:00'),
(33, 1, 6, 1, 4, '0000-00-00 00:00:00'),
(56, 1, 6, 1, 2, '0000-00-00 00:00:00'),
(57, 1, 6, 2, 4, '0000-00-00 00:00:00'),
(58, 1, 2, 1, 3, '0000-00-00 00:00:00'),
(59, 1, 3, 1, 3, '0000-00-00 00:00:00'),
(60, 1, 4, 1, 3, '0000-00-00 00:00:00'),
(61, 1, 5, 1, 3, '0000-00-00 00:00:00'),
(64, 1, 6, 2, 3, '0000-00-00 00:00:00'),
(70, 1, 2, 1, 5, '0000-00-00 00:00:00'),
(71, 1, 3, 1, 5, '0000-00-00 00:00:00'),
(72, 1, 4, 1, 5, '0000-00-00 00:00:00'),
(73, 1, 5, 1, 5, '0000-00-00 00:00:00'),
(74, 1, 6, 2, 5, '0000-00-00 00:00:00'),
(78, 1, 3, 1, 1, '0000-00-00 00:00:00'),
(81, 1, 7, 2, 2, '0000-00-00 00:00:00'),
(82, 1, 4, 1, 1, '0000-00-00 00:00:00'),
(84, 1, 5, 1, 1, '0000-00-00 00:00:00'),
(87, 1, 6, 1, 1, '0000-00-00 00:00:00'),
(88, 1, 6, 2, 1, '0000-00-00 00:00:00'),
(90, 1, 2, 1, 1, '0000-00-00 00:00:00'),
(92, 1, 6, 3, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_additional_details`
--
CREATE TABLE `vw_additional_details` (
`user_additional_detail_id` int(11)
,`school_id` int(11)
,`user_id` int(11)
,`user_additional_field_id` int(11)
,`value` varchar(100)
,`name` varchar(100)
,`type` varchar(20)
,`required` int(11)
,`description` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_class`
--
CREATE TABLE `vw_class` (
`class_id` int(11)
,`school_id` int(11)
,`student_department_id` int(11)
,`name` varchar(100)
,`code` varchar(200)
,`level_id` int(11)
,`level_name` varchar(50)
,`date_created` datetime
,`department_name` varchar(100)
,`department_code` varchar(20)
,`class_type_id` int(11)
,`class_type` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_class_basic_subject`
--
CREATE TABLE `vw_class_basic_subject` (
`class_basic_subject_id` int(11)
,`school_id` int(11)
,`class_id` int(11)
,`employee_id` int(11)
,`subject_id` int(11)
,`class` varchar(100)
,`class_code` varchar(200)
,`subject` varchar(200)
,`subject_code` varchar(20)
,`teacher` varchar(201)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_class_period`
--
CREATE TABLE `vw_class_period` (
`class_period_id` int(11)
,`school_id` int(11)
,`class_timing_set_id` int(11)
,`name` varchar(100)
,`start_time` time
,`end_time` time
,`is_break` int(11)
,`class_timing_set` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_class_timetable`
--
CREATE TABLE `vw_class_timetable` (
`class_timetable_id` int(11)
,`class_id` int(11)
,`school_id` int(11)
,`weekday_id` int(11)
,`class_period_id` int(11)
,`subject_id` int(11)
,`employee_id` int(11)
,`date_created` datetime
,`weekday` varchar(100)
,`class_timing_set_id` int(11)
,`class_period` varchar(100)
,`start_time` time
,`end_time` time
,`is_break` int(11)
,`subject` varchar(200)
,`teacher` varchar(201)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_employee`
--
CREATE TABLE `vw_employee` (
`user_id` int(11)
,`firstname` varchar(100)
,`lastname` varchar(100)
,`othernames` varchar(100)
,`username` varchar(100)
,`password` varchar(200)
,`is_active` int(11)
,`school_id` int(11)
,`gender` varchar(10)
,`dob` datetime
,`marital_status` varchar(50)
,`state_id` int(11)
,`address` varchar(200)
,`city` varchar(50)
,`phone1` varchar(50)
,`phone2` varchar(50)
,`email` varchar(100)
,`photo` varchar(200)
,`privilege_id` int(11)
,`privilege` varchar(50)
,`employee_id` int(11)
,`deparment_id` int(11)
,`category_id` int(11)
,`position_id` int(11)
,`date_joined` date
,`employee_number` varchar(30)
,`grade_level_id` int(11)
,`department` varchar(200)
,`category` varchar(100)
,`position` varchar(100)
,`grade_level` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_employee_position`
--
CREATE TABLE `vw_employee_position` (
`employee_position_id` int(11)
,`school_id` int(11)
,`name` varchar(100)
,`description` varchar(200)
,`date_created` datetime
,`date_modified` datetime
,`employee_category_id` int(11)
,`category` varchar(100)
,`category_code` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_parent`
--
CREATE TABLE `vw_parent` (
`user_id` int(11)
,`fullname` varchar(100)
,`username` varchar(100)
,`password` varchar(200)
,`is_active` int(11)
,`school_id` int(11)
,`gender` varchar(10)
,`dob` datetime
,`marital_status` varchar(50)
,`state_id` int(11)
,`address` varchar(200)
,`city` varchar(50)
,`phone1` varchar(50)
,`phone2` varchar(50)
,`email` varchar(100)
,`photo` varchar(200)
,`privilege_id` int(11)
,`parent_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_quota`
--
CREATE TABLE `vw_quota` (
`school_id` int(11)
,`session_id` int(100)
,`quota_id` int(11)
,`name` varchar(100)
,`start_time` date
,`end_time` date
,`description` varchar(200)
,`date_created` datetime
,`session` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_student`
--
CREATE TABLE `vw_student` (
`user_id` int(11)
,`firstname` varchar(100)
,`lastname` varchar(100)
,`othernames` varchar(100)
,`username` varchar(100)
,`password` varchar(200)
,`is_active` int(11)
,`school_id` int(11)
,`gender` varchar(10)
,`dob` datetime
,`marital_status` varchar(50)
,`state_id` int(11)
,`address` varchar(200)
,`city` varchar(50)
,`phone1` varchar(50)
,`phone2` varchar(50)
,`email` varchar(100)
,`photo` varchar(200)
,`privilege_id` int(11)
,`student_id` int(11)
,`department_id` int(11)
,`registration_number` varchar(100)
,`admission_date` datetime
,`date_created` datetime
,`batch_id` int(11)
,`category_id` int(11)
,`parent_id` int(11)
,`parent_relationship` varchar(50)
,`class_type_id` int(11)
,`class_level_id` int(11)
,`class_id` int(11)
,`class` varchar(100)
,`class_code` varchar(200)
,`level` varchar(50)
,`department` varchar(100)
,`department_code` varchar(20)
,`class_type` varchar(50)
,`category` varchar(200)
,`category_code` varchar(50)
,`state` varchar(30)
,`parent_name` varchar(100)
,`parent_username` varchar(100)
,`parent_address` varchar(200)
,`parent_city` varchar(50)
,`parent_phone1` varchar(50)
,`parent_phone2` varchar(50)
,`parent_email` varchar(100)
,`parent_photo` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_user_privilege_module`
--
CREATE TABLE `vw_user_privilege_module` (
`user_privilege_module_id` int(11)
,`user_privilege_id` int(11)
,`module_id` int(11)
,`school_id` int(11)
,`create` tinyint(1)
,`update` tinyint(4)
,`delete` tinyint(4)
,`view` tinyint(4)
,`print` tinyint(4)
,`check_all` tinyint(1)
,`is_active` int(11)
,`privilege` varchar(50)
,`module` varchar(30)
,`has_child` tinyint(1)
,`icon` varchar(20)
,`url` varchar(50)
,`parent_id` tinyint(1)
,`position` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_weekday_class_period`
--
CREATE TABLE `vw_weekday_class_period` (
`weekday_class_period_id` int(11)
,`school_id` int(11)
,`weekday_id` int(11)
,`class_timing_id` int(11)
,`class_id` int(11)
,`weekday` varchar(100)
,`class_timing_set` varchar(100)
,`class` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_additional_details`
--
DROP TABLE IF EXISTS `vw_additional_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_additional_details`  AS  select `tb_user_additional_details`.`user_additional_detail_id` AS `user_additional_detail_id`,`tb_user_additional_details`.`school_id` AS `school_id`,`tb_user_additional_details`.`user_id` AS `user_id`,`tb_user_additional_details`.`user_additional_field_id` AS `user_additional_field_id`,`tb_user_additional_details`.`value` AS `value`,`tb_user_additional_field`.`name` AS `name`,`tb_user_additional_field`.`type` AS `type`,`tb_user_additional_field`.`required` AS `required`,`tb_user_additional_field`.`description` AS `description` from (`tb_user_additional_details` join `tb_user_additional_field` on((`tb_user_additional_details`.`user_additional_field_id` = `tb_user_additional_field`.`user_additional_field_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_class`
--
DROP TABLE IF EXISTS `vw_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_class`  AS  select `tb_class`.`class_id` AS `class_id`,`tb_class`.`school_id` AS `school_id`,`tb_class`.`student_department_id` AS `student_department_id`,`tb_class`.`name` AS `name`,`tb_class`.`code` AS `code`,`tb_class_level`.`class_level_id` AS `level_id`,`tb_class_level`.`name` AS `level_name`,`tb_class`.`date_created` AS `date_created`,`tb_student_department`.`name` AS `department_name`,`tb_student_department`.`code` AS `department_code`,`tb_class_type`.`class_type_id` AS `class_type_id`,`tb_class_type`.`name` AS `class_type` from (((`tb_class` join `tb_student_department` on((`tb_class`.`student_department_id` = `tb_student_department`.`student_department_id`))) join `tb_class_level` on((`tb_class_level`.`class_level_id` = `tb_class`.`class_level_id`))) join `tb_class_type` on((`tb_class_type`.`class_type_id` = `tb_class`.`class_type_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_class_basic_subject`
--
DROP TABLE IF EXISTS `vw_class_basic_subject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_class_basic_subject`  AS  select `tb_class_basic_subject`.`class_basic_subject_id` AS `class_basic_subject_id`,`tb_class_basic_subject`.`school_id` AS `school_id`,`tb_class_basic_subject`.`class_id` AS `class_id`,`tb_class_basic_subject`.`employee_id` AS `employee_id`,`tb_class_basic_subject`.`subject_id` AS `subject_id`,`tb_class`.`name` AS `class`,`tb_class`.`code` AS `class_code`,`tb_subject`.`name` AS `subject`,`tb_subject`.`code` AS `subject_code`,concat(`vw_employee`.`firstname`,' ',`vw_employee`.`lastname`) AS `teacher` from (((`tb_class_basic_subject` join `tb_class` on((`tb_class_basic_subject`.`class_id` = `tb_class`.`class_id`))) join `tb_subject` on((`tb_class_basic_subject`.`subject_id` = `tb_subject`.`subject_id`))) left join `vw_employee` on((`tb_class_basic_subject`.`employee_id` = `vw_employee`.`employee_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_class_period`
--
DROP TABLE IF EXISTS `vw_class_period`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_class_period`  AS  select `tb_class_period`.`class_period_id` AS `class_period_id`,`tb_class_period`.`school_id` AS `school_id`,`tb_class_period`.`class_timing_set_id` AS `class_timing_set_id`,`tb_class_period`.`name` AS `name`,`tb_class_period`.`start_time` AS `start_time`,`tb_class_period`.`end_time` AS `end_time`,`tb_class_period`.`is_break` AS `is_break`,`tb_class_timing_set`.`name` AS `class_timing_set` from (`tb_class_period` join `tb_class_timing_set` on((`tb_class_timing_set`.`class_timing_set_id` = `tb_class_period`.`class_timing_set_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_class_timetable`
--
DROP TABLE IF EXISTS `vw_class_timetable`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_class_timetable`  AS  select `tb_class_timetable`.`class_timetable_id` AS `class_timetable_id`,`tb_class_timetable`.`class_id` AS `class_id`,`tb_class_timetable`.`school_id` AS `school_id`,`tb_class_timetable`.`weekday_id` AS `weekday_id`,`tb_class_timetable`.`class_period_id` AS `class_period_id`,`tb_class_timetable`.`subject_id` AS `subject_id`,`tb_class_timetable`.`employee_id` AS `employee_id`,`tb_class_timetable`.`date_created` AS `date_created`,`tb_weekday`.`name` AS `weekday`,`tb_class_period`.`class_timing_set_id` AS `class_timing_set_id`,`tb_class_period`.`name` AS `class_period`,`tb_class_period`.`start_time` AS `start_time`,`tb_class_period`.`end_time` AS `end_time`,`tb_class_period`.`is_break` AS `is_break`,`tb_subject`.`name` AS `subject`,concat(`vw_employee`.`firstname`,' ',`vw_employee`.`lastname`) AS `teacher` from ((((`tb_class_timetable` join `tb_weekday` on((`tb_class_timetable`.`weekday_id` = `tb_weekday`.`weekday_id`))) join `tb_class_period` on((`tb_class_timetable`.`class_period_id` = `tb_class_period`.`class_period_id`))) join `tb_subject` on((`tb_class_timetable`.`subject_id` = `tb_subject`.`subject_id`))) left join `vw_employee` on((`tb_class_timetable`.`employee_id` = `vw_employee`.`employee_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_employee`
--
DROP TABLE IF EXISTS `vw_employee`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_employee`  AS  select `tb_user`.`user_id` AS `user_id`,`tb_user`.`firstname` AS `firstname`,`tb_user`.`lastname` AS `lastname`,`tb_user`.`othernames` AS `othernames`,`tb_user`.`username` AS `username`,`tb_user`.`password` AS `password`,`tb_user`.`is_active` AS `is_active`,`tb_user`.`school_id` AS `school_id`,`tb_user`.`gender` AS `gender`,`tb_user`.`dob` AS `dob`,`tb_user`.`marital_status` AS `marital_status`,`tb_user`.`state_id` AS `state_id`,`tb_user`.`address` AS `address`,`tb_user`.`city` AS `city`,`tb_user`.`phone1` AS `phone1`,`tb_user`.`phone2` AS `phone2`,`tb_user`.`email` AS `email`,`tb_user`.`photo` AS `photo`,`tb_user`.`privilege_id` AS `privilege_id`,`tb_user_privilege`.`name` AS `privilege`,`tb_employee`.`employee_id` AS `employee_id`,`tb_employee`.`employee_department_id` AS `deparment_id`,`tb_employee`.`employee_category_id` AS `category_id`,`tb_employee`.`employee_position_id` AS `position_id`,`tb_employee`.`date_joined` AS `date_joined`,`tb_employee`.`employee_number` AS `employee_number`,`tb_employee`.`employee_grade_level_id` AS `grade_level_id`,`tb_employee_department`.`name` AS `department`,`tb_employee_category`.`name` AS `category`,`tb_employee_position`.`name` AS `position`,`tb_employee_grade_level`.`name` AS `grade_level` from ((((((`tb_user` join `tb_user_privilege` on((`tb_user_privilege`.`user_privilege_id` = `tb_user`.`privilege_id`))) join `tb_employee` on((`tb_employee`.`user_id` = `tb_user`.`user_id`))) join `tb_employee_department` on((`tb_employee_department`.`employee_department_id` = `tb_employee`.`employee_department_id`))) join `tb_employee_category` on((`tb_employee_category`.`employee_category_id` = `tb_employee`.`employee_category_id`))) join `tb_employee_position` on((`tb_employee_position`.`employee_position_id` = `tb_employee`.`employee_position_id`))) join `tb_employee_grade_level` on((`tb_employee_grade_level`.`employee_grade_level_id` = `tb_employee`.`employee_grade_level_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_employee_position`
--
DROP TABLE IF EXISTS `vw_employee_position`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_employee_position`  AS  select `tb_employee_position`.`employee_position_id` AS `employee_position_id`,`tb_employee_position`.`school_id` AS `school_id`,`tb_employee_position`.`name` AS `name`,`tb_employee_position`.`description` AS `description`,`tb_employee_position`.`date_created` AS `date_created`,`tb_employee_position`.`date_modified` AS `date_modified`,`tb_employee_position`.`employee_category_id` AS `employee_category_id`,`tb_employee_category`.`name` AS `category`,`tb_employee_category`.`code` AS `category_code` from (`tb_employee_position` join `tb_employee_category` on((`tb_employee_position`.`employee_category_id` = `tb_employee_category`.`employee_category_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_parent`
--
DROP TABLE IF EXISTS `vw_parent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_parent`  AS  select `tb_user`.`user_id` AS `user_id`,`tb_user`.`firstname` AS `fullname`,`tb_user`.`username` AS `username`,`tb_user`.`password` AS `password`,`tb_user`.`is_active` AS `is_active`,`tb_user`.`school_id` AS `school_id`,`tb_user`.`gender` AS `gender`,`tb_user`.`dob` AS `dob`,`tb_user`.`marital_status` AS `marital_status`,`tb_user`.`state_id` AS `state_id`,`tb_user`.`address` AS `address`,`tb_user`.`city` AS `city`,`tb_user`.`phone1` AS `phone1`,`tb_user`.`phone2` AS `phone2`,`tb_user`.`email` AS `email`,`tb_user`.`photo` AS `photo`,`tb_user`.`privilege_id` AS `privilege_id`,`tb_parent`.`parent_id` AS `parent_id` from (`tb_user` join `tb_parent` on((`tb_user`.`user_id` = `tb_parent`.`user_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_quota`
--
DROP TABLE IF EXISTS `vw_quota`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_quota`  AS  select `tb_quota`.`school_id` AS `school_id`,`tb_quota`.`session_id` AS `session_id`,`tb_quota`.`quota_id` AS `quota_id`,`tb_quota`.`name` AS `name`,`tb_quota`.`start_time` AS `start_time`,`tb_quota`.`end_time` AS `end_time`,`tb_quota`.`description` AS `description`,`tb_quota`.`date_created` AS `date_created`,`tb_session`.`name` AS `session` from (`tb_quota` join `tb_session` on((`tb_quota`.`session_id` = `tb_session`.`session_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_student`
--
DROP TABLE IF EXISTS `vw_student`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student`  AS  select `tb_user`.`user_id` AS `user_id`,`tb_user`.`firstname` AS `firstname`,`tb_user`.`lastname` AS `lastname`,`tb_user`.`othernames` AS `othernames`,`tb_user`.`username` AS `username`,`tb_user`.`password` AS `password`,`tb_user`.`is_active` AS `is_active`,`tb_user`.`school_id` AS `school_id`,`tb_user`.`gender` AS `gender`,`tb_user`.`dob` AS `dob`,`tb_user`.`marital_status` AS `marital_status`,`tb_user`.`state_id` AS `state_id`,`tb_user`.`address` AS `address`,`tb_user`.`city` AS `city`,`tb_user`.`phone1` AS `phone1`,`tb_user`.`phone2` AS `phone2`,`tb_user`.`email` AS `email`,`tb_user`.`photo` AS `photo`,`tb_user`.`privilege_id` AS `privilege_id`,`tb_student`.`student_id` AS `student_id`,`tb_student`.`student_department_id` AS `department_id`,`tb_student`.`registration_number` AS `registration_number`,`tb_student`.`admission_date` AS `admission_date`,`tb_student`.`date_created` AS `date_created`,`tb_student`.`batch_id` AS `batch_id`,`tb_student`.`student_category_id` AS `category_id`,`tb_student`.`parent_id` AS `parent_id`,`tb_student`.`parent_relationship` AS `parent_relationship`,`tb_student`.`class_type_id` AS `class_type_id`,`tb_student`.`class_level_id` AS `class_level_id`,`tb_student`.`class_id` AS `class_id`,`vw_class`.`name` AS `class`,`vw_class`.`code` AS `class_code`,`vw_class`.`level_name` AS `level`,`vw_class`.`department_name` AS `department`,`vw_class`.`department_code` AS `department_code`,`vw_class`.`class_type` AS `class_type`,`tb_student_category`.`name` AS `category`,`tb_student_category`.`code` AS `category_code`,`tb_state`.`name` AS `state`,`vw_parent`.`fullname` AS `parent_name`,`vw_parent`.`username` AS `parent_username`,`vw_parent`.`address` AS `parent_address`,`vw_parent`.`city` AS `parent_city`,`vw_parent`.`phone1` AS `parent_phone1`,`vw_parent`.`phone2` AS `parent_phone2`,`vw_parent`.`email` AS `parent_email`,`vw_parent`.`photo` AS `parent_photo` from (((((`tb_user` join `tb_student` on((`tb_user`.`user_id` = `tb_student`.`user_id`))) join `vw_class` on((`tb_student`.`class_id` = `vw_class`.`class_id`))) join `tb_student_category` on((`tb_student_category`.`student_category_id` = `tb_student`.`student_category_id`))) join `tb_state` on((`tb_user`.`state_id` = `tb_state`.`id`))) join `vw_parent` on((`tb_student`.`parent_id` = `vw_parent`.`parent_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_user_privilege_module`
--
DROP TABLE IF EXISTS `vw_user_privilege_module`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_user_privilege_module`  AS  select `tb_user_privilege_module`.`user_privilege_module_id` AS `user_privilege_module_id`,`tb_user_privilege_module`.`user_privilege_id` AS `user_privilege_id`,`tb_user_privilege_module`.`module_id` AS `module_id`,`tb_user_privilege_module`.`school_id` AS `school_id`,`tb_user_privilege_module`.`create` AS `create`,`tb_user_privilege_module`.`update` AS `update`,`tb_user_privilege_module`.`delete` AS `delete`,`tb_user_privilege_module`.`view` AS `view`,`tb_user_privilege_module`.`print` AS `print`,`tb_user_privilege_module`.`check_all` AS `check_all`,`tb_user_privilege_module`.`is_active` AS `is_active`,`tb_user_privilege`.`name` AS `privilege`,`tb_module`.`name` AS `module`,`tb_module`.`has_child` AS `has_child`,`tb_module`.`icon` AS `icon`,`tb_module`.`url` AS `url`,`tb_module`.`parent_id` AS `parent_id`,`tb_module`.`position` AS `position` from ((`tb_user_privilege_module` join `tb_user_privilege` on((`tb_user_privilege`.`user_privilege_id` = `tb_user_privilege_module`.`user_privilege_id`))) join `tb_module` on((`tb_module`.`module_id` = `tb_user_privilege_module`.`module_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_weekday_class_period`
--
DROP TABLE IF EXISTS `vw_weekday_class_period`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_weekday_class_period`  AS  select `tb_weekday_class_period`.`weekday_class_period_id` AS `weekday_class_period_id`,`tb_weekday_class_period`.`school_id` AS `school_id`,`tb_weekday_class_period`.`weekday_id` AS `weekday_id`,`tb_weekday_class_period`.`class_timing_id` AS `class_timing_id`,`tb_weekday_class_period`.`class_id` AS `class_id`,`tb_weekday`.`name` AS `weekday`,`tb_class_timing_set`.`name` AS `class_timing_set`,`tb_class`.`name` AS `class` from (((`tb_weekday_class_period` join `tb_weekday` on((`tb_weekday_class_period`.`weekday_id` = `tb_weekday`.`weekday_id`))) join `tb_class_timing_set` on((`tb_class_timing_set`.`class_timing_set_id` = `tb_weekday_class_period`.`class_timing_id`))) join `tb_class` on((`tb_weekday_class_period`.`class_id` = `tb_class`.`class_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_assessment_timetable`
--
ALTER TABLE `tb_assessment_timetable`
  ADD PRIMARY KEY (`assessment_timetable_id`);

--
-- Indexes for table `tb_batch`
--
ALTER TABLE `tb_batch`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `tb_class`
--
ALTER TABLE `tb_class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `tb_class_basic_subject`
--
ALTER TABLE `tb_class_basic_subject`
  ADD PRIMARY KEY (`class_basic_subject_id`);

--
-- Indexes for table `tb_class_designation`
--
ALTER TABLE `tb_class_designation`
  ADD PRIMARY KEY (`class_designation_id`);

--
-- Indexes for table `tb_class_designation_structure`
--
ALTER TABLE `tb_class_designation_structure`
  ADD PRIMARY KEY (`class_designation_structure_id`);

--
-- Indexes for table `tb_class_level`
--
ALTER TABLE `tb_class_level`
  ADD PRIMARY KEY (`class_level_id`);

--
-- Indexes for table `tb_class_period`
--
ALTER TABLE `tb_class_period`
  ADD PRIMARY KEY (`class_period_id`);

--
-- Indexes for table `tb_class_timetable`
--
ALTER TABLE `tb_class_timetable`
  ADD PRIMARY KEY (`class_timetable_id`);

--
-- Indexes for table `tb_class_timing_set`
--
ALTER TABLE `tb_class_timing_set`
  ADD PRIMARY KEY (`class_timing_set_id`);

--
-- Indexes for table `tb_class_type`
--
ALTER TABLE `tb_class_type`
  ADD PRIMARY KEY (`class_type_id`);

--
-- Indexes for table `tb_country`
--
ALTER TABLE `tb_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `tb_employee_category`
--
ALTER TABLE `tb_employee_category`
  ADD PRIMARY KEY (`employee_category_id`);

--
-- Indexes for table `tb_employee_department`
--
ALTER TABLE `tb_employee_department`
  ADD PRIMARY KEY (`employee_department_id`);

--
-- Indexes for table `tb_employee_grade_level`
--
ALTER TABLE `tb_employee_grade_level`
  ADD PRIMARY KEY (`employee_grade_level_id`);

--
-- Indexes for table `tb_employee_position`
--
ALTER TABLE `tb_employee_position`
  ADD PRIMARY KEY (`employee_position_id`);

--
-- Indexes for table `tb_employee_subject`
--
ALTER TABLE `tb_employee_subject`
  ADD PRIMARY KEY (`employee_subject_id`);

--
-- Indexes for table `tb_examination`
--
ALTER TABLE `tb_examination`
  ADD PRIMARY KEY (`examination_id`);

--
-- Indexes for table `tb_examination_group`
--
ALTER TABLE `tb_examination_group`
  ADD PRIMARY KEY (`examination_group_id`);

--
-- Indexes for table `tb_examination_timetable`
--
ALTER TABLE `tb_examination_timetable`
  ADD PRIMARY KEY (`examination_timetable_id`);

--
-- Indexes for table `tb_grade_level_payroll`
--
ALTER TABLE `tb_grade_level_payroll`
  ADD PRIMARY KEY (`tb_grade_level_payroll_id`);

--
-- Indexes for table `tb_grading_level`
--
ALTER TABLE `tb_grading_level`
  ADD PRIMARY KEY (`grading_level_id`);

--
-- Indexes for table `tb_grading_level_structure`
--
ALTER TABLE `tb_grading_level_structure`
  ADD PRIMARY KEY (`tb_grading_level_structure_id`);

--
-- Indexes for table `tb_grading_system`
--
ALTER TABLE `tb_grading_system`
  ADD PRIMARY KEY (`grading_system_id`);

--
-- Indexes for table `tb_module`
--
ALTER TABLE `tb_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `tb_parent`
--
ALTER TABLE `tb_parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `tb_quota`
--
ALTER TABLE `tb_quota`
  ADD PRIMARY KEY (`quota_id`);

--
-- Indexes for table `tb_school`
--
ALTER TABLE `tb_school`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexes for table `tb_session`
--
ALTER TABLE `tb_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `tb_state`
--
ALTER TABLE `tb_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_student`
--
ALTER TABLE `tb_student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tb_student_category`
--
ALTER TABLE `tb_student_category`
  ADD PRIMARY KEY (`student_category_id`);

--
-- Indexes for table `tb_student_category_subject`
--
ALTER TABLE `tb_student_category_subject`
  ADD PRIMARY KEY (`student_category_subject_id`);

--
-- Indexes for table `tb_student_department`
--
ALTER TABLE `tb_student_department`
  ADD PRIMARY KEY (`student_department_id`);

--
-- Indexes for table `tb_subject`
--
ALTER TABLE `tb_subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `tb_subject_assessment_timetable`
--
ALTER TABLE `tb_subject_assessment_timetable`
  ADD PRIMARY KEY (`subject_assessment_timetable_id`);

--
-- Indexes for table `tb_subject_category`
--
ALTER TABLE `tb_subject_category`
  ADD PRIMARY KEY (`subject_category_id`);

--
-- Indexes for table `tb_time_zone`
--
ALTER TABLE `tb_time_zone`
  ADD PRIMARY KEY (`time_zone_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tb_user_additional_details`
--
ALTER TABLE `tb_user_additional_details`
  ADD PRIMARY KEY (`user_additional_detail_id`);

--
-- Indexes for table `tb_user_additional_field`
--
ALTER TABLE `tb_user_additional_field`
  ADD PRIMARY KEY (`user_additional_field_id`);

--
-- Indexes for table `tb_user_privilege`
--
ALTER TABLE `tb_user_privilege`
  ADD PRIMARY KEY (`user_privilege_id`);

--
-- Indexes for table `tb_user_privilege_module`
--
ALTER TABLE `tb_user_privilege_module`
  ADD PRIMARY KEY (`user_privilege_module_id`);

--
-- Indexes for table `tb_weekday`
--
ALTER TABLE `tb_weekday`
  ADD PRIMARY KEY (`weekday_id`);

--
-- Indexes for table `tb_weekday_class_period`
--
ALTER TABLE `tb_weekday_class_period`
  ADD PRIMARY KEY (`weekday_class_period_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_assessment_timetable`
--
ALTER TABLE `tb_assessment_timetable`
  MODIFY `assessment_timetable_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_batch`
--
ALTER TABLE `tb_batch`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_class`
--
ALTER TABLE `tb_class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_class_basic_subject`
--
ALTER TABLE `tb_class_basic_subject`
  MODIFY `class_basic_subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `tb_class_designation`
--
ALTER TABLE `tb_class_designation`
  MODIFY `class_designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_class_designation_structure`
--
ALTER TABLE `tb_class_designation_structure`
  MODIFY `class_designation_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_class_level`
--
ALTER TABLE `tb_class_level`
  MODIFY `class_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_class_period`
--
ALTER TABLE `tb_class_period`
  MODIFY `class_period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_class_timetable`
--
ALTER TABLE `tb_class_timetable`
  MODIFY `class_timetable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tb_class_timing_set`
--
ALTER TABLE `tb_class_timing_set`
  MODIFY `class_timing_set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_class_type`
--
ALTER TABLE `tb_class_type`
  MODIFY `class_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_country`
--
ALTER TABLE `tb_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_employee`
--
ALTER TABLE `tb_employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_employee_category`
--
ALTER TABLE `tb_employee_category`
  MODIFY `employee_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_employee_department`
--
ALTER TABLE `tb_employee_department`
  MODIFY `employee_department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_employee_grade_level`
--
ALTER TABLE `tb_employee_grade_level`
  MODIFY `employee_grade_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_employee_position`
--
ALTER TABLE `tb_employee_position`
  MODIFY `employee_position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_employee_subject`
--
ALTER TABLE `tb_employee_subject`
  MODIFY `employee_subject_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_examination`
--
ALTER TABLE `tb_examination`
  MODIFY `examination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tb_examination_group`
--
ALTER TABLE `tb_examination_group`
  MODIFY `examination_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_examination_timetable`
--
ALTER TABLE `tb_examination_timetable`
  MODIFY `examination_timetable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_grade_level_payroll`
--
ALTER TABLE `tb_grade_level_payroll`
  MODIFY `tb_grade_level_payroll_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_grading_level`
--
ALTER TABLE `tb_grading_level`
  MODIFY `grading_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_grading_level_structure`
--
ALTER TABLE `tb_grading_level_structure`
  MODIFY `tb_grading_level_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_grading_system`
--
ALTER TABLE `tb_grading_system`
  MODIFY `grading_system_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_module`
--
ALTER TABLE `tb_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tb_parent`
--
ALTER TABLE `tb_parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_quota`
--
ALTER TABLE `tb_quota`
  MODIFY `quota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_school`
--
ALTER TABLE `tb_school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_session`
--
ALTER TABLE `tb_session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_state`
--
ALTER TABLE `tb_state`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tb_student`
--
ALTER TABLE `tb_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_student_category`
--
ALTER TABLE `tb_student_category`
  MODIFY `student_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_student_category_subject`
--
ALTER TABLE `tb_student_category_subject`
  MODIFY `student_category_subject_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_student_department`
--
ALTER TABLE `tb_student_department`
  MODIFY `student_department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_subject`
--
ALTER TABLE `tb_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_subject_assessment_timetable`
--
ALTER TABLE `tb_subject_assessment_timetable`
  MODIFY `subject_assessment_timetable_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_subject_category`
--
ALTER TABLE `tb_subject_category`
  MODIFY `subject_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_time_zone`
--
ALTER TABLE `tb_time_zone`
  MODIFY `time_zone_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_user_additional_details`
--
ALTER TABLE `tb_user_additional_details`
  MODIFY `user_additional_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `tb_user_additional_field`
--
ALTER TABLE `tb_user_additional_field`
  MODIFY `user_additional_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_user_privilege`
--
ALTER TABLE `tb_user_privilege`
  MODIFY `user_privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tb_user_privilege_module`
--
ALTER TABLE `tb_user_privilege_module`
  MODIFY `user_privilege_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;
--
-- AUTO_INCREMENT for table `tb_weekday`
--
ALTER TABLE `tb_weekday`
  MODIFY `weekday_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_weekday_class_period`
--
ALTER TABLE `tb_weekday_class_period`
  MODIFY `weekday_class_period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
