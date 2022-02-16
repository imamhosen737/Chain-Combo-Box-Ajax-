-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2021 at 09:47 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chain_combo`
--

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `division_id`, `name`) VALUES
(1, 1, 'Comilla'),
(2, 2, 'Gazipur'),
(3, 1, 'Noakhali'),
(4, 2, 'Narshingdhi'),
(5, 4, 'Patuakhali'),
(6, 4, 'Pirojpur'),
(7, 4, 'Jhalokati'),
(8, 4, 'Jhalokati'),
(9, 1, 'Cox\'s Bazar'),
(10, 1, 'Khagrachhari'),
(11, 1, 'Chandpur'),
(12, 1, 'Feni'),
(13, 1, 'Bandarban'),
(14, 1, 'Brahmanbaria'),
(15, 2, 'Kishoreganj'),
(16, 2, 'Manikganj'),
(17, 2, 'Munshiganj'),
(18, 2, 'Narayanganj'),
(19, 3, 'Gaibandha'),
(20, 3, 'Kurigram'),
(21, 3, 'Lalmonirhat'),
(22, 3, 'Nilphamari'),
(23, 3, 'Panchagarh'),
(24, 3, 'Rangpur');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `name`) VALUES
(1, 'Chittagong'),
(2, 'Dhaka'),
(3, 'Rangpur'),
(4, 'Barishal');

-- --------------------------------------------------------

--
-- Table structure for table `upazilla`
--

CREATE TABLE `upazilla` (
  `id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upazilla`
--

INSERT INTO `upazilla` (`id`, `district_id`, `name`) VALUES
(10, 1, 'Cumilla Adarsha Sadar'),
(11, 1, 'Cumilla Sadar South'),
(12, 1, 'Chandina'),
(13, 1, 'Chauddagram'),
(14, 13, 'Ali Kadam.'),
(15, 13, 'Bandarban Sadar.'),
(16, 13, 'Lama'),
(17, 13, 'Ruma.'),
(18, 2, 'Gazipur Sadar Upazila.'),
(19, 2, 'Kaliakair '),
(20, 2, 'Kapasia '),
(21, 2, 'Sreepur '),
(22, 21, 'Aditmari Upazila'),
(23, 21, 'Hatibandha '),
(24, 16, 'Manikganj Sadar Upazila.'),
(25, 16, 'Shivalaya'),
(26, 16, ' Singair '),
(27, 22, 'Dimla'),
(28, 22, 'Domar'),
(29, 22, 'Nilphamari Sadar'),
(30, 9, 'Chakaria '),
(31, 9, 'Cox\'s Bazar Sadar '),
(32, 9, 'Kutubdia '),
(33, 9, 'Maheshkhali '),
(34, 9, 'Ramu'),
(35, 9, 'Teknaf ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `division_id` (`division_id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazilla`
--
ALTER TABLE `upazilla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id` (`district_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `upazilla`
--
ALTER TABLE `upazilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `upazilla`
--
ALTER TABLE `upazilla`
  ADD CONSTRAINT `upazilla_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
