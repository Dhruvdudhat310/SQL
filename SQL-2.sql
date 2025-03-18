create database TestDemo;

use TestDemo;

CREATE TABLE student (
    student_id INT PRIMARY KEY,       -- Unique identifier for each student
    first_name VARCHAR(50) NOT NULL,   -- First name of the student
    last_name VARCHAR(50) NOT NULL,    -- Last name of the student
    date_of_birth DATE,                -- Date of birth
    email VARCHAR(100),                -- Email address
    phone_number VARCHAR(15),          -- Phone number
    enrollment_date DATE,              -- Date when the student enrolled
    major VARCHAR(100),                -- Major subject the student is enrolled in
    gpa DECIMAL(3, 2)                  -- Grade point average, e.g., 3.75
);

INSERT INTO student (student_id, first_name, last_name, date_of_birth, email, phone_number, enrollment_date, major, gpa)
VALUES
(1, 'John', 'Doe', '2000-04-15', 'john.doe@example.com', '123-456-7890', '2023-09-01', 'Computer Science', 3.75),
(2, 'Jane', 'Smith', '1999-12-05', 'jane.smith@example.com', '987-654-3210', '2022-09-01', 'Mathematics', 3.85),
(3, 'Alice', 'Johnson', '2001-06-20', 'alice.johnson@example.com', '555-555-5555', '2024-01-15', 'Physics', 3.60),
(4, 'Bob', 'Williams', '2000-11-10', 'bob.williams@example.com', '444-444-4444', '2023-09-01', 'Biology', 3.95),
(5, 'Charlie', 'Brown', '2001-01-30', 'charlie.brown@example.com', '333-333-3333', '2024-01-15', 'Chemistry', 3.50),
(6, 'David', 'Davis', '2002-08-18', 'david.davis@example.com', '222-222-2222', '2024-01-15', 'Engineering', 3.80),
(7, 'Eva', 'Martinez', '2000-03-25', 'eva.martinez@example.com', '111-111-1111', '2023-09-01', 'Psychology', 3.65);

Alter table Student
ADD Standard varchar(30);

Alter table Student
alter column Standard text;

Alter table Student
drop column Standard;

Execute sys.sp_rename 'Student','Studentdemo'

---------------------------------------------------------------------------------------------------
--30-01-2025--
---------------------------------------------------------------------------------------------------
/*Arithmetic Operators*/
Select 10 + 5 as Addition, 10 - 5 as Substraction, 10 * 5 as Multiplication, 10 / 5 as Division,
10 % 3 as Modulus;
select name, salary, salary = 5000 as Increasedsalary from employees;

/*Comparison Operators*/
select * from employees where salary > 70000;

/*Logical Operators*/
select * from employees where salary > 50000 AND department = 'IT';
select * from employees where salary BETWEEN 20000 AND 50000;

/*Bitwise Operators*/
/* 0101 & 0011 = 0001 */
select 5 & 3 as BitwiseAND, 5 | 3 as BitwiseOR, 5 ^ 3 as BitwiseXOR;

/*Compond Operators*/
Declare @x as int
SET @x = 10;
SET @x += 5;
SELECT @x as X;

/*Special Operators*/
select * from employees where salary between 30000 and 60000;

select * from employees where department in ('IT','HR','Finance');

select * from employees where name like 'A%';

select * from employees where Department IS NULL;

---------------------------------------------------------------------------------------------------
--03-02-2025--
---------------------------------------------------------------------------------------------------
CREATE TABLE EMP {
EMP_ID INT IDENTITY PRIMARY KEY,
ENAME VARCHAR(100) NOT NULL,
EEMAIL VARCHAR(255) UNIQUE,
ESALARY DECIMAL(10,2) CHECK (ESALARY > 30000),
EDEPT_ID INT,
ESTATUS VARCHAR(20) DEFAULT 'ACTIVE',
CONSTRAINT FK_DEPT FOREIGN KEY (EDEPT_ID) REFERENCES (DEPT)() 
};

