-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2018 at 12:14 PM
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
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` int(11) NOT NULL,
  `title` varchar(22) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `publisher` varchar(20) DEFAULT NULL,
  `publishing_date` date DEFAULT NULL,
  `dimension` varchar(20) DEFAULT NULL,
  `lang` varchar(32) DEFAULT NULL,
  `author` varchar(22) DEFAULT NULL,
  `comments` varchar(22) DEFAULT NULL,
  `sell_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `title`, `pages`, `price`, `publisher`, `publishing_date`, `dimension`, `lang`, `author`, `comments`, `sell_date`) VALUES
(2, 'cats', 25, 20, 'fisher', '2018-06-08', 'A5', 'Deutsch', 'Katzer mauser', 'we love cats', '2018-06-26'),
(3, 'dogs', 22, 33, 'fisher', '2000-02-23', 'A5', 'Deutsch', 'Hunder Vögel', 'we love dogs', '2001-04-12'),
(4, 'Birds', 232, 26, 'fisher', '2000-02-18', 'A5', 'Deutsch', 'Hunder Vögel', 'we love birds', '2001-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL,
  `person_name` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`id`, `person_name`, `start_date`, `end_date`, `book_id`) VALUES
(1, 'Alex', '2010-12-23', '2010-12-29', 2),
(2, 'Denis', '2010-12-01', '2010-12-12', 3);

-- --------------------------------------------------------

--
-- Table structure for table `highlight`
--

CREATE TABLE `highlight` (
  `ID` int(11) NOT NULL,
  `page_nr` int(11) DEFAULT NULL,
  `line_nr` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `highlight`
--

INSERT INTO `highlight` (`ID`, `page_nr`, `line_nr`, `book_id`) VALUES
(1, 51, 12, NULL),
(2, 12, 32, NULL),
(3, 51, 12, NULL),
(4, 42, 23, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reading`
--

CREATE TABLE `reading` (
  `id` int(11) NOT NULL,
  `recent_reading` varchar(22) DEFAULT NULL,
  `next_reading` varchar(22) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reading`
--

INSERT INTO `reading` (`id`, `recent_reading`, `next_reading`, `start_date`, `finish_date`, `book_id`) VALUES
(2, 'cats', 'dogs', '2018-06-13', '2018-06-22', 2),
(3, 'dogs', 'cats', '2018-05-07', '2018-04-10', 3),
(4, 'dogs', 'birds', '2018-02-06', '2018-03-21', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `highlight`
--
ALTER TABLE `highlight`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `reading`
--
ALTER TABLE `reading`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `ISBN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `highlight`
--
ALTER TABLE `highlight`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reading`
--
ALTER TABLE `reading`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`);

--
-- Constraints for table `highlight`
--
ALTER TABLE `highlight`
  ADD CONSTRAINT `highlight_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`);

--
-- Constraints for table `reading`
--
ALTER TABLE `reading`
  ADD CONSTRAINT `reading_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
