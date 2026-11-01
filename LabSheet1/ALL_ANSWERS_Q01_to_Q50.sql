-- ============================================================
-- Lab Sheet 1 - SETUP (run this FIRST, and again any time you want to start from scratch)
-- Database Technologies (MCA105P) | MySQL / MariaDB syntax
-- ============================================================
DROP DATABASE IF EXISTS lab1_db;
CREATE DATABASE lab1_db;
USE lab1_db;

-- ============================================================
-- Q01 | Section A (Easy) | Create Table
-- Question: Write a DDL statement to create an empty table named departments with an integer
-- dept_id as the primary key and a dept_name of up to 50 characters.
-- ============================================================
CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Verify
DESCRIBE departments;

-- ============================================================
-- Q02 | Section A (Easy) | Create Table
-- Question: Write a DDL query to create a table employees with an emp_id (Primary Key),
-- first_name (VARCHAR 30), and salary (DECIMAL 10,2).
-- ============================================================
CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    first_name VARCHAR(30),
    salary     DECIMAL(10,2)
);

-- Verify
DESCRIBE employees;

-- ============================================================
-- Q03 | Section A (Easy) | Create Table
-- Question: Create a table projects with project_id (Primary Key), project_name (VARCHAR
-- 100), and start_date using the standard DATE data type.
-- ============================================================
CREATE TABLE projects (
    project_id   INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date   DATE
);

-- Verify
DESCRIBE projects;

-- ============================================================
-- Q04 | Section A (Easy) | Create Table
-- Question: Create a table audit_logs storing log_id (Primary Key), action (TEXT), and
-- created_at using TIMESTAMP.
-- ============================================================
CREATE TABLE audit_logs (
    log_id     INT PRIMARY KEY,
    action     TEXT,
    created_at TIMESTAMP
);

-- Verify
DESCRIBE audit_logs;

-- ============================================================
-- Q05 | Section A (Easy) | Create Table
-- Question: Write a DDL query to create a table products with product_id (Primary Key),
-- product_name (VARCHAR 50), and is_available using BOOLEAN.
-- ============================================================
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50),
    is_available BOOLEAN
);

-- Verify
DESCRIBE products;

-- ============================================================
-- Q06 | Section A (Easy) | Create Table
-- Question: Create a table system_settings with setting_id (SMALLINT Primary Key),
-- setting_key (VARCHAR 50), and setting_value (VARCHAR 100).
-- ============================================================
CREATE TABLE system_settings (
    setting_id    SMALLINT PRIMARY KEY,
    setting_key   VARCHAR(50),
    setting_value VARCHAR(100)
);

-- Verify
DESCRIBE system_settings;

-- ============================================================
-- Q07 | Section A (Easy) | ALTER - Add Column
-- Question: Write an ALTER command to add a new column email (VARCHAR 100) to the existing
-- employees table.
-- ============================================================
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

-- Verify
DESCRIBE employees;

-- ============================================================
-- Q08 | Section A (Easy) | ALTER - Drop Column
-- Question: Write an ALTER statement to remove the is_available column from the products
-- table.
-- ============================================================
ALTER TABLE products
DROP COLUMN is_available;

-- Verify
DESCRIBE products;

-- ============================================================
-- Q09 | Section A (Easy) | RENAME Table
-- Question: Write the SQL DDL command to rename the table departments to dept_units.
-- ============================================================
RENAME TABLE departments TO dept_units;
-- Alternative: ALTER TABLE departments RENAME TO dept_units;

-- Verify
SHOW TABLES;

-- ============================================================
-- Q10 | Section A (Easy) | TRUNCATE
-- Question: Write a command to empty all records from audit_logs without dropping the table
-- structure.
-- ============================================================
TRUNCATE TABLE audit_logs;

-- Verify
SELECT COUNT(*) AS rows_left FROM audit_logs;
DESCRIBE audit_logs;

-- ============================================================
-- Q11 | Section A (Easy) | Create Table
-- Question: Create a table user_profiles with user_id (Primary Key), bio (TEXT), and
-- profile_pic (BLOB).
-- ============================================================
CREATE TABLE user_profiles (
    user_id     INT PRIMARY KEY,
    bio         TEXT,
    profile_pic BLOB
);

-- Verify
DESCRIBE user_profiles;

-- ============================================================
-- Q12 | Section A (Easy) | Create Table - ENUM
-- Question: Create a table ticket_orders with ticket_id (Primary Key) and priority_level
-- restricted to ENUM('Low', 'Medium', 'High').
-- ============================================================
CREATE TABLE ticket_orders (
    ticket_id      INT PRIMARY KEY,
    priority_level ENUM('Low', 'Medium', 'High')
);

-- Verify
DESCRIBE ticket_orders;

-- ============================================================
-- Q13 | Section A (Easy) | DROP Table
-- Question: Write the DDL statement to drop the entire products table permanently from the
-- database.
-- ============================================================
DROP TABLE products;

-- Verify
SHOW TABLES;

-- ============================================================
-- Q14 | Section A (Easy) | ALTER - Modify Column
-- Question: Write a command to change the data type of email in employees from VARCHAR(100)
-- to VARCHAR(150).
-- ============================================================
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(150);

-- Verify
DESCRIBE employees;

-- ============================================================
-- Q15 | Section A (Easy) | Create Table
-- Question: Create a table sensor_data with read_id (BIGINT Primary Key) and temperature
-- (FLOAT).
-- ============================================================
CREATE TABLE sensor_data (
    read_id     BIGINT PRIMARY KEY,
    temperature FLOAT
);

-- Verify
DESCRIBE sensor_data;

-- ============================================================
-- Q16 | Section A (Easy) | ALTER - Add Composite PK
-- Question: Add a composite primary key to an existing table student_courses using columns
-- student_id (INT) and course_id (INT).
-- ============================================================
-- Prerequisite: the question says the table already exists, so it is created here without a primary key.
CREATE TABLE student_courses (
    student_id INT NOT NULL,
    course_id  INT NOT NULL
);

-- Answer:
ALTER TABLE student_courses
ADD PRIMARY KEY (student_id, course_id);

-- Verify
DESCRIBE student_courses;

-- ============================================================
-- Q17 | Section A (Easy) | ALTER - Rename Column
-- Question: Rename column first_name to given_name in the employees table using DDL.
-- ============================================================
ALTER TABLE employees
RENAME COLUMN first_name TO given_name;
-- Older MySQL (5.7) alternative:
-- ALTER TABLE employees CHANGE first_name given_name VARCHAR(30);

-- Verify
DESCRIBE employees;

-- ============================================================
-- Q18 | Section A (Easy) | ALTER - Drop Primary Key
-- Question: Write an ALTER command to drop the primary key constraint from the
-- system_settings table.
-- ============================================================
ALTER TABLE system_settings
DROP PRIMARY KEY;

-- Verify
DESCRIBE system_settings;

-- ============================================================
-- Q19 | Section A (Easy) | Create Table
-- Question: Create a table clients with client_id (INT Primary Key) and registration_time
-- (TIME).
-- ============================================================
CREATE TABLE clients (
    client_id         INT PRIMARY KEY,
    registration_time TIME
);

-- Verify
DESCRIBE clients;

-- ============================================================
-- Q20 | Section A (Easy) | ALTER - Re-add Primary Key
-- Question: Re-add a primary key to column client_id in clients after table creation using
-- an ALTER command.
-- ============================================================
-- The table already has a primary key from Q19, so drop it first, then add it again.
ALTER TABLE clients
DROP PRIMARY KEY;

ALTER TABLE clients
ADD PRIMARY KEY (client_id);

-- Verify
DESCRIBE clients;

-- ============================================================
-- Q21 | Section B (Medium) | Create Table - Composite PK
-- Question: Create a table order_items representing a line-item in an order. Use a composite
-- primary key consisting of order_id (INT) and item_id (INT), along with quantity (INT) and
-- unit_price (DECIMAL 8,2).
-- ============================================================
CREATE TABLE order_items (
    order_id   INT,
    item_id    INT,
    quantity   INT,
    unit_price DECIMAL(8,2),
    PRIMARY KEY (order_id, item_id)
);

-- Verify
DESCRIBE order_items;

-- ============================================================
-- Q22 | Section B (Medium) | Create Table - Composite PK
-- Question: Create a table event_schedules with event_id (INT), venue_id (INT), event_date
-- (DATE), and duration_hours (TINYINT). Make event_id and venue_id the composite primary
-- key.
-- ============================================================
CREATE TABLE event_schedules (
    event_id       INT,
    venue_id       INT,
    event_date     DATE,
    duration_hours TINYINT,
    PRIMARY KEY (event_id, venue_id)
);

-- Verify
DESCRIBE event_schedules;

-- ============================================================
-- Q23 | Section B (Medium) | ALTER - Add Multiple Columns
-- Question: Modify the employees table to add two new columns in a single DDL statement:
-- hire_date (DATE) and is_active (BOOLEAN).
-- ============================================================
ALTER TABLE employees
ADD COLUMN hire_date DATE,
ADD COLUMN is_active BOOLEAN;

