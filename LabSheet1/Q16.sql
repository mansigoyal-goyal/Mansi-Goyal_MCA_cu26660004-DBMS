-- ============================================================
-- Q16 | Section A (Easy) | ALTER - Add Composite PK
-- Question: Add a composite primary key to an existing table student_courses using columns
-- student_id (INT) and course_id (INT).
-- ============================================================
USE lab1_db;

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
