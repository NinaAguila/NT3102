-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 25, 2023 at 05:16 AM
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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `administratorID` int NOT NULL,
  `empid` int NOT NULL,
  `administratorPassword` text,
  PRIMARY KEY (`administratorID`),
  KEY `fk_empid` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`administratorID`, `empid`, `administratorPassword`) VALUES
(1, 1001, 'password1'),
(2, 1002, 'password2'),
(3, 1003, 'password3');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_tbl`
--

DROP TABLE IF EXISTS `attendance_tbl`;
CREATE TABLE IF NOT EXISTS `attendance_tbl` (
  `AttendanceID` int NOT NULL AUTO_INCREMENT,
  `FacultyID` int NOT NULL,
  `studid` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `AttendanceDate` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ClassSection` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Room` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TimeStart` time(6) NOT NULL,
  `TimeEnd` time(6) NOT NULL,
  PRIMARY KEY (`AttendanceID`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `attendance_tbl`
--

INSERT INTO `attendance_tbl` (`AttendanceID`, `FacultyID`, `studid`, `AttendanceDate`, `ClassSection`, `Room`, `TimeStart`, `TimeEnd`) VALUES
(31, 1, '3', '2023-11-25', 'BSCS-NT-1102', 'HEB 402', '12:00:00.000000', '16:00:00.000000'),
(32, 1, '1', '2023-11-25', 'BSCS-NT-1102', 'HEB 402', '12:00:00.000000', '16:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `authorID` int NOT NULL AUTO_INCREMENT,
  `authorFn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `authorLn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`authorID`, `authorFn`, `authorLn`) VALUES
(1, 'Aia', 'Amare'),
(2, 'Fulgur', 'Ovid'),
(3, 'John', 'Doe'),
(4, 'Milie', 'Parfait'),
(5, 'Johns', 'Doe'),
(6, 'John', 'Doo'),
(7, 'millie', 'Parfait'),
(8, 'Enna', 'alouette');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `bookID` int NOT NULL AUTO_INCREMENT,
  `authorID` int DEFAULT NULL,
  `publisherID` int DEFAULT NULL,
  `bookTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ISBN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `genre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `publishDate` date DEFAULT NULL,
  PRIMARY KEY (`bookID`),
  KEY `authorID` (`authorID`),
  KEY `publisherID` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookID`, `authorID`, `publisherID`, `bookTitle`, `ISBN`, `description`, `genre`, `publishDate`) VALUES
(1, 2, 1, 'Dork', '0-2029-2791-1', 'ILUNA Institute of the Mystics 2nd Year. An angelic maiden who descended from Heaven to observe mankind. Her gentle appearance hides a rather mischievous disposition 1', 'Non-Fiction', '2023-01-01'),
(2, 3, 2, 'Legatus 404', '0-1260-6478-4', 'A Cyborg from the future with unparalleled strength. His body is partly cold steel, and who is to say if he has a heart', 'Fiction', '2023-02-02'),
(3, 4, 3, 'though Doe', '0-4319-1393-5', 'A typical AI generated name', 'Comedy', '2023-03-03'),
(5, 6, 1, 'Flat is justice', '32141', 'A monster cat creeping through hell. A bit aggressive, but maybe she just needs some attention.[1]', 'Fantasy', '2023-01-01'),
(8, 8, 3, 'Song Bird', '2432', 'A blue bird fluttering in the heavens. She sings a love song for the souls of the living', 'Fantasy', '2023-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_tbl`
--

DROP TABLE IF EXISTS `faculty_tbl`;
CREATE TABLE IF NOT EXISTS `faculty_tbl` (
  `FacultyID` int NOT NULL AUTO_INCREMENT,
  `empid` int NOT NULL,
  `FacultyUsername` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `FacultyPassword` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`FacultyID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `faculty_tbl`
--

INSERT INTO `faculty_tbl` (`FacultyID`, `empid`, `FacultyUsername`, `FacultyPassword`) VALUES
(1, 1, 'Jennifer Reyes', 'jenniferreyes123');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
CREATE TABLE IF NOT EXISTS `librarian` (
  `libID` int NOT NULL AUTO_INCREMENT,
  `empid` int NOT NULL,
  `librarianPassword` varchar(25) NOT NULL,
  PRIMARY KEY (`libID`),
  KEY `fk_empid_librarian` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`libID`, `empid`, `librarianPassword`) VALUES
(4, 1004, 'password4'),
(5, 1005, 'password5'),
(6, 1006, 'password6');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `publisherID` int NOT NULL AUTO_INCREMENT,
  `publisherName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `publisherAddress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisherID`, `publisherName`, `publisherAddress`) VALUES
(1, 'ABC Production', 'Cuenca, Batangas'),
(2, 'Victory', 'Lipa City, Batangas'),
(3, 'Modico', 'BiÃ±an, Laguna'),
(4, 'City Publishers', '321 Maple St, City4, Country'),
(5, 'Metro Print House', '555 Pine St, City5, Country'),
(6, 'Sunny Publications', '777 Cedar St, City6, Country'),
(7, 'Valley Books', '999 Birch St, City7, Country'),
(8, 'Summit Press', '234 Spruce St, City8, Country'),
(9, 'Harbor Publishing', '876 Fir St, City9, Country'),
(10, 'Meadow Books Inc', '543 Redwood St, City10, Country');

-- --------------------------------------------------------

--
-- Table structure for table `student_tbl`
--

DROP TABLE IF EXISTS `student_tbl`;
CREATE TABLE IF NOT EXISTS `student_tbl` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `studid` int NOT NULL,
  `StudentQR` varchar(300) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `student_tbl`
--

INSERT INTO `student_tbl` (`StudentID`, `studid`, `StudentQR`) VALUES
(1, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzcmNvZGUiOiIyMS0zNjk5OSIsImZ1bGxuYW1lIjoiVkFMREVaLCBGUllBTiBBVVJJQyBMLiIsInRpbWVzdGFtcCI6IjIwMjMtMTEtMTYgMjI6MDA6MTUiLCJ0eXBlIjoiU1RVREVOVCIsInVzZXJpZCI6IjIxLTM2OTk5In0.Zvx0BjtFexJ1dKbr295nGIUDCA9vZ44yqmdoBBw7rfc'),
(2, 2, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzcmNvZGUiOiIyMS0zNjQ1MiIsImZ1bGxuYW1lIjoiQkFZQkFZLCBFTU1BTlVFTCBULiIsInRpbWVzdGFtcCI6IjIwMjMtMTEtMjQgMTY6NDE6NDAiLCJ0eXBlIjoiU1RVREVOVCIsInVzZXJpZCI6IjIxLTM2NDUyIn0.PJOlVBipbUwubXYYsoC2leHBinMpTBces1s3VkQUGNE'),
(3, 3, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzcmNvZGUiOiIyMS0zNjExMSIsImZ1bGxuYW1lIjoiTEFUT1JSRSwgSk9ITiBBRVJPTiBELiIsInRpbWVzdGFtcCI6IjIwMjMtMTEtMTYgMjE6NTA6MDQiLCJ0eXBlIjoiU1RVREVOVCIsInVzZXJpZCI6IjIxLTM2MTExIn0.qVMtyeO9V_qiWnM9lJe8fNT9NnZPaAYVDTFgdyAstYo');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbemployee`
--

INSERT INTO `tbemployee` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1, 'Reyes', 'Jennifer', 'BSIT'),
(1001, 'Dela Cruz', 'Juan', 'BSIT'),
(1002, 'Santos', 'Maria', 'BSCS'),
(1003, 'Reyes', 'Pedro', 'BSIS'),
(1004, 'Doe', 'John', 'Librarian'),
(1005, 'Smith', 'Jane', 'Librarian'),
(1006, 'Johnson', 'Bob', 'Librarian');

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentinfo`
--

DROP TABLE IF EXISTS `tb_studentinfo`;
CREATE TABLE IF NOT EXISTS `tb_studentinfo` (
  `studid` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
CREATE TABLE IF NOT EXISTS `updatelog` (
  `updateID` int NOT NULL AUTO_INCREMENT,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `entityType` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `entityID` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`updateID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `updatelog`
--

INSERT INTO `updatelog` (`updateID`, `action`, `entityType`, `entityID`, `timestamp`) VALUES
(1, 'Delete', 'Staff', 1, '2023-11-24 13:52:26'),
(2, 'Delete', 'User', 2, '2023-11-24 13:57:34'),
(3, 'ADD', 'Staff', 3, '2023-11-24 13:57:34'),
(4, 'Delete', 'User', 4, '2023-11-24 13:57:34'),
(5, 'ADD', 'User', 5, '2023-11-24 13:57:34'),
(6, 'ADD', 'Staff', 6, '2023-11-24 13:57:34'),
(7, 'Delete', 'User', 7, '2023-11-24 13:57:34'),
(8, 'Delete', 'Staff', 8, '2023-11-24 13:57:34'),
(9, 'Add', 'Staff', 9, '2023-11-24 13:57:34'),
(10, 'Delete', 'Staff', 10, '2023-11-24 13:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `usere`
--

DROP TABLE IF EXISTS `usere`;
CREATE TABLE IF NOT EXISTS `usere` (
  `UserEID` int NOT NULL AUTO_INCREMENT,
  `empid` int NOT NULL,
  `UserE_password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`UserEID`),
  KEY `fk_empid` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserSID` int NOT NULL AUTO_INCREMENT,
  `SR-Code` int NOT NULL,
  `UserS_password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`UserSID`),
  KEY `fk_studid` (`SR-Code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `fk_empid` FOREIGN KEY (`empid`) REFERENCES `tbemployee` (`empid`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisherID`) REFERENCES `publisher` (`publisherID`);

--
-- Constraints for table `librarian`
--
ALTER TABLE `librarian`
  ADD CONSTRAINT `fk_empid_librarian` FOREIGN KEY (`empid`) REFERENCES `tbemployee` (`empid`);

--
-- Constraints for table `usere`
--
ALTER TABLE `usere`
  ADD CONSTRAINT `fk_empid_usere` FOREIGN KEY (`empid`) REFERENCES `tbemployee` (`empid`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_studid` FOREIGN KEY (`SR-Code`) REFERENCES `tb_studentinfo` (`studid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
