-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q18. Calculate Double Marks

DROP FUNCTION IF EXISTS DoubleMarks;

DELIMITER //
CREATE FUNCTION DoubleMarks(p_Marks DECIMAL(5,2))
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN p_Marks * 2;
END //
DELIMITER ;

-- Test
SELECT StudentName, Marks, DoubleMarks(Marks) AS DoubleMarks FROM Student;
