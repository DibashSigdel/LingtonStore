-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 01:07 AM
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
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` varchar(50) DEFAULT NULL,
  `ShippingStatus` varchar(50) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `DeliveryDate` datetime DEFAULT NULL,
  `Fullname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ShippingAddress` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `User_ID`, `TotalAmount`, `PaymentStatus`, `ShippingStatus`, `OrderDate`, `DeliveryDate`, `Fullname`, `Email`, `ShippingAddress`) VALUES
(23, 30, 434.00, 'Paid', 'Shipped', '2025-05-21 15:41:34', '2025-05-23 00:00:00', 'helloooooooo', 'dibashsigdel1@gmail.com', 'asdasdas'),
(24, 30, 115.00, 'Pending', 'Pending', '2025-05-21 19:57:23', NULL, 'Dibash Sigdel', 'asd@gmail.com', 'asdasd'),
(25, 30, 246.00, 'Pending', 'Pending', '2025-05-21 20:13:53', NULL, 'Debish Sigdel', 'sigdel.bish@gmail.com', '300 Constitution Ave APT 375'),
(26, 30, 115.00, 'Pending', 'Pending', '2025-05-21 22:08:41', NULL, 'Debish Sigdel', 'sigdel.bish@gmail.com', '300 Constitution Ave APT 375'),
(27, 30, 444.00, 'Pending', 'Pending', '2025-05-21 22:32:37', NULL, 'Subit Malla', 'adrianpouydal@gmail.com', 'Stratford high street'),
(28, 30, 65.00, 'Pending', 'Pending', '2025-05-21 23:28:40', NULL, 'Subit Malla', 'adrianpouydal@gmail.com', 'Stratford high street');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `ItemID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`ItemID`, `OrderID`, `ProductID`, `Quantity`, `Price`) VALUES
(26, 23, 14, 1, 65),
(27, 23, 16, 1, 123),
(28, 23, 17, 1, 123),
(29, 23, 18, 1, 123),
(30, 24, 13, 1, 50),
(31, 24, 14, 1, 65),
(32, 25, 17, 1, 123),
(33, 25, 18, 1, 123),
(34, 26, 13, 1, 50),
(35, 26, 14, 1, 65),
(36, 27, 22, 1, 231),
(37, 27, 23, 1, 213),
(38, 28, 14, 1, 65);

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
(26, 'Egg', '1 caret egg', 550.00, 5, 4, 'https://khetifood.com/image/cache/catalog/Egg3-500x500.jpg'),
(27, 'Apple (1kg)', 'fresh and crunchy ', 220.00, 5, 2, 'https://assets.clevelandclinic.org/transform/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg'),
(28, 'Coke', '1leter ', 250.00, 6, 1, 'https://upload.wikimedia.org/wikipedia/commons/2/27/Coca_Cola_Flasche_-_Original_Taste.jpg'),
(29, 'Pringles', 'Crunchy and tasty', 160.00, 7, 1, 'https://cdn11.bigcommerce.com/s-tgrcca6nho/images/stencil/1280x1280/products/4711/10357/Pringles-Potato-Crisps-Original-102g_1__16378.1733902328.jpg?c=1'),
(30, 'Rice ', '5 kg rice', 1250.00, 5, 4, 'https://www.jiomart.com/images/product/original/rvbzowg7fl/ahaar-2kg-basmati-rice-1kg-x-2-pack-product-images-orvbzowg7fl-p596097266-1-202308042139.jpg?im=Resize=(420,420)'),
(31, 'Sunflower Oil', '1 leter fresh oil', 190.00, 3, 4, 'https://img.drz.lazcdn.com/static/np/p/590f28f84a6f8395cbc9ab0b9c2e5ec8.jpg_720x720q80.jpg'),
(32, 'Paneer per Kg', 'Fresh paneer', 650.00, 5, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5iI2oX7e6upD278nrolbj_VLFarXyVa1tmg&s'),
(33, 'Banana (1 dorzen)', 'Fresh banana', 90.00, 4, 2, 'https://api.citi977.com.np/images/image-1707917636845.webp'),
(34, 'Frozen Momo', 'fresh  chicken momo', 550.00, 6, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaPOZDeQkSd4sBEQ93QghIU6QpdtogBW0KCA&s'),
(35, 'Coffee', 'Nescafe Pure Coffee', 660.00, 6, 5, 'https://i5.walmartimages.com/seo/NESCAF-CL-SICO-Instant-Coffee-Packets-Dark-Roast-1-Box-7-Packets_ded8c705-aade-43b8-bd20-7409aa0b9715.94a591b8ead9d54693a9a6c3670c9910.jpeg'),
(36, 'Wheat', '1 kg wheat', 90.00, 15, 4, 'https://5.imimg.com/data5/SELLER/Default/2023/9/344454432/WH/ZE/OZ/50862900/aashirvaad-wheat-flour.jpg'),
(37, 'Shampoo', 'Head and shoulder', 460.00, 6, 5, 'https://www.healme.com.np/storage/Product/PR-1716611355-4747275.webp');

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
(34, 'anya', 'Manchey', 'nayamanchey', '2025-05-13', 'male', 'manchey@gmail.com', '0987654321', '8990', 'admin'),
(35, 'hello', 'hello', 'nirp', '2025-05-06', 'male', 'nirp@gmail.com', '0987654321', '1234', 'user'),
(36, 'arya', 'bahadue', 'arya bd shah', '2025-05-01', 'male', 'arya@gmail.com', '0987654321', '1234', 'User'),
(37, 'rabina', 'lama', 'rabina12', '2002-06-04', 'Female', 'rabina12@gmail.com', '9876543210', 'Rabina@123', 'user'),
(38, 'bisesta', 'sharma', 'bisestssharma@gmail.com', '2025-05-21', 'Female', 'sharmaqbisesta@gmail.com', '0987654321', '30123', 'user'),
(39, 'hello muncheyyyy', 'ke cha ni', 'munchey', '2025-05-06', 'male', 'sigdel.bish@gmail.com', '5129985192', 'admin', 'admin'),
(40, 'cha ni', 'hehe', 'ke cha', '2025-05-05', 'Female', 'sigdel.bish@gmail.com', '5129985192', 'admin', 'user');

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
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`ItemID`);

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
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
-- Constraints for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
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
