-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q8. Check Student Result

DROP PROCEDURE IF EXISTS CheckResult;

DELIMITER //
CREATE PROCEDURE CheckResult(IN p_StudentID INT)
BEGIN
    DECLARE v_Marks DECIMAL(5,2);

    SELECT Marks INTO v_Marks FROM Student WHERE StudentID = p_StudentID;

    IF v_Marks >= 50 THEN
        SELECT 'Pass' AS Result;
    ELSE
        SELECT 'Fail' AS Result;
    END IF;
END //
DELIMITER ;

-- Test
CALL CheckResult(1);
CALL CheckResult(5);