--USE OF KEYS AND CONSTRAINTS 
--KEYS ALWAYS AT COLUMN LEVEAL 
--CONSTRAINTS CAN BE AT COLUMN AND TABLE LEVEL
--1. NOT NULL
--2. UNIQUE
--3. CHECK
--4. DEFAULT
--5. PRIMARY KEY / FOREIGN KEY

--AGGREGATE FUNCTION
SELECT * FROM EMP;
SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM EMP;
SELECT SUM(SALARY) AS TOTAL_EMPLOYEES FROM EMP;
SELECT AVG(SALARY) AS AVG_SALARY FROM EMP;
SELECT MIN(SALARY) AS LOWEST_SALARY FROM EMP;
SELECT MAX(SALARY) AS HIGHEST_SALARY FROM EMP;

--ORDER
-- SELECT, FROM(OPTIONAL), WHERE, GROUP BY, HAVING, ORDER BY
-- SELECT, FROM(OPTIONAL), WHERE, ORDER BY

--CLAUSES IN SQL
--WHERE, ORDER BY, GROUP BY, HAVING
SELECT * FROM EMP WHERE SALARY > 50000;

SELECT * FROM EMP ORDER BY SALARY DESC;

SELECT EDEPT_ID, COUNT(*) AS TOTAL_EMP
FROM EMP
GROUP BY DEPT_ID;

SELECT EDEPT_ID, COUNT(*) AS TOTAL_EMP
FROM EMP
GROUP BY DEPT_ID;

SELECT  COUNT(*), SALARY 
FROM EMP
WHERE SALARY > 50000
GROUP BY DEPT
HAVING COUNT(*) > 5
ORDER BY DESC;

---------------------------------------------------------------------------------------------------
--04-02-2025 -- view --> virtual table 
---------------------------------------------------------------------------------------------------

TABLE_1 LOGIN_ ---> ID --> PK, USERNAME, PASSWORD
TABLE_2 EMPLOYEE --> ID, NAME, SALARY, ID --> FK

--SYNTAX
CREATE VIEW VIEW_EXA
AS
SELECT EID, ENAME, SALARY, USERNAME 
FROM EMPLOYEE, LOGIN_;

-- VIWE TABLE ALWAYS REMAINS UNTIL USER CAN NOT FROP
DROP VIEW VIEW_EXA;

-- SINGLE TABLE
CREATE VIEW QUE1
AS
SELECT NAME, SALARY FROM EMP
WHERE SALARY > 20000;

SELECT * FROM QUE1;

-- MULTIPLE VALUE 
CREATE VIEW QUE2
AS
SELECT NAME, SALARY, DEPT_NAME FROM EMP, DEPARTMENT --> FATCH FROM TWO TABLES
WHERE SALARY > 20000;

SELECT * FROM QUE2;

--UPDATE VIWE TABLE DATA
UPDATE QUE1
SET DEPT_NAME = 'HR'
WHERE NAME = 'JOHN';

--- 2 TYPES OF VIEW
--1) UPDATABLE VIEW ---> update --> DML COMMANDS
--2) READABLE VIEW ---> fetch --> use select

--QUESTIONS--
--INPACT ON BASE TABLE?

CREATE TABLE LOGIN1 (
ID INT PRIMARY KEY,
USERNAME varchar(100),
PASSWORD VARCHAR(100)
);


INSERT INTO LOGIN1
VALUES (1, 'DHRUV', 'DH310'),
(2, 'RAJ', 'RJ505'),
(3, 'ASHISH', 'AS019'),
(4, 'SMIT', 'SM051'),
(5, 'JASH', 'JA081'),
(6, 'MAITRY', 'MA210'),
(7, 'MANN', 'MA550'),
(8, 'KEVAL', 'KE710')

CREATE TABLE EMPLOYEE (
ID INT,
NAME varchar(100),
SALARY MONEY,
EID INT,
FOREIGN KEY(EID) REFERENCES LOGIN1(ID)
);

