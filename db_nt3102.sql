-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2023 at 01:04 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(19, '000019', 'Shades', '2023-11-21', NULL, NULL, NULL),
(20, '000020', 'Ballpen', '2023-11-21', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `security`
--

DROP TABLE IF EXISTS `security`;
CREATE TABLE IF NOT EXISTS `security` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('admin','security') DEFAULT 'security',
  `usersign` varchar(50) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `security`
--

INSERT INTO `security` (`UserId`, `username`, `password`, `role`, `usersign`) VALUES
(1, 'admin', 'admin', 'admin', 'Admin SD'),
(2, 'security01', 'security01', 'security', 'Security_G01');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentId` int NOT NULL AUTO_INCREMENT,
  `Sr_code` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`StudentId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentId`, `Sr_code`, `password`) VALUES
(1, '21-36991', '21-36991'),
(2, '21-34511', '21-34511'),
(3, '21-22122', '21-22122'),
(4, '21-00111', '21-00111'),
(5, '21-22322', '21-22322'),
(6, '21-31630', '21-31630'),
(7, '21-34661', '21-34661'),
(8, '21-23411', '21-23411'),
(9, '21-33111', '21-33111');

-- --------------------------------------------------------

--
-- Table structure for table `tbemployee`
--

DROP TABLE IF EXISTS `tbemployee`;
CREATE TABLE IF NOT EXISTS `tbemployee` (
  `empid` int NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentinfo`
--

DROP TABLE IF EXISTS `tb_studentinfo`;
CREATE TABLE IF NOT EXISTS `tb_studentinfo` (
  `studid` int NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
