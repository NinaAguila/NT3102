-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 07:34 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_stocks`
--

CREATE TABLE `add_stocks` (
  `Product_ID` int(100) NOT NULL,
  `Quantity` int(50) NOT NULL,
  `Transaction_No` int(50) NOT NULL,
  `Date` date NOT NULL,
  `empid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_stocks`
--

INSERT INTO `add_stocks` (`Product_ID`, `Quantity`, `Transaction_No`, `Date`, `empid`) VALUES
(1, 5, 1, '2023-11-21', 5678);

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(50) NOT NULL,
  `announcement` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_data`
--

CREATE TABLE `emp_data` (
  `User_ID` int(11) NOT NULL,
  `empid` int(11) NOT NULL,
  `User_Type` varchar(100) NOT NULL,
  `User_Email` varchar(100) NOT NULL,
  `User_Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_data`
--

INSERT INTO `emp_data` (`User_ID`, `empid`, `User_Type`, `User_Email`, `User_Password`) VALUES
(1, 1234, 'Admin', '1234@g.batstate-u.edu.ph', 'admin'),
(2, 5678, 'RGO Admin', '5678@g.batstate-u.edu.ph', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `out_stocks`
--

CREATE TABLE `out_stocks` (
  `Product_ID` int(100) NOT NULL,
  `SoldStocks` varchar(100) NOT NULL,
  `Transaction_No` int(100) NOT NULL,
  `Date` date NOT NULL,
  `empid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `out_stocks`
--

INSERT INTO `out_stocks` (`Product_ID`, `SoldStocks`, `Transaction_No`, `Date`, `empid`) VALUES
(1, '12', 1, '2023-11-21', 5678);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(100) NOT NULL,
  `Category_Name` varchar(100) NOT NULL,
  `Product_Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Price` int(50) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Category_Name`, `Product_Name`, `Description`, `Price`, `image`) VALUES
(1, 'Uniform', 'Polo', 'Large', 350, '655af4f733676.png');

-- --------------------------------------------------------

--
-- Table structure for table `stud_data`
--

CREATE TABLE `stud_data` (
  `User_ID` int(255) NOT NULL,
  `studid` int(11) DEFAULT NULL,
  `User_Type` varchar(100) DEFAULT NULL,
  `User_Email` varchar(100) NOT NULL,
  `User_Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stud_data`
--

INSERT INTO `stud_data` (`User_ID`, `studid`, `User_Type`, `User_Email`, `User_Password`) VALUES
(1, 2138474, 'User', '2138474@g.batstate-u.edu.ph', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tbemployee`
--

CREATE TABLE `tbemployee` (
  `empid` int(11) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbemployee`
--

INSERT INTO `tbemployee` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1234, 'Tatum', 'Jason', 'RGO'),
(5678, 'Chu', 'Kimi', 'RGO');

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentinfo`
--

CREATE TABLE `tb_studentinfo` (
  `studid` int(11) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_studentinfo`
--

INSERT INTO `tb_studentinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(2138474, 'Anuyo', 'Yvan', 'BSIT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_stocks`
--
ALTER TABLE `add_stocks`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_data`
--
ALTER TABLE `emp_data`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `out_stocks`
--
ALTER TABLE `out_stocks`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `stud_data`
--
ALTER TABLE `stud_data`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `studid` (`studid`);

--
-- Indexes for table `tbemployee`
--
ALTER TABLE `tbemployee`
  ADD PRIMARY KEY (`empid`);

--
-- Indexes for table `tb_studentinfo`
--
ALTER TABLE `tb_studentinfo`
  ADD PRIMARY KEY (`studid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_stocks`
--
ALTER TABLE `add_stocks`
  MODIFY `Product_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_data`
--
ALTER TABLE `emp_data`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `out_stocks`
--
ALTER TABLE `out_stocks`
  MODIFY `Product_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stud_data`
--
ALTER TABLE `stud_data`
  MODIFY `User_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_stocks`
--
ALTER TABLE `add_stocks`
  ADD CONSTRAINT `add_stocks_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `tbemployee` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emp_data`
--
ALTER TABLE `emp_data`
  ADD CONSTRAINT `emp_data_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `tbemployee` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `out_stocks`
--
ALTER TABLE `out_stocks`
  ADD CONSTRAINT `out_stocks_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `tbemployee` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stud_data`
--
ALTER TABLE `stud_data`
  ADD CONSTRAINT `stud_data_ibfk_1` FOREIGN KEY (`studid`) REFERENCES `tb_studentinfo` (`studid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