-- Verify
DESCRIBE employees;

-- ============================================================
-- Q24 | Section B (Medium) | ALTER - Drop + Modify
-- Question: In the table employees, drop column email and change salary data type to
-- DECIMAL(12,2) in a single ALTER statement.
-- ============================================================
ALTER TABLE employees
DROP COLUMN email,
MODIFY COLUMN salary DECIMAL(12,2);

-- Verify
DESCRIBE employees;

-- ============================================================
-- Q25 | Section B (Medium) | ALTER - Add Composite PK
-- Question: Given table inventory with columns warehouse_id (INT) and sku (VARCHAR 20),
-- write an ALTER statement to add a composite primary key to both columns.
-- ============================================================
-- Prerequisite: the 'given' table is created here without a primary key.
CREATE TABLE inventory (
    warehouse_id INT         NOT NULL,
    sku          VARCHAR(20) NOT NULL
);

-- Answer:
ALTER TABLE inventory
ADD PRIMARY KEY (warehouse_id, sku);

-- Verify
DESCRIBE inventory;

-- ============================================================
-- Q26 | Section B (Medium) | ALTER - Modify Column
-- Question: Write a DDL command to change the bio column in user_profiles from TEXT to
-- MEDIUMTEXT.
-- ============================================================
ALTER TABLE user_profiles
MODIFY COLUMN bio MEDIUMTEXT;

-- Verify
DESCRIBE user_profiles;

-- ============================================================
-- Q27 | Section B (Medium) | ALTER - Column Position
-- Question: Add a column middle_name (VARCHAR 30) to employees specifically positioned right
-- after given_name.
-- ============================================================
ALTER TABLE employees
ADD COLUMN middle_name VARCHAR(30) AFTER given_name;

-- Verify
DESCRIBE employees;

-- ============================================================
-- Q28 | Section B (Medium) | Create Table
-- Question: Create a table geolocations with location_id (INT Primary Key), latitude
-- (DECIMAL 9,6), and longitude (DECIMAL 9,6).
-- ============================================================
CREATE TABLE geolocations (
    location_id INT PRIMARY KEY,
    latitude    DECIMAL(9,6),
    longitude   DECIMAL(9,6)
);

-- Verify
DESCRIBE geolocations;

-- ============================================================
-- Q29 | Section B (Medium) | Create Table - ENUM
-- Question: Create a table user_accounts with user_id (BIGINT Primary Key), account_type
-- (ENUM('Standard', 'Premium', 'Admin')), and created_timestamp (TIMESTAMP).
-- ============================================================
CREATE TABLE user_accounts (
    user_id           BIGINT PRIMARY KEY,
    account_type      ENUM('Standard', 'Premium', 'Admin'),
    created_timestamp TIMESTAMP
);

-- Verify
DESCRIBE user_accounts;

-- ============================================================
-- Q30 | Section B (Medium) | Create Table
-- Question: Create a table device_logs with log_id (BIGINT Primary Key), ip_address (VARCHAR
-- 45), and payload (LONGBLOB).
-- ============================================================
CREATE TABLE device_logs (
    log_id     BIGINT PRIMARY KEY,
    ip_address VARCHAR(45),
    payload    LONGBLOB
);

-- Verify
DESCRIBE device_logs;

-- ============================================================
-- Q31 | Section B (Medium) | ALTER - Change Primary Key
-- Question: Drop the existing primary key of order_items, add a new column order_item_id
-- (INT) at the first position, and set it as the new primary key in a single ALTER command
-- chain.
-- ============================================================
ALTER TABLE order_items
DROP PRIMARY KEY,
ADD COLUMN order_item_id INT FIRST,
ADD PRIMARY KEY (order_item_id);

-- Verify
DESCRIBE order_items;

-- ============================================================
-- Q32 | Section B (Medium) | ALTER - Change Column
-- Question: Convert start_date column in table projects to project_year with data type YEAR
-- using a single DDL statement.
-- ============================================================
ALTER TABLE projects
CHANGE COLUMN start_date project_year YEAR;

-- Verify
DESCRIBE projects;

-- ============================================================
-- Q33 | Section B (Medium) | Create Table
-- Question: Create a table document_store with doc_id (INT Primary Key), doc_title (VARCHAR
-- 255), and content (LONGTEXT).
-- ============================================================
CREATE TABLE document_store (
    doc_id    INT PRIMARY KEY,
    doc_title VARCHAR(255),
    content   LONGTEXT
);

