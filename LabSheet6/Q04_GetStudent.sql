-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q4. Display Student by ID

DROP PROCEDURE IF EXISTS GetStudent;

DELIMITER //
CREATE PROCEDURE GetStudent(IN p_StudentID INT)
BEGIN
    SELECT * FROM Student WHERE StudentID = p_StudentID;
END //
DELIMITER ;

-- Test
CALL GetStudent(3);
