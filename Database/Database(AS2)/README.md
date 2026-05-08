# STEM Historical Figures Database

A relational and non-relational database system for storing biographical information about historical STEM figures, together with a booking extension for managing related lectures and events.

---

## Overview

This project implements a fully normalised database (3NF) to store and manipulate information about historical STEM figures (with a focus on women in science) and to manage a booking system for lectures and events about them. It demonstrates:

- Relational database design using **MySQL** with foreign keys, junction tables and a stored procedure.
- An optional **NoSQL** implementation using **MongoDB** to demonstrate an alternative document-based approach.
- A range of SQL and NoSQL queries covering filtering, joining, aggregation, text search and updates.

---

## Files

| File | Description |
| --- | --- |
| [STEM_Historical_MYSQL-Full.sql](STEM_Historical_MYSQL-Full.sql) | Full MySQL schema, sample data, stored procedure and queries. |
| [STEM_Historical_NoSQL.js](STEM_Historical_NoSQL.js) | MongoDB shell script with collections, sample documents and equivalent queries. |


---

## Relational Schema (MySQL)

The schema is normalised to 3NF, separating entities and using junction tables for many-to-many relationships.

### Core entities

- **Country** — `CountryID`, `CountryName`
- **Field** — `FieldID`, `FieldName` (research areas such as Mathematics, Physics, Computing)
- **Scientist** — `ScientistID`, `FullName`, `BirthYear`, `DeathYear`, `CountryID` (FK), `Notes`
- **ScientistField** — junction table for the M:M between Scientist and Field

### Booking extension

- **Event** — `EventID`, `EventName`, `EventDate`, `RequiresTicket`
- **Speaker** — `SpeakerID`, `SpeakerName`
- **Room** — `RoomID`, `RoomName`, `RoomType` (`Lecture` / `Event`), `Capacity`
- **EventSpeaker** — junction (M:M between Event and Speaker)
- **EventScientist** — junction (events and the scientists they are about)
- **EventRoom** — links each event to a room

### Stored procedure

`AddScientist(name, birth, death, country)` — standardises insertion of a new scientist.

```sql
CALL AddScientist('Chien-Shiung Wu', 1912, 1997, 3);
```

---

## NoSQL Schema (MongoDB)

Database name: `STEM_Historical_NoSQL`.

- **scientists** — embedded `fields` array and inline `country` string (no joins required).
- **events** — embeds `speakers`, `scientists` and `room` directly within each document.

---

## Demonstrated Queries

Both implementations cover the same set of operations:

| # | Question | SQL technique | NoSQL technique |
| --- | --- | --- | --- |
| 1 | Scientists born in France | `JOIN` on Country | `find({ country: "France" })` |
| 2 | Scientists who contributed to Computing | `JOIN` via `ScientistField` | `find({ fields: "Computing" })` |
| 3 | Scientists with more than one field | `GROUP BY` + `HAVING COUNT > 1` | `$expr` with `$size` on `fields` |
| 4 | Fix Mary Jackson's death year to 2005 | `UPDATE … WHERE` | `updateOne({ name: "Mary Jackson" }, { $set: { deathYear: 2005 } })` |
| 5 | Scientists who died before age 40 | `(DeathYear - BirthYear) < 40` | `$expr` with `$subtract` |
| 6 | Countries with the most scientists | `COUNT(*) … GROUP BY … ORDER BY` | `aggregate` with `$group` + `$sort` |
| 7 | Scientists still alive | `WHERE DeathYear IS NULL` | `find({ deathYear: null })` |
| 8 | Worked for NASA | `Notes LIKE '%NASA%'` | `$regex: "NASA"` |
| 9 | Worked with Einstein | `Notes LIKE '%Einstein%'` | `$regex: "Einstein"` |
| 10 | Countries with most distinct fields | `COUNT(DISTINCT FieldID)` + `JOIN` | `aggregate` with `$unwind` + `$addToSet` + `$size` |
| 11 | Add a new event | `INSERT` into Event + junctions | `events.insertOne({ … })` |
| 12 | Update an event date | `UPDATE Event SET EventDate …` | `events.updateOne({ … }, { $set: { date: … } })` |
| 13 | Add a new scientist (e.g. Chien-Shiung Wu) | `INSERT` or `CALL AddScientist(...)` | `scientists.insertOne({ … })` |

---

## How to Run

### MySQL

1. Open the script in MySQL Workbench (or any MySQL client).
2. Execute [STEM_Historical_MYSQL-Full.sql](STEM_Historical_MYSQL-Full.sql) — it creates the `STEM_Historical` database, tables, sample data, the stored procedure, and runs the demonstration queries.

```bash
mysql -u <user> -p < STEM_Historical_MYSQL-Full.sql
```

### MongoDB

1. Start a local MongoDB instance (the report uses MongoDB Compass on `localhost:27017`).
2. Run the script in `mongosh`:

```bash
mongosh < STEM_Historical_NoSQL.js
```

This switches to the `STEM_Historical_NoSQL` database, populates the `scientists` and `events` collections, and runs the demonstration queries.

---

## Reflection

Designing this system reinforced the value of normalisation (3NF), referential integrity through foreign keys, and junction tables for many-to-many relationships. The stored procedure `AddScientist` shows how repetitive insert logic can be standardised at the database layer. The optional NoSQL implementation contrasts the relational approach by embedding related data in a single document, illustrating the trade-off between joins and denormalised structure.