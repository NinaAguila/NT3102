-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 01, 2023 at 11:53 AM
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
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `Admin_Id` int NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Admin_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_claim`
--

DROP TABLE IF EXISTS `tbl_claim`;
CREATE TABLE IF NOT EXISTS `tbl_claim` (
  `Claim_Id` int NOT NULL,
  `ClaimDate` date DEFAULT NULL,
  `Item_Number` int DEFAULT NULL,
  PRIMARY KEY (`Claim_Id`),
  KEY `Item_Number` (`Item_Number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_founditem`
--

DROP TABLE IF EXISTS `tbl_founditem`;
CREATE TABLE IF NOT EXISTS `tbl_founditem` (
  `TimeFound` time DEFAULT NULL,
  `DateFound` date DEFAULT NULL,
  `Item_Number` int DEFAULT NULL,
  KEY `Item_Number` (`Item_Number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
CREATE TABLE IF NOT EXISTS `tbl_item` (
  `Item_Number` int NOT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `ActiveInactive` varchar(10) DEFAULT NULL,
  `Admin_Id` int DEFAULT NULL,
  `Security_Id` int DEFAULT NULL,
  `Student_Id` int DEFAULT NULL,
  PRIMARY KEY (`Item_Number`),
  KEY `Admin_Id` (`Admin_Id`),
  KEY `Security_Id` (`Security_Id`),
  KEY `Student_Id` (`Student_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_security`
--

DROP TABLE IF EXISTS `tbl_security`;
CREATE TABLE IF NOT EXISTS `tbl_security` (
  `Security_Id` int NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Security_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

DROP TABLE IF EXISTS `tbl_student`;
CREATE TABLE IF NOT EXISTS `tbl_student` (
  `Student_Id` int NOT NULL,
  `Sr_Code` varchar(10) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Student_Id`)
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

--
-- Dumping data for table `tb_studentinfo`
--

INSERT INTO `tb_studentinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(1, 'parker', 'peter', 'bsit');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
