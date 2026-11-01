-- Q21: Increase salaries in department 10 by 15%, then conditionally
-- increase its budget. If the budget exceeds 520,000, undo only the budget
-- change; keep the salary update and commit it.
USE company_db;
DELIMITER //

CREATE PROCEDURE q21_salary_and_budget()
BEGIN
    DECLARE v_budget DECIMAL(12,2);

    START TRANSACTION;

    UPDATE employees
       SET salary = salary * 1.15
     WHERE dept_id = 10;

    SAVEPOINT sp_salary_done;

    UPDATE departments
       SET budget = budget + 50000.00
     WHERE dept_id = 10;

    SELECT budget INTO v_budget
      FROM departments
     WHERE dept_id = 10;

    IF v_budget > 520000.00 THEN
        ROLLBACK TO SAVEPOINT sp_salary_done;
    END IF;

    COMMIT;
END //

DELIMITER ;

CALL q21_salary_and_budget();
DROP PROCEDURE q21_salary_and_budget;

-- Given budget: 500,000. After adding 50,000 it is 550,000,
-- so the budget change is rolled back while the salary increase is committed.
