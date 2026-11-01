-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q20. Display Student Name, Marks and Grade using StudentGrade()
-- (StudentGrade is re-created here so this file runs on its own)

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

SELECT StudentName, Marks, StudentGrade(Marks) AS Grade
FROM Student;
