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