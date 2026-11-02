exp-01.sql

-- DBMS LAB PROGRAM
-- Student Management System
-- Oracle SQL*Plus

-- 1. Create Student table
CREATE TABLE Student (
    Student_ID NUMBER(5) PRIMARY KEY,
    Student_Name VARCHAR2(50) NOT NULL,
    Department VARCHAR2(20),
    Age NUMBER(3),
    Marks NUMBER(5,2)
);

-- 2. Insert student records
INSERT INTO Student VALUES (101, 'Arun', 'CSE', 20, 85);
INSERT INTO Student VALUES (102, 'Priya', 'ECE', 21, 90);
INSERT INTO Student VALUES (103, 'Kumar', 'CSE', 20, 75);
INSERT INTO Student VALUES (104, 'Divya', 'IT', 19, 88);
INSERT INTO Student VALUES (105, 'Ravi', 'ECE', 22, 65);
INSERT INTO Student VALUES (106, 'Anu', 'CSE', 20, 95);
INSERT INTO Student VALUES (107, 'Bala', 'IT', 21, 70);
INSERT INTO Student VALUES (108, 'Meena', 'ECE', 20, 82);

-- 3. Save the records
COMMIT;

-- 4. Display all records
SELECT * FROM Student;

-- 5. Display students from CSE
SELECT *
FROM Student
WHERE Department = 'CSE';

-- 6. Display students with marks above 80
SELECT Student_ID, Student_Name, Marks
FROM Student
WHERE Marks > 80;

-- 7. Display students in descending order of marks
SELECT Student_ID, Student_Name, Marks
FROM Student
ORDER BY Marks DESC;

-- 8. Find the total number of students
SELECT COUNT(*) AS Total_Students
FROM Student;

-- 9. Find average marks
SELECT ROUND(AVG(Marks), 2) AS Average_Marks
FROM Student;

-- 10. Find highest marks
SELECT MAX(Marks) AS Highest_Marks
FROM Student;

-- 11. Find lowest marks
SELECT MIN(Marks) AS Lowest_Marks
FROM Student;

-- 12. Department-wise student count
SELECT Department, COUNT(*) AS Total_Students
FROM Student
GROUP BY Department;

-- 13. Department-wise average marks
SELECT Department, ROUND(AVG(Marks), 2) AS Average_Marks
FROM Student
GROUP BY Department;

-- 14. Update marks
UPDATE Student
SET Marks = 92
WHERE Student_ID = 102;

-- 15. Display updated record
SELECT *
FROM Student
WHERE Student_ID = 102;

-- 16. Add email column
ALTER TABLE Student
ADD Email VARCHAR2(100);

-- 17. Update email
UPDATE Student
SET Email = 'arun@example.com'
WHERE Student_ID = 101;

-- 18. Display students whose names start with A
SELECT *
FROM Student
WHERE Student_Name LIKE 'A%';

-- 19. Display students with marks between 70 and 90
SELECT *
FROM Student
WHERE Marks BETWEEN 70 AND 90;

-- 20. Display distinct departments
SELECT DISTINCT Department
FROM Student;

-- 21. Create a department table
CREATE TABLE Department (
    Dept_ID NUMBER(3) PRIMARY KEY,
    Dept_Name VARCHAR2(20) UNIQUE
);

-- 22. Insert department records
INSERT INTO Department VALUES (1, 'CSE');
INSERT INTO Department VALUES (2, 'ECE');
INSERT INTO Department VALUES (3, 'IT');

COMMIT;

-- 23. Display department records
SELECT * FROM Department;

-- 24. Delete a student record
DELETE FROM Student
WHERE Student_ID = 108;

-- 25. Display remaining students
SELECT * FROM Student
ORDER BY Student_ID;

-- 26. Count students in each department
SELECT Department, COUNT(*) AS Student_Count
FROM Student
GROUP BY Department
HAVING COUNT(*) >= 2;

-- 27. Find students scoring above average
SELECT Student_ID, Student_Name, Marks
FROM Student
WHERE Marks > (
    SELECT AVG(Marks)
    FROM Student
);

-- 28. Roll back is only useful before COMMIT
-- ROLLBACK;

-- 29. Describe the Student table
DESC Student;

-- 30. Describe the Department table
DESC Department;
