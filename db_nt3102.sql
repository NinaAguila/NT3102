-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 19, 2023 at 11:43 PM
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
,`firstName` varchar(250)
,`lastName` varchar(250)
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
  `courseName` text COLLATE utf8mb4_general_ci NOT NULL,
  `dept_ID` int NOT NULL,
  PRIMARY KEY (`courseID`),
  KEY `dept_ID` (`dept_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `department_Name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`dept_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `attendeeID` int NOT NULL AUTO_INCREMENT,
  `eventID` int NOT NULL,
  `sr_code` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `DateRegistered` timestamp NOT NULL,
  PRIMARY KEY (`attendeeID`),
  KEY `eventID` (`eventID`),
  KEY `sr_code` (`sr_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eventattendees`
--

INSERT INTO `eventattendees` (`attendeeID`, `eventID`, `sr_code`, `DateRegistered`) VALUES
(1, 1, '21-33470', '2023-11-18 16:00:00'),
(2, 1, '21-33273', '2023-11-19 14:08:10'),
(3, 1, '21-33273', '2023-11-19 14:08:18'),
(4, 1, '21-33273', '2023-11-19 14:08:28'),
(5, 1, '21-33273', '2023-11-19 14:08:31'),
(6, 1, '21-33273', '2023-11-19 14:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `eventrecords`
--

DROP TABLE IF EXISTS `eventrecords`;
CREATE TABLE IF NOT EXISTS `eventrecords` (
  `recordID` int NOT NULL AUTO_INCREMENT,
  `eventID` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `superID` int NOT NULL,
  PRIMARY KEY (`recordID`),
  KEY `superID` (`superID`),
  KEY `statusID` (`eventID`(250)),
  KEY `fk_eventID` (`eventID`(250))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `eventName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `eventDesc` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `org_ID` int NOT NULL,
  `statusID` int NOT NULL,
  `e_date` datetime NOT NULL,
  PRIMARY KEY (`eventID`),
  KEY `org_ID` (`org_ID`),
  KEY `statusID` (`statusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventID`, `eventName`, `eventDesc`, `org_ID`, `statusID`, `e_date`) VALUES
(1, 'sample', 'sample', 1, 1, '2023-11-19 09:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `eventstatus`
--

DROP TABLE IF EXISTS `eventstatus`;
CREATE TABLE IF NOT EXISTS `eventstatus` (
  `statusID` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `org_Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `superID` int NOT NULL,
  PRIMARY KEY (`org_ID`),
  KEY `superID` (`superID`),
  KEY `dept_ID` (`dept_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
,`firstName` varchar(250)
,`lastName` varchar(250)
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
  `sr_code` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `firstName` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `courseID` int NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `section` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sr_code`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`sr_code`, `firstName`, `lastName`, `courseID`, `year`, `section`) VALUES
('21-33273', 'Aleister', 'Alinsunurin', 6, '3rd', 'NT-3102'),
('21-33470', 'Emjay', 'Rongavilla', 6, '3rd', 'NT-3102');

-- --------------------------------------------------------

--
-- Table structure for table `superusers`
--

DROP TABLE IF EXISTS `superusers`;
CREATE TABLE IF NOT EXISTS `superusers` (
  `superID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `salt` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`superID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `tbemployee`
--

DROP TABLE IF EXISTS `tbemployee`;
CREATE TABLE IF NOT EXISTS `tbemployee` (
  `empid` int NOT NULL,
  `lastname` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentinfo`
--

DROP TABLE IF EXISTS `tb_studentinfo`;
CREATE TABLE IF NOT EXISTS `tb_studentinfo` (
  `studid` int NOT NULL,
  `lastname` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `course` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_studentinfo`
--

INSERT INTO `tb_studentinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(1, 'parker', 'peter', 'bsit');

-- --------------------------------------------------------

--
-- Table structure for table `userstudents`
--

DROP TABLE IF EXISTS `userstudents`;
CREATE TABLE IF NOT EXISTS `userstudents` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `sr_code` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `salt` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `sr_code` (`sr_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userstudents`
--

INSERT INTO `userstudents` (`userID`, `sr_code`, `password`, `salt`) VALUES
(1, '21-33470', 'e0999eedf060a2ee05ab267bdb52f827b5f0174d839ac30eae6cd235392531f6', '1ea831d0d9'),
(3, '21-33273', 'a46509693cff178f34647bb3bdf3b8fffcf36b75e102b9fabeba3417632f7366', '00d8bf7d8b');

-- --------------------------------------------------------

--
-- Structure for view `atendees_view`
--
DROP TABLE IF EXISTS `atendees_view`;

DROP VIEW IF EXISTS `atendees_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `atendees_view`  AS SELECT `studentinfoview`.`userID` AS `userID`, `studentinfoview`.`sr_code` AS `sr_code`, `studentinfoview`.`password` AS `password`, `studentinfoview`.`salt` AS `salt`, `studentinfoview`.`firstName` AS `firstName`, `studentinfoview`.`lastName` AS `lastName`, `studentinfoview`.`courseID` AS `courseID`, `studentinfoview`.`year` AS `year`, `studentinfoview`.`section` AS `section`, `studentinfoview`.`courseName` AS `courseName`, `studentinfoview`.`dept_ID` AS `dept_ID`, `studentinfoview`.`department_Name` AS `stud_dept`, `event_info`.`statusID` AS `statusID`, `event_info`.`status` AS `status`, `eventattendees`.`eventID` AS `stud_deptid`, `event_info`.`eventName` AS `eventName`, `event_info`.`eventDesc` AS `eventDesc`, `event_info`.`org_ID` AS `org_ID`, `event_info`.`e_date` AS `e_date`, `event_info`.`department_Name` AS `department_Name`, `event_info`.`dept_ID` AS `event_deptid`, `event_info`.`org_Name` AS `org_Name`, `eventattendees`.`attendeeID` AS `attendeeID`, `eventattendees`.`eventID` AS `eventID`, `eventattendees`.`DateRegistered` AS `DateRegistered` FROM ((`eventattendees` join `event_info` on((`event_info`.`eventID` = `eventattendees`.`eventID`))) join `studentinfoview` on((`studentinfoview`.`userID` = `eventattendees`.`attendeeID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `event_info`
--
DROP TABLE IF EXISTS `event_info`;

DROP VIEW IF EXISTS `event_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event_info`  AS SELECT `eventstatus`.`statusID` AS `statusID`, `eventstatus`.`status` AS `status`, `events`.`eventID` AS `eventID`, `events`.`eventName` AS `eventName`, `events`.`eventDesc` AS `eventDesc`, `events`.`org_ID` AS `org_ID`, `events`.`e_date` AS `e_date`, `department`.`department_Name` AS `department_Name`, `organization`.`dept_ID` AS `dept_ID`, `organization`.`org_Name` AS `org_Name` FROM (((`eventstatus` join `events` on((`eventstatus`.`statusID` = `events`.`eventID`))) join `organization` on((`organization`.`org_ID` = `events`.`org_ID`))) join `department` on((`department`.`dept_ID` = `organization`.`dept_ID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `moderators`
--
DROP TABLE IF EXISTS `moderators`;

DROP VIEW IF EXISTS `moderators`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `moderators`  AS SELECT `superusers`.`superID` AS `superID`, `superusers`.`userName` AS `username`, `organization`.`org_Name` AS `org_Name` FROM (`organization` join `superusers` on((`organization`.`superID` = `superusers`.`superID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `studentinfoview`
--
DROP TABLE IF EXISTS `studentinfoview`;

DROP VIEW IF EXISTS `studentinfoview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentinfoview`  AS SELECT `userstudents`.`userID` AS `userID`, `students`.`sr_code` AS `sr_code`, `userstudents`.`password` AS `password`, `userstudents`.`salt` AS `salt`, `students`.`firstName` AS `firstName`, `students`.`lastName` AS `lastName`, `course`.`courseID` AS `courseID`, `students`.`year` AS `year`, `students`.`section` AS `section`, `course`.`courseName` AS `courseName`, `department`.`dept_ID` AS `dept_ID`, `department`.`department_Name` AS `department_Name` FROM (((`userstudents` join `students` on((`students`.`sr_code` = `userstudents`.`sr_code`))) join `course` on((`course`.`courseID` = `students`.`courseID`))) join `department` on((`department`.`dept_ID` = `course`.`dept_ID`)))  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
