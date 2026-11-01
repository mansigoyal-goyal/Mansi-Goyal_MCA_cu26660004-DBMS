-- Database Technologies Lab Sheet 8 (MCA105P)
-- Q10. medicine_report() using medicine_stock_value()
-- Run 00_setup.sql once first (creates the database and tables).
-- Stock status rules: below 30 = Low Stock, 30 to 59 = Medium Stock, 60 and above = In Stock.

USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS medicine_stock_value;

DELIMITER //
CREATE FUNCTION medicine_stock_value(p_unit_price DECIMAL(10,2), p_stock INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN p_unit_price * p_stock;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS medicine_report;

DELIMITER //
CREATE PROCEDURE medicine_report()
BEGIN
    SELECT MedicineID,
           MedicineName,
           UnitPrice,
           Stock,
           medicine_stock_value(UnitPrice, Stock) AS StockValue,
           CASE
               WHEN Stock < 30 THEN 'Low Stock'
               WHEN Stock < 60 THEN 'Medium Stock'
               ELSE 'In Stock'
           END AS StockStatus
    FROM Medicines;
END //
DELIMITER ;

-- Test
CALL medicine_report();
