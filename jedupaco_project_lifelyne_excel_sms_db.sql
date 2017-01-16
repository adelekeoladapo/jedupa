-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2017 at 07:41 AM
-- Server version: 10.1.16-MariaDB
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
(24, 1, 1, 2, 2, '2017-01-11 08:43:57'),
(26, 1, 4, 1, 2, '2016-12-28 09:01:56'),
(27, 1, 4, 2, 1, '2016-12-28 09:02:27'),
(29, 1, 1, 6, 2, '2017-01-11 08:27:54'),
(30, 1, 3, 1, 2, '2016-12-30 09:20:11'),
(31, 1, 3, 2, 2, '2016-12-30 09:21:27'),
(32, 1, 3, 3, 2, '2016-12-30 09:21:50'),
(35, 1, 2, 3, 2, '2016-12-30 23:16:36'),
(42, 1, 6, 1, 2, '2016-12-31 23:06:37'),
(43, 1, 1, 3, 2, '2017-01-10 10:44:18'),
(44, 1, 1, 4, 1, '2017-01-10 18:05:54'),
(45, 1, 1, 5, 1, '2017-01-10 18:06:52'),
(46, 1, 2, 5, 1, '2017-01-10 18:07:44'),
(47, 1, 2, 6, 2, '2017-01-10 18:07:56'),
(49, 1, 4, 3, 2, '2017-01-11 06:51:29'),
(50, 1, 4, 4, 1, '2017-01-11 06:52:23'),
(51, 1, 4, 5, 2, '2017-01-11 06:52:55'),
(52, 1, 3, 4, 1, '2017-01-11 06:55:15'),
(53, 1, 3, 5, 1, '2017-01-11 06:55:26'),
(56, 1, 1, 7, 1, '2017-01-11 07:56:14'),
(57, 1, 5, 1, 2, '2017-01-11 09:03:42'),
(58, 1, 5, 2, 2, '2017-01-11 09:04:04'),
(59, 1, 5, 3, 2, '2017-01-11 09:04:10'),
(60, 1, 5, 4, 1, '2017-01-11 09:04:16'),
(61, 1, 5, 5, 1, '2017-01-11 09:04:23'),
(62, 1, 1, 1, 2, '2017-01-11 14:40:35');

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
(2, 1, 'Desig_2', '2017-01-12 18:15:23');

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
(2, 1, 1, 'Second Class Upper', 60, '2017-01-12 18:15:04', '0000-00-00 00:00:00', 'Second Class Upper Students');

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
(7, 1, 2, 'Period 1', '07:00:00', '08:00:00', 0);

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
  `class_basic_subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_class_timetable`
--

