-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2016 at 05:08 PM
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
(3, 1, 1, 'J S S Two A', 'J S S 2 A', 2, 1, '2016-11-30 17:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_basic_subject`
--

CREATE TABLE `tb_class_basic_subject` (
  `class_basic_subject_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(4, 1, 2, 'S S S 2', '2016-11-21 13:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_period`
--

CREATE TABLE `tb_class_period` (
  `class_period_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `class_timing_set_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `is_break` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_class_timing_set`
--

CREATE TABLE `tb_class_timing_set` (
  `class_timing_set_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `tb_employee_grade_level_id` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `student_department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(3, 1, 'Library Staff', NULL, '2016-11-23 17:29:11', '');

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
  `tb_employee_grade_level_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_employee_grade_level`
--

INSERT INTO `tb_employee_grade_level` (`tb_employee_grade_level_id`, `school_id`, `name`, `description`, `date_created`) VALUES
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
(2, 1, 'Cooks', 'Staff that work in the kitchen', '2016-11-23 17:31:14', '0000-00-00 00:00:00', 2);

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
(1, 1, '2016-11-30 12:24:03', 2),
(2, 1, '2016-11-30 12:33:53', 4),
(3, 1, '2016-11-30 12:35:59', 6),
(4, 1, '2016-11-30 17:55:01', 8);

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
(1, 1, 3, 'Third Term', '2016-11-02', '2016-12-30', NULL, '2016-11-21 16:41:40');

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
-- Table structure for table `tb_score_group`
--

CREATE TABLE `tb_score_group` (
  `score_group_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_score_group`
--

INSERT INTO `tb_score_group` (`score_group_id`, `school_id`, `name`, `date_created`) VALUES
(1, 1, 'Default', '2016-11-22 07:58:47'),
(2, 1, 'Practicals', '2016-11-22 08:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `tb_score_group_structure`
--

CREATE TABLE `tb_score_group_structure` (
  `score_group_structure_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `score_group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_score_group_structure`
--

INSERT INTO `tb_score_group_structure` (`score_group_structure_id`, `school_id`, `score_group_id`, `name`, `date_created`, `date_modified`, `description`) VALUES
(1, 1, 1, 'Test 1', '2016-11-22 08:01:18', '0000-00-00 00:00:00', 'First Periodic Test'),
(2, 1, 1, 'Test 2', '2016-11-22 08:01:36', '0000-00-00 00:00:00', 'Second Periodic Test'),
(3, 1, 1, 'Exam', '2016-11-22 08:01:53', '0000-00-00 00:00:00', 'Examination');

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
(1, 1, 1, '2013/2014 Session', '2016-11-01', '2017-12-02', '', '2016-11-21 13:46:33');

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
(1, 1, 1, 1, 'REG-01', '0000-00-00 00:00:00', '2016-11-30 12:24:03', 0, 1, 1, 'Father', 1, 1, 1),
(2, 1, 3, 2, 'REG-02', '0000-00-00 00:00:00', '2016-11-30 12:33:53', 0, 2, 2, 'Father', 1, 1, 1),
(3, 1, 5, 1, 'REG-03', '0000-00-00 00:00:00', '2016-11-30 12:35:59', 0, 1, 3, 'Brother', 1, 1, 1),
(4, 1, 7, 1, 'REG-04', '0000-00-00 00:00:00', '2016-11-30 17:55:02', 0, 1, 4, 'Father', 1, 2, 3);

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
(2, 1, 'Staff Kids', 'Children of staff', '2016-11-29 09:34:10', 'STK');

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
  `credit_unit` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `score_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(8, 'Mr Perri', '', '', '', '', 0, 1, NULL, '0000-00-00 00:00:00', '', NULL, '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_additional_details`
--

CREATE TABLE `tb_user_additional_details` (
  `user_additional_detail_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `user_additional_field_id` int(11) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_additional_details`
--

INSERT INTO `tb_user_additional_details` (`user_additional_detail_id`, `school_id`, `student_id`, `user_additional_field_id`, `value`) VALUES
(1, 1, 1, 1, '7cm'),
(2, 1, 1, 2, 'Group O'),
(3, 1, 1, 4, 'Christianity'),
(4, 1, 1, 5, 'Green'),
(5, 1, 2, 1, '80cm'),
(6, 1, 2, 2, 'Group A'),
(7, 1, 2, 4, 'Islam'),
(8, 1, 2, 5, 'RED'),
(9, 1, 3, 1, '5cm'),
(10, 1, 3, 2, 'O group'),
(11, 1, 3, 4, 'Islam'),
(12, 1, 3, 5, 'Grey'),
(13, 1, 1, 1, '10cm'),
(14, 1, 1, 2, 'Group A'),
(15, 1, 1, 4, 'Christian'),
(16, 1, 1, 5, 'RED'),
(17, 1, 1, 1, '10cm'),
(18, 1, 1, 2, 'Group O'),
(19, 1, 1, 4, 'Christianity'),
(20, 1, 1, 5, 'Red'),
(21, 1, 2, 1, '10cm'),
(22, 1, 2, 2, ''),
(23, 1, 2, 4, 'Christianity'),
(24, 1, 2, 5, ''),
(25, 1, 3, 1, ''),
(26, 1, 3, 2, ''),
(27, 1, 3, 4, ''),
(28, 1, 3, 5, ''),
(29, 1, 4, 1, '20cm'),
(30, 1, 4, 2, 'O'),
(31, 1, 4, 4, 'Hindu'),
(32, 1, 4, 5, 'Green');

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
(2, 1, 'Blood Group', 'The blood group of students', 'student', 0, '2016-11-22 15:01:45'),
(3, 1, 'Bank Name', 'Bank name of all our staff', 'employee', 0, '2016-11-22 15:02:29'),
(4, 1, 'Religion', 'The religion of student', 'student', 0, '2016-11-29 07:20:15'),
(5, 1, 'House Color', 'Student''s house color', 'student', 1, '2016-11-29 07:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_weekday`
--

CREATE TABLE `tb_weekday` (
  `weekday` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_weekday_class_period`
--

CREATE TABLE `tb_weekday_class_period` (
  `weekday_class_period_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `quota_id` int(11) DEFAULT NULL,
  `weekday_id` int(11) DEFAULT NULL,
  `class_timing_id` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
`score_group_structure_id` int(11)
,`school_id` int(11)
,`name` varchar(100)
,`date_created` datetime
,`date_modified` datetime
,`description` varchar(300)
,`score_group_id` int(11)
,`score_group` varchar(30)
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
);

-- --------------------------------------------------------

--
-- Structure for view `vw_class`
--
DROP TABLE IF EXISTS `vw_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_class`  AS  select `tb_class`.`class_id` AS `class_id`,`tb_class`.`school_id` AS `school_id`,`tb_class`.`student_department_id` AS `student_department_id`,`tb_class`.`name` AS `name`,`tb_class`.`code` AS `code`,`tb_class_level`.`class_level_id` AS `level_id`,`tb_class_level`.`name` AS `level_name`,`tb_class`.`date_created` AS `date_created`,`tb_student_department`.`name` AS `department_name`,`tb_student_department`.`code` AS `department_code`,`tb_class_type`.`class_type_id` AS `class_type_id`,`tb_class_type`.`name` AS `class_type` from (((`tb_class` join `tb_student_department` on((`tb_class`.`student_department_id` = `tb_student_department`.`student_department_id`))) join `tb_class_level` on((`tb_class_level`.`class_level_id` = `tb_class`.`class_level_id`))) join `tb_class_type` on((`tb_class_type`.`class_type_id` = `tb_class`.`class_type_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_employee_position`
--
DROP TABLE IF EXISTS `vw_employee_position`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_employee_position`  AS  select `tb_employee_position`.`employee_position_id` AS `employee_position_id`,`tb_employee_position`.`school_id` AS `school_id`,`tb_employee_position`.`name` AS `name`,`tb_employee_position`.`description` AS `description`,`tb_employee_position`.`date_created` AS `date_created`,`tb_employee_position`.`date_modified` AS `date_modified`,`tb_employee_position`.`employee_category_id` AS `employee_category_id`,`tb_employee_category`.`name` AS `category`,`tb_employee_category`.`code` AS `category_code` from (`tb_employee_position` join `tb_employee_category` on((`tb_employee_position`.`employee_category_id` = `tb_employee_category`.`employee_category_id`))) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student`  AS  select `tb_user`.`user_id` AS `user_id`,`tb_user`.`firstname` AS `firstname`,`tb_user`.`lastname` AS `lastname`,`tb_user`.`othernames` AS `othernames`,`tb_user`.`username` AS `username`,`tb_user`.`password` AS `password`,`tb_user`.`is_active` AS `is_active`,`tb_user`.`school_id` AS `school_id`,`tb_user`.`gender` AS `gender`,`tb_user`.`dob` AS `dob`,`tb_user`.`marital_status` AS `marital_status`,`tb_user`.`state_id` AS `state_id`,`tb_user`.`address` AS `address`,`tb_user`.`city` AS `city`,`tb_user`.`phone1` AS `phone1`,`tb_user`.`phone2` AS `phone2`,`tb_user`.`email` AS `email`,`tb_user`.`photo` AS `photo`,`tb_user`.`privilege_id` AS `privilege_id`,`tb_student`.`student_id` AS `student_id`,`tb_student`.`student_department_id` AS `department_id`,`tb_student`.`registration_number` AS `registration_number`,`tb_student`.`admission_date` AS `admission_date`,`tb_student`.`date_created` AS `date_created`,`tb_student`.`batch_id` AS `batch_id`,`tb_student`.`student_category_id` AS `category_id`,`tb_student`.`parent_id` AS `parent_id`,`tb_student`.`parent_relationship` AS `parent_relationship`,`tb_student`.`class_type_id` AS `class_type_id`,`tb_student`.`class_level_id` AS `class_level_id`,`tb_student`.`class_id` AS `class_id`,`vw_class`.`name` AS `class`,`vw_class`.`code` AS `class_code`,`vw_class`.`level_name` AS `level`,`vw_class`.`department_name` AS `department`,`vw_class`.`department_code` AS `department_code`,`vw_class`.`class_type` AS `class_type`,`tb_student_category`.`name` AS `category`,`tb_student_category`.`code` AS `category_code` from (((`tb_user` join `tb_student` on((`tb_user`.`user_id` = `tb_student`.`user_id`))) join `vw_class` on((`tb_student`.`class_id` = `vw_class`.`class_id`))) join `tb_student_category` on((`tb_student_category`.`student_category_id` = `tb_student`.`student_category_id`))) ;

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
  ADD PRIMARY KEY (`tb_employee_grade_level_id`);

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
-- Indexes for table `tb_grade_level_payroll`
--
ALTER TABLE `tb_grade_level_payroll`
  ADD PRIMARY KEY (`tb_grade_level_payroll_id`);

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
-- Indexes for table `tb_score_group`
--
ALTER TABLE `tb_score_group`
  ADD PRIMARY KEY (`score_group_id`);

--
-- Indexes for table `tb_score_group_structure`
--
ALTER TABLE `tb_score_group_structure`
  ADD PRIMARY KEY (`score_group_structure_id`);

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
-- Indexes for table `tb_weekday`
--
ALTER TABLE `tb_weekday`
  ADD PRIMARY KEY (`weekday`);

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
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_class_basic_subject`
--
ALTER TABLE `tb_class_basic_subject`
  MODIFY `class_basic_subject_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_class_level`
--
ALTER TABLE `tb_class_level`
  MODIFY `class_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_class_period`
--
ALTER TABLE `tb_class_period`
  MODIFY `class_period_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_class_timing_set`
--
ALTER TABLE `tb_class_timing_set`
  MODIFY `class_timing_set_id` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `tb_employee_category`
--
ALTER TABLE `tb_employee_category`
  MODIFY `employee_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_employee_department`
--
ALTER TABLE `tb_employee_department`
  MODIFY `employee_department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_employee_grade_level`
--
ALTER TABLE `tb_employee_grade_level`
  MODIFY `tb_employee_grade_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_employee_position`
--
ALTER TABLE `tb_employee_position`
  MODIFY `employee_position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_employee_subject`
--
ALTER TABLE `tb_employee_subject`
  MODIFY `employee_subject_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_grade_level_payroll`
--
ALTER TABLE `tb_grade_level_payroll`
  MODIFY `tb_grade_level_payroll_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_grading_system`
--
ALTER TABLE `tb_grading_system`
  MODIFY `grading_system_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_parent`
--
ALTER TABLE `tb_parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_quota`
--
ALTER TABLE `tb_quota`
  MODIFY `quota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_school`
--
ALTER TABLE `tb_school`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_score_group`
--
ALTER TABLE `tb_score_group`
  MODIFY `score_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_score_group_structure`
--
ALTER TABLE `tb_score_group_structure`
  MODIFY `score_group_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_session`
--
ALTER TABLE `tb_session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_state`
--
ALTER TABLE `tb_state`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `tb_student`
--
ALTER TABLE `tb_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_student_category`
--
ALTER TABLE `tb_student_category`
  MODIFY `student_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_user_additional_details`
--
ALTER TABLE `tb_user_additional_details`
  MODIFY `user_additional_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `tb_user_additional_field`
--
ALTER TABLE `tb_user_additional_field`
  MODIFY `user_additional_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_weekday`
--
ALTER TABLE `tb_weekday`
  MODIFY `weekday` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_weekday_class_period`
--
ALTER TABLE `tb_weekday_class_period`
  MODIFY `weekday_class_period_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
