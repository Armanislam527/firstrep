show databases
CREATE DATABASE testdb;
USE testdb;
show tables;
CREATE TABLE accounts (
    id INT PRIMARY KEY,
    balance DECIMAL(10,2)
);

INSERT INTO accounts VALUES (1, 1000.00), (2, 500.00);

-- Start transaction
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
-- ROLLBACK;  -- Uncomment to cancel
COMMIT;

SELECT * FROM accounts;
SELECT * FROM audit_log;

DELIMITER //
CREATE PROCEDURE GetBalance(IN account_id INT)
BEGIN
    SELECT balance FROM accounts WHERE id = account_id;
END //
DELIMITER ;

CALL GetBalance(1);
CREATE TABLE audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_update_balance
AFTER UPDATE ON accounts
FOR EACH ROW
BEGIN
    INSERT INTO audit_log(message)
    VALUES (CONCAT('Account ', OLD.id, ' updated from ', OLD.balance, ' to ', NEW.balance));
END//
DELIMITER ;

UPDATE accounts SET balance = balance + 50 WHERE id = 1;
SELECT * FROM audit_log;

USE employees;
SHOW TABLES;
SELECT COUNT(*) FROM employees;
USE school;
show tables;
select * from students;
DESCRIBE students;
DESC students;
SELECT name FROM students;
SELECT * FROM students WHERE age > 22;
DELETE FROM students WHERE name = 'Sara';
UPDATE students SET age = 25 WHERE name = 'Arman';
CREATE TABLE courses (course_id INT, title VARCHAR(100), credits INT);
INSERT INTO courses VALUES (101, 'Database Systems', 3);
-- add one more...
SELECT title FROM courses;
desc courses;
EXIT;
USE school;

DROP TABLE students;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 0 AND age <= 150),
    email VARCHAR(100) UNIQUE
);
INSERT INTO students (id, name, age, email)
VALUES (1, 'Arman Islam', 24, 'arman@example.com');
INSERT INTO students (id, name, age, email)
VALUES (1, 'Another Arman', 30, 'other@example.com');
INSERT INTO students (id, name, age, email)
VALUES (2, NULL, 22, 'sara@example.com');
desc students;
DROP TABLE courses;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3
);
INSERT INTO courses VALUES
(101, 'Database Systems', 3),
(102, 'IoT Fundamentals', 4);
select * from courses;
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 101, '2026-01-18');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (999, 101, '2026-01-18');
select * from enrollments;
delete from enrollments where student_id=1;


SELECT students.name, courses.title
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.course_id;
DESC enrollments;
-- Students aged 20 to 25
SELECT * FROM students
WHERE age >= 20 AND age <= 25;

-- Names starting with 'A'
SELECT name FROM students
WHERE name LIKE 'A%';

-- Names containing 'man'
SELECT name FROM students
WHERE name LIKE '%man%';

SELECT title FROM courses
WHERE course_id IN (101, 102);
-- Find students without an email (should be none, thanks to NOT NULL!)
SELECT * FROM students WHERE email IS NULL;
SELECT name, age FROM students ORDER BY age DESC;
SELECT name, age FROM students ORDER BY age ASC;
SELECT COUNT(*) FROM students;
SELECT AVG(age) FROM students;
SELECT MIN(age) AS youngest, MAX(age) AS oldest FROM students;
SELECT SUM(credits) FROM courses;
SELECT course_id, COUNT(*) AS student_count
FROM enrollments
GROUP BY course_id;
SELECT courses.title, COUNT(*) AS enrolled_students
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY courses.course_id, courses.title;

SELECT courses.title, COUNT(*) AS enrolled
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
GROUP BY courses.course_id
HAVING enrolled > 1;
SELECT students.name, COUNT(enrollments.course_id) AS course_count
FROM students
LEFT JOIN enrollments ON students.id = enrollments.student_id
GROUP BY students.id, students.name;

SELECT AVG(students.age) AS average_age
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.course_id
WHERE courses.title = 'Database Systems';


SELECT courses.title
FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
WHERE enrollments.student_id IS NULL;
SELECT COUNT(*) AS total_enrollments FROM enrollments;
USE school;
SET autocommit = OFF;
SELECT course_id, title, credits FROM courses;


START TRANSACTION;

UPDATE courses SET credits = credits - 50 WHERE course_id = 101;
UPDATE courses SET credits = credits + 50 WHERE course_id = 102;

-- Check intermediate state (only you can see this!)
SELECT course_id, title, credits FROM courses;
COMMIT;
ROLLBACK;