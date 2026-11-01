-- ============================================================
-- Q28 | Section B (Medium) | Create Table
-- Question: Create a table geolocations with location_id (INT Primary Key), latitude
-- (DECIMAL 9,6), and longitude (DECIMAL 9,6).
-- ============================================================
USE lab1_db;

CREATE TABLE geolocations (
    location_id INT PRIMARY KEY,
    latitude    DECIMAL(9,6),
    longitude   DECIMAL(9,6)
);

-- Verify
DESCRIBE geolocations;
