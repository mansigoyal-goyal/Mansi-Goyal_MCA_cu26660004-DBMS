-- Database Technologies Lab Sheet 8 (MCA105P)
-- Q7. update_medicine_stock(IN p_id, IN p_quantity)
-- Run 00_setup.sql once first (creates the database and tables).
-- This file resets the Medicines data every time it runs.

USE Hospital_Functions_Lab;

DELETE FROM Medicines;
INSERT INTO Medicines VALUES
(301,'Paracetamol',25,100),
(302,'Amoxicillin',80,50),
(303,'Cetirizine',35,75),
(304,'Omeprazole',60,40),
(305,'Azithromycin',120,25);

DROP PROCEDURE IF EXISTS update_medicine_stock;

DELIMITER //
CREATE PROCEDURE update_medicine_stock(IN p_id INT, IN p_quantity INT)
BEGIN
    UPDATE Medicines
    SET Stock = Stock + p_quantity
    WHERE MedicineID = p_id;

    -- show the changed row
    SELECT * FROM Medicines WHERE MedicineID = p_id;
END //
DELIMITER ;

-- Test
SELECT * FROM Medicines WHERE MedicineID = 305;   -- before: Stock 25
CALL update_medicine_stock(305, 15);              -- after:  Stock 40
SELECT * FROM Medicines;