INSERT INTO `tb_class_timetable` (`class_timetable_id`, `class_id`, `school_id`, `weekday_id`, `class_period_id`, `class_basic_subject_id`) VALUES
(49, 1, 1, 2, 1, 62),
(50, 1, 1, 3, 1, 62),
(52, 1, 1, 5, 1, 62),
(53, 1, 1, 4, 1, 24),
(54, 1, 1, 2, 2, 24),
(55, 1, 1, 5, 4, 24),
(56, 1, 1, 2, 6, 43),
(58, 1, 1, 2, 4, 44),
(59, 1, 1, 2, 5, 44),
(60, 1, 1, 5, 2, 44),
(63, 1, 1, 3, 4, 43),
(64, 1, 1, 4, 6, 43),
(65, 1, 1, 5, 5, 43),
(66, 1, 1, 6, 7, 29);

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
(2, 1, 'Fridays', NULL, '2016-12-31 00:34:54');

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
  `employee_department_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `employee_position_id` int(11) DEFAULT NULL,
  `date_joined` date DEFAULT NULL,
  `employee_code` varchar(100) DEFAULT NULL,
  `employee_grade_level_id` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `student_department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee`
--

INSERT INTO `tb_employee` (`employee_id`, `school_id`, `user_id`, `employee_department_id`, `employee_category_id`, `employee_position_id`, `date_joined`, `employee_code`, `employee_grade_level_id`, `date_created`, `student_department_id`) VALUES
(1, 1, 21, 2, 2, 2, '2016-12-04', 'EMP-001', 2, '2016-12-06 17:08:59', NULL),
(2, 1, 22, 1, 1, 1, '2016-12-20', 'EMP-002', 3, '2016-12-06 18:48:15', NULL);

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
(1, 1, 1, 1, 'Test 1', 'First Test', 0, 1, '2017-01-13 13:39:41'),
(2, 1, 1, 1, 'Test 2', 'Second Test', 0, 1, '2017-01-13 13:40:09'),
(3, 1, 1, 2, 'First Test', 'First Periodic Test', 0, 1, '2017-01-13 14:14:42'),
(4, 1, 1, 1, 'Exam', 'Examinaion', 0, 1, '2017-01-13 14:21:44'),
(5, 1, 1, 2, 'Second Test', 'Second Periodic Test', 0, 1, '2017-01-13 14:31:09'),
(6, 1, 1, 2, 'Exam', 'Examinaion', 0, 1, '2017-01-13 14:33:27'),
(7, 1, 2, 4, 'C A 1', 'First C A', 0, 1, '2017-01-13 14:37:32'),
(8, 1, 1, 1, 'Test One', 'Test One', 0, 2, '2017-01-13 14:51:57'),
(9, 1, 1, 1, 'Test Two', 'Test Two', 0, 2, '2017-01-13 14:53:38');

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
(3, 1, 'G Level_3', '2017-01-12 15:32:12');

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
(3, 1, 1, 'C', 50, '2017-01-12 16:09:50', '0000-00-00 00:00:00', 'Average');

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
-- Table structure for table `tb_parent`
--

CREATE TABLE `tb_parent` (
  `parent_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_parent`
--

INSERT INTO `tb_parent` (`parent_id`, `school_id`, `date_created`, `user_id`) VALUES
(1, 1, '2016-12-05 13:24:46', 12),
(2, 1, '2016-12-05 14:14:26', 14);

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
  `rc_number` varchar(50) NOT NULL,
  `time_zone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_school`
--

INSERT INTO `tb_school` (`school_id`, `name`, `logo`, `code`, `date_created`, `address1`, `address2`, `phone1`, `phone2`, `status_id`, `country_id`, `state_id`, `language_id`, `auto_gen_student_id`, `email`, `website`, `password`, `auto_gen_employee_id`, `auto_gen_parent_id`, `motto`, `rc_number`, `time_zone_id`) VALUES
(1, 'Oxford College Abuja', 'badge.jpg', 'O C A', '0000-00-00 00:00:00', 'PO Box 80, Area 11, Garki', '', '08020803585', '08102937011', 0, 1, 1, 0, 1, 'info@oxfordcollege.com', 'www.oxfordcollege.com', '', 1, 1, 'Up And On', '', NULL);

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
(1, 1, 11, 1, 'REG-01', '0000-00-00 00:00:00', '2016-12-05 13:24:46', 0, 1, 1, 'Father', 1, 1, 1),
(2, 1, 13, 1, 'REG-02', '0000-00-00 00:00:00', '2016-12-05 14:14:26', 0, 1, 2, 'Father', 1, 1, 2);

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
(1, 'John', 'Doe', 'Plantain', '', '', 0, 1, 'Male', '2016-12-01 00:00:00', '', 6, 'Lagos', 'Lagos', '0802324364', '', 'johndoe@gmail.com', 'passport_photo.jpg', 0),
(2, 'Mr John', '', '', '', '', 0, NULL, NULL, '0000-00-00 00:00:00', '', NULL, 'Lagos', '', '08095775757', '', 'jane@gmail.com', '', 0),
(3, 'Bill', 'Gates', '', '', '', 0, 1, 'Male', '2016-11-15 00:00:00', '', 7, 'Lagos', 'Lagos', '0802324364', '', 'bill@gmail.com', '14725506_10208052812786742_2500313437545856516_n.jpg', 0),
(4, 'Mr Bill', '', '', '', '', 0, NULL, NULL, '0000-00-00 00:00:00', '', NULL, 'Lagos', '', '08095775757', '', 'mary@gmail.com', '', 0),
(5, 'Michael', 'Jackson', '', '', '', 0, 1, 'Male', '2016-12-09 00:00:00', '', 0, '', '', '0802324364', '', '', 'passport_photo1.jpg', 0),
(6, 'Mr John', '', '', '', '', 0, NULL, NULL, '0000-00-00 00:00:00', '', NULL, '', '', '', '', '', '', 0),
(7, 'Christiana', 'Perri', '', '', '', 0, 1, 'Female', '2016-11-09 00:00:00', '', 16, '', 'Lagos', '0802324364', '', 'sundayijeoma001@gmail.com', '', 0),
(8, 'Mr Perri', '', '', '', '', 0, 1, NULL, '0000-00-00 00:00:00', '', NULL, '', '', '', '', '', '', 0),
(9, 'Adeleke', 'Oladapo', 'Philips', '', '', 0, 1, 'Male', '2016-12-23 00:00:00', '', 1, 'Ajah', 'Lagos', '0802324364', '', 'adelekeoladapo@gmail.com', '14725506_10208052812786742_2500313437545856516_n1.jpg', 0),
(10, 'Mr Adeleke', '', '', '', '', 0, 1, NULL, '0000-00-00 00:00:00', '', NULL, '', '', '08095775757', '', 'adeleke@gmail.com', '', 0),
(11, 'Adeleke', 'Oladapo', 'Philips', '', '', 0, 1, 'Male', '2016-12-21 00:00:00', '', 24, 'Lagos', 'Lagos', '0802324364', '', 'adelekeoladapo@gmail.com', '14725506_10208052812786742_2500313437545856516_n2.jpg', 0),
(12, 'Mr Adeleke', '', '', '', '', 0, 1, NULL, '0000-00-00 00:00:00', '', NULL, '', '', '08095775757', '', 'adeleke@gmail.com', '', 0),
(13, 'Mark', 'Zuckerberg', 'Elliot', '', '', 0, 1, 'Male', '2016-12-30 00:00:00', '', 18, 'Daura', 'Daura', '0802324364', '', 'mark@gmail.com', 'passport_photo2.jpg', 0),
(14, 'Mr Zuckerberg Jim', '', '', '', '', 0, 1, NULL, '0000-00-00 00:00:00', '', NULL, 'Somewhere in the U.S', '', '08095775757', '', 'zuckjim@gmail.com', '', 0),
(21, 'Michael', 'Jordan', '', '', '', 0, 1, 'Male', '2016-12-11 00:00:00', '', 10, 'Ikoyi', 'Lagos', '0802324364', '', 'jordan@gmail.com', '10.jpg', 1),
(22, 'James', 'Gosling', 'Mike', '', '', 0, 1, 'Male', '2016-12-23 00:00:00', '', 19, 'Ikoyi', 'Lagos', '0802324364', '', 'jamesgosling@gmail.com', '1018px-James_Gosling_2008.jpg', 1);

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
(11, 1, 22, 3, 'Diamond');

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
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_privilege`
--

