-- ============================================================
-- Q32 | Section B (Medium) | ALTER - Change Column
-- Question: Convert start_date column in table projects to project_year with data type YEAR
-- using a single DDL statement.
-- ============================================================
USE lab1_db;

ALTER TABLE projects
CHANGE COLUMN start_date project_year YEAR;

-- Verify
DESCRIBE projects;
