-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 07:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogrid_customer`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication`
--

CREATE TABLE `authentication` (
  `Cus_id` varchar(50) NOT NULL,
  `Pw` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authentication`
--

INSERT INTO `authentication` (`Cus_id`, `Pw`) VALUES
('2', 11223);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_id` varchar(10) NOT NULL,
  `Month` int(3) NOT NULL,
  `Unit_rate` double(8,5) NOT NULL,
  `used_units` int(10) NOT NULL,
  `Account_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bill_id`, `Month`, `Unit_rate`, `used_units`, `Account_number`) VALUES
('1', 1, 200.00000, 3, 1),
('2', 2, 200.00000, 50, 1),
('3', 1, 15.00000, 15, 1),
('4', 1, 15.00000, 15, 1),
('5', 2, 200.00000, 1, 123);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `Complaint_id` int(6) NOT NULL,
  `Inquiry_message` varchar(100) NOT NULL,
  `Section` varchar(10) NOT NULL,
  `Cus_id` varchar(10) NOT NULL,
  `reply` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`Complaint_id`, `Inquiry_message`, `Section`, `Cus_id`, `reply`) VALUES
(3, '1', 'A73-f', '2', NULL),
(9, 'hyhyh', 'frfr', '2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cus_id` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` bigint(12) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `age` int(11) NOT NULL,
  `Assign_eid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cus_id`, `name`, `NIC`, `Email`, `Phone`, `Location`, `Password`, `age`, `Assign_eid`) VALUES
