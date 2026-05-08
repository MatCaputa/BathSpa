-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20260507.1dbd1b26fa
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.30.23
-- Generation Time: May 08, 2026 at 09:43 AM
-- Server version: 8.0.18
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `STEM_Historical`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`192.168.30.%` PROCEDURE `AddScientist` (IN `name` VARCHAR(200), IN `birth` INT, IN `death` INT, IN `country` INT)   BEGIN
    INSERT INTO Scientist (FullName, BirthYear, DeathYear, CountryID)
    VALUES (name, birth, death, country);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

CREATE TABLE `Country` (
  `CountryID` int(11) NOT NULL,
  `CountryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Country`
--

INSERT INTO `Country` (`CountryID`, `CountryName`) VALUES
(1, 'Britain'),
(9, 'Egypt'),
(2, 'France'),
(3, 'Germany'),
(12, 'Iran'),
(7, 'Italy'),
(8, 'Japan'),
(5, 'Poland'),
(6, 'Russia'),
(11, 'Serbia'),
(10, 'Sweden'),
(4, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE `Event` (
  `EventID` int(11) NOT NULL,
  `EventName` varchar(200) DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `RequiresTicket` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`EventID`, `EventName`, `EventDate`, `RequiresTicket`) VALUES
(1, 'Women in Computing', '2026-01-10', 1),
(2, 'Einstein Collaborators', '2026-02-15', 1),
(3, 'NASA Pioneers', '2026-03-10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `EventRoom`
--

CREATE TABLE `EventRoom` (
  `EventID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `EventRoom`
--

INSERT INTO `EventRoom` (`EventID`, `RoomID`) VALUES
(1, 1),
(3, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `EventScientist`
--

CREATE TABLE `EventScientist` (
  `EventID` int(11) NOT NULL,
  `ScientistID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `EventScientist`
--

INSERT INTO `EventScientist` (`EventID`, `ScientistID`) VALUES
(1, 1),
(2, 10),
(2, 11),
(2, 18),
(1, 21),
(3, 23),
(3, 24);

-- --------------------------------------------------------

--
-- Table structure for table `EventSpeaker`
--

CREATE TABLE `EventSpeaker` (
  `EventID` int(11) NOT NULL,
  `SpeakerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `EventSpeaker`
--

INSERT INTO `EventSpeaker` (`EventID`, `SpeakerID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Field`
--

CREATE TABLE `Field` (
  `FieldID` int(11) NOT NULL,
  `FieldName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Field`
--

INSERT INTO `Field` (`FieldID`, `FieldName`) VALUES
(6, 'Astronomy'),
(5, 'Biology'),
(4, 'Chemistry'),
(3, 'Computing'),
(7, 'Engineering'),
(1, 'Mathematics'),
(8, 'Medicine'),
(2, 'Physics');

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE `Room` (
  `RoomID` int(11) NOT NULL,
  `RoomName` varchar(100) DEFAULT NULL,
  `RoomType` enum('Lecture','Event') DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Room`
--

INSERT INTO `Room` (`RoomID`, `RoomName`, `RoomType`, `Capacity`) VALUES
(1, 'Lecture Hall A', 'Lecture', 120),
(2, 'Lecture Hall B', 'Lecture', 80),
(3, 'Main Event Hall', 'Event', 300),
(4, 'Conference Room', 'Event', 60);

-- --------------------------------------------------------

--
-- Table structure for table `Scientist`
--

CREATE TABLE `Scientist` (
  `ScientistID` int(11) NOT NULL,
  `FullName` varchar(200) NOT NULL,
  `BirthYear` int(11) DEFAULT NULL,
  `DeathYear` int(11) DEFAULT NULL,
  `CountryID` int(11) DEFAULT NULL,
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Scientist`
--

INSERT INTO `Scientist` (`ScientistID`, `FullName`, `BirthYear`, `DeathYear`, `CountryID`, `Notes`) VALUES
(1, 'Ada Lovelace', 1815, 1852, 1, 'First computer algorithm'),
(2, 'Mary Cartwright', 1900, 1998, 1, 'Mathematics and chaos theory'),
(3, 'Rosalind Franklin', 1920, 1958, 1, 'DNA structure discovery'),
(4, 'Hertha Ayrton', 1854, 1923, 1, 'Electrical engineering arc lighting'),
(5, 'Dorothy Hodgkin', 1910, 1994, 1, 'Protein crystallography'),
(6, 'Hypatia', 360, 415, 9, 'Ancient mathematician and astronomer'),
(7, 'Emilie du Chatelet', 1706, 1749, 2, 'Translated Newton'),
(8, 'Marie-Sophie Germain', 1776, 1831, 2, 'Number theory'),
(9, 'Irene Joliot-Curie', 1897, 1956, 2, 'Artificial radioactivity'),
(10, 'Yvonne Choquet-Bruhat', 1923, NULL, 2, 'Worked with Einstein'),
(11, 'Emmy Noether', 1882, 1935, 3, 'Worked on relativity with Einstein'),
(12, 'Ida Noddack', 1896, 1978, 3, 'Nuclear fission theory'),
(13, 'Maria Goeppert Mayer', 1906, 1972, 3, 'Nuclear shell model'),
(14, 'Maria Agnesi', 1718, 1799, 7, 'Mathematics textbook'),
(15, 'Fumiko Yonezawa', 1938, 2019, 8, 'Physics and computing'),
(16, 'Marie Curie', 1867, 1934, 5, 'Radioactivity pioneer'),
(17, 'Julia Lermontova', 1846, 1919, 6, 'Petroleum chemistry'),
(18, 'Mileva Maric', 1875, 1948, 11, 'Worked with Einstein'),
(19, 'Sophia Brahe', 1559, 1643, 10, 'Astronomy observations'),
(20, 'Maria Christina Bruhn', 1732, 1808, 10, 'Military inventions'),
(21, 'Grace Hopper', 1906, 1992, 4, 'COBOL pioneer'),
(22, 'Stephanie Kwolek', 1923, 2014, 4, 'Kevlar invention'),
(23, 'Katherine Johnson', 1918, 2020, 4, 'NASA orbital calculations'),
(24, 'Mary Jackson', 1921, 1944, 4, 'NASA engineer'),
(25, 'Sofya Kovalevskaya', 1850, 1891, 6, 'Partial differential equations'),
(26, 'Maryam Mirzakhani', 1977, 2017, 12, 'Fields Medal mathematician');

-- --------------------------------------------------------

--
-- Table structure for table `ScientistField`
--

CREATE TABLE `ScientistField` (
  `ScientistID` int(11) NOT NULL,
  `FieldID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ScientistField`
--

INSERT INTO `ScientistField` (`ScientistID`, `FieldID`) VALUES
(1, 1),
(2, 1),
(4, 1),
(6, 1),
(7, 1),
(8, 1),
(10, 1),
(11, 1),
(14, 1),
(18, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(3, 2),
(4, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(15, 2),
(16, 2),
(18, 2),
(1, 3),
(15, 3),
(21, 3),
(5, 4),
(9, 4),
(12, 4),
(16, 4),
(17, 4),
(19, 4),
(20, 4),
(22, 4),
(3, 5),
(5, 5),
(6, 6),
(19, 6),
(4, 7),
(24, 7),
(19, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Speaker`
--

CREATE TABLE `Speaker` (
  `SpeakerID` int(11) NOT NULL,
  `SpeakerName` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Speaker`
--

INSERT INTO `Speaker` (`SpeakerID`, `SpeakerName`) VALUES
(1, 'Dr Smith'),
(2, 'Prof Johnson'),
(3, 'Dr Williams');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Country`
--
ALTER TABLE `Country`
  ADD PRIMARY KEY (`CountryID`),
  ADD UNIQUE KEY `CountryName` (`CountryName`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`EventID`);

--
-- Indexes for table `EventRoom`
--
ALTER TABLE `EventRoom`
  ADD PRIMARY KEY (`EventID`,`RoomID`),
  ADD KEY `RoomID` (`RoomID`);

--
-- Indexes for table `EventScientist`
--
ALTER TABLE `EventScientist`
  ADD PRIMARY KEY (`EventID`,`ScientistID`),
  ADD KEY `ScientistID` (`ScientistID`);

--
-- Indexes for table `EventSpeaker`
--
ALTER TABLE `EventSpeaker`
  ADD PRIMARY KEY (`EventID`,`SpeakerID`),
  ADD KEY `SpeakerID` (`SpeakerID`);

--
-- Indexes for table `Field`
--
ALTER TABLE `Field`
  ADD PRIMARY KEY (`FieldID`),
  ADD UNIQUE KEY `FieldName` (`FieldName`);

--
-- Indexes for table `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`RoomID`);

--
-- Indexes for table `Scientist`
--
ALTER TABLE `Scientist`
  ADD PRIMARY KEY (`ScientistID`),
  ADD KEY `CountryID` (`CountryID`);

--
-- Indexes for table `ScientistField`
--
ALTER TABLE `ScientistField`
  ADD PRIMARY KEY (`ScientistID`,`FieldID`),
  ADD KEY `FieldID` (`FieldID`);

--
-- Indexes for table `Speaker`
--
ALTER TABLE `Speaker`
  ADD PRIMARY KEY (`SpeakerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Country`
--
ALTER TABLE `Country`
  MODIFY `CountryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Event`
--
ALTER TABLE `Event`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Field`
--
ALTER TABLE `Field`
  MODIFY `FieldID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Room`
--
ALTER TABLE `Room`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Scientist`
--
ALTER TABLE `Scientist`
  MODIFY `ScientistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `Speaker`
--
ALTER TABLE `Speaker`
  MODIFY `SpeakerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `EventRoom`
--
ALTER TABLE `EventRoom`
  ADD CONSTRAINT `EventRoom_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`),
  ADD CONSTRAINT `EventRoom_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `Room` (`RoomID`);

--
-- Constraints for table `EventScientist`
--
ALTER TABLE `EventScientist`
  ADD CONSTRAINT `EventScientist_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`),
  ADD CONSTRAINT `EventScientist_ibfk_2` FOREIGN KEY (`ScientistID`) REFERENCES `Scientist` (`ScientistID`);

--
-- Constraints for table `EventSpeaker`
--
ALTER TABLE `EventSpeaker`
  ADD CONSTRAINT `EventSpeaker_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`),
  ADD CONSTRAINT `EventSpeaker_ibfk_2` FOREIGN KEY (`SpeakerID`) REFERENCES `Speaker` (`SpeakerID`);

--
-- Constraints for table `Scientist`
--
ALTER TABLE `Scientist`
  ADD CONSTRAINT `Scientist_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `Country` (`CountryID`);

--
-- Constraints for table `ScientistField`
--
ALTER TABLE `ScientistField`
  ADD CONSTRAINT `ScientistField_ibfk_1` FOREIGN KEY (`ScientistID`) REFERENCES `Scientist` (`ScientistID`),
  ADD CONSTRAINT `ScientistField_ibfk_2` FOREIGN KEY (`FieldID`) REFERENCES `Field` (`FieldID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
