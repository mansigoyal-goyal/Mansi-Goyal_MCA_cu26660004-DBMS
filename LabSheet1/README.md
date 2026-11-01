# Lab Sheet 1 - DDL Commands (MCA105P)

All answers are written in **MySQL / MariaDB** syntax (MySQL Workbench, XAMPP, MySQL CLI).

## Files
| File | Contents |
|---|---|
| `00_Setup_Database.sql` | Creates (and resets) the database `lab1_db`. **Run first.** |
| `Q01.sql` ... `Q50.sql` | One file per question (question text is in the comments at the top of each file) |
| `ALL_ANSWERS_Q01_to_Q50.sql` | Setup + all 50 answers in one script |
| `SAMPLE_OUTPUT.txt` | Output produced when the answers are run in order Q01 -> Q50 |

## How to run
1. Run `00_Setup_Database.sql`.
2. Run `Q01.sql`, `Q02.sql`, ... **in order**. Later questions ALTER tables created by earlier ones
   (e.g. Q07 alters `employees` from Q02, Q31 alters `order_items` from Q21).
3. Every file ends with a `Verify` section (DESCRIBE / SHOW TABLES) so you can see the result.

MySQL command line:  `mysql -u root -p < 00_Setup_Database.sql`  then  `mysql -u root -p lab1_db < Q01.sql`

## Notes
* Q16, Q25 and Q44 refer to "existing" tables (`student_courses`, `inventory`, `raw_data`) that no earlier question creates,
  so each of those files first creates the table (marked "Prerequisite") and then gives the answer.
* Q20 drops the primary key first, because `clients` already has one from Q19.
* Q17 uses `RENAME COLUMN` (MySQL 8.0+ / MariaDB 10.5+); the `CHANGE` alternative for MySQL 5.7 is in the file.
* Q35 uses `CREATE TABLE ... LIKE`, which copies columns, keys and indexes.