-- Verify
DESCRIBE document_store;

-- ============================================================
-- Q34 | Section B (Medium) | ALTER - Rename Column
-- Question: Change column content in document_store to doc_body while maintaining its
-- LONGTEXT type.
-- ============================================================
ALTER TABLE document_store
CHANGE COLUMN content doc_body LONGTEXT;

-- Verify
DESCRIBE document_store;

-- ============================================================
-- Q35 | Section B (Medium) | CREATE TABLE ... LIKE
-- Question: Write a DDL command to create an empty table structure employees_archive
-- identical in layout and constraints to the employees table.
-- ============================================================
CREATE TABLE employees_archive LIKE employees;

-- Verify
DESCRIBE employees_archive;

-- ============================================================
-- Q36 | Section B (Medium) | DROP IF EXISTS
-- Question: Write a DDL query to drop table employees_archive safely only if it exists in
-- the schema.
-- ============================================================
DROP TABLE IF EXISTS employees_archive;

-- Verify
SHOW TABLES;

-- ============================================================
-- Q37 | Section B (Medium) | Create Table
-- Question: Create a table financial_ledger with entry_id (BIGINT Primary Key), debit
-- (DECIMAL 15,4), and credit (DECIMAL 15,4).
-- ============================================================
CREATE TABLE financial_ledger (
    entry_id BIGINT PRIMARY KEY,
    debit    DECIMAL(15,4),
    credit   DECIMAL(15,4)
);

-- Verify
DESCRIBE financial_ledger;

-- ============================================================
-- Q38 | Section B (Medium) | ALTER - Add Column FIRST
-- Question: Add transaction_date (DATETIME) as the absolute first column in the
-- financial_ledger table using ALTER.
-- ============================================================
ALTER TABLE financial_ledger
ADD COLUMN transaction_date DATETIME FIRST;

-- Verify
DESCRIBE financial_ledger;

-- ============================================================
-- Q39 | Section B (Medium) | Create Table
-- Question: Create a table measurements with sample_id (INT Primary Key) and value (DOUBLE).
-- ============================================================
CREATE TABLE measurements (
    sample_id INT PRIMARY KEY,
    `value`   DOUBLE
);
-- (backticks around `value` are optional in MySQL but make the name safe)

-- Verify
DESCRIBE measurements;

-- ============================================================
-- Q40 | Section B (Medium) | Create Table
-- Question: Create a table app_users with user_id (INT Primary Key) and status_code
-- (TINYINT).
-- ============================================================
CREATE TABLE app_users (
    user_id     INT PRIMARY KEY,
    status_code TINYINT
);

-- Verify
DESCRIBE app_users;

-- ============================================================
-- Q41 | Section C (Hard) | Create Table - Design
-- Question: Design a transactions table with an xact_id (BIGINT Primary Key), user_id (INT),
-- amount (DECIMAL 10,2), channel (ENUM('Web', 'Mobile', 'ATM')), status (VARCHAR 20), and
-- xact_time (TIMESTAMP).
-- ============================================================
CREATE TABLE transactions (
    xact_id   BIGINT PRIMARY KEY,
    user_id   INT,
    amount    DECIMAL(10,2),
    channel   ENUM('Web', 'Mobile', 'ATM'),
    status    VARCHAR(20),
    xact_time TIMESTAMP
);

-- Verify
DESCRIBE transactions;

-- ============================================================
-- Q42 | Section C (Hard) | Create Table - Composite PK
-- Question: Create a high-throughput logging table system_events using event_id (BIGINT),
-- node_id (SMALLINT), event_payload (TEXT), and logged_time (TIMESTAMP). Define a composite
-- primary key on (event_id, node_id).
-- ============================================================
CREATE TABLE system_events (
    event_id      BIGINT,
    node_id       SMALLINT,
    event_payload TEXT,
    logged_time   TIMESTAMP,
    PRIMARY KEY (event_id, node_id)
);

-- Verify
DESCRIBE system_events;

-- ============================================================
-- Q43 | Section C (Hard) | ALTER - Redesign PK
-- Question: Redesign existing table clients in a single ALTER statement: drop its current
-- primary key, add region_code (CHAR 3), and set (client_id, region_code) as the new
-- composite primary key.
-- ============================================================
ALTER TABLE clients
DROP PRIMARY KEY,
ADD COLUMN region_code CHAR(3) NOT NULL,
ADD PRIMARY KEY (client_id, region_code);

-- Verify
DESCRIBE clients;

