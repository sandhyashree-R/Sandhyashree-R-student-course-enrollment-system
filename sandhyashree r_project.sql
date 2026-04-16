CREATE DATABASE student_project;
USE student_project;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);
CREATE TABLE enrollment (
    enroll_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    UNIQUE(student_id, course_id),
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    exam_date DATE,
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);
CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_id INT UNIQUE,
    marks INT,
    grade CHAR(2),
    FOREIGN KEY(exam_id) REFERENCES exams(exam_id)
);
INSERT INTO students(name, age, gender) VALUES
('Arjun', 20, 'Male'),
('Nayana', 21, 'Female'),
('Ravi', 22, 'Male'),
('Divya', 20, 'Female');
INSERT INTO courses(course_name, credits) VALUES
('Database Systems', 4),
('Python Programming', 3),
('Statistics', 4),
('Machine Learning', 5);
INSERT INTO enrollment(student_id, course_id, enroll_date) VALUES
(1, 1, '2024-01-15'),
(1, 2, '2024-01-16'),
(2, 1, '2024-01-15'),
(3, 3, '2024-01-20'),
(4, 4, '2024-01-22');

INSERT INTO exams(student_id, course_id, exam_date) VALUES
(1, 1, '2024-02-20'),
(1, 2, '2024-02-21'),
(2, 1, '2024-02-20'),
(4, 4, '2024-02-25');

INSERT INTO results(exam_id, marks, grade) VALUES
(1, 85, 'A'),
(2, 78, 'B'),
(3, 92, 'A'),
(4, 65, 'C');
SELECT * FROM students;
SELECT * FROM courses;
SELECT s.name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;
SELECT s.name, c.course_name, r.marks
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;
SELECT s.name, r.marks
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN students s ON e.student_id = s.student_id
ORDER BY r.marks DESC
LIMIT 1;
SELECT s.name
FROM students s
LEFT JOIN enrollment e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
SELECT c.course_name
FROM courses c
LEFT JOIN exams e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;
SELECT c.course_name
FROM courses c
LEFT JOIN exams e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;
SELECT c.course_name
FROM courses c
LEFT JOIN exams e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;
SELECT c.course_name, AVG(r.marks) AS avg_marks
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;
SELECT s.name
FROM results r
JOIN exams e ON r.exam_id = e.exam_id
JOIN students s ON e.student_id = s.student_id
WHERE r.grade = 'A';
SELECT *
FROM exams
WHERE MONTH(exam_date) = 2;
SELECT marks,
CASE
    WHEN marks >= 85 THEN 'A'
    WHEN marks >= 70 THEN 'B'
    WHEN marks >= 50 THEN 'C'
    ELSE 'F'
END AS grade
FROM results;
SELECT marks,
CASE
    WHEN marks >= 85 THEN 'A'
    WHEN marks >= 70 THEN 'B'
    WHEN marks >= 50 THEN 'C'
    ELSE 'F'
END AS grade
FROM results;
SELECT marks,
CASE
    WHEN marks >= 85 THEN 'A'
    WHEN marks >= 70 THEN 'B'
    WHEN marks >= 50 THEN 'C'
    ELSE 'F'
END AS grade
FROM results;
SELECT s.name, COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.name
ORDER BY total_courses DESC
LIMIT 1;


