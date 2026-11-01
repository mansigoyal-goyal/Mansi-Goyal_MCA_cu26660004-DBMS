-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q5. Display Students from a Department

DROP PROCEDURE IF EXISTS GetStudentsByDept;

DELIMITER //
CREATE PROCEDURE GetStudentsByDept(IN p_DeptID INT)
BEGIN
    SELECT * FROM Student WHERE DeptID = p_DeptID;
END //
DELIMITER ;

-- Test
CALL GetStudentsByDept(102);
