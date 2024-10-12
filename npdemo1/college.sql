-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2024 at 11:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `gate_pass`
--

CREATE TABLE `gate_pass` (
  `id` int(11) NOT NULL,
  `gate_pass_no` varchar(50) NOT NULL,
  `serial_no` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `vehicle_no` varchar(50) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `accompanying_persons` varchar(255) NOT NULL,
  `issuing_department` varchar(100) NOT NULL,
  `issued_to_whom` varchar(100) NOT NULL,
  `issued_to_where` varchar(100) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `time_out` time NOT NULL,
  `security_check` varchar(100) NOT NULL,
  `remarks` text DEFAULT NULL,
  `returnable` enum('returnable','non-returnable') NOT NULL,
  `issuing_official` varchar(100) NOT NULL,
  `superior_office` varchar(100) NOT NULL,
  `project_coordinator` varchar(100) NOT NULL,
  `pdf_file` varchar(255) NOT NULL,
  `superior_officer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gate_pass`
--

INSERT INTO `gate_pass` (`id`, `gate_pass_no`, `serial_no`, `description`, `vehicle_no`, `quantity`, `accompanying_persons`, `issuing_department`, `issued_to_whom`, `issued_to_where`, `purpose`, `time_out`, `security_check`, `remarks`, `returnable`, `issuing_official`, `superior_office`, `project_coordinator`, `pdf_file`, `superior_officer`) VALUES
(1, '67876', '45', 'SFDSF', '544', -2.00, 'akfjhafd', 'eee', 'akjgakfd', 'gggg', 'sfouihiuighi', '00:00:08', 'dsd', 'hjjdshgahfd', 'non-returnable', 'sduuduy', '', 'djfhkdf', 'D12_Initial_architectural_reference_model_for_IoT.pdf', NULL),
(2, '123123', '45', 'asdfg', 'ufhh', 15.00, 'fghagfdjrat', 'tahjfasgh', 'gfgf', 'gfhjath', 'afdghaetr5y', '00:00:00', 'fdghadtyhe5', 'aertyha.edmrgynkanetr', 'non-returnable', 'ahgaetrdhyaer', '', 'adfghaedtrye3', 'black modern corporate Resume.pdf', 'adfhgtaerty'),
(3, '3234', '3', 'gfdfgf', 'hgfghg', -3.00, 'ghgjhjg', 'eee', 'ryt', 'tfgtyry', 'rytrty', '00:00:09', 'trer', 'nbvtfytry', 'non-returnable', 'ytrryuy', '', 'rtwerere', 'D12_Initial_architectural_reference_model_for_IoT.pdf', 'iyoiu'),
(4, '3234', '3', 'gfdfgf', 'hgfghg', -3.00, 'ghgjhjg', 'eee', 'ryt', 'tfgtyry', 'rytrty', '00:00:09', 'trer', 'nbvtfytry', 'non-returnable', 'ytrryuy', '', 'rtwerere', 'D12_Initial_architectural_reference_model_for_IoT.pdf', 'iyoiu'),
(5, '3234', '3', 'gfdfgf', 'hgfghg', -3.00, 'ghgjhjg', 'eee', 'ryt', 'tfgtyry', 'rytrty', '00:00:09', 'trer', 'nbvtfytry', 'non-returnable', 'ytrryuy', '', 'rtwerere', 'D12_Initial_architectural_reference_model_for_IoT.pdf', 'iyoiu'),
(6, '3234', '3', 'gfdfgf', 'hgfghg', -3.00, 'ghgjhjg', 'eee', 'ryt', 'tfgtyry', 'rytrty', '00:00:09', 'trer', 'nbvtfytry', 'non-returnable', 'ytrryuy', '', 'rtwerere', 'D12_Initial_architectural_reference_model_for_IoT.pdf', 'iyoiu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gate_pass`
--
ALTER TABLE `gate_pass`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gate_pass`
--
ALTER TABLE `gate_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
