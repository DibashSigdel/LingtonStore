-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 02:07 PM
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
-- Table structure for table `activitylog`
--

CREATE TABLE `activitylog` (
  `AdminID` int(11) DEFAULT NULL,
  `LogEntry` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `AccessLevel` varchar(50) DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  `AppliedDiscounts` text DEFAULT NULL,
  `LastUpdatedTimestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartproduct`
--

CREATE TABLE `cartproduct` (
  `CartID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Instant Food & Drinks'),
(2, 'Fruits and Vegetables'),
(3, 'Milk & Dairy'),
(4, 'Kitchen Accessories'),
(5, 'naya Category');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `DiscountID` int(11) NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Value` decimal(10,2) DEFAULT NULL,
  `MinimumOrderAmount` decimal(10,2) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` varchar(50) DEFAULT NULL,
  `ShippingStatus` varchar(50) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `DeliveryDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `TransactionStatus` varchar(50) DEFAULT NULL,
  `PaymentDateTime` datetime DEFAULT NULL,
  `TransactionID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `StockQuantity` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ImageURL` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Description`, `Price`, `StockQuantity`, `CategoryID`, `ImageURL`) VALUES
(11, 'manish', 'sad', 123.00, 123, 4, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUwAAACYCAMAAAC4aCDgAAAB0VBMVEVOm/is3/3AAAoAAABQoP9Rof9PnfxMmvis4v8SQc7IAABPnv6VAADCAAnBAACs4/9SpP+WAg4XL0uy5v8AMssaNFMAN8wAL8oIDxuwAAAANcur5v+6AACZAAAMGCchQmkfPmE9esMuXJJcAACKAABFjuHNAAA3brEQIDQ0Z6RToPpPeNstZpxvAABAhdEJPM2kpbmilaeiAABjrPxakOZwfceZT395dbqfR3ORW5MpUYFvs/tmrPqowtumuNCIxPuzn7MuWNO7hZZUft20t85diOATP8SghpcdT3Svz+mecIB/AAAoUNCfe4qj0uev7f+YyvV2EhymO2G4GSy8DxutM1KDaqqJZaGsK0m0IjqUVoxxe8W3FymfR3SFaagPHi8qLTEoNEhpm+pBadZSY2h6m6ppgoyPvtRELidsQkpOCAB7v/+CfYpFHhBFT041PUIAF8e4WGYzDAC7cYEtHRrFRE4YIVUUImqNWXhBY4ZihJxPeaETKIB0dbCcKiyRa4mLeZ+dPkV/PnARM6aFMlubUFuOL01eIyWdYW9NME0XHkybSlqYLzoVPLEANINDI0BSCgA8AAA+LkBmFyBiJzeTgJ9HGh9JJ1GJsL+YFB0fAAPRq0edAAAQAElEQVR4nO2di1vaWN7HEzg5CQkkYCgIeEONqMjNBm2l0PpaZLDeaq2262wvuB33ne7s+7Zze3c60207447dabvT+rZb96/dc5KAYC8kkKl1PZ+nVUKA5+TL+V1PEimKQCAQCIRDBVLs/gb77tcRmgOzKgWA0PDUYY3lqAOzQ7xjZeK0qm2posjz/CRRszVYauXSqnj5sgogkpBdEVdWVtTDHtTRBXhPiRPra2sbRVUF6lDRCw57REcZZlXE1j00NMSjB+tEyzaAKj/hRb/VYnZyRbyywhz2gI4wDLXGZwFOiSCg+PX1VS9gSABqCV'),
(12, 'Dibash Sigdel', 'asd', 1234.00, 123, 3, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPDw8NDxAQDw8NDQ0NDQ8PEA8NDw0NFREWFhURFRUYHSggGBolGxUVITEhJSkrLi4uFx82ODMsNyg1LjcBCgoKDg0OFRAQGy0dFR0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLSstLf/AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAACAAEDBAUIBgf/xABCEAACAgEBBgMGAwMJCAMAAAAAAQIDBBEFEhMhUWEGFDEHIkFxgZEyUqEjQrEIFSSCosHR4fBiZXJzkrKzwiUzNP/EABoBAAMBAQEBAAAAAAAAAAAAAAABAgMFBAb/xAAhEQEBAAMAAgIDAQEAAAAAAAAAAQIREhMhA1ExQWEUBP/aAAwDAQACEQMRAD8Afyw6xzU8sOsYz7bcstY4XlzUWOEsYXZ8slY4SxzVWMEsYOxwyfLhcDsaqxh1jB2OGVwB1Qa3lh1jdg7PhkqgfgGt5YXlg7o4ZDoBljmw8YCWKEzK4RiuhAulGvPGIZY5U+RF+Nm8HsNwTRdAuCV5IXDMdBG6OxqSqI5VDmabgypUdiOWOasqwHSV2i/HGPLHRXso7G5OghnR2LnyM8vgljElV2I5UmzPHIZYpc+Rjl/zsWdHz5jcLQ1p4wDxS+4w/wA1l/DKsrI9zX0NSeKRvGHMoxz+G7/DNdYLiaMqGvQhnTzKmTLP47P0p7oO6W5Vfcfgj2z5qnuiLTq7CGNV9W4QuGT6C3TjbfWaRKsJVhaDoNjQdwJQHTH1Fs9G3Bbg6FqGz0dQFui1G3kGxo+6LdFqht5BsaPujOIt5C3kLZ6BKBHKslc0DKaDZaQusCUESytj1RHxYtapprqnqg2WkE4Igmiay1FadqKlLQZA8gZXEbuKhDkQy0BneRSuLlqbIJtASaIpXETuLlZ2RPJojehDK'),
(13, 'Seb', 'Syau', 50.00, 15, 2, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPDw8NDxAQDw8NDQ0NDQ8PEA8NDw0NFREWFhURFRUYHSggGBolGxUVITEhJSkrLi4uFx82ODMsNyg1LjcBCgoKDg0OFRAQGy0dFR0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLSstLf/AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAACAAEDBAUIBgf/xABCEAACAgEBBgMGAwMJCAMAAAAAAQIDBBEFEhMhUWEGFDEHIkFxgZEyUqEjQrEIFSSCosHR4fBiZXJzkrKzwiUzNP/EABoBAAMBAQEBAAAAAAAAAAAAAAABAgMFBAb/xAAhEQEBAAMAAgIDAQEAAAAAAAAAAQIREhMhA1ExQWEUBP/aAAwDAQACEQMRAD8Afyw6xzU8sOsYz7bcstY4XlzUWOEsYXZ8slY4SxzVWMEsYOxwyfLhcDsaqxh1jB2OGVwB1Qa3lh1jdg7PhkqgfgGt5YXlg7o4ZDoBljmw8YCWKEzK4RiuhAulGvPGIZY5U+RF+Nm8HsNwTRdAuCV5IXDMdBG6OxqSqI5VDmabgypUdiOWOasqwHSV2i/HGPLHRXso7G5OghnR2LnyM8vgljElV2I5UmzPHIZYpc+Rjl/zsWdHz5jcLQ1p4wDxS+4w/wA1l/DKsrI9zX0NSeKRvGHMoxz+G7/DNdYLiaMqGvQhnTzKmTLP47P0p7oO6W5Vfcfgj2z5qnuiLTq7CGNV9W4QuGT6C3TjbfWaRKsJVhaDoNjQdwJQHTH1Fs9G3Bbg6FqGz0dQFui1G3kGxo+6LdFqht5BsaPujOIt5C3kLZ6BKBHKslc0DKaDZaQusCUESytj1RHxYtapprqnqg2WkE4Igmiay1FadqKlLQZA8gZXEbuKhDkQy0BneRSuLlqbIJtASaIpXETuLlZ2RPJojehDK'),
(14, 'jhgjhgf', 'gfdghd', 65.00, 654, 1, 'fdghd');

-- --------------------------------------------------------

--
-- Table structure for table `productmanagement`
--

CREATE TABLE `productmanagement` (
  `ProductID` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(16, 'Adrian', 'poudyal', 'Adrian', '2025-04-12', 'Male', 'Email@123', '1023456789', 'adrian123', 'user'),
(17, 'Dibash', 'Sigdel', 'Dibash07', '2024-06-06', 'Male', 'Dibashsigdel1@gmail.com', '9809767857', '7889', 'user'),
(18, 'Aayush', 'Sapkota', 'Aayush07', '2024-10-15', 'Male', 'Aayushsapkota@gmail.com', '1234567890', 'khuljasimsim', 'user'),
(19, 'Aayush', 'Sapkota', 'Aayush07', '2024-10-15', 'Male', 'Aayushsapkota@gmail.com', '1234567890', 'khuljasimsim', 'user'),
(20, 'Dibash', 'adsasd', 'DibashSigdel', '2025-04-16', 'Male', 'dibash@gmailll.comn', '1234567890', '30123', 'user'),
(30, 'admin', 'admin', 'admin', '2025-05-07', 'Male', 'admin@admin', '0987654321', 'admin', 'admin'),
(31, 'admin', 'admin', 'admin', '2025-05-07', 'Male', 'admin@admin', '0987654321', 'admin', 'admin'),
(32, 'jaggu', 'dada', 'jagguDada', '2025-05-14', 'male', 'admin@123.com', '0987654321', 'Admin', 'admin'),
(33, 'adrian', 'poudyal', 'adrianji', '2025-05-02', 'male', 'adrian1@gmail.com', '0987654321', '30123', 'admin'),
(34, 'anya', 'Manchey', 'nayamanchey', '2025-05-13', 'male', 'manchey@gmail.com', '0987654321', '8990', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `useraddress`
--

CREATE TABLE `useraddress` (
  `User_ID` int(11) DEFAULT NULL,
  `Address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpaymentmethod`
--

CREATE TABLE `userpaymentmethod` (
  `User_ID` int(11) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `User_ID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activitylog`
--
ALTER TABLE `activitylog`
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `cartproduct`
--
ALTER TABLE `cartproduct`
  ADD PRIMARY KEY (`CartID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`DiscountID`),
  ADD UNIQUE KEY `Code` (`Code`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `fk_category` (`CategoryID`);

--
-- Indexes for table `productmanagement`
--
ALTER TABLE `productmanagement`
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `userpaymentmethod`
--
ALTER TABLE `userpaymentmethod`
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`User_ID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `DiscountID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activitylog`
--
ALTER TABLE `activitylog`
  ADD CONSTRAINT `activitylog_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `cartproduct`
--
ALTER TABLE `cartproduct`
  ADD CONSTRAINT `cartproduct_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  ADD CONSTRAINT `cartproduct_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  ADD CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);

--
-- Constraints for table `productmanagement`
--
ALTER TABLE `productmanagement`
  ADD CONSTRAINT `productmanagement_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD CONSTRAINT `useraddress_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `userpaymentmethod`
--
ALTER TABLE `userpaymentmethod`
  ADD CONSTRAINT `userpaymentmethod_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
