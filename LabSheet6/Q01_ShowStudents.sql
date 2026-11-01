-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q1. Display All Students

DROP PROCEDURE IF EXISTS ShowStudents;

DELIMITER //
CREATE PROCEDURE ShowStudents()
BEGIN
    SELECT * FROM Student;
END //
DELIMITER ;

-- Test
CALL ShowStudents();
