# Student Course Enrollment System

## Project Description
This project is a database management system developed using MySQL. It manages student information, courses, enrollments, exams, and results in an organized manner.

The system demonstrates how relational databases can be used to handle academic data using SQL queries.

---

## Database Structure

The project consists of the following tables:

- Students – Stores student details  
- Courses – Stores course information  
- Enrollment – Manages student-course relationships  
- Exams – Records exam details  
- Results – Stores marks and grades  

---

## ER Diagram Concept

- Students and Courses have a many-to-many relationship  
- This relationship is resolved using the Enrollment table  
- Each student can enroll in multiple courses  
- Each course can have multiple students  
- Exams are conducted for each student in a course  
- Each exam has one corresponding result  

---

## Features / Queries Implemented

- List all students  
- Show all courses  
- Students enrolled in a specific course  
- Count students in each course  
- Display exam marks with student and course  
- Find the highest scoring student  
- Students not enrolled in any course  
- Courses with no exams conducted  
- Average marks per course  
- Students with grade 'A'  
- List exams conducted in February  
- Convert marks to grade automatically  
- Show student with most enrollments  

---

## Technologies Used

- MySQL  
- SQL (Structured Query Language)  
- MySQL Workbench  

---

## How to Run the Project

1. Open MySQL Workbench  
2. Create the database:
   ```sql
   CREATE DATABASE student_project;
   USE student_project;
