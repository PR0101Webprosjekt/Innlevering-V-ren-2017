-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:8889
-- Generation Time: Apr 27, 2017 at 09:20 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pro101`
--

-- --------------------------------------------------------

--
-- Table structure for table `spisested`
--

CREATE TABLE IF NOT EXISTS `spisested` (
  `Plass_Id` int(3) NOT NULL,
  `Navn` char(60) NOT NULL,
  `Prisnivå` enum('Lav','Medium','Høy') NOT NULL,
  `Vegetar` enum('Vegetarvennelig','Ikke vegetarvennelig') NOT NULL,
  `Levering` enum('Levering','Ikke levering') DEFAULT NULL,
  `Åpner` time NOT NULL,
  `Stenger` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spisested`
--

INSERT INTO `spisested` (`Plass_Id`, `Navn`, `Prisnivå`, `Vegetar`, `Levering`, `Åpner`, `Stenger`) VALUES
(3, 'Cafe Con Bar', 'Høy', 'Ikke vegetarvennelig', 'Ikke levering', '10:00:00', '01:00:00'),
(1, 'Cafe Sarah', 'Medium', 'Vegetarvennelig', 'Levering', '11:00:00', '03:45:00'),
(2, 'Pelton', 'Lav', 'Vegetarvennelig', 'Ikke levering', '08:00:00', '23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sted`
--

CREATE TABLE IF NOT EXISTS `sted` (
  `Id` int(3) NOT NULL,
  `Navn` char(60) DEFAULT NULL,
  `image_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sted`
--

INSERT INTO `sted` (`Id`, `Navn`, `image_path`) VALUES
(1, 'Cafe Sarah', ''),
(2, 'Pelton', ''),
(3, 'Cafe Con Bar', ''),
(4, 'SYNG', ''),
(5, 'Kaffebrenneriet', '');

-- --------------------------------------------------------

--
-- Table structure for table `studiested`
--

CREATE TABLE IF NOT EXISTS `studiested` (
  `Studie_id` int(3) NOT NULL,
  `Navn` char(60) NOT NULL,
  `Strømuttak` enum('ja','Nei') DEFAULT NULL,
  `Wifi` enum('Ja','Nei') DEFAULT NULL,
  `KaffePris` int(3) NOT NULL,
  `Åpner` time NOT NULL,
  `Stenger` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studiested`
--

INSERT INTO `studiested` (`Studie_id`, `Navn`, `Strømuttak`, `Wifi`, `KaffePris`, `Åpner`, `Stenger`) VALUES
(5, 'Kaffebrenneriet', 'Nei', 'Ja', 59, '07:00:00', '19:00:00'),
(2, 'Pelton', 'ja', 'Ja', 40, '08:00:00', '16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `utested`
--

CREATE TABLE IF NOT EXISTS `utested` (
  `Ute_id` int(3) NOT NULL,
  `Navn` char(60) NOT NULL,
  `ØlPris` int(3) NOT NULL,
  `Aldersgrense` int(2) DEFAULT NULL,
  `Stenger` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utested`
--

INSERT INTO `utested` (`Ute_id`, `Navn`, `ØlPris`, `Aldersgrense`, `Stenger`) VALUES
(1, 'Cafe Sarah', 89, 21, '03:45:00'),
(4, 'SYNG', 49, 21, '01:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `spisested`
--
ALTER TABLE `spisested`
  ADD PRIMARY KEY (`Navn`),
  ADD UNIQUE KEY `Navn` (`Navn`),
  ADD KEY `Plass_Id` (`Plass_Id`);

--
-- Indexes for table `sted`
--
ALTER TABLE `sted`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`);

--
-- Indexes for table `studiested`
--
ALTER TABLE `studiested`
  ADD PRIMARY KEY (`Navn`),
  ADD UNIQUE KEY `Navn` (`Navn`),
  ADD KEY `Studie_id` (`Studie_id`);

--
-- Indexes for table `utested`
--
ALTER TABLE `utested`
  ADD PRIMARY KEY (`Navn`),
  ADD UNIQUE KEY `Navn` (`Navn`),
  ADD KEY `Ute_id` (`Ute_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `spisested`
--
ALTER TABLE `spisested`
  ADD CONSTRAINT `spisested_ibfk_1` FOREIGN KEY (`Plass_Id`) REFERENCES `sted` (`Id`);

--
-- Constraints for table `studiested`
--
ALTER TABLE `studiested`
  ADD CONSTRAINT `studiested_ibfk_1` FOREIGN KEY (`Studie_id`) REFERENCES `sted` (`Id`);

--
-- Constraints for table `utested`
--
ALTER TABLE `utested`
  ADD CONSTRAINT `utested_ibfk_1` FOREIGN KEY (`Ute_id`) REFERENCES `sted` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