INSERT INTO `tb_user_privilege` (`user_privilege_id`, `name`, `description`) VALUES
(1, 'Super Admin', '');

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
(85, 1, 2, 1, 1, '0000-00-00 00:00:00'),
(87, 1, 6, 1, 1, '0000-00-00 00:00:00'),
(88, 1, 6, 2, 1, '0000-00-00 00:00:00');

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
,`class_basic_subject_id` int(11)
,`weekday` varchar(100)
,`class_timing_set_id` int(11)
,`class_period` varchar(100)
,`start_time` time
,`end_time` time
,`is_break` int(11)
,`subject_id` int(11)
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
,`employee_code` varchar(100)
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
-- Stand-in structure for view `vw_score_group_structure`
--
CREATE TABLE `vw_score_group_structure` (
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_class_timetable`  AS  select `tb_class_timetable`.`class_timetable_id` AS `class_timetable_id`,`tb_class_timetable`.`class_id` AS `class_id`,`tb_class_timetable`.`school_id` AS `school_id`,`tb_class_timetable`.`weekday_id` AS `weekday_id`,`tb_class_timetable`.`class_period_id` AS `class_period_id`,`tb_class_timetable`.`class_basic_subject_id` AS `class_basic_subject_id`,`tb_weekday`.`name` AS `weekday`,`tb_class_period`.`class_timing_set_id` AS `class_timing_set_id`,`tb_class_period`.`name` AS `class_period`,`tb_class_period`.`start_time` AS `start_time`,`tb_class_period`.`end_time` AS `end_time`,`tb_class_period`.`is_break` AS `is_break`,`vw_class_basic_subject`.`subject_id` AS `subject_id`,`vw_class_basic_subject`.`subject` AS `subject`,`vw_class_basic_subject`.`teacher` AS `teacher` from (((`tb_class_timetable` join `tb_weekday` on((`tb_class_timetable`.`weekday_id` = `tb_weekday`.`weekday_id`))) join `tb_class_period` on((`tb_class_timetable`.`class_period_id` = `tb_class_period`.`class_period_id`))) join `vw_class_basic_subject` on((`tb_class_timetable`.`class_basic_subject_id` = `vw_class_basic_subject`.`class_basic_subject_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_employee`
--
DROP TABLE IF EXISTS `vw_employee`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_employee`  AS  select `tb_user`.`user_id` AS `user_id`,`tb_user`.`firstname` AS `firstname`,`tb_user`.`lastname` AS `lastname`,`tb_user`.`othernames` AS `othernames`,`tb_user`.`username` AS `username`,`tb_user`.`password` AS `password`,`tb_user`.`is_active` AS `is_active`,`tb_user`.`school_id` AS `school_id`,`tb_user`.`gender` AS `gender`,`tb_user`.`dob` AS `dob`,`tb_user`.`marital_status` AS `marital_status`,`tb_user`.`state_id` AS `state_id`,`tb_user`.`address` AS `address`,`tb_user`.`city` AS `city`,`tb_user`.`phone1` AS `phone1`,`tb_user`.`phone2` AS `phone2`,`tb_user`.`email` AS `email`,`tb_user`.`photo` AS `photo`,`tb_user`.`privilege_id` AS `privilege_id`,`tb_user_privilege`.`name` AS `privilege`,`tb_employee`.`employee_id` AS `employee_id`,`tb_employee`.`employee_department_id` AS `deparment_id`,`tb_employee`.`employee_category_id` AS `category_id`,`tb_employee`.`employee_position_id` AS `position_id`,`tb_employee`.`date_joined` AS `date_joined`,`tb_employee`.`employee_code` AS `employee_code`,`tb_employee`.`employee_grade_level_id` AS `grade_level_id`,`tb_employee_department`.`name` AS `department`,`tb_employee_category`.`name` AS `category`,`tb_employee_position`.`name` AS `position`,`tb_employee_grade_level`.`name` AS `grade_level` from ((((((`tb_user` join `tb_user_privilege` on((`tb_user_privilege`.`user_privilege_id` = `tb_user`.`privilege_id`))) join `tb_employee` on((`tb_employee`.`user_id` = `tb_user`.`user_id`))) join `tb_employee_department` on((`tb_employee_department`.`employee_department_id` = `tb_employee`.`employee_department_id`))) join `tb_employee_category` on((`tb_employee_category`.`employee_category_id` = `tb_employee`.`employee_category_id`))) join `tb_employee_position` on((`tb_employee_position`.`employee_position_id` = `tb_employee`.`employee_position_id`))) join `tb_employee_grade_level` on((`tb_employee_grade_level`.`employee_grade_level_id` = `tb_employee`.`employee_grade_level_id`))) ;

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
-- Structure for view `vw_score_group_structure`
--
DROP TABLE IF EXISTS `vw_score_group_structure`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_score_group_structure`  AS  select `tb_score_group_structure`.`score_group_structure_id` AS `score_group_structure_id`,`tb_score_group_structure`.`school_id` AS `school_id`,`tb_score_group_structure`.`name` AS `name`,`tb_score_group_structure`.`date_created` AS `date_created`,`tb_score_group_structure`.`date_modified` AS `date_modified`,`tb_score_group_structure`.`description` AS `description`,`tb_score_group`.`score_group_id` AS `score_group_id`,`tb_score_group`.`name` AS `score_group` from (`tb_score_group_structure` join `tb_score_group`) where (`tb_score_group_structure`.`score_group_id` = `tb_score_group`.`score_group_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_student`
--
DROP TABLE IF EXISTS `vw_student`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student`  AS  select `tb_user`.`user_id` AS `user_id`,`tb_user`.`firstname` AS `firstname`,`tb_user`.`lastname` AS `lastname`,`tb_user`.`othernames` AS `othernames`,`tb_user`.`username` AS `username`,`tb_user`.`password` AS `password`,`tb_user`.`is_active` AS `is_active`,`tb_user`.`school_id` AS `school_id`,`tb_user`.`gender` AS `gender`,`tb_user`.`dob` AS `dob`,`tb_user`.`marital_status` AS `marital_status`,`tb_user`.`state_id` AS `state_id`,`tb_user`.`address` AS `address`,`tb_user`.`city` AS `city`,`tb_user`.`phone1` AS `phone1`,`tb_user`.`phone2` AS `phone2`,`tb_user`.`email` AS `email`,`tb_user`.`photo` AS `photo`,`tb_user`.`privilege_id` AS `privilege_id`,`tb_student`.`student_id` AS `student_id`,`tb_student`.`student_department_id` AS `department_id`,`tb_student`.`registration_number` AS `registration_number`,`tb_student`.`admission_date` AS `admission_date`,`tb_student`.`date_created` AS `date_created`,`tb_student`.`batch_id` AS `batch_id`,`tb_student`.`student_category_id` AS `category_id`,`tb_student`.`parent_id` AS `parent_id`,`tb_student`.`parent_relationship` AS `parent_relationship`,`tb_student`.`class_type_id` AS `class_type_id`,`tb_student`.`class_level_id` AS `class_level_id`,`tb_student`.`class_id` AS `class_id`,`vw_class`.`name` AS `class`,`vw_class`.`code` AS `class_code`,`vw_class`.`level_name` AS `level`,`vw_class`.`department_name` AS `department`,`vw_class`.`department_code` AS `department_code`,`vw_class`.`class_type` AS `class_type`,`tb_student_category`.`name` AS `category`,`tb_student_category`.`code` AS `category_code`,`tb_state`.`name` AS `state`,`vw_parent`.`fullname` AS `parent_name`,`vw_parent`.`username` AS `parent_username`,`vw_parent`.`address` AS `parent_address`,`vw_parent`.`city` AS `parent_city`,`vw_parent`.`phone1` AS `parent_phone1`,`vw_parent`.`phone2` AS `parent_phone2`,`vw_parent`.`email` AS `parent_email`,`vw_parent`.`photo` AS `parent_photo` from (((((`tb_user` join `tb_student` on((`tb_user`.`user_id` = `tb_student`.`user_id`))) join `vw_class` on((`tb_student`.`class_id` = `vw_class`.`class_id`))) join `tb_student_category` on((`tb_student_category`.`student_category_id` = `tb_student`.`student_category_id`))) join `tb_state` on((`tb_user`.`state_id` = `tb_state`.`id`))) join `vw_parent` on((`tb_student`.`parent_id` = `vw_parent`.`parent_id`))) ;

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
  MODIFY `class_basic_subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `tb_class_designation`
--
ALTER TABLE `tb_class_designation`
  MODIFY `class_designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_class_designation_structure`
--
ALTER TABLE `tb_class_designation_structure`
  MODIFY `class_designation_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_class_level`
--
ALTER TABLE `tb_class_level`
  MODIFY `class_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_class_period`
--
ALTER TABLE `tb_class_period`
  MODIFY `class_period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_class_timetable`
--
ALTER TABLE `tb_class_timetable`
  MODIFY `class_timetable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `tb_class_timing_set`
--
ALTER TABLE `tb_class_timing_set`
  MODIFY `class_timing_set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `examination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_grade_level_payroll`
--
ALTER TABLE `tb_grade_level_payroll`
  MODIFY `tb_grade_level_payroll_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_grading_level`
--
ALTER TABLE `tb_grading_level`
  MODIFY `grading_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_grading_level_structure`
--
ALTER TABLE `tb_grading_level_structure`
  MODIFY `tb_grading_level_structure_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_grading_system`
--
ALTER TABLE `tb_grading_system`
  MODIFY `grading_system_id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tb_user_additional_details`
--
ALTER TABLE `tb_user_additional_details`
  MODIFY `user_additional_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tb_user_additional_field`
--
ALTER TABLE `tb_user_additional_field`
  MODIFY `user_additional_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_user_privilege`
--
ALTER TABLE `tb_user_privilege`
  MODIFY `user_privilege_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_weekday`
--
ALTER TABLE `tb_weekday`
  MODIFY `weekday_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_weekday_class_period`
--
ALTER TABLE `tb_weekday_class_period`
  MODIFY `weekday_class_period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
