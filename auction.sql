-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2018 at 03:52 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bidding`
--

CREATE TABLE `tbl_bidding` (
  `bidding_id` int(22) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `time_of_bidding` datetime DEFAULT NULL,
  `fk_user_id` int(22) NOT NULL,
  `fk_set_id` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(22) NOT NULL,
  `product_name` varchar(22) DEFAULT NULL,
  `product_description` varchar(22) DEFAULT NULL,
  `product_img` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_set`
--

CREATE TABLE `tbl_set` (
  `set_id` int(22) NOT NULL,
  `catalog_id` varchar(22) DEFAULT NULL,
  `bid_start_time` datetime DEFAULT NULL,
  `bid_end_time` datetime DEFAULT NULL,
  `highest_bid` int(11) DEFAULT NULL,
  `fk_user_id` int(22) NOT NULL,
  `fk_bidding_id` int(22) NOT NULL,
  `fk_product_id` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_ID` int(20) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `pw` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bidding`
--
ALTER TABLE `tbl_bidding`
  ADD PRIMARY KEY (`bidding_id`),
  ADD KEY `bidding_id` (`bidding_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_set_id` (`fk_set_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`);

--
-- Indexes for table `tbl_set`
--
ALTER TABLE `tbl_set`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `set_id` (`set_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bidding`
--
ALTER TABLE `tbl_bidding`
  ADD CONSTRAINT `tbl_bidding_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `tbl_users` (`user_ID`),
  ADD CONSTRAINT `tbl_bidding_ibfk_2` FOREIGN KEY (`fk_set_id`) REFERENCES `tbl_set` (`set_id`);

--
-- Constraints for table `tbl_set`
--
ALTER TABLE `tbl_set`
  ADD CONSTRAINT `tbl_set_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `tbl_users` (`user_ID`),
  ADD CONSTRAINT `tbl_set_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `tbl_product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
