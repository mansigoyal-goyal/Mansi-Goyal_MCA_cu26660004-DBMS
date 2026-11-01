-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q7. Display Total Number of Students

DROP PROCEDURE IF EXISTS TotalStudents;

DELIMITER //
CREATE PROCEDURE TotalStudents()
BEGIN
    SELECT COUNT(*) AS TotalStudents FROM Student;
END //
DELIMITER ;

-- Test
CALL TotalStudents();
