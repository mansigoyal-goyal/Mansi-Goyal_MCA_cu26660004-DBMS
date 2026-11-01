-- ============================================================
-- Q25 | Section B (Medium) | ALTER - Add Composite PK
-- Question: Given table inventory with columns warehouse_id (INT) and sku (VARCHAR 20),
-- write an ALTER statement to add a composite primary key to both columns.
-- ============================================================
USE lab1_db;

-- Prerequisite: the 'given' table is created here without a primary key.
CREATE TABLE inventory (
    warehouse_id INT         NOT NULL,
    sku          VARCHAR(20) NOT NULL
);

-- Answer:
ALTER TABLE inventory
ADD PRIMARY KEY (warehouse_id, sku);

-- Verify
DESCRIBE inventory;
