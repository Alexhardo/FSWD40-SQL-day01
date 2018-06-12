-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 12, 2018 at 12:30 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(25) DEFAULT NULL,
  `speciality` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `speciality`) VALUES
(1, 'Karl Heinz', 'Heart'),
(2, 'Julia Eller', 'Chirugie'),
(3, 'Walter Fritz', 'Heart'),
(4, 'Jürgen Puller', 'HNO'),
(5, 'Fritz Schubert', 'Emergency'),
(6, 'Jürgen Affiger', 'Nervenstation'),
(7, 'Alex Voller', 'Heart');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL DEFAULT '0',
  `fk_patient_svnr` int(11) DEFAULT NULL,
  `actual_date` date DEFAULT NULL,
  `symptoms` text,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `fk_patient_svnr`, `actual_date`, `symptoms`, `doctor_id`) VALUES
(1, 2, '2018-06-08', 'Help me I\'m on the Weide', 7),
(2, 1, '2018-06-12', 'Isabel eat to much Icecream', 5);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `svnr` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `illness` varchar(20) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`svnr`, `name`, `age`, `illness`, `admission_date`, `fk_unit_id`) VALUES
(1, 'Isabell Schanazs', 18, 'Laughing', '2018-04-09', 3),
(2, 'Dan Von Der Weider', 24, 'Smoking', '2018-06-04', 4);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL DEFAULT '0',
  `fk_svnr_patient` int(11) DEFAULT NULL,
  `medicine` varchar(500) DEFAULT NULL,
  `dose` int(11) DEFAULT NULL,
  `fk_doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `fk_svnr_patient`, `medicine`, `dose`, `fk_doctor_id`) VALUES
(1, 1, 'LESS Icecream', -100, 6),
(2, 2, 'Parazetamol', 15, 6);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(25) DEFAULT NULL,
  `floor` tinyint(4) DEFAULT NULL,
  `fk_doctor_in_charge_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `floor`, `fk_doctor_in_charge_id`) VALUES
(1, 'HNO', 1, 1),
(2, 'Gynologi', 2, 5),
(3, 'Birth', 3, 1),
(4, 'Neurologie', 5, 6),
(5, 'Emergency', 0, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `fk_patient_svnr` (`fk_patient_svnr`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`svnr`),
  ADD KEY `fk_unit_id` (`fk_unit_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_svnr_patient` (`fk_svnr_patient`),
  ADD KEY `fk_doctor_id` (`fk_doctor_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor_in_charge_id` (`fk_doctor_in_charge_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `log_ibfk_2` FOREIGN KEY (`fk_patient_svnr`) REFERENCES `patient` (`svnr`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`fk_svnr_patient`) REFERENCES `patient` (`svnr`),
  ADD CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`fk_doctor_id`) REFERENCES `doctor` (`id`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`fk_doctor_in_charge_id`) REFERENCES `doctor` (`id`);