INSERT INTO EMPLOYEE 
VALUES (1,'DHRUV',50000,1),
(2,'RAJ',40000,2),
(3,'ASHISH',35000,3),
(4,'SMIT',22000,4),
(5,'JASH',15000,5),
(6,'MAITRY',40000,6),
(7,'MANN',33000,7),
(8,'KEVAL',20000,8);

-- IF WE ARE CREATING VIEW FROM MULTIPLE TABLE WE HAVE TO GIVE CONDITION 
-- OTHERWISE IT GENERATE WRONG VIEW TABLE

--VIEW FROM SINGLE TABLE 
CREATE VIEW VIEW1
AS
SELECT ID,NAME,SALARY 
FROM EMPLOYEE;

SELECT * FROM VIEW1;

--VIEW FROM MULTIPLE TABLE
CREATE VIEW VIEW2
AS
SELECT EID,NAME,SALARY,PASSWORD
FROM EMPLOYEE,LOGIN1
WHERE EMPLOYEE.EID = LOGIN1.ID; ----> THIS CONDITION IS COMPALSOURY

SELECT * FROM VIEW2;
 
 --ALL THE INSERT, UPDATE AND DELETE SYNTAXES ARE THE SAME AS REAL TABLE 

---------------------------------------------------------------------------------
--06-02-2025-- (INDEXES)
---------------------------------------------------------------------------------
/*
 index : Indexes are used to retrieve data from the database more quickly 
 than otherwise. The users cannot see the indexes, they are just used to 
 speed up searches/queries.
*/

--TYPE OF INDEX
--1. SINGLE INDEX
--2. MULTIPLE INDEX
--3. CLUSTERED INDEX --> ONLY ONE (UNIQUE + PRIMARY COLUMN APPLY)
--4. NON-CLUSTERED INDEX

CREATE CLUSTERED INDEX IDX_TABLE_NAME
ON TABLE_NAME(ID); --> ID MUST BE UNIQUE AND (PRIMARY) (CLUSTERED INDEX) 1 PAR TABLE

CREATE INDEX IDX_SALARY
ON TABLE_NAME(SALARY); --> (SINGLE COLUMN INDEX) NON-CLUSTERED BY DEFAULT

CREATE UNIQUE INDEX IDX_UNIQUE_NAME
ON TABLE_NAME(NAME); --> (UNIQUE INDEX) CANT DUPLICATE NAME 

CREATE INDEX IDX_DEPT_SALARY
ON TABLE_NAME(DEPARTMENT,SALARY); --> COMPOSITE (MULTIPLE COLUMN INDEX)

--ALTER AND RENAME
EXEC SP_RENAME ' TABLE_NAME.OLDINDEX', 'NEWINDEX', 'INDEX';

--SHOW ALL THE INDEX
EXEC SP_HELPINDEX 'TABLE_NAME';

-----------------------------------------------------------------------------------------
--10-02-2025
-----------------------------------------------------------------------------------------
-- SUB QUERIES
--KEY WORDS :- SELECT, WHERE, HAVING (SELECT, INSERT, UPDATE, DELETE)
--DYNAMIC DECLARATION OF ANY COLUMN AND TABLE
--WE CAN CREATE VIRTUAL COLUMN AND TABLE 

--1). Find employees who have a salary greater than the average salary.
SELECT NAME, SALARY 
FROM EMPLOYEE 
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

--2). Retrieve the usernames of employees who earn more than ₹30,000.
SELECT USERNAME 
FROM LOGIN1 
WHERE ID IN (SELECT EID FROM EMPLOYEE WHERE SALARY > 30000);

--3). Find the employee with the highest salary.
SELECT NAME, SALARY 
FROM EMPLOYEE 
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

--4). Get the names of employees who have the same salary as any other employee.
SELECT NAME, SALARY 
FROM EMPLOYEE 
WHERE SALARY IN (SELECT SALARY FROM EMPLOYEE GROUP BY SALARY HAVING COUNT(*) > 1);

--5). Find employees whose salaries are higher than the salary of 'JASH'
SELECT NAME, SALARY 
FROM EMPLOYEE 
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE NAME = 'JASH');


