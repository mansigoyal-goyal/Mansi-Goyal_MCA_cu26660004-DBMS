-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q6. Display Students Above Given Marks

DROP PROCEDURE IF EXISTS StudentsAboveMarks;

DELIMITER //
CREATE PROCEDURE StudentsAboveMarks(IN p_Marks DECIMAL(5,2))
BEGIN
    SELECT * FROM Student WHERE Marks > p_Marks;
END //
DELIMITER ;

-- Test
CALL StudentsAboveMarks(80);
