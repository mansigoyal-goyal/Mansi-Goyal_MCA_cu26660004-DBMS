-- ============================================================
-- Q03 | Section A (Easy) | Create Table
-- Question: Create a table projects with project_id (Primary Key), project_name (VARCHAR
-- 100), and start_date using the standard DATE data type.
-- ============================================================
USE lab1_db;

CREATE TABLE projects (
    project_id   INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date   DATE
);

-- Verify
DESCRIBE projects;
