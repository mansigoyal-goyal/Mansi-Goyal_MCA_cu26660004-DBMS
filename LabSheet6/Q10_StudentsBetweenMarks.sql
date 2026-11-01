-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q10. Display Students Within a Marks Range

DROP PROCEDURE IF EXISTS StudentsBetweenMarks;

DELIMITER //
CREATE PROCEDURE StudentsBetweenMarks(IN p_Min DECIMAL(5,2), IN p_Max DECIMAL(5,2))
BEGIN
    SELECT * FROM Student WHERE Marks BETWEEN p_Min AND p_Max;
END //
DELIMITER ;

-- Test
CALL StudentsBetweenMarks(70, 90);
