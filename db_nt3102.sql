-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2023 at 01:30 AM
-- Server version: 8.0.34
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminID` int NOT NULL,
  `adminFN` text,
  `adminLN` text,
  `adminEmailAddress` text,
  `adminPassword` text,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `authorID` int NOT NULL AUTO_INCREMENT,
  `authorFn` text COLLATE utf8mb4_general_ci,
  `authorLn` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`authorID`, `authorFn`, `authorLn`) VALUES
(2, 'Aia', 'Amare'),
(3, 'Fulgur', 'Ovid'),
(4, 'John', 'Doe');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `bookID` int NOT NULL AUTO_INCREMENT,
  `authorID` int DEFAULT NULL,
  `publisherID` int DEFAULT NULL,
  `bookTitle` text COLLATE utf8mb4_general_ci,
  `ISBN` text COLLATE utf8mb4_general_ci,
  `description` longtext COLLATE utf8mb4_general_ci,
  `genre` text COLLATE utf8mb4_general_ci,
  `publishDate` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `goodbook` int NOT NULL,
  `badbook` int NOT NULL,
  PRIMARY KEY (`bookID`),
  KEY `authorID` (`authorID`),
  KEY `publisherID` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookID`, `authorID`, `publisherID`, `bookTitle`, `ISBN`, `description`, `genre`, `publishDate`, `quantity`, `goodbook`, `badbook`) VALUES
(1, 2, 1, 'Dork', '0-2029-2791-1', 'ILUNA Institute of the Mystics 2nd Year.\r\nAn angelic maiden who descended from Heaven to observe mankind.\r\nHer gentle appearance hides a rather mischievous disposition 1', 'Non-Fiction', '2023-01-01', 10, 5, 5),
(2, 3, 2, 'Legatus 404', '0-1260-6478-4', 'A Cyborg from the future with unparalleled strength.\r\nHis body is partly cold steel, and who is to say if he has a heart', 'Fiction', '2023-02-02', 20, 10, 10),
(3, 4, 3, 'though Doe', '0-4319-1393-5', 'A typical AI generated name', 'Comedy', '2023-03-03', 30, 20, 10),
(4, NULL, NULL, 'Flat is justice', '2312314', 'witch', 'Fantasy', '2023-11-23', 1312, 1, 1),
(5, NULL, NULL, 'Flat is justice', '2312314', 'witch', 'Fantasy', '2023-11-10', 2, 3, 4),
(6, 2, NULL, 'Flat is justice', '2312314', 'dawa', 'Fiction', '2023-11-02', 4, 2, 2),
(7, 2, NULL, 'Flat is justice', '2312314', 'dawa', 'Fiction', '2023-11-02', 4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
CREATE TABLE IF NOT EXISTS `librarian` (
  `libID` int NOT NULL AUTO_INCREMENT,
  `libFN` text,
  `libLN` text,
  `librarianEmail` text,
  `librarianPassword` text,
  PRIMARY KEY (`libID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `publisherID` int NOT NULL AUTO_INCREMENT,
  `publisherName` text COLLATE utf8mb4_general_ci,
  `publisherAddress` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisherID`, `publisherName`, `publisherAddress`) VALUES
(1, 'ABC Production', 'Cuenca, Batangas'),
(2, 'Victory', 'Lipa City, Batangas'),
(3, 'Modico', 'Biñan, Laguna');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
CREATE TABLE IF NOT EXISTS `updatelog` (
  `updateID` int NOT NULL AUTO_INCREMENT,
  `action` text COLLATE utf8mb4_general_ci,
  `entityType` text COLLATE utf8mb4_general_ci,
  `entityID` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`updateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisherID`) REFERENCES `publisher` (`publisherID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
