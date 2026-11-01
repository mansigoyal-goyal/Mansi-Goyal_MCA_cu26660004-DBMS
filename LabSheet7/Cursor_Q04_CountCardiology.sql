-- Database Technologies Lab Sheet 7 (MCA105P)
-- Part D - Cursor Question 4: Count Cardiology doctors using an OUT parameter
-- Run 00_setup.sql once first (creates the database and tables).
-- Re-running this file resets the Doctors data.

USE Hospital_Cursor_Trigger_Lab;

-- Reset so this file can be run on its own, any number of times
DROP TRIGGER IF EXISTS trg_doctors_after_insert;
DROP TRIGGER IF EXISTS trg_doctors_after_update_fee;
DROP TRIGGER IF EXISTS trg_doctors_before_insert_upper;
DROP TRIGGER IF EXISTS trg_doctors_before_insert_fee_check;
DROP TRIGGER IF EXISTS trg_doctors_after_delete;
DROP TRIGGER IF EXISTS trg_doctors_after_update_feelog;
DROP TRIGGER IF EXISTS trg_doctors_before_update_fee_check;
DROP TRIGGER IF EXISTS trg_doctors_before_update_status;
DROP TRIGGER IF EXISTS trg_doctors_after_update_dept;
DROP TRIGGER IF EXISTS trg_doctors_before_update_fee_jump;
DELETE FROM Doctors;
INSERT INTO Doctors VALUES
(201,'Dr. Anil','Cardiology',1200,'Active'),
(202,'Dr. Beena','Pediatrics',900,'Active'),
(203,'Dr. Chirag','Neurology',1500,'Active'),
(204,'Dr. Divya','Dermatology',1000,'Active'),
(205,'Dr. Eshan','Cardiology',1300,'Active'),
(206,'Dr. Farah','Pediatrics',850,'Active');
TRUNCATE TABLE Doctor_Audit;
TRUNCATE TABLE Fee_Log;

DROP PROCEDURE IF EXISTS CountCardiologyDoctors;

DELIMITER //
CREATE PROCEDURE CountCardiologyDoctors(OUT p_count INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;

    DECLARE cur CURSOR FOR
        SELECT DoctorID FROM Doctors WHERE Department = 'Cardiology';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET p_count = 0;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET p_count = p_count + 1;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- Test
CALL CountCardiologyDoctors(@cnt);
SELECT @cnt AS CardiologyDoctors;   -- 2
