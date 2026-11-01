-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q3. Display All Courses

DROP PROCEDURE IF EXISTS ShowCourses;

DELIMITER //
CREATE PROCEDURE ShowCourses()
BEGIN
    SELECT * FROM Course;
END //
DELIMITER ;

-- Test
CALL ShowCourses();
