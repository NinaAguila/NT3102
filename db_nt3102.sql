-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 10:40 AM
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
-- Database: `db_nt3102`
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
  `empid` int(11) NOT NULL,
  `empCode` varchar(50) NOT NULL,
  `User_Type` varchar(100) NOT NULL,
  `User_Email` varchar(100) NOT NULL,
  `User_Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `stud_data`
--

CREATE TABLE `stud_data` (
  `studid` int(11) NOT NULL,
  `srCode` varchar(50) DEFAULT NULL,
  `User_Type` varchar(100) DEFAULT NULL,
  `User_Email` varchar(100) NOT NULL,
  `User_Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `add_stocks`
--
ALTER TABLE `add_stocks`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_data`
--
ALTER TABLE `emp_data`
  ADD PRIMARY KEY (`empid`);

--
-- Indexes for table `out_stocks`
--
ALTER TABLE `out_stocks`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `stud_data`
--
ALTER TABLE `stud_data`
  ADD PRIMARY KEY (`studid`);

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
  MODIFY `Product_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_data`
--
ALTER TABLE `emp_data`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `out_stocks`
--
ALTER TABLE `out_stocks`
  MODIFY `Product_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stud_data`
--
ALTER TABLE `stud_data`
  MODIFY `studid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbemployee`
--
ALTER TABLE `tbemployee`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_studentinfo`
--
ALTER TABLE `tb_studentinfo`
  MODIFY `studid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
