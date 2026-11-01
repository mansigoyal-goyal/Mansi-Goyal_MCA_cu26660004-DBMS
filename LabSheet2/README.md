# Lab Sheet 2 - DML Commands, Subqueries, Aggregations & Conditional Logic (MCA105P)

All answers are written in **MySQL / MariaDB** syntax (MySQL Workbench, XAMPP, MySQL CLI).

## Files
| File | Contents |
|---|---|
| `00_Setup_Tables.sql` | Creates database `lab2_db`, the 3 tables and the 5-row sample data. **Run first.** |
| `Q01.sql` ... `Q50.sql` | One file per question (question text is in the comments at the top of each file) |
| `ALL_ANSWERS_Q01_to_Q50.sql` | Setup + all 50 answers in one script |
| `SAMPLE_OUTPUT.txt` | Output produced when the answers are run in order Q01 -> Q50 |

## How to run
1. Run `00_Setup_Tables.sql` (this also resets the data).
2. Run `Q01.sql`, `Q02.sql`, ... **in order**. Many questions change the data (INSERT / UPDATE / DELETE), and later questions build on those changes (e.g. Q12 deletes Diana, Q23 deactivates old employees, Q46 uses those flags).
3. To redo a question from a clean state, run the setup file again and replay the questions up to that one.

MySQL command line:  `mysql -u root -p < 00_Setup_Tables.sql`  then  `mysql -u root -p lab2_db < Q01.sql`

## Notes
* `emp_id` 107 and 108 are used for the two employees in Q21 (the question doesn't specify IDs).
* `orders.order_id` is `AUTO_INCREMENT`, so Q03 creates order 5006.
* Q34 and Q46 use a derived table / join because MySQL does not allow a subquery on the table being deleted from (Error 1093).
* No foreign keys are defined, so deleting departments (Q39) does not fail.
