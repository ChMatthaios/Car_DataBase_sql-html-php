-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2020 at 09:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `autokinhta`
--

CREATE TABLE `autokinhta` (
  `idautokinhta` int(11) NOT NULL,
  `kataskeuasths` varchar(45) NOT NULL,
  `megethos` varchar(15) NOT NULL,
  `xrwma` varchar(45) NOT NULL,
  `timh_pwlhshs` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `autokinhta`
--

INSERT INTO `autokinhta` (`idautokinhta`, `kataskeuasths`, `megethos`, `xrwma`, `timh_pwlhshs`) VALUES
(1, 'ACURA', 'COUPE', 'YELLOW', 47075),
(2, 'AUDI', 'SEDAN', 'BLACK', 63890),
(3, 'BMW', 'COUPE', 'SILVER', 108990),
(4, 'BUICK', 'SEDAN', 'BLACK', 31599),
(5, 'CADILAC', 'CONVERTIBLE', 'RED', 62777),
(6, 'FORD', 'PICKUP', 'RED', 47440),
(7, 'HONDA', 'COUPE', 'RED', 34785),
(8, 'ISUZU', 'WAGON', 'RED', 30505),
(9, 'JAGUAR', 'CONVERTIBLE', 'BLACK', 91675),
(10, 'JEEP', 'WAGON', 'SILVER', 37854),
(11, 'KIA', 'SEDAN', 'WHITE', 25998),
(12, 'LAND ROVER', 'WAGON', 'BLACK', 98356),
(13, 'MAZDA', 'WAGON', 'SILVER', 27846),
(14, 'MERCEDES', 'SEDAN', 'SILVER', 86990),
(15, 'MINI', 'CONVERTIBLE', 'SILVER', 32930),
(16, 'MITSUBISHI', 'CONVERTIBLE', 'RED', 31995),
(17, 'NISSAN', 'WAGON', 'SILVER', 36777),
(18, 'SUBARU', 'WAGON', 'BLUE', 34999),
(19, 'TOYOTA', 'CONVERTIBLE', 'SILVER', 35648),
(20, 'VOLKSWAGEN', 'WAGON', 'BLACK', 51472);

-- --------------------------------------------------------

--
-- Table structure for table `etaireia`
--

CREATE TABLE `etaireia` (
  `idetaireia` int(11) NOT NULL,
  `kwdiko` varchar(15) NOT NULL,
  `idaut` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `synallagh`
--

CREATE TABLE `synallagh` (
  `idsynallagh` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `idauto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `synallagh`
--

INSERT INTO `synallagh` (`idsynallagh`, `username`, `idauto`) VALUES
(1, 0, 9),
(2, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `xrhsths`
--

CREATE TABLE `xrhsths` (
  `kwdikos` varchar(15) NOT NULL,
  `poso` float NOT NULL,
  `idautokinhta` int(11) DEFAULT NULL,
  `username` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xrhsths`
--

INSERT INTO `xrhsths` (`kwdikos`, `poso`, `idautokinhta`, `username`) VALUES
('pass456', 34999, 18, 'mathaios'),
('pass123', 63890, 2, 'user1'),
('pass234', 31599, 4, 'user2'),
('pass345', 47440, 6, 'user3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autokinhta`
--
ALTER TABLE `autokinhta`
  ADD PRIMARY KEY (`idautokinhta`);

--
-- Indexes for table `etaireia`
--
ALTER TABLE `etaireia`
  ADD PRIMARY KEY (`idetaireia`),
  ADD KEY `idaut` (`idaut`);

--
-- Indexes for table `synallagh`
--
ALTER TABLE `synallagh`
  ADD PRIMARY KEY (`idsynallagh`),
  ADD KEY `username` (`username`),
  ADD KEY `idauto` (`idauto`);

--
-- Indexes for table `xrhsths`
--
ALTER TABLE `xrhsths`
  ADD PRIMARY KEY (`username`),
  ADD KEY `idautokinhta` (`idautokinhta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autokinhta`
--
ALTER TABLE `autokinhta`
  MODIFY `idautokinhta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `etaireia`
--
ALTER TABLE `etaireia`
  MODIFY `idetaireia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `synallagh`
--
ALTER TABLE `synallagh`
  MODIFY `idsynallagh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `etaireia`
--
ALTER TABLE `etaireia`
  ADD CONSTRAINT `idaut` FOREIGN KEY (`idaut`) REFERENCES `autokinhta` (`idautokinhta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `synallagh`
--
ALTER TABLE `synallagh`
  ADD CONSTRAINT `idauto` FOREIGN KEY (`idauto`) REFERENCES `autokinhta` (`idautokinhta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `xrhsths`
--
ALTER TABLE `xrhsths`
  ADD CONSTRAINT `idautokinhta` FOREIGN KEY (`idautokinhta`) REFERENCES `autokinhta` (`idautokinhta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT * FROM `xrhsths`;
SELECT * FROM `autokinhta`;
SELECT * FROM `synallagh`;
SELECT * FROM `etaireia`;

SELECT * FROM `xrhsths`, `autokinhta` WHERE xrhsths.idautokinhta=autokinhta.idautokinhta;
SELECT * FROM `synallagh`, `xrhsths` WHERE synallagh.username=2 AND xrhsths.username=2;
SELECT * FROM `etaireia`, `autokinhta`WHERE etaireia.idaut=autokinhta.idautokinhta;
SELECT * FROM `synallagh`,`autokinhta` WHERE synallagh.idauto=autokinhta.idautokinhta;