-- ============================================================
-- Q44 | Section C (Hard) | ALTER - Rename + Modify + Add
-- Question: You have a table raw_data with column temp_val (VARCHAR 50). In a single ALTER
-- command, rename column temp_val to converted_val, change its type to DECIMAL(6,3), and add
-- column processed_at (TIMESTAMP) right after it.
-- ============================================================
-- Prerequisite: the 'existing' table is created here.
CREATE TABLE raw_data (
    temp_val VARCHAR(50)
);

-- Answer (CHANGE COLUMN renames and changes the type in one go):
ALTER TABLE raw_data
CHANGE COLUMN temp_val converted_val DECIMAL(6,3),
ADD COLUMN processed_at TIMESTAMP AFTER converted_val;

-- Verify
DESCRIBE raw_data;

-- ============================================================
-- Q45 | Section C (Hard) | Create Table - 3-column PK
-- Question: Create a student_enrollments junction table with student_id (INT), course_id
-- (INT), semester (VARCHAR 10), and enrollment_date (DATE). Set a 3-column composite primary
-- key across (student_id, course_id, semester).
-- ============================================================
CREATE TABLE student_enrollments (
    student_id      INT,
    course_id       INT,
    semester        VARCHAR(10),
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id, semester)
);

-- Verify
DESCRIBE student_enrollments;

-- ============================================================
-- Q46 | Section C (Hard) | ALTER - Refactor PK
-- Question: Refactor student_enrollments by dropping the composite key (student_id,
-- course_id, semester), adding enrollment_id (BIGINT) as the first column, and establishing
-- it as the new primary key in a single statement.
-- ============================================================
ALTER TABLE student_enrollments
DROP PRIMARY KEY,
ADD COLUMN enrollment_id BIGINT FIRST,
ADD PRIMARY KEY (enrollment_id);

-- Verify
DESCRIBE student_enrollments;

-- ============================================================
-- Q47 | Section C (Hard) | Create Table
-- Question: Create table file_metadata with file_id (INT Primary Key), file_path (VARCHAR
-- 500), file_size_bytes (BIGINT), and checksum (CHAR 64).
-- ============================================================
CREATE TABLE file_metadata (
    file_id         INT PRIMARY KEY,
    file_path       VARCHAR(500),
    file_size_bytes BIGINT,
    checksum        CHAR(64)
);

-- Verify
DESCRIBE file_metadata;

-- ============================================================
-- Q48 | Section C (Hard) | ALTER - Multiple Changes
-- Question: Modify file_metadata schema in one ALTER statement: Change file_id from INT to
-- BIGINT, alter file_path to TEXT, and drop column checksum.
-- ============================================================
ALTER TABLE file_metadata
MODIFY COLUMN file_id BIGINT NOT NULL,
MODIFY COLUMN file_path TEXT,
DROP COLUMN checksum;

-- Verify
DESCRIBE file_metadata;

-- ============================================================
-- Q49 | Section C (Hard) | Create + Rename
-- Question: Write the SQL DDL statements to: (1) Create a table sensor_readings with
-- composite PK (sensor_id INT, recorded_at TIMESTAMP) and column reading (FLOAT), and (2)
-- Rename sensor_readings to historical_sensor_readings.
-- ============================================================
-- (1) Create table
CREATE TABLE sensor_readings (
    sensor_id   INT,
    recorded_at TIMESTAMP NOT NULL,
    reading     FLOAT,
    PRIMARY KEY (sensor_id, recorded_at)
);

-- (2) Rename table
RENAME TABLE sensor_readings TO historical_sensor_readings;

-- Verify
DESCRIBE historical_sensor_readings;

-- ============================================================
-- Q50 | Section C (Hard) | Create + Modify
-- Question: Write the SQL DDL statements to: (1) Create table application_logs with log_id
-- (BIGINT Primary Key), level (ENUM('DEBUG', 'INFO', 'WARN', 'ERROR')), message (TEXT),
-- execution_time (DOUBLE), and created_at (DATETIME), and (2) Modify the level column to
-- VARCHAR(10).
-- ============================================================
-- (1) Create table
CREATE TABLE application_logs (
    log_id         BIGINT PRIMARY KEY,
    level          ENUM('DEBUG', 'INFO', 'WARN', 'ERROR'),
    message        TEXT,
    execution_time DOUBLE,
    created_at     DATETIME
);

-- (2) Modify column
ALTER TABLE application_logs
MODIFY COLUMN level VARCHAR(10);

-- Verify
DESCRIBE application_logs;

