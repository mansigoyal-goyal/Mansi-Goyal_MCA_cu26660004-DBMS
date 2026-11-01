-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q14. Find Student Grade

DROP FUNCTION IF EXISTS StudentGrade;

DELIMITER //
CREATE FUNCTION StudentGrade(p_Marks DECIMAL(5,2))
RETURNS CHAR(1)
DETERMINISTIC
BEGIN
    DECLARE v_Grade CHAR(1);

    IF p_Marks >= 90 THEN
        SET v_Grade = 'A';
    ELSEIF p_Marks >= 75 THEN
        SET v_Grade = 'B';
    ELSEIF p_Marks >= 60 THEN
        SET v_Grade = 'C';
    ELSE
        SET v_Grade = 'D';
    END IF;

    RETURN v_Grade;
END //
DELIMITER ;

-- Test
SELECT StudentGrade(95) AS Grade;
SELECT StudentGrade(80) AS Grade;
SELECT StudentGrade(65) AS Grade;
SELECT StudentGrade(40) AS Grade;
