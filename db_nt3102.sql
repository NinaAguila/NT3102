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
  `studid` int AUTO_INCREMENT NOT NULL,
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

INSERT INTO `userstudents` (`userID`, `sr_code`, `password`, `salt`) VALUES
(1, '21-33470', 'e0999eedf060a2ee05ab267bdb52f827b5f0174d839ac30eae6cd235392531f6', '1ea831d0d9'),
(3, '21-33273', 'e0999eedf060a2ee05ab267bdb52f827b5f0174d839ac30eae6cd235392531f6', '1ea831d0d9');

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

DROP VIEW IF EXISTS `stud_atendees_view`;
CREATE  VIEW stud_atendees_view  AS SELECT studentinfoview.`userID` AS userID, studentinfoview.`dept_ID` AS dept_ID, studentinfoview.`department_Name` AS stud_dept, event_info.`statusID` AS statusID, event_info.`status` AS status, eventattendees.`eventID` AS stud_deptid, event_info.`org_ID` AS org_ID, event_info.`e_date` AS e_date, eventattendees.`attendeeID` AS attendeeID, eventattendees.`eventID` AS eventID, eventattendees.`DateRegistered` AS DateRegistered FROM ((eventattendees join event_info on((event_info.`eventID` = eventattendees.`eventID`))) join studentinfoview on((studentinfoview.`userID` = eventattendees.`attendeeID`)))  ;

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


COMMIT;	
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
