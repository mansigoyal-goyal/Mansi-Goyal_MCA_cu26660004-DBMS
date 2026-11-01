-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q9. Display Students of a Particular Gender

DROP PROCEDURE IF EXISTS GetStudentsByGender;

DELIMITER //
CREATE PROCEDURE GetStudentsByGender(IN p_Gender VARCHAR(10))
BEGIN
    SELECT * FROM Student WHERE Gender = p_Gender;
END //
DELIMITER ;

-- Test
CALL GetStudentsByGender('Female');
