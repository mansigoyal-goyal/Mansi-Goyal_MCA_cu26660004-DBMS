-- Database Technologies Lab Sheet 7 (MCA105P)
-- Part E - Trigger Question 10: Own trigger: block fee changes of more than 50% in one UPDATE
-- Run 00_setup.sql once first (creates the database and tables).
-- Re-running this file resets the Doctors data and audit tables.

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

-- RULE: a doctor's ConsultationFee cannot be raised or cut by more than 50% in a
-- single UPDATE. This catches data-entry mistakes (an extra zero, a misplaced decimal
-- point such as 1200 -> 12000) before they reach billing.
DELIMITER //
CREATE TRIGGER trg_doctors_before_update_fee_jump
BEFORE UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF OLD.ConsultationFee > 0
       AND ABS(NEW.ConsultationFee - OLD.ConsultationFee) > OLD.ConsultationFee * 0.5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: fee change of more than 50% is not allowed in one update';
    END IF;
END //
DELIMITER ;

-- Test
-- 1) Allowed: 1200 -> 1320 (+10%)
UPDATE Doctors SET ConsultationFee = 1320 WHERE DoctorID = 201;
SELECT * FROM Doctors WHERE DoctorID = 201;

-- 2) Blocked: 1200 would become 12000 (a typo). Fails with ERROR 1644 (45000)
UPDATE Doctors SET ConsultationFee = 12000 WHERE DoctorID = 205;
SELECT * FROM Doctors WHERE DoctorID = 205;   -- fee unchanged: 1300.00
