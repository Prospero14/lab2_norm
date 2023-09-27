-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 27, 2023 at 10:55 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `razgon`
--

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `id_director ` int(11) UNSIGNED NOT NULL,
  `Last Name` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`id_director `, `Last Name`, `Name`, `date_of_birth`) VALUES
(1, 'Gaidai', 'Leonid', '1923-01-30'),
(2, 'Vachovski', 'Sisters', '1975-10-03'),
(3, 'Tarantino', 'Quentin', '1968-11-11'),
(4, 'Bykov', 'Oleg', '1992-11-10'),
(5, 'Satan', 'Lucifer', '1444-09-09'),
(6, 'Petrov', 'Denny', '2001-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id_movie` int(11) UNSIGNED NOT NULL,
  `movies_name` varchar(50) NOT NULL,
  `genre` enum('comedy','tragedy','action movie','thriller') NOT NULL,
  `id_director` int(11) UNSIGNED NOT NULL,
  `release_year` int(4) NOT NULL,
  `budget` int(11) UNSIGNED DEFAULT NULL,
  `Box_office` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id_movie`, `movies_name`, `genre`, `id_director`, `release_year`, `budget`, `Box_office`) VALUES
(4, 'Stray Dogs', 'thriller', 3, 1999, 111111232, 1412441),
(5, 'Star Wars', 'tragedy', 5, 2006, 929292, 29299),
(7, 'bobik', 'tragedy', 1, 2000, 141414, 141),
(8, 'matrix', 'action movie', 2, 2006, 111, 1111),
(9, 'diablo con carne', 'thriller', 5, 1999, 555, 56655),
(10, 'sunrape', 'thriller', 4, 1996, 4141, 41414),
(11, 'honey comb', 'tragedy', 3, 1999, 213124, 132123),
(12, 'world of warcraft', 'action movie', 3, 2004, 3453, 7373788),
(14, 'VTM', 'thriller', 2, 1979, 342, 6262),
(15, 'Hail the apocalypse', 'action movie', 5, 1969, 1231, 1214),
(18, 'jojo bizarre adv', 'comedy', 3, 1999, 929292, NULL),
(19, 'blade runner', 'comedy', 6, 1999, 929292, NULL),
(20, 'bipki', 'comedy', 5, 1967, 555, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id_director `);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id_movie`),
  ADD KEY `id_director` (`id_director`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `id_director ` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id_movie` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director `);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
