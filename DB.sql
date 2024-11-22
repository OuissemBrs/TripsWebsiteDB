-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2024 at 09:15 PM
-- Server version: 8.0.36
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hellothere`
--

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `Phone` varchar(10) NOT NULL,
  `Evaluation` int NOT NULL,
  `Category` enum('car','bus') NOT NULL,
  `Delay` int NOT NULL,
  `Certified` enum('yes','no') NOT NULL,
  `LicenceDate` date NOT NULL,
  `NbrTrajetA` int NOT NULL,
  `NbrTrajetT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journey`
--

CREATE TABLE `journey` (
  `ID` int NOT NULL,
  `Departure` enum('Annaba','Batna','Constantine','Guelma','Jijel','Skikda','Taref','Om Bwaqi') NOT NULL,
  `Destination` enum('Annaba','Batna','Constantine','Guelma','Jijel','Skikda','Taref','Om Bwaqi') NOT NULL,
  `Stop1` enum('Annaba','Batna','Constantine','Guelma','Jijel','Skikda','Taref','Om Bwaqi') DEFAULT NULL,
  `Stop2` enum('Annaba','Batna','Constantine','Guelma','Jijel','Skikda','Taref','Om Bwaqi') DEFAULT NULL,
  `Places` int NOT NULL,
  `DepH` time NOT NULL,
  `DesH` time NOT NULL,
  `Date` date NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Smoking` enum('yes','no') NOT NULL,
  `Prix` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasjourney`
--

CREATE TABLE `pasjourney` (
  `Phone` varchar(10) NOT NULL,
  `ID` int NOT NULL,
  `Statu` enum('pending','accepted','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE `personne` (
  `Name` varchar(30) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Gmail` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Sex` enum('male','female') NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Adress` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BirthDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`Phone`);

--
-- Indexes for table `journey`
--
ALTER TABLE `journey`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `journey_ibfk_1` (`Phone`);

--
-- Indexes for table `pasjourney`
--
ALTER TABLE `pasjourney`
  ADD PRIMARY KEY (`Phone`,`ID`),
  ADD KEY `pasjourney_ibfk_1` (`ID`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`Phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `journey`
--
ALTER TABLE `journey`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`Phone`) REFERENCES `personne` (`Phone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `journey`
--
ALTER TABLE `journey`
  ADD CONSTRAINT `journey_ibfk_1` FOREIGN KEY (`Phone`) REFERENCES `driver` (`Phone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasjourney`
--
ALTER TABLE `pasjourney`
  ADD CONSTRAINT `pasjourney_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `journey` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasjourney_ibfk_2` FOREIGN KEY (`Phone`) REFERENCES `personne` (`Phone`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
