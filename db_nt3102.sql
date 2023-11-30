-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 22, 2023 at 03:05 AM
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
CREATE DATABASE IF NOT EXISTS `db_nt3102` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_nt3102`;

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
-- Stand-in structure for view `atendees_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `atendees_view`;
CREATE TABLE IF NOT EXISTS `atendees_view` (
`attendeeID` int
,`courseID` int
,`courseName` text
,`DateRegistered` timestamp
,`department_Name` varchar(100)
,`dept_ID` int
,`e_date` datetime
,`event_deptid` int
,`eventDesc` varchar(50)
,`eventID` int
,`eventName` varchar(50)
,`firstName` varchar(25)
,`lastName` varchar(25)
,`org_ID` int
,`org_Name` varchar(255)
,`password` varchar(255)
,`salt` varchar(10)
,`section` varchar(250)
,`sr_code` varchar(250)
,`status` varchar(255)
,`statusID` int
,`stud_dept` varchar(100)
,`stud_deptid` int
,`userID` int
,`year` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseID` int NOT NULL AUTO_INCREMENT,
  `courseName` text NOT NULL,
  `dept_ID` int NOT NULL,
  PRIMARY KEY (`courseID`),
  KEY `dept_ID` (`dept_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `courseName`, `dept_ID`) VALUES
(1, 'Bachelor of Science in Business Administration', 1),
(2, 'Bachelor of Science in Management Accounting', 1),
(3, 'Bachelor of Science in Psychology', 2),
(4, 'Bachelor of Arts in Communication', 2),
(5, 'Bachelor of Industrial Technology', 3),
(6, 'Bachelor of Science in Information Technology', 4),
(7, 'Bachelor of Science in Computer Science', 4),
(8, 'Bachelor of Secondary Education', 5),
(9, 'Bachelor of Science in Industrial Engineering ', 6);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dept_ID` int NOT NULL AUTO_INCREMENT,
  `department_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`dept_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_ID`, `department_Name`) VALUES
(0, 'General Department'),
(1, 'CABEIHM'),
(2, 'CAS'),
(3, 'CIT'),
(4, 'CICS'),
(5, 'CTE'),
(6, 'CE');

-- --------------------------------------------------------

--
-- Table structure for table `eventattendees`
--