('2', 'Anupa', '200018801871', 'upa%252540gmail.com', 765707598, 'C-H-327/c', 'anupa-123', 22, '1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_manager`
--

CREATE TABLE `customer_manager` (
  `Emp_id` varchar(10) NOT NULL,
  `c` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_manager`
--

INSERT INTO `customer_manager` (`Emp_id`, `c`) VALUES
('1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `electricity_account`
--

CREATE TABLE `electricity_account` (
  `Account_number` int(10) NOT NULL,
  `Premises_id` varchar(10) NOT NULL,
  `Account_name` varchar(15) NOT NULL,
  `Cus_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `electricity_account`
--

INSERT INTO `electricity_account` (`Account_number`, `Premises_id`, `Account_name`, `Cus_id`) VALUES
(1, '1', '1', '2'),
(123, 'blah', 'blah', '2'),
(123123, 'blah', 'blah', '2'),
(1231231233, 'blah', 'blah', '2');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Emp_id` varchar(10) NOT NULL,
  `Emp_password` varchar(10) NOT NULL,
  `E_name` varchar(12) NOT NULL,
  `NIC` varchar(13) NOT NULL,
  `Age` int(3) NOT NULL,
  `Gender` varchar(8) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_id`, `Emp_password`, `E_name`, `NIC`, `Age`, `Gender`, `Email`, `Phone`) VALUES
('1', '1', '1', '1', 1, '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_manager`
--

CREATE TABLE `employee_manager` (
  `Emp_id` varchar(10) NOT NULL,
  `ee` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Feedback_id` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `rate` int(6) NOT NULL,
  `phone` bigint(12) NOT NULL,
  `feedback_comment` varchar(100) NOT NULL,
  `Cus_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `financial_manager`
--

CREATE TABLE `financial_manager` (
  `Emp_id` varchar(10) NOT NULL,
  `fm` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `financial_manager`
--

INSERT INTO `financial_manager` (`Emp_id`, `fm`) VALUES
('1', 9);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_id` int(10) NOT NULL,
  `Payment_method` varchar(10) NOT NULL,
  `Bill_id` varchar(8) NOT NULL,
  `Cus_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_id`, `Payment_method`, `Bill_id`, `Cus_id`) VALUES
(1, '1', '1', '2'),
(2, 'Cash', '2', '2'),
(3, '1', '1', '2'),
(4, 'visa', '5', '2'),
(5, 'visa', '2', '2'),
(6, '1', '2', '2'),
(22, 'wwwew', '2', '2'),
(23, 'eeee', '2', '2'),
(24, 'eeee', '2', '2'),
(25, 'qqqqqqqqq', '2', '2'),
(26, 'swswswswsw', '2', '2'),
(27, 'qqq', '2', '2'),
(28, 'hyhy', '2', '2'),
(29, 'visaaaaa', '2', '2'),
(30, 'wew', '2', '2'),
(31, 'gtgtg', '2', '2'),
(32, 'mjm', '2', '2'),
(33, 'fr', '2', '2'),
(34, 'qwqwqwqw', '2', '2'),
(35, 'j', '2', '2'),
(36, 'ffff', '2', '2'),
(37, 'de', '2', '2'),
(38, 'ed', '2', '2'),
(39, 'edededt', '2', '2'),
(40, 'j', '2', '2'),
(41, 'e', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `Emp_id` varchar(10) NOT NULL,
  `Salary_id` varchar(10) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Allowance` int(11) NOT NULL,
  `Emp_fm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service_manager`
--

CREATE TABLE `service_manager` (
  `Emp_id` varchar(10) NOT NULL,
  `sm` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication`
--
ALTER TABLE `authentication`
  ADD PRIMARY KEY (`Cus_id`,`Pw`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_id`),
  ADD KEY `FK1_bill` (`Account_number`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`Complaint_id`),
  ADD KEY `FK1_com` (`Cus_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cus_id`),
  ADD KEY `FK1_cus` (`Assign_eid`);

--
-- Indexes for table `customer_manager`
--
ALTER TABLE `customer_manager`
  ADD PRIMARY KEY (`Emp_id`);

--
-- Indexes for table `electricity_account`
--
ALTER TABLE `electricity_account`
  ADD PRIMARY KEY (`Account_number`),
  ADD KEY `FK1_elec` (`Cus_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_id`);

--
-- Indexes for table `employee_manager`
--
ALTER TABLE `employee_manager`
  ADD PRIMARY KEY (`Emp_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_id`),
  ADD KEY `FK1_rate` (`Cus_id`);

--
-- Indexes for table `financial_manager`
--
ALTER TABLE `financial_manager`
  ADD PRIMARY KEY (`Emp_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_id`),
  ADD KEY `FK1_pay` (`Bill_id`),
  ADD KEY `FK2_pay` (`Cus_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`Emp_id`,`Salary_id`),
  ADD KEY `Emp_id` (`Emp_id`),
  ADD KEY `Emp_id_2` (`Emp_id`),
  ADD KEY `FK2_Salary` (`Emp_fm`);

--
-- Indexes for table `service_manager`
--
ALTER TABLE `service_manager`
  ADD PRIMARY KEY (`Emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `Complaint_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authentication`
--
ALTER TABLE `authentication`
  ADD CONSTRAINT `fk_auth` FOREIGN KEY (`Cus_id`) REFERENCES `customer` (`Cus_id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK1_bill` FOREIGN KEY (`Account_number`) REFERENCES `electricity_account` (`Account_number`);

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `FK1_com` FOREIGN KEY (`Cus_id`) REFERENCES `customer` (`Cus_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK1_cus` FOREIGN KEY (`Assign_eid`) REFERENCES `customer_manager` (`Emp_id`);

--
-- Constraints for table `customer_manager`
--
ALTER TABLE `customer_manager`
  ADD CONSTRAINT `fk1_cm` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`);

--
-- Constraints for table `electricity_account`
--
ALTER TABLE `electricity_account`
  ADD CONSTRAINT `FK1_elec` FOREIGN KEY (`Cus_id`) REFERENCES `customer` (`Cus_id`);

--
-- Constraints for table `employee_manager`
--
ALTER TABLE `employee_manager`
  ADD CONSTRAINT `FK1_em` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK1_rate` FOREIGN KEY (`Cus_id`) REFERENCES `customer` (`Cus_id`);

--
-- Constraints for table `financial_manager`
--
ALTER TABLE `financial_manager`
  ADD CONSTRAINT `FK1_fm` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK1_pay` FOREIGN KEY (`Bill_id`) REFERENCES `bill` (`Bill_id`),
  ADD CONSTRAINT `FK2_pay` FOREIGN KEY (`Cus_id`) REFERENCES `customer` (`Cus_id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `FK1_Salary` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`),
  ADD CONSTRAINT `FK2_Salary` FOREIGN KEY (`Emp_fm`) REFERENCES `financial_manager` (`Emp_id`);

--
-- Constraints for table `service_manager`
--
ALTER TABLE `service_manager`
  ADD CONSTRAINT `FK1_sm` FOREIGN KEY (`Emp_id`) REFERENCES `employee` (`Emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
