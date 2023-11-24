-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 24, 2023 at 09:26 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_nt3102`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `EventManager`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EventManager` (IN `eventNameVal` VARCHAR(255), IN `eventDescVal` VARCHAR(255), IN `eventIDVal` INT, IN `eventDateVal` TIMESTAMP, IN `orgIDVal` INT)   BEGIN
	SET @statusID = 1;
    INSERT INTO events (eventID,eventName,eventDesc,e_date,org_ID,statusID) VALUES (eventIDVal,eventNameVal,eventDescVal,evenDateVal,orgIDVal,@statusID);
    SET @eventID = LAST_INSERT_ID();
    SET @superID = orgIDVal;
    INSERT INTO eventrecords(eventID,superID) VALUES ( @eventID, orgIDVal);
END$$

DROP PROCEDURE IF EXISTS `RegisterModerator`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterModerator` (IN `org_namevalue` VARCHAR(255), IN `passwordvalue` VARCHAR(255), IN `usernamevalue` VARCHAR(255), IN `deptIDvalue` INT)   BEGIN
	SET @salt = (SUBSTRING(MD5(RAND()), 1, 10));
    SET @password = SHA2(CONCAT(passwordvalue,@salt),256);
    INSERT INTO superusers (username,password,salt) VALUES (usernamevalue,@password,@salt);
    SET @superID = LAST_INSERT_ID();
    
    INSERT INTO organization (dept_ID,org_name,superID) VALUES ( deptIDvalue, org_namevalue,@superID);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `lost_items`
--

DROP TABLE IF EXISTS `lost_items`;
CREATE TABLE IF NOT EXISTS `lost_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_number` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `date_found` date NOT NULL,
  `date_claimed` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `student_id` (`student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lost_items`
--

INSERT INTO `lost_items` (`id`, `item_number`, `item_name`, `date_found`, `date_claimed`, `user_id`, `student_id`) VALUES
(1, '000001', 'NoteBook', '2023-11-13', '2023-11-20', NULL, NULL),
(2, '000002', 'Iphone Xr ', '2023-11-14', '2023-11-20', NULL, NULL),
(3, '000003', 'Book', '2023-11-21', '2023-11-20', NULL, NULL),
(4, '000004', 'Umbrella', '2023-11-22', '2023-11-20', NULL, NULL),
(5, '000005', 'Mini Fan', '2023-11-23', '2023-11-20', NULL, NULL),
(6, '000006', 'Laptop ', '2023-11-13', '2023-11-20', NULL, NULL),
(7, '000007', 'ID', '2023-11-14', '2023-11-20', NULL, NULL),
(8, '000008', 'Cellphone', '2023-11-14', '2023-11-20', NULL, NULL),
(9, '000009', 'Bag', '2023-11-15', '2023-11-20', NULL, NULL),
(10, '000010', 'ID Lace', '2023-11-16', '2023-11-20', NULL, NULL),
(11, '000011', 'Bottle', '2023-11-17', '2023-11-20', NULL, NULL),
(12, '000012', 'Cellphone', '2023-11-17', '2023-11-20', NULL, NULL),
(13, '000013', 'NoteBook', '2023-11-17', '2023-11-20', NULL, NULL),
(14, '000014', 'Cellphone', '2023-11-21', '2023-11-20', NULL, NULL),
(15, '000015', 'ID Lace', '2023-11-22', '2023-11-20', NULL, NULL),
(16, '000016', 'Shoes', '2023-11-21', '2023-11-20', NULL, NULL),
(17, '000017', 'Ballpen', '2023-11-21', '2023-11-20', NULL, NULL),
(18, '000018', 'Shades', '2023-11-21', '2023-11-20', NULL, NULL),
(19, '000019', 'Shades', '2023-11-21', '2023-11-22', NULL, NULL),
(20, '000020', 'Ballpen', '2023-11-21', NULL, NULL, NULL),
(21, '000021', 'handkerchief', '2023-11-22', NULL, NULL, NULL),
(22, '000022', 'Relo', '2023-11-23', NULL, NULL, NULL),
(23, '000023', 'Charger Cable ', '2023-11-25', NULL, NULL, NULL),
(24, '000024', 'NoteBook', '2023-11-25', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `security_lostnfound`
--

DROP TABLE IF EXISTS `security_lostnfound`;
CREATE TABLE IF NOT EXISTS `security_lostnfound` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('admin','security') DEFAULT 'security',
  `usersign` varchar(50) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=2126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `security_lostnfound`
--

INSERT INTO `security_lostnfound` (`UserId`, `username`, `password`, `role`, `usersign`) VALUES
(1010, 'Admin_Sd', 'adminsd', 'admin', 'Seurity Department'),
(2125, 'jose2125', '2125', 'security', 'Security_G0'),
(2121, 'MarkRyuo', '2121', 'admin', 'Seurity Department');

-- --------------------------------------------------------

--
-- Table structure for table `student_lostnfound`
--

DROP TABLE IF EXISTS `student_lostnfound`;
CREATE TABLE IF NOT EXISTS `student_lostnfound` (
  `StudentId` int NOT NULL AUTO_INCREMENT,
  `Sr_code` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`StudentId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student_lostnfound`
--

INSERT INTO `student_lostnfound` (`StudentId`, `Sr_code`, `password`) VALUES
(1, '21-36991', '21-36991');

-- --------------------------------------------------------

--
-- Table structure for table `tbemployee`
--

DROP TABLE IF EXISTS `tbemployee`;
CREATE TABLE IF NOT EXISTS `tbemployee` (
  `empid` int NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbemployee`
--

INSERT INTO `tbemployee` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1010, 'Admin_Sd', 'Admin_Sd', 'Seurity Department'),
(2125, 'Manabat', 'Jose', 'Seurity Department'),
(2121, 'Ryuo', 'Mark', 'Seurity Department');

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentinfo`
--

DROP TABLE IF EXISTS `tb_studentinfo`;
CREATE TABLE IF NOT EXISTS `tb_studentinfo` (
  `studid` int NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