DROP TABLE IF EXISTS `eventattendees`;
CREATE TABLE IF NOT EXISTS `eventattendees` (
  `attendeeID` int NOT NULL,
  `eventID` int NOT NULL,
  `sr_code` varchar(11) NOT NULL,
  `DateRegistered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eventattendees`
--

INSERT INTO `eventattendees` (`attendeeID`, `eventID`, `sr_code`, `DateRegistered`) VALUES
(1, 1, '21-33273', '2023-11-20 01:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `eventrecords`
--

DROP TABLE IF EXISTS `eventrecords`;
CREATE TABLE IF NOT EXISTS `eventrecords` (
  `recordID` int NOT NULL AUTO_INCREMENT,
  `eventID` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) NOT NULL,
  `superID` int NOT NULL,
  PRIMARY KEY (`recordID`),
  KEY `superID` (`superID`),
  KEY `statusID` (`eventID`(250)),
  KEY `fk_eventID` (`eventID`(250))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eventrecords`
--

INSERT INTO `eventrecords` (`recordID`, `eventID`, `remarks`, `superID`) VALUES
(1, '1', 'NA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `eventID` int NOT NULL AUTO_INCREMENT,
  `eventName` varchar(50) NOT NULL,
  `eventDesc` varchar(50) NOT NULL,
  `org_ID` int NOT NULL,
  `statusID` int NOT NULL,
  `e_date` datetime NOT NULL,
  PRIMARY KEY (`eventID`),
  KEY `org_ID` (`org_ID`),
  KEY `statusID` (`statusID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventID`, `eventName`, `eventDesc`, `org_ID`, `statusID`, `e_date`) VALUES
(1, 'sample', 'sample', 1, 1, '2023-11-19 09:32:12'),
(2, 'sample2', 'sample3', 1, 1, '2023-11-19 13:44:43');

-- --------------------------------------------------------

--
-- Table structure for table `eventstatus`
--

DROP TABLE IF EXISTS `eventstatus`;
CREATE TABLE IF NOT EXISTS `eventstatus` (
  `statusID` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eventstatus`
--

INSERT INTO `eventstatus` (`statusID`, `status`) VALUES
(1, 'Pending'),
(2, 'Approved'),
(3, 'Cancelled');

-- --------------------------------------------------------

--
-- Stand-in structure for view `event_info`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `event_info`;
CREATE TABLE IF NOT EXISTS `event_info` (
`department_Name` varchar(100)
,`dept_ID` int
,`e_date` datetime
,`eventDesc` varchar(50)
,`eventID` int
,`eventName` varchar(50)
,`org_ID` int
,`org_Name` varchar(255)
,`status` varchar(255)
,`statusID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `moderators`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `moderators`;
CREATE TABLE IF NOT EXISTS `moderators` (
`org_Name` varchar(255)
,`superID` int
,`username` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
CREATE TABLE IF NOT EXISTS `organization` (
  `org_ID` int NOT NULL AUTO_INCREMENT,
  `dept_ID` int NOT NULL,
  `org_Name` varchar(255) NOT NULL,
  `superID` int NOT NULL,
  PRIMARY KEY (`org_ID`),
  KEY `superID` (`superID`),
  KEY `dept_ID` (`dept_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`org_ID`, `dept_ID`, `org_Name`, `superID`) VALUES
(1, 1, 'Junior Philippine Association of Management Accountants', 1),
(2, 1, 'Junior Marketing Executives', 2),
(3, 1, 'College of Accountancy, Business and Economics Council', 3),
(4, 1, 'Public Administration Student Association', 4),
(5, 1, 'Association Of Operation Management Students', 5),
(6, 1, 'Young People Management Association of the Philippines', 6),
(7, 2, 'Association of College of Arts and Sciences Students', 7),
(8, 2, 'Circle of Psychology Students', 8),
(9, 2, 'Poderoso Communicador Sociedad', 9),
(10, 3, 'Alliance of Industrial Technology Students', 10),
(11, 3, 'CTRL+A', 11),
(12, 4, 'Junior Philippine Computer Society - Lipa Chapter', 12),
(13, 4, 'Tech Innovators Society', 13),
(14, 5, 'Aspiring Future Educators Guild', 14),
(15, 5, 'Language Educators Association', 15),
(16, 6, 'Junior Philippine Institute of Industrial Engineers', 16),
(17, 0, 'Red Spartan Sports Council', 17),
(18, 0, 'Supreme Student Council Lipa Campus', 18);

-- --------------------------------------------------------

--
-- Stand-in structure for view `studentinfoview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `studentinfoview`;
CREATE TABLE IF NOT EXISTS `studentinfoview` (
`courseID` int
,`courseName` text
,`department_Name` varchar(100)
,`dept_ID` int
,`firstName` varchar(25)
,`lastName` varchar(25)
,`password` varchar(255)
,`salt` varchar(10)
,`section` varchar(250)
,`sr_code` varchar(250)
,`userID` int
,`year` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `sr_code` varchar(250) NOT NULL,
  `courseID` int NOT NULL,
  `year` varchar(255) NOT NULL,
  `section` varchar(250) NOT NULL,
  `stud_id` int NOT NULL,
  PRIMARY KEY (`sr_code`),
  KEY `courseID` (`courseID`),
  KEY `stud_id` (`stud_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Table structure for table `superusers`
--

DROP TABLE IF EXISTS `superusers`;
CREATE TABLE IF NOT EXISTS `superusers` (
  `superID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(10) NOT NULL,
  PRIMARY KEY (`superID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `superusers`
--

INSERT INTO `superusers` (`superID`, `userName`, `password`, `salt`) VALUES
(0, 'adminval', '95e1d817e753fe6392b68de89c337e4cbcf63d280e77245d5c7a3fc4938863d9', 'kckKVzx9k1'),
(1, 'JPAMA', '3913342ed7e247f86dc7bf83229b90a0cec7d8f7f9a6851927f7becc7fec9035', 'b79dc59cf1'),
(2, 'JME', '18d7d94a8343f46b943d963da0d1b8bb42520ba84d4329280be02e5c542a9ee4', 'fc39983032'),
(3, 'CABE Council', '423a577e2d08ee38ad7969840840efd3ebc0adde65ccce896eb93c3d2c491fc8', '02eb527701');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_tbl`
--

CREATE TABLE `attendance_tbl` (
  `AttendanceID` int(11) NOT NULL,
  `studid` varchar(25) NOT NULL,
  `AttendanceDate` varchar(25) NOT NULL,
  `ClassSection` varchar(25) NOT NULL,
  `Room` varchar(25) NOT NULL,
  `TimeStart` time(6) NOT NULL,
  `TimeEnd` time(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance_tbl`
--

INSERT INTO `attendance_tbl` (`AttendanceID`, `studid`, `AttendanceDate`, `ClassSection`, `Room`, `TimeStart`, `TimeEnd`) VALUES
(1, '3', '2023-11-02', 'BSIT-NT-3102', 'CECS 503', '08:00:00.000000', '11:00:00.000000'),
(2, '2', '2023-11-02', 'BSIT-NT-3102', 'CECS 503', '08:00:00.000000', '11:00:00.000000'),
(3, '1', '2023-11-02', 'BSIT-NT-3102', 'CECS 503', '08:00:00.000000', '11:00:00.000000'),
(4, '3', '2023-11-04', 'BSIT-NT-3102', 'HEB 502', '12:00:00.000000', '16:00:00.000000'),
(11, '1', '2023-11-17', 'BSIT-NT-1104', 'CECS 301', '08:00:00.000000', '12:00:00.000000'),
(10, '3', '2023-11-17', 'BSCS-NT-1102', 'HEB 402', '12:00:00.000000', '16:00:00.000000'),
(14, '4', '2023-11-24', 'BSCS-NT-1102', 'HEB 402', '12:00:00.000000', '16:00:00.000000'),
(15, '5', '2023-11-24', 'BSCS-NT-1102', 'HEB 402', '12:00:00.000000', '16:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_tbl`
--

CREATE TABLE `faculty_tbl` (
  `FacultyID` int(11) NOT NULL,
  `FacultyUsername` varchar(25) NOT NULL,
  `FacultyPassword` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faculty_tbl`
--

INSERT INTO `faculty_tbl` (`FacultyID`, `FacultyUsername`, `FacultyPassword`) VALUES
(1, 'BSU_admin123!', 'adminAccess123BSU');

-- --------------------------------------------------------

--
-- Table structure for table `student_tbl`
--

CREATE TABLE `student_tbl` (
  `StudentID` int(11) NOT NULL,
  `studid` int(11) NOT NULL,
  `StudentQR` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_tbl`
--

INSERT INTO `student_tbl` (`StudentID`, `studid`, `StudentQR`) VALUES
(1, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzcmNvZGUiOiIyMS0zNjk5OSIsImZ1bGxuYW1lIjoiVkFMREVaLCBGUllBTiBBVVJJQyBMLiIsInRpbWVzdGFtcCI6IjIwMjMtMTEtMTYgMjI6MDA6MTUiLCJ0eXBlIjoiU1RVREVOVCIsInVzZXJpZCI6IjIxLTM2OTk5In0.Zvx0BjtFexJ1dKbr295nGIUDCA9vZ44yqmdoBBw7rfc'),
(2, 2, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzcmNvZGUiOiIyMS0zNjQ1MiIsImZ1bGxuYW1lIjoiQkFZQkFZLCBFTU1BTlVFTCBULiIsInRpbWVzdGFtcCI6IjIwMjMtMTEtMTYgMTk6MDE6MDYiLCJ0eXBlIjoiU1RVREVOVCIsInVzZXJpZCI6IjIxLTM2NDUyIn0.rXk1EvJwCKX0S1Lw9OpjZV7onA0Nzmj1VpXwPYTZgBE'),
(3, 3, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzcmNvZGUiOiIyMS0zNjExMSIsImZ1bGxuYW1lIjoiTEFUT1JSRSwgSk9ITiBBRVJPTiBELiIsInRpbWVzdGFtcCI6IjIwMjMtMTEtMTYgMjE6NTA6MDQiLCJ0eXBlIjoiU1RVREVOVCIsInVzZXJpZCI6IjIxLTM2MTExIn0.qVMtyeO9V_qiWnM9lJe8fNT9NnZPaAYVDTFgdyAstYo');

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

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `adminFN`, `adminLN`, `adminEmailAddress`, `adminPassword`) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', 'password1'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', 'password2'),
(3, 'Bob', 'Johnson', 'bob.johnson@email.com', 'password3'),
(4, 'Alice', 'Williams', 'alice.williams@email.com', 'password4'),
(5, 'Charlie', 'Brown', 'charlie.brown@email.com', 'password5'),
(6, 'Eva', 'Davis', 'eva.davis@email.com', 'password6'),
(7, 'Frank', 'Taylor', 'frank.taylor@email.com', 'password7'),
(8, 'Grace', 'Moore', 'grace.moore@email.com', 'password8'),
(9, 'Henry', 'Clark', 'henry.clark@email.com', 'password9'),
(10, 'Ivy', 'Anderson', 'ivy.anderson@email.com', 'password10');

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
(2, 'Aia', 'Amare'),
(3, 'Fulgur', 'Ovid'),
(4, 'John', 'Doe'),
(5, 'Milie', 'Parfait'),
(6, 'Johns', 'Doe'),
(7, 'John', 'Doo'),
(8, 'millie', 'Parfait'),
(9, 'Enna', 'alouette');

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
  `quantity` int DEFAULT NULL,
  `goodbook` int NOT NULL,
  `badbook` int NOT NULL,
  PRIMARY KEY (`bookID`),
  KEY `authorID` (`authorID`),
  KEY `publisherID` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookID`, `authorID`, `publisherID`, `bookTitle`, `ISBN`, `description`, `genre`, `publishDate`, `quantity`, `goodbook`, `badbook`) VALUES
(1, 2, 1, 'Dork', '0-2029-2791-1', 'ILUNA Institute of the Mystics 2nd Year.\r\nAn angelic maiden who descended from Heaven to observe mankind.\r\nHer gentle appearance hides a rather mischievous disposition 1', 'Non-Fiction', '2023-01-01', 10, 5, 5),
(2, 3, 2, 'Legatus 404', '0-1260-6478-4', 'A Cyborg from the future with unparalleled strength.\r\nHis body is partly cold steel, and who is to say if he has a heart', 'Fiction', '2023-02-02', 20, 10, 10),
(3, 4, 3, 'though Doe', '0-4319-1393-5', 'A typical AI generated name', 'Comedy', '2023-03-03', 30, 20, 10),
(6, 6, 1, 'Flat is justice', '32141', 'A monster cat creeping through hell. A bit aggressive, but maybe she just needs some attention.[1]', 'Fantasy', '2023-11-21', 6, 2, 4),
(8, 8, 3, 'Song Bird', '2432', 'A blue bird fluttering in the heavens. She sings a love song for the souls of the living', 'Fantasy', '2023-11-01', 10, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
CREATE TABLE IF NOT EXISTS `librarian` (
  `libID` int NOT NULL AUTO_INCREMENT,
  `libFN` varchar(25) NOT NULL,
  `libLN` varchar(25) NOT NULL,
  `librarianPassword` varchar(25) NOT NULL,
  PRIMARY KEY (`libID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`libID`, `libFN`, `libLN`, `librarianPassword`) VALUES
(101, 'Sarah', 'Miller', 'librarianpass1'),
(102, 'David', 'Jones', 'librarianpass2'),
(103, 'Emily', 'White', 'librarianpass3'),
(104, 'Mark', 'Johnson', 'librarianpass4'),
(105, 'Linda', 'Taylor', 'librarianpass5'),
(106, 'Brian', 'Smith', 'librarianpass6'),
(107, 'Catherine', 'Brown', 'librarianpass7'),
(108, 'Daniel', 'Clark', 'librarianpass8'),
(109, 'Olivia', 'Davis', 'librarianpass9'),
(110, 'Peter', 'Wilson', 'librarianpass10');

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
(3, 'Modico', 'Biñan, Laguna'),
(4, 'City Publishers', '321 Maple St, City4, Country'),
(5, 'Metro Print House', '555 Pine St, City5, Country'),
(6, 'Sunny Publications', '777 Cedar St, City6, Country'),
(7, 'Valley Books', '999 Birch St, City7, Country'),
(8, 'Summit Press', '234 Spruce St, City8, Country'),
(9, 'Harbor Publishing', '876 Fir St, City9, Country'),
(10, 'Meadow Books Inc', '543 Redwood St, City10, Country');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbemployee`
--
INSERT INTO `tbemployee` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1001, 'Dela Cruz', 'Juan', 'BSIT'),
(1002, 'Santos', 'Maria', 'BSCS'),
(1003, 'Reyes', 'Pedro', 'BSIS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentinfo`
--

DROP TABLE IF EXISTS `tb_studentinfo`;
CREATE TABLE IF NOT EXISTS `tb_studentinfo` (
  `studid` int(11) AUTO_INCREMENT NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- --------------------------------------------------------

--
-- Table structure for table `userstudents`
--

DROP TABLE IF EXISTS `userstudents`;
CREATE TABLE IF NOT EXISTS `userstudents` (
  `userID` int AUTO_INCREMENT NOT NULL,
  `sr_code` varchar(250) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(10) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `sr_code` (`sr_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userstudents`
--

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

--
-- Dumping data for table `usere`
--

INSERT INTO `usere` (`UserEID`, `empid`, `UserE_password`) VALUES
(4, 1001, 'Emp'),
(5, 1002, 'EMp'),
(6, 1003, 'emP');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserSID` int NOT NULL AUTO_INCREMENT,
  `studid` int NOT NULL,
  `UserS_password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`UserSID`),
  KEY `fk_studid` (`studid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserSID`, `studid`, `UserS_password`) VALUES
(1, 1001, 'Student'),
(2, 1002, 'Student'),
(3, 1003, 'Student');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisherID`) REFERENCES `publisher` (`publisherID`);

--
-- Constraints for table `usere`
--
ALTER TABLE `usere`
  ADD CONSTRAINT `fk_empid` FOREIGN KEY (`empid`) REFERENCES `tbemployee` (`empid`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_studid` FOREIGN KEY (`studid`) REFERENCES `tb_studentinfo` (`studid`);


-- --------------------------------------------------------

--
-- Structure for view `atendees_view`
--
DROP TABLE IF EXISTS `atendees_view`;

DROP VIEW IF EXISTS `atendees_view`;
CREATE VIEW `atendees_view` AS
SELECT 
    `studentinfoview`.`userID` AS `userID`,
    -- (other columns)
    `event_info`.`eventID` AS `stud_deptid`,
    -- (other columns)
    `event_info`.`eventName` AS `eventName`,
    `event_info`.`eventDesc` AS `eventDesc`,
    -- (other columns)
    `event_info`.`department_Name` AS `department_Name`,
    `event_info`.`dept_ID` AS `event_deptid`,
    `event_info`.`org_Name` AS `org_Name`,
    `eventattendees`.`attendeeID` AS `attendeeID`,
    `eventattendees`.`eventID` AS `eventID`,
    `eventattendees`.`DateRegistered` AS `DateRegistered`
FROM
    (`eventattendees`
    JOIN `event_info` ON `event_info`.`eventID` = `eventattendees`.`eventID`)
    JOIN `studentinfoview` ON `studentinfoview`.`sr_code` = `eventattendees`.`sr_code`
GROUP BY `eventattendees`.`attendeeID`, `eventattendees`.`eventID`;
-- --------------------------------------------------------

--
-- Structure for view `event_info`
--
DROP TABLE IF EXISTS `event_info`;

DROP VIEW IF EXISTS `event_info`;
CREATE VIEW `event_info`  AS SELECT `eventstatus`.`statusID` AS `statusID`, `eventstatus`.`status` AS `status`, `events`.`eventID` AS `eventID`, `events`.`eventName` AS `eventName`, `events`.`eventDesc` AS `eventDesc`, `events`.`org_ID` AS `org_ID`, `events`.`e_date` AS `e_date`, `department`.`department_Name` AS `department_Name`, `organization`.`dept_ID` AS `dept_ID`, `organization`.`org_Name` AS `org_Name` FROM (((`eventstatus` join `events` on((`eventstatus`.`statusID` = `events`.`eventID`))) join `organization` on((`organization`.`org_ID` = `events`.`org_ID`))) join `department` on((`department`.`dept_ID` = `organization`.`dept_ID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `moderators`
--
DROP TABLE IF EXISTS `moderators`;

DROP VIEW IF EXISTS `moderators`;
CREATE VIEW `moderators`  AS SELECT `superusers`.`superID` AS `superID`, `superusers`.`userName` AS `username`, `organization`.`org_Name` AS `org_Name` FROM (`organization` join `superusers` on((`organization`.`superID` = `superusers`.`superID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `studentinfoview`
--
DROP TABLE IF EXISTS `studentinfoview`;

DROP VIEW IF EXISTS `studentinfoview`;
CREATE VIEW `studentinfoview`  AS SELECT `userstudents`.`userID` AS `userID`, `students`.`sr_code` AS `sr_code`, `userstudents`.`password` AS `password`, `userstudents`.`salt` AS `salt`, `tb_studentinfo`.`firstname` AS `firstName`, `tb_studentinfo`.`lastname` AS `lastName`, `course`.`courseID` AS `courseID`, `students`.`year` AS `year`, `students`.`section` AS `section`, `course`.`courseName` AS `courseName`, `department`.`dept_ID` AS `dept_ID`, `department`.`department_Name` AS `department_Name` FROM ((((`userstudents` join `students` on((`students`.`sr_code` = `userstudents`.`sr_code`))) join `tb_studentinfo` on((`students`.`stud_id` = `tb_studentinfo`.`studid`))) join `course` on((`course`.`courseID` = `students`.`courseID`))) join `department` on((`department`.`dept_ID` = `course`.`dept_ID`)))  ;

DROP VIEW IF EXISTS `moderatorcookies`;
CREATE VIEW `moderatorcookies`  AS SELECT `superusers`.`superID` AS `superID`, `superusers`.`userName` AS `userName`, `superusers`.`password` AS `password`, `superusers`.`salt` AS `salt`, `organization`.`org_ID` AS `org_ID`, `department`.`dept_ID` AS `dept_ID` FROM ((`superusers` join `organization` on((`superusers`.`superID` = `organization`.`superID`))) join `department` on((`department`.`dept_ID` = `organization`.`dept_ID`)))  ;

DROP VIEW IF EXISTS `Notfications`;
CREATE VIEW Notifications as SELECT * FROM event_info WHERE date(e_date) BETWEEN NOW() AND (NOW() + INTERVAL 7 day) and status = 'Approved';

START TRANSACTION;
DELIMITER $$
DROP PROCEDURE IF EXISTS `registerStudents`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registerStudents`(
    IN sr_codeIN VARCHAR(10), 
    IN firstnameIN VARCHAR(255), 
    IN lastnameIN VARCHAR(255)
)
BEGIN
    INSERT INTO tb_studentinfo(lastname, firstname, course) VALUES (lastnameIN, firstnameIN, 'BSIT'); 
    SET @studid = LAST_INSERT_ID();
    INSERT INTO students(sr_code, courseID, year, section, stud_id) VALUES (sr_codeIN, 6, '3rd', 'NT-3102', @studid);
    SET @salt =  SUBSTRING(MD5(RAND()) FROM 1 FOR 10);
	SET @password = SHA2(CONCAT(sr_codeIN,@salt),256);
	INSERT INTO userstudents(sr_code,password,salt) values(sr_codeIN,@password,@salt);
END$$
DELIMITER ;

CALL registerStudents('21-33273','ALEISTER','ALINSUNURIN');
CALL registerStudents('21-38474','YVAN JEFF L.','ANUYO');
CALL registerStudents('21-32782','BERNARD ANGELO E.','ARADA');
CALL registerStudents('21-36452','EMMANUEL T.','BAYBAY');
CALL registerStudents('21-35509','JED MHARWAYNE P.','CANUEL');
CALL registerStudents('21-31630','LEOMAR P.','DE LA CRUZ');
CALL registerStudents('21-30506','ROYSHANE MARU P.','DIEZ');
CALL registerStudents('21-36155','AUBREY A.','ESGUERRA');
CALL registerStudents('22-35794','CEDRICK JHON','FIESTADA');
CALL registerStudents('21-35078','GENELLA MAE E.','GRENIAS');
CALL registerStudents('21-30802','JOHN MATTHEW I.','HORARIO');
CALL registerStudents('21-34772','MIKKO D.','IGLE');
CALL registerStudents('21-36111','JOHN AERON D.','LATORRE');
CALL registerStudents('21-30320','JULIUS MELWIN D.','LAYLO');
CALL registerStudents('21-36991','JHON MARK L.','MALUPA');
CALL registerStudents('21-37287','DON-DON C.','MARANAN');
CALL registerStudents('21-32548','MIKAELA A.','MARANAN');
CALL registerStudents('21-37831','KURT DRAHCIR C.','MERCADO');
CALL registerStudents('21-37178','ELBERT D.','NEBRES');
CALL registerStudents('21-30812','JOMARI M.','PANALIGAN');
CALL registerStudents('21-34330','ALLEN EIDRIAN S.','RAMOS');
CALL registerStudents('21-32259','JUN MARK C.','RITUAL');
CALL registerStudents('21-33470','EMJAY R.','RONGAVILLA');
CALL registerStudents('21-37046','MIKO JASPER M.','SALANGSANG');
CALL registerStudents('21-36999','FRYAN AURIC L.','VALDEZ');
CALL registerStudents('21-34053','KURT XAVIER L. ','VILLANUEVA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_tbl`
--
ALTER TABLE `attendance_tbl`
  ADD PRIMARY KEY (`AttendanceID`);

--
-- Indexes for table `faculty_tbl`
--
ALTER TABLE `faculty_tbl`
  ADD PRIMARY KEY (`FacultyID`);

--
-- Indexes for table `student_tbl`
--
ALTER TABLE `student_tbl`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `tbemployee`
--
ALTER TABLE `tbemployee`
  ADD PRIMARY KEY (`empid`);
--
-- AUTO_INCREMENT for table `attendance_tbl`
--
ALTER TABLE `attendance_tbl`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `faculty_tbl`
--
ALTER TABLE `faculty_tbl`
  MODIFY `FacultyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_tbl`
--
ALTER TABLE `student_tbl`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

COMMIT;	
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
