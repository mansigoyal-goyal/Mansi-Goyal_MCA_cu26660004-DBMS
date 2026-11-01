-- ============================================================
-- Q20 | Section A (Easy) | ALTER - Re-add Primary Key
-- Question: Re-add a primary key to column client_id in clients after table creation using
-- an ALTER command.
-- ============================================================
USE lab1_db;

-- The table already has a primary key from Q19, so drop it first, then add it again.
ALTER TABLE clients
DROP PRIMARY KEY;

ALTER TABLE clients
ADD PRIMARY KEY (client_id);

-- Verify
DESCRIBE clients;
