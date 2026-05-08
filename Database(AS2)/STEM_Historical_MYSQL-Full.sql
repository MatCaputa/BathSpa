-- Create Database
CREATE DATABASE STEM_Historical;
USE STEM_Historical;

-- =========================
-- COUNTRY TABLE
-- =========================
CREATE TABLE Country (
    CountryID INT PRIMARY KEY AUTO_INCREMENT,
    CountryName VARCHAR(100) UNIQUE NOT NULL
);

-- =========================
-- FIELD TABLE (Normalized)
-- =========================
CREATE TABLE Field (
    FieldID INT PRIMARY KEY AUTO_INCREMENT,
    FieldName VARCHAR(100) UNIQUE NOT NULL
);

-- =========================
-- SCIENTIST TABLE
-- =========================
CREATE TABLE Scientist (
    ScientistID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(200) NOT NULL,
    BirthYear INT,
    DeathYear INT,
    CountryID INT,
    Notes TEXT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

-- =========================
-- SCIENTIST-FIELD (M:M)
-- =========================
CREATE TABLE ScientistField (
    ScientistID INT,
    FieldID INT,
    PRIMARY KEY (ScientistID, FieldID),
    FOREIGN KEY (ScientistID) REFERENCES Scientist(ScientistID),
    FOREIGN KEY (FieldID) REFERENCES Field(FieldID)
);

-- =========================
-- ROOM TABLE
-- =========================
CREATE TABLE Room (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomName VARCHAR(100),
    RoomType ENUM('Lecture', 'Event'),
    Capacity INT
);

-- =========================
-- SPEAKER TABLE
-- =========================
CREATE TABLE Speaker (
    SpeakerID INT PRIMARY KEY AUTO_INCREMENT,
    SpeakerName VARCHAR(150) NOT NULL
);

-- =========================
-- EVENT TABLE
-- =========================
CREATE TABLE Event (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(200),
    EventDate DATE,
    RequiresTicket BOOLEAN
);

-- =========================
-- EVENT-SPEAKER (M:M)
-- =========================
CREATE TABLE EventSpeaker (
    EventID INT,
    SpeakerID INT,
    PRIMARY KEY (EventID, SpeakerID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (SpeakerID) REFERENCES Speaker(SpeakerID)
);

-- =========================
-- EVENT-SCIENTIST (TOPIC)
-- =========================
CREATE TABLE EventScientist (
    EventID INT,
    ScientistID INT,
    PRIMARY KEY (EventID, ScientistID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (ScientistID) REFERENCES Scientist(ScientistID)
);

-- =========================
-- EVENT-ROOM
-- =========================
CREATE TABLE EventRoom (
    EventID INT,
    RoomID INT,
    PRIMARY KEY (EventID, RoomID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

INSERT INTO Country (CountryName) VALUES
('Britain'),
('France'),
('Germany'),
('USA'),
('Poland'),
('Russia'),
('Italy'),
('Japan'),
('Egypt'),
('Sweden'),
('Serbia'),
('Iran');

INSERT INTO Field (FieldName) VALUES
('Mathematics'),
('Physics'),
('Computing'),
('Chemistry'),
('Biology'),
('Astronomy'),
('Engineering'),
('Medicine');

INSERT INTO Scientist (FullName, BirthYear, DeathYear, CountryID, Notes) VALUES
('Ada Lovelace', 1815, 1852, 1, 'First computer algorithm'),
('Mary Cartwright', 1900, 1998, 1, 'Mathematics and chaos theory'),
('Rosalind Franklin', 1920, 1958, 1, 'DNA structure discovery'),
('Hertha Ayrton', 1854, 1923, 1, 'Electrical engineering arc lighting'),
('Dorothy Hodgkin', 1910, 1994, 1, 'Protein crystallography'),
('Hypatia', 360, 415, 9, 'Ancient mathematician and astronomer'),
('Emilie du Chatelet', 1706, 1749, 2, 'Translated Newton'),
('Marie-Sophie Germain', 1776, 1831, 2, 'Number theory'),
('Irene Joliot-Curie', 1897, 1956, 2, 'Artificial radioactivity'),
('Yvonne Choquet-Bruhat', 1923, NULL, 2, 'Worked with Einstein'),
('Emmy Noether', 1882, 1935, 3, 'Worked on relativity with Einstein'),
('Ida Noddack', 1896, 1978, 3, 'Nuclear fission theory'),
('Maria Goeppert Mayer', 1906, 1972, 3, 'Nuclear shell model'),
('Maria Agnesi', 1718, 1799, 7, 'Mathematics textbook'),
('Fumiko Yonezawa', 1938, 2019, 8, 'Physics and computing'),
('Marie Curie', 1867, 1934, 5, 'Radioactivity pioneer'),
('Julia Lermontova', 1846, 1919, 6, 'Petroleum chemistry'),
('Mileva Maric', 1875, 1948, 11, 'Worked with Einstein'),
('Sophia Brahe', 1559, 1643, 10, 'Astronomy observations'),
('Maria Christina Bruhn', 1732, 1808, 10, 'Military inventions'),
('Grace Hopper', 1906, 1992, 4, 'COBOL pioneer'),
('Stephanie Kwolek', 1923, 2014, 4, 'Kevlar invention'),
('Katherine Johnson', 1918, 2020, 4, 'NASA orbital calculations'),
('Mary Jackson', 1921, 1944, 4, 'NASA engineer'),
('Sofya Kovalevskaya', 1850, 1891, 6, 'Partial differential equations'),
('Maryam Mirzakhani', 1977, 2017, 12, 'Fields Medal mathematician');

INSERT INTO ScientistField VALUES
-- Ada Lovelace
(1,1),(1,3),

-- Mary Cartwright
(2,1),

-- Rosalind Franklin
(3,5),(3,2),

-- Hertha Ayrton
(4,7),(4,1),(4,2),

-- Dorothy Hodgkin
(5,5),(5,4),

-- Hypatia
(6,1),(6,6),

-- Emilie du Chatelet
(7,1),(7,2),

-- Germain
(8,1),(8,2),

-- Irene Curie
(9,4),(9,2),

-- Yvonne
(10,1),(10,2),

-- Emmy Noether
(11,1),(11,2),

-- Noddack
(12,4),(12,2),

-- Mayer
(13,2),

-- Agnesi
(14,1),

-- Yonezawa
(15,2),(15,3),

-- Marie Curie
(16,2),(16,4),

-- Lermontova
(17,4),

-- Mileva
(18,1),(18,2),

-- Sophia Brahe
(19,6),(19,4),(19,8),

-- Bruhn
(20,4),

-- Hopper
(21,3),

-- Kwolek
(22,4),

-- Katherine Johnson
(23,1),

-- Mary Jackson
(24,1),(24,7),

-- Kovalevskaya
(25,1),

-- Mirzakhani
(26,1);

INSERT INTO Room (RoomName, RoomType, Capacity) VALUES
('Lecture Hall A', 'Lecture', 120),
('Lecture Hall B', 'Lecture', 80),
('Main Event Hall', 'Event', 300),
('Conference Room', 'Event', 60);

INSERT INTO Speaker (SpeakerName) VALUES
('Dr Smith'),
('Prof Johnson'),
('Dr Williams');

INSERT INTO Event (EventName, EventDate, RequiresTicket) VALUES
('Women in Computing', '2026-01-10', TRUE),
('Einstein Collaborators', '2026-02-15', TRUE),
('NASA Pioneers', '2026-03-10', FALSE);

-- Event 1
INSERT INTO EventSpeaker VALUES (1,1);
INSERT INTO EventScientist VALUES (1,1),(1,21);
INSERT INTO EventRoom VALUES (1,1);

-- Event 2
INSERT INTO EventSpeaker VALUES (2,2);
INSERT INTO EventScientist VALUES (2,10),(2,11),(2,18);
INSERT INTO EventRoom VALUES (2,3);

-- Event 3
INSERT INTO EventSpeaker VALUES (3,3);
INSERT INTO EventScientist VALUES (3,23),(3,24);
INSERT INTO EventRoom VALUES (3,2);

-- Add new scientist easily
DELIMITER //
CREATE PROCEDURE AddScientist(
    IN name VARCHAR(200),
    IN birth INT,
    IN death INT,
    IN country INT
)
BEGIN
    INSERT INTO Scientist (FullName, BirthYear, DeathYear, CountryID)
    VALUES (name, birth, death, country);
END //
DELIMITER ;

-- Scientists born in France
SELECT s.FullName
FROM Scientist s
JOIN Country c ON s.CountryID = c.CountryID
WHERE c.CountryName = 'France';

-- Contributed to Computing
SELECT DISTINCT s.FullName
FROM Scientist s
JOIN ScientistField sf ON s.ScientistID = sf.ScientistID
JOIN Field f ON sf.FieldID = f.FieldID
WHERE f.FieldName = 'Computing';

-- More than 1 field

SELECT s.FullName
FROM Scientist s
JOIN ScientistField sf ON s.ScientistID = sf.ScientistID
GROUP BY s.ScientistID
HAVING COUNT(sf.FieldID) > 1;

-- Fix Mary Jackson death
UPDATE Scientist
SET DeathYear = 2005
WHERE ScientistID = 24;
Select * from Scientist;

-- Died before 40

SELECT FullName
FROM Scientist
WHERE (DeathYear - BirthYear) < 40;

-- Countries with most scientists

SELECT c.CountryName, COUNT(*) AS Total
FROM Scientist s
JOIN Country c ON s.CountryID = c.CountryID
GROUP BY c.CountryName
ORDER BY Total DESC;

-- Still alive?
SELECT FullName
FROM Scientist
WHERE DeathYear IS NULL;

-- Worked for NASA
SELECT FullName
FROM Scientist
WHERE Notes LIKE '%NASA%';

-- Worked with Einstein
SELECT FullName
FROM Scientist
WHERE Notes LIKE '%Einstein%';

-- Countries with most fields
SELECT c.CountryName, COUNT(DISTINCT sf.FieldID) AS FieldCount
FROM Scientist s
JOIN Country c ON s.CountryID = c.CountryID
JOIN ScientistField sf ON s.ScientistID = sf.ScientistID
GROUP BY c.CountryName
ORDER BY FieldCount DESC;

-- Add event
INSERT INTO Event (EventName, EventDate, RequiresTicket)
VALUES ('Einstein Collaborators Talk', '2026-03-01', TRUE);

INSERT INTO EventSpeaker VALUES (2,3);
INSERT INTO EventScientist VALUES (2,7);
INSERT INTO EventRoom VALUES (2,2);
Select * from Event;

-- Update event date
UPDATE Event
SET EventDate = '2026-04-01'
WHERE EventID = 2;
Select * from Event;

-- Add new scientist (example: obscure)
INSERT INTO Scientist (FullName, BirthYear, DeathYear, CountryID)
VALUES ('Chien-Shiung Wu', 1912, 1997, 3);
Select * from Scientist;