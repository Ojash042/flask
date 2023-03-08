-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 08, 2023 at 04:41 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customer_id`, `FName`, `LName`, `email`, `password`, `contact`) VALUES
(1, 'admin', NULL, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL),
(2030, 'Ojash', 'Devkota', 'ojash25@gmail.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', '9845123225'),
(8854, 'Mohan', 'Sharma', 'mohan221@yahoo.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', '9844125784');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Films`
--

INSERT INTO `Films` (`id`, `FILM_NAME`, `Director`, `STATE`, `Release_Date`) VALUES
(1856101, 'Blade Runner 2049', 'Denis Villeneuve', 0, '2017-08-03'),
(2582802, 'Caravan', 'Damien Chazelle', 1, '2014-01-16'),
(10366460, 'Coda', 'Sian Heder', 0, '2021-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `reservation_id` int(11) NOT NULL,
  `screening_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `reservation_type_id` int(11) DEFAULT NULL,
  `reserved` int(11) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Reservation`
--

INSERT INTO `Reservation` (`reservation_id`, `screening_id`, `customer_id`, `reservation_type_id`, `reserved`, `paid`, `active`) VALUES
(10647, 25, 1, 33981, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Reservation_Type`
--

CREATE TABLE `Reservation_Type` (
  `reservation_type_id` int(11) NOT NULL,
  `reservation_type` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Reservation_Type`
--

INSERT INTO `Reservation_Type` (`reservation_type_id`, `reservation_type`) VALUES
(33981, '1');

-- --------------------------------------------------------

--
-- Table structure for table `Screening`
--

CREATE TABLE `Screening` (
  `screening_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `theatre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Screening`
--

INSERT INTO `Screening` (`screening_id`, `id`, `start_time`, `theatre_id`) VALUES
(24, 1856101, '2022-03-14 11:45:00', 1),
(25, 10366460, '2022-03-14 12:45:00', 2),
(26, 1856101, '2022-03-14 14:45:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Seats`
--

CREATE TABLE `Seats` (
  `seat_id` int(11) NOT NULL,
  `row` char(2) DEFAULT NULL,
  `col` int(3) DEFAULT NULL,
  `theatre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Seats`
--

INSERT INTO `Seats` (`seat_id`, `row`, `col`, `theatre_id`) VALUES
(101, 'A', 1, 1),
(102, 'A', 2, 1),
(103, 'A', 3, 1),
(104, 'A', 4, 1),
(105, 'A', 5, 1),
(106, 'A', 6, 1),
(107, 'A', 7, 1),
(108, 'A', 8, 1),
(109, 'A', 9, 1),
(110, 'A', 10, 1),
(111, 'A', 11, 1),
(112, 'A', 12, 1),
(113, 'B', 1, 1),
(114, 'B', 2, 1),
(115, 'B', 3, 1),
(116, 'B', 4, 1),
(117, 'B', 5, 1),
(118, 'B', 6, 1),
(119, 'B', 7, 1),
(120, 'B', 8, 1),
(121, 'B', 9, 1),
(122, 'B', 10, 1),
(123, 'B', 11, 1),
(124, 'B', 12, 1),
(125, 'C', 1, 1),
(126, 'C', 2, 1),
(127, 'C', 3, 1),
(128, 'C', 4, 1),
(129, 'C', 5, 1),
(130, 'C', 6, 1),
(131, 'C', 7, 1),
(132, 'C', 8, 1),
(133, 'C', 9, 1),
(134, 'C', 10, 1),
(135, 'C', 11, 1),
(136, 'C', 12, 1),
(137, 'D', 1, 1),
(138, 'D', 2, 1),
(139, 'D', 3, 1),
(140, 'D', 4, 1),
(141, 'D', 5, 1),
(142, 'D', 6, 1),
(143, 'D', 7, 1),
(144, 'D', 8, 1),
(145, 'D', 9, 1),
(146, 'D', 10, 1),
(147, 'D', 11, 1),
(148, 'D', 12, 1),
(149, 'E', 1, 1),
(150, 'E', 2, 1),
(151, 'E', 3, 1),
(152, 'E', 4, 1),
(153, 'E', 5, 1),
(154, 'E', 6, 1),
(155, 'E', 7, 1),
(156, 'E', 8, 1),
(157, 'E', 9, 1),
(158, 'E', 10, 1),
(159, 'E', 11, 1),
(160, 'E', 12, 1),
(161, 'F', 1, 1),
(162, 'F', 2, 1),
(163, 'F', 3, 1),
(164, 'F', 4, 1),
(165, 'F', 5, 1),
(166, 'F', 6, 1),
(167, 'F', 7, 1),
(168, 'F', 8, 1),
(169, 'F', 9, 1),
(170, 'F', 10, 1),
(171, 'F', 11, 1),
(172, 'F', 12, 1),
(201, 'A', 1, 2),
(202, 'A', 2, 2),
(203, 'A', 3, 2),
(204, 'A', 4, 2),
(205, 'A', 5, 2),
(206, 'A', 6, 2),
(207, 'A', 7, 2),
(208, 'A', 8, 2),
(209, 'A', 9, 2),
(210, 'A', 10, 2),
(211, 'A', 11, 2),
(212, 'A', 12, 2),
(213, 'B', 1, 2),
(214, 'B', 2, 2),
(215, 'B', 3, 2),
(216, 'B', 4, 2),
(217, 'B', 5, 2),
(218, 'B', 6, 2),
(219, 'B', 7, 2),
(220, 'B', 8, 2),
(221, 'B', 9, 2),
(222, 'B', 10, 2),
(223, 'B', 11, 2),
(224, 'B', 12, 2),
(225, 'C', 1, 2),
(226, 'C', 2, 2),
(227, 'C', 3, 2),
(228, 'C', 4, 2),
(229, 'C', 5, 2),
(230, 'C', 6, 2),
(231, 'C', 7, 2),
(232, 'C', 8, 2),
(233, 'C', 9, 2),
(234, 'C', 10, 2),
(235, 'C', 11, 2),
(236, 'C', 12, 2),
(237, 'D', 1, 2),
(238, 'D', 2, 2),
(239, 'D', 3, 2),
(240, 'D', 4, 2),
(241, 'D', 5, 2),
(242, 'D', 6, 2),
(243, 'D', 7, 2),
(244, 'D', 8, 2),
(245, 'D', 9, 2),
(246, 'D', 10, 2),
(247, 'D', 11, 2),
(248, 'D', 12, 2),
(249, 'E', 1, 2),
(250, 'E', 2, 2),
(251, 'E', 3, 2),
(252, 'E', 4, 2),
(253, 'E', 5, 2),
(254, 'E', 6, 2),
(255, 'E', 7, 2),
(256, 'E', 8, 2),
(257, 'E', 9, 2),
(258, 'E', 10, 2),
(259, 'E', 11, 2),
(260, 'E', 12, 2),
(261, 'F', 1, 2),
(262, 'F', 2, 2),
(263, 'F', 3, 2),
(264, 'F', 4, 2),
(265, 'F', 5, 2),
(266, 'F', 6, 2),
(267, 'F', 7, 2),
(268, 'F', 8, 2),
(269, 'F', 9, 2),
(270, 'F', 10, 2),
(271, 'F', 11, 2),
(272, 'F', 12, 2),
(301, 'A', 1, 3),
(302, 'A', 2, 3),
(303, 'A', 3, 3),
(304, 'A', 4, 3),
(305, 'A', 5, 3),
(306, 'A', 6, 3),
(307, 'A', 7, 3),
(308, 'A', 8, 3),
(309, 'A', 9, 3),
(310, 'A', 10, 3),
(311, 'A', 11, 3),
(312, 'A', 12, 3),
(313, 'B', 1, 3),
(314, 'B', 2, 3),
(315, 'B', 3, 3),
(316, 'B', 4, 3),
(317, 'B', 5, 3),
(318, 'B', 6, 3),
(319, 'B', 7, 3),
(320, 'B', 8, 3),
(321, 'B', 9, 3),
(322, 'B', 10, 3),
(323, 'B', 11, 3),
(324, 'B', 12, 3),
(325, 'C', 1, 3),
(326, 'C', 2, 3),
(327, 'C', 3, 3),
(328, 'C', 4, 3),
(329, 'C', 5, 3),
(330, 'C', 6, 3),
(331, 'C', 7, 3),
(332, 'C', 8, 3),
(333, 'C', 9, 3),
(334, 'C', 10, 3),
(335, 'C', 11, 3),
(336, 'C', 12, 3),
(337, 'D', 1, 3),
(338, 'D', 2, 3),
(339, 'D', 3, 3),
(340, 'D', 4, 3),
(341, 'D', 5, 3),
(342, 'D', 6, 3),
(343, 'D', 7, 3),
(344, 'D', 8, 3),
(345, 'D', 9, 3),
(346, 'D', 10, 3),
(347, 'D', 11, 3),
(348, 'D', 12, 3),
(349, 'E', 1, 3),
(350, 'E', 2, 3),
(351, 'E', 3, 3),
(352, 'E', 4, 3),
(353, 'E', 5, 3),
(354, 'E', 6, 3),
(355, 'E', 7, 3),
(356, 'E', 8, 3),
(357, 'E', 9, 3),
(358, 'E', 10, 3),
(359, 'E', 11, 3),
(360, 'E', 12, 3),
(361, 'F', 1, 3),
(362, 'F', 2, 3),
(363, 'F', 3, 3),
(364, 'F', 4, 3),
(365, 'F', 5, 3),
(366, 'F', 6, 3),
(367, 'F', 7, 3),
(368, 'F', 8, 3),
(369, 'F', 9, 3),
(370, 'F', 10, 3),
(371, 'F', 11, 3),
(372, 'F', 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Seat_Reserved`
--

CREATE TABLE `Seat_Reserved` (
  `seat_reserved_id` int(11) NOT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `screening_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Seat_Reserved`
--

INSERT INTO `Seat_Reserved` (`seat_reserved_id`, `seat_id`, `reservation_id`, `screening_id`) VALUES
(67, 208, 10647, 25),
(790, 207, 10647, 25);

-- --------------------------------------------------------

--
-- Table structure for table `Theatre`
--

CREATE TABLE `Theatre` (
  `theatre_id` int(11) NOT NULL,
  `seat_no` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Theatre`
--

INSERT INTO `Theatre` (`theatre_id`, `seat_no`) VALUES
(1, '72'),
(2, '72'),
(3, '72');

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
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `screening_id` (`screening_id`),
  ADD KEY `reservation_type_id` (`reservation_type_id`),
  ADD KEY `Reservation_ibfk_3` (`customer_id`);

--
-- Indexes for table `Reservation_Type`
--
ALTER TABLE `Reservation_Type`
  ADD PRIMARY KEY (`reservation_type_id`);

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
  ADD KEY `theatre_id` (`theatre_id`);

--
-- Indexes for table `Seat_Reserved`
--
ALTER TABLE `Seat_Reserved`
  ADD PRIMARY KEY (`seat_reserved_id`),
  ADD KEY `seat_id` (`seat_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `screening_id` (`screening_id`);

--
-- Indexes for table `Theatre`
--
ALTER TABLE `Theatre`
  ADD PRIMARY KEY (`theatre_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`screening_id`) REFERENCES `Screening` (`screening_id`),
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`reservation_type_id`) REFERENCES `Reservation_Type` (`reservation_type_id`),
  ADD CONSTRAINT `Reservation_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`);

--
-- Constraints for table `Screening`
--
ALTER TABLE `Screening`
  ADD CONSTRAINT `Screening_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Films` (`id`);

--
-- Constraints for table `Seats`
--
ALTER TABLE `Seats`
  ADD CONSTRAINT `Seats_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `Theatre` (`theatre_id`);

--
-- Constraints for table `Seat_Reserved`
--
ALTER TABLE `Seat_Reserved`
  ADD CONSTRAINT `Seat_Reserved_ibfk_1` FOREIGN KEY (`seat_id`) REFERENCES `Seats` (`seat_id`),
  ADD CONSTRAINT `Seat_Reserved_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation` (`reservation_id`),
  ADD CONSTRAINT `Seat_Reserved_ibfk_3` FOREIGN KEY (`screening_id`) REFERENCES `Screening` (`screening_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
