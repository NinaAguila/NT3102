-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 01:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
-- Table structure for table `attendance_tbl`
--

CREATE TABLE `attendance_tbl` (
  `AttendanceID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `AttendanceDate` date NOT NULL,
  `TimeStart` time(6) NOT NULL,
  `TimeEnd` time(6) NOT NULL,
  `Room` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance_tbl`
--

INSERT INTO `attendance_tbl` (`AttendanceID`, `CourseID`, `FacultyID`, `StudentID`, `AttendanceDate`, `TimeStart`, `TimeEnd`, `Room`) VALUES
(1, 1, 1, 2, '2023-11-02', '08:00:00.000000', '11:00:00.214000', 'CECS 503');

-- --------------------------------------------------------

--
-- Table structure for table `course_tbl`
--

CREATE TABLE `course_tbl` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course_tbl`
--

INSERT INTO `course_tbl` (`CourseID`, `CourseName`) VALUES
(1, 'Bachelor of Science in Information Technology'),
(2, 'Bachelor of Science in Computer Science');

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
(1, 'Jennifer Reyes', 'jenniferreyes123');

-- --------------------------------------------------------

--
-- Table structure for table `student_tbl`
--

CREATE TABLE `student_tbl` (
  `StudentID` int(11) NOT NULL,
  `StudentSRC` varchar(25) NOT NULL,
  `StudentPassword` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_tbl`
--

INSERT INTO `student_tbl` (`StudentID`, `StudentSRC`, `StudentPassword`) VALUES
(1, '21-36999', 'auric123'),
(2, '21-32139', 'emman924'),
(3, '22-71959', 'aeron098');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_tbl`
--
ALTER TABLE `attendance_tbl`
  ADD PRIMARY KEY (`AttendanceID`);

--
-- Indexes for table `course_tbl`
--
ALTER TABLE `course_tbl`
  ADD PRIMARY KEY (`CourseID`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
