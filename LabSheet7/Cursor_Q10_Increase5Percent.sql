-- Database Technologies Lab Sheet 7 (MCA105P)
-- Part D - Cursor Question 10: 5% increase for doctors with ConsultationFee of at least 1200
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

DROP PROCEDURE IF EXISTS IncreaseHighFees5Percent;

DELIMITER //
CREATE PROCEDURE IncreaseHighFees5Percent()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_fee DECIMAL(10,2);

    DECLARE cur CURSOR FOR
        SELECT DoctorID, ConsultationFee FROM Doctors WHERE ConsultationFee >= 1200;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_fee;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE Doctors
        SET ConsultationFee = ROUND(v_fee * 1.05, 2)
        WHERE DoctorID = v_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- Test
SELECT * FROM Doctors;          -- before
CALL IncreaseHighFees5Percent();
SELECT * FROM Doctors;          -- after: 201 = 1260.00, 203 = 1575.00, 205 = 1365.00
