-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q13. Check Pass or Fail

DROP FUNCTION IF EXISTS ResultStatus;

DELIMITER //
CREATE FUNCTION ResultStatus(p_Marks DECIMAL(5,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF p_Marks >= 50 THEN
        RETURN 'Pass';
    ELSE
        RETURN 'Fail';
    END IF;
END //
DELIMITER ;

-- Test
SELECT ResultStatus(65) AS Result;
SELECT ResultStatus(40) AS Result;
SELECT StudentName, Marks, ResultStatus(Marks) AS Result FROM Student;
