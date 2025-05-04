-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2025 at 08:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lingtonstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `firstName`, `lastName`, `username`, `dob`, `gender`, `email`, `phoneNumber`, `password`, `role`) VALUES
(13, 'ayush', 'sapkota', 'aayushrj', '2025-04-20', 'Male', 'sapkota@123', '9812462789', 'ayush123', 'user'),
(14, 'Manish', 'Lama', 'Mani', '2025-04-01', 'Male', 'lama@gmail.com', '9841267067', 'asdf123', 'user'),
(15, 'Dibash', 'Sigdel', 'Dibs', '2025-04-21', 'Male', 'Dibs@2123', '1234567890', 'wasd123', 'user'),
(16, 'Adrian', 'poudyal', 'Adri', '2025-04-12', 'Male', 'Email@123', '1023456789', 'adrian123', 'user'),
(17, 'Dibash', 'Sigdel', 'Dibash07', '2024-06-06', 'Male', 'Dibashsigdel1@gmail.com', '9809767857', '7889', 'user'),
(18, 'Aayush', 'Sapkota', 'Aayush07', '2024-10-15', 'Male', 'Aayushsapkota@gmail.com', '1234567890', 'khuljasimsim', 'user'),
(19, 'Aayush', 'Sapkota', 'Aayush07', '2024-10-15', 'Male', 'Aayushsapkota@gmail.com', '1234567890', 'khuljasimsim', 'user'),
(20, 'Dibash', 'adsasd', 'DibashSigdel', '2025-04-16', 'Male', 'dibash@gmailll.comn', '1234567890', '30123', 'user'),
(30, 'admin', 'admin', 'admin', '2025-05-07', 'Male', 'admin@admin', '0987654321', 'admin', 'admin'),
(31, 'admin', 'admin', 'admin', '2025-05-07', 'Male', 'admin@admin', '0987654321', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
