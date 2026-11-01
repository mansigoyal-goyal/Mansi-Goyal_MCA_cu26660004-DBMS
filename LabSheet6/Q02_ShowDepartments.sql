-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q2. Display All Departments

DROP PROCEDURE IF EXISTS ShowDepartments;

DELIMITER //
CREATE PROCEDURE ShowDepartments()
BEGIN
    SELECT * FROM Department;
END //
DELIMITER ;

-- Test
CALL ShowDepartments();
