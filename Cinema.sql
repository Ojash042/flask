-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 08, 2023 at 01:10 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `customer_id` int(11) NOT NULL,
  `FName` char(30) DEFAULT NULL,
  `LName` char(30) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `contact` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customer_id`, `FName`, `LName`, `email`, `password`, `contact`) VALUES
(1, 'admin', NULL, 'admin@admin.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Films`
--

CREATE TABLE `Films` (
  `id` int(11) NOT NULL,
  `FILM_NAME` char(20) DEFAULT NULL,
  `Director` char(30) DEFAULT NULL,
  `STATE` tinyint(1) DEFAULT NULL,
  `Release_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Films`
--

INSERT INTO `Films` (`id`, `FILM_NAME`, `Director`, `STATE`, `Release_Date`) VALUES
(1856101, 'Blade Runner 2049', 'Denis Villeneuve', 0, '2017-08-03'),
(2582802, 'Caravan', 'Damien Chazelle', 1, '2014-01-16'),
(10366460, 'Coda', 'Sian Heder', 0, '2021-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `Screening`
--

CREATE TABLE `Screening` (
  `screening_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `theatre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Seats`
--

CREATE TABLE `Seats` (
  `seat_id` int(11) NOT NULL,
  `row` char(2) DEFAULT NULL,
  `col` int(3) DEFAULT NULL,
  `theatre_id` int(11) DEFAULT NULL,
  `costumer_id` int(11) DEFAULT NULL,
  `screening_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Theatre`
--

CREATE TABLE `Theatre` (
  `theatre_id` int(11) NOT NULL,
  `seat_no` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `Films`
--
ALTER TABLE `Films`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Screening`
--
ALTER TABLE `Screening`
  ADD PRIMARY KEY (`screening_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `Seats`
--
ALTER TABLE `Seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `theatre_id` (`theatre_id`),
  ADD KEY `costumer_id` (`costumer_id`),
  ADD KEY `Seats_ibfk_3` (`screening_id`);

--
-- Indexes for table `Theatre`
--
ALTER TABLE `Theatre`
  ADD PRIMARY KEY (`theatre_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Screening`
--
ALTER TABLE `Screening`
  ADD CONSTRAINT `Screening_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Films` (`id`);

--
-- Constraints for table `Seats`
--
ALTER TABLE `Seats`
  ADD CONSTRAINT `Seats_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `Theatre` (`theatre_id`),
  ADD CONSTRAINT `Seats_ibfk_2` FOREIGN KEY (`costumer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `Seats_ibfk_3` FOREIGN KEY (`screening_id`) REFERENCES `Screening` (`screening_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
