-- ============================================================
-- Q43 | Section C (Hard) | ALTER - Redesign PK
-- Question: Redesign existing table clients in a single ALTER statement: drop its current
-- primary key, add region_code (CHAR 3), and set (client_id, region_code) as the new
-- composite primary key.
-- ============================================================
USE lab1_db;

ALTER TABLE clients
DROP PRIMARY KEY,
ADD COLUMN region_code CHAR(3) NOT NULL,
ADD PRIMARY KEY (client_id, region_code);

-- Verify
DESCRIBE clients;
