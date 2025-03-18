-- COLOMN = ATTRIBUTE
-- ROWS = TUPLE

--USE OF SELECT (SELECT IS LITERAL, IT GOSE WITH ALL THINGS)
SELECT (4+3)*2 --USE AS CALCULATOR
SELECT 'DHRUV' --DISPLAY NAME 
SELECT 'DHRUV', 'RISE' --WITHOUT ATTRIBUTE 
SELECT 'DHRUV' AS NAME, 'RISE' AS DEPARTMENT --WITH ATTRIBUTE NAME
--CONCATINATION OF STRING
SELECT 'SURESH' AS FIRSTNAME, 'PATEL' AS LASTNAME, 'SURESH ' + 'PATEL' AS FULLNAME;

--SCRIPT TO CREATE DB
CREATE DATABASE JAN 
USE JAN

--TO DROP DB
DROP DATABASE JAN

--TO MODIFY DB NAME
ALTER DATABASE JAN
MODIFY NAME = JAN2025;
SP_RENAME <OLDNAME>, <NEWNAME>;

--DISPLAY ALL DATABASES 
EXECUTE SP_DATABASES

--CHANGE TABLE NAME
execute sp_rename 'OLD_TABLE_NAME', 'NEW_TABLE_NAME';

--DISPLAY ALL TABLES
SELECT NAME FROM SYS.TABLES
--DISPLAY WITH CREATING DATE
SELECT NAME, CREATE_DATE FROM SYS.TABLES
--DISPLAY WITH MODIFY DATE
SELECT NAME, CREATE_DATE, MODIFY_DATE FROM SYS.TABLES


--CREATE A NEW TABLE 
CREATE TABLE EMPLOYEEDETAILS (
EID INT,
ENAME VARCHAR(20),
EAGE INT,
DEPARTMENT VARCHAR(20),
SALARY MONEY,
CITY VARCHAR(20)
);

-- FOR INSERTING DATA INTO TABLE ATTRIBUTE MUST BE MATCHED. THEN MOVE TO COMPARE DATA TYPE OF ATTRIBUTE
--INSERT METHOD 1
INSERT INTO EMPLOYEEDETAILS VALUES (1,'SURESH',20,'FS',20000,'VADODARA')
INSERT INTO EMPLOYEEDETAILS VALUES (2,'RAMESH',20,'FS','VADODARA') --NOT ALLOWED
--INSERT METHOD 2
INSERT INTO EMPLOYEEDETAILS(EID,ENAME,EAGE,DEPARTMENT,CITY) 
VALUES (2,'RAMESH',20,'FS','VADODARA')
--INSERT METHOD 3
INSERT INTO EMPLOYEEDETAILS
VALUES (3,'NARESH',23,'QA',30000,'NAVSARI'),
(4,'MAHESH',22,'DA',25000,'ANAND'),
(5,'JAYESH',25,'DS',40000,'AHEMDABAD'),
(6,'KAMESH',24,'DE',30000,'SURAT'),
(7,'HITESH',23,'DA',30000,'VADODARA'),
(8,'PRIYESH',24,'CLOUD',26000,'AHEMDABAD')

INSERT INTO EMPLOYEEDETAILS(EID,ENAME,DEPARTMENT,CITY) 
VALUES (9,'JIGNESH','FS','SURAT')
INSERT INTO EMPLOYEEDETAILS(EID,ENAME,DEPARTMENT,CITY) 
VALUES (10,'JIGNESH','FS','ANAND')

--UPDATE METHOD 1
UPDATE EMPLOYEEDETAILS SET EAGE = 22 WHERE EID =1
--UPDATE METHOD 2 (USE FOR ASSIGN DEFOLT VALUE TO NULL CELL)
UPDATE EMPLOYEEDETAILS SET EAGE = 18 WHERE EAGE IS NULL
--UPDATE METHOD 3
UPDATE EMPLOYEEDETAILS SET SALARY = 25000 --WHERE SALARY IS NOT NULL

--DELETE METHOD 1 
DELETE FROM EMPLOYEEDETAILS WHERE EID = 8
--DELETE METHOD 2
DELETE FROM EMPLOYEEDETAILS WHERE EAGE IS NULL
--DELETE METHOD 3 (ONLY DATA WILL BE DELETED NOT TABLE)
DELETE FROM EMPLOYEEDETAILS
DROP TABLE EMPLOYEEDETAILS
TRUNCATE TABLE EMPLOYEEDETAILS

--(DELETE) ONLY DATA WILL BE DELETED NOT TABLE SCHEMA (ADD CONDIIONS TO DELETE DATA)
--(DROP) DATA AND TABLE BOTH WILL BE DELETED
--(TRUNCATE) DATA WILL BE DELETED NOT TABLE SCHEMA (CAN'T ADD CONDITIONS TO DELETE DATA)

--WHERE CLAUSE 
SELECT * FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'QA'

SELECT * FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'DA' OR DEPARTMENT = 'QA'
--DONT USE *
SELECT EID,ENAME FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'DA' OR DEPARTMENT = 'QA'
--ALIAS ONLY APPLICABLE AT THE RUN TIME (IT IS NOT PERMANENT CHANGE)
SELECT EID,ENAME AS FIRSTNAME FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'DA' OR DEPARTMENT = 'QA'

SELECT * FROM EMPLOYEEDETAILS
WHERE (DEPARTMENT = 'DA' AND EAGE = '22') OR CITY = 'ANAND'

SELECT * FROM EMPLOYEEDETAILS
WHERE (DEPARTMENT = 'DA' OR EAGE = '22') AND CITY = 'ANAND'

SELECT * FROM EMPLOYEEDETAILS
WHERE SALARY <> 25000

--AND AND OR REQUIRED BREACKET OTHERWISE MEANING OF THE QUERY WILL CHANGE
-- (<> OR !=) = NOT EQUAL TO 
-- >  = GREATER THAN 
-- <  = LESS THAN
-- >= AND <=
--LIKE OPERATOR (HOME WORK)

--USE OF BETWEEN WORD (BELLOW BOTH QUERY GIVE THE OUTPUT)
SELECT * FROM EMPLOYEEDETAILS
WHERE SALARY >= 25000 AND SALARY <= 30000

SELECT * FROM EMPLOYEEDETAILS
WHERE SALARY BETWEEN 25000 AND 30000

SELECT * FROM EMPLOYEEDETAILS

---------------------------------------------------------------------------------------------------
--30-01-2025--  (Assignment 1)  where clause
---------------------------------------------------------------------------------------------------

--1) Return the name column from Employeedetails where the Name column is equal to "Suresh".
SELECT ENAME FROM EMPLOYEEDETAILS 
WHERE ENAME = 'SURESH';

--2) Find the top 100 rows from Employeedetails where the Salary is not equal to 0.
SELECT TOP 2 * FROM EMPLOYEEDETAILS 
WHERE SALARY <> 0;

--3) Return all rows and columns from Employeedetails where the employee’s Name starts with a 
--letter less than “D”.
SELECT * FROM EMPLOYEEDETAILS 
WHERE ENAME < 'D';

--4) Return all rows and columns from Employeedetails where the City column is equal to "New 
--York".
SELECT * FROM EMPLOYEEDETAILS 
WHERE CITY = 'VADODARA';

--5) Return the Name column from Employeedetails where the Name is equal to "Ramesh". Give 
--the column alias "Employee Name".
SELECT ENAME AS Employee_Name FROM EMPLOYEEDETAILS 
WHERE ENAME = 'RAMESH';

--6) Using the Employeedetails table, find all employees with a Department equal to "QA" or all 
--employees who have an Age greater than 23 and a Salary less than 50000.  
SELECT * FROM EMPLOYEEDETAILS 
WHERE (DEPARTMENT = 'QA' OR EAGE > 23) AND SALARY < 50000;

--7) Find all employees from Employeedetails who have a Department in the list of: "DA", "FS", 
--and "DE". Complete this query twice – once using the IN operator in the WHERE clause and a 
--second time using multiple OR operators.
SELECT * FROM EMPLOYEEDETAILS 
WHERE DEPARTMENT IN ('DA','FS','DE');

SELECT * FROM EMPLOYEEDETAILS 
WHERE DEPARTMENT = 'DA' OR DEPARTMENT = 'FS' OR DEPARTMENT = 'DE';

--8) Find all employees from Employeedetails whose Name starts with the letter “A”.  
SELECT ENAME FROM EMPLOYEEDETAILS 
WHERE ENAME LIKE 'A%';

--9) Find all employees from Employeedetails whose Name ends with the letter “a”.  
SELECT ENAME FROM EMPLOYEEDETAILS 
WHERE ENAME LIKE '%a';

--10) Return all columns from the Employeedetails table for all employees who have a 
--Department. That is, return all rows where the Department column does not contain a NULL 
--value.
SELECT * FROM EMPLOYEEDETAILS 
WHERE DEPARTMENT <> NULL;

--11) Return the EID and Salary columns from Employeedetails for all employees who have a 
--Department and whose Salary exceeds 20,000. 
SELECT EID,SALARY FROM EMPLOYEEDETAILS 
WHERE DEPARTMENT IS NOT NULL AND SALARY > 20000;

---------------------------------------------------------------------------------------------------
--31-01-2025-- --SELECT STATEMENT
---------------------------------------------------------------------------------------------------

--1) Retrieve all rows from the Employeedetails table. Return only the EID column.
SELECT EID FROM EMPLOYEEDETAILS;

--2) Retrieve all rows from the Employeedetails table. Return the EID and Name columns. 
SELECT EID,ENAME FROM EMPLOYEEDETAILS;

--3) Retrieve the top 20 percent of rows from the Employeedetails table. Return the EID, Name and 
--Age columns. 
SELECT TOP 20 PERCENT EID, ENAME, EAGE FROM EMPLOYEEDETAILS;

--4) Retrieve the top 5 rows from the Employeedetails table. Return the EID, Name and Age columns. 
--Give the EID column an alias "Employee ID", and the Name column an alias "Employee Name".
SELECT TOP 5 EID AS Employee_ID, ENAME as Employee_Name, EAGE FROM EMPLOYEEDETAILS;

--5) Return all rows and all columns from the Employeedetails table. 
SELECT * FROM EMPLOYEEDETAILS;

--6) Retrieve the top 50 percent of rows and all columns from the Employeedetails table.
SELECT TOP 50 PERCENT * FROM EMPLOYEEDETAILS;

--7) Return the Name column from the Employeedetails table. Give this column an alias "Employee 
--Name".
SELECT ENAME AS Employee_Name FROM EMPLOYEEDETAILS;

--8) Return the top 4 rows from Employeedetails.
SELECT TOP 4 * FROM EMPLOYEEDETAILS;

--9) Return all rows and all columns from the Employeedetails table.
SELECT * FROM EMPLOYEEDETAILS;

--10) Return the top 3 rows and columns from the Employeedetails table.
SELECT TOP 3 EID, ENAME, DEPARTMENT FROM EMPLOYEEDETAILS;

--11) DELETE ONLY ONE CITY WHOS ID = 2
--NOTE: WE CAN NOT DELETE ONE RECORD, BUT WE CAN UPDATE IT TO NULL
UPDATE EMPLOYEEDETAILS SET CITY = NULL WHERE ID = 5;

-- WRONG QUERY
DELETE FROM EMPLOYEEDETAILS WHERE EID = 5;

-- HOW TO ADD BONUS TO SALARY AND STORE IT INTO NEW ATTRIBUTE
ALTER TABLE EMPLOYEEDETAILS ADD BONUS MONEY;

DELETE FROM EMPLOYEEDETAILS WHERE BONUS IS NOT NULL;

UPDATE EMPLOYEEDETAILS SET BONUS = 2000 WHERE EID IN(1,4,8);
UPDATE EMPLOYEEDETAILS SET BONUS = 3000 WHERE EID IN(5,7,9);
UPDATE EMPLOYEEDETAILS SET BONUS = 2500 WHERE EID IN(2,3,6,10);

SELECT ENAME, SALARY, BONUS, SALARY + BONUS AS INCREASEDSALARY FROM EMPLOYEEDETAILS;

-- EVERY SALARY INCREASED BY 5000
SELECT ENAME, SALARY, SALARY + 5000 AS INCREASEDSALARY FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEEDETAILS;

---------------------------------------------------------------------------------------------------
--03-02-2025--
---------------------------------------------------------------------------------------------------
--(ALTER-ALTER)
ALTER TABLENAME
ALTER COLUMNAME DATATYPE SIZE;

--(ALTER-ADD)
ALTER TABLENAME 
ADD COLUMNNAME DATATYPE SIZE;

--(ALTER-DROP)
ALTER TABLENAME 
DROP COLUMN COLUMNNAME;

--(DELETE) ONLY DATA WILL BE DELETED NOT TABLE SCHEMA (ADD CONDIIONS TO DELETE DATA)
--(DROP) DATA AND TABLE BOTH WILL BE DELETED
--(TRUNCATE) DATA WILL BE DELETED NOT TABLE SCHEMA (CAN'T ADD CONDITIONS TO DELETE DATA)

DROP TABLE EMPLOYEEDETAILS;

--CREATE A NEW TABLE WITH ( IDENTITY = INDENTITY(SEED,ENCREMENT) IDENTITY(101,2) ) AUTO INCREMENT
CREATE TABLE EMPLOYEEDETAILS (
EID INT IDENTITY,
ENAME VARCHAR(20),
EAGE INT,
DEPARTMENT VARCHAR(20),
SALARY MONEY,
CITY VARCHAR(20)
);

--INSERT METHOD 1
INSERT INTO EMPLOYEEDETAILS 
VALUES ('SURESH',20,'FS',20000,'VADODARA');

--INSERT METHOD 2
INSERT INTO EMPLOYEEDETAILS 
VALUES ('RAMESH',20,'FS',30000,'VADODARA');

--IDENTITY USE FOR ONLY 1 COLUMN PER TABLE
--IDENTITY CAN BE ALWAYS INT ATTRIBUTE

--WE CAN ADD ID ( NOT AUTO INCREMENT )
SET IDENTITY_INSERT EMPLOYEEDETAILS ON;

INSERT INTO EMPLOYEEDETAILS(EID,ENAME,EAGE,DEPARTMENT,CITY) 
VALUES (5,'RAMESH',20,'FS','VADODARA');

-- (AUTO INCREMENT)
SET IDENTITY_INSERT EMPLOYEEDETAILS OFF;
INSERT INTO EMPLOYEEDETAILS 
VALUES ('DHRUV',22,'QA',30000,'VADODARA');

INSERT INTO EMPLOYEEDETAILS 
VALUES ('RAJ',22,'DS',30000,'VADODARA'),
('NARESH',23,'QA',30000,'NAVSARI'),
('MAHESH',22,'DA',25000,'ANAND'),
('JAYESH',25,'DS',40000,'AHEMDABAD'),
('KAMESH',24,'DE',30000,'SURAT'),
('HITESH',23,'DA',30000,'VADODARA');

SELECT * FROM EMPLOYEEDETAILS;

---------------------------------------------------------------------------------------------------
--04-02-2025-- Aggregate Function --> MAX, MIN, AVG, COUNT, SUM
---------------------------------------------------------------------------------------------------
-- AGGREGATE FUNCTIONS ONLY USE FOR ATTRIBUTE

SELECT MAX(SALARY) FROM EMPLOYEEDETAILS;    
SELECT MIN(SALARY) FROM EMPLOYEEDETAILS; 
SELECT AVG(SALARY) FROM EMPLOYEEDETAILS;
SELECT COUNT(ENAME) FROM EMPLOYEEDETAILS; --NOT INCLUDE NULL DATA COUNT
SELECT COUNT(DISTINCT ENAME) FROM EMPLOYEEDETAILS; --NOT INCLUDE DUPLICATE DATA COUNT
SELECT COUNT(*) FROM EMPLOYEEDETAILS; -- INCLUDE NULL DATA COUNT
SELECT SUM(SALARY) FROM EMPLOYEEDETAILS;

---------------------------------------------------------------------------------------------------
------ AGGREGATE FUNCTION PRACTICE -----
---------------------------------------------------------------------------------------------------

--1) How many rows are in the Employeedetails table?  
SELECT COUNT(*) AS TOTAL_ROWS FROM EMPLOYEEDETAILS;

--2) How many rows in the Employeedetails table do not have a NULL value in the Age column? 
SELECT COUNT(EAGE) AS ROWS_WITHOUT_NULL_VALUES FROM EMPLOYEEDETAILS;

--3) What is the average Salary for QA Department? 
SELECT AVG(SALARY) AS AVG_SALARY FROM EMPLOYEEDETAILS 
WHERE DEPARTMENT = 'QA';

--5) How expensive is the highest Salary in the Employeedetails table? 
SELECT MAX(SALARY) AS HIGHEST_SALARY FROM EMPLOYEEDETAILS;

--6) What is the total salary expenditure for the entire company.
SELECT SUM(SALARY) AS SALARY_EXPENDITURE FROM EMPLOYEEDETAILS;

--7) What is the average age of employees in the "FS" department? 
SELECT AVG(EAGE) AS AVG_AGE FROM EMPLOYEEDETAILS
WHERE DEPARTMENT = 'FS';

--8)What is the youngest employee's age in the company? 
SELECT MIN(EAGE) AS YOUNGEST_EMP FROM EMPLOYEEDETAILS;

--9) How many different cities are employees located in? 
SELECT COUNT(DISTINCT CITY) AS TOTAL_DIS_CITY FROM EMPLOYEEDETAILS;

---------------------------------------------------------------------------------------------------
------ GROUP BY HAVING ------
---------------------------------------------------------------------------------------------------
--1) Find the departments with an average salary greater than 20,000.
SELECT DEPARTMENT, AVG(SALARY)
FROM EMPLOYEEDETAILS
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 20000;

--2) List the cities where the average employee age is greater than 20.
SELECT CITY, AVG(EAGE)
FROM EMPLOYEEDETAILS
GROUP BY CITY
HAVING AVG(EAGE) > 20;

--3) Find the departments with more than 5 employees.
SELECT DEPARTMENT, COUNT(*)
FROM EMPLOYEEDETAILS
GROUP BY DEPARTMENT
HAVING COUNT(*) > 5;

--4) List the cities where the total salary of all employees exceeds 30,000.
SELECT CITY, SUM(SALARY)
FROM EMPLOYEEDETAILS
GROUP BY CITY
HAVING SUM(SALARY) > 30000;

--5) Find the departments where the average age of employees is between 20 and 25.
SELECT DEPARTMENT, AVG(EAGE)
FROM EMPLOYEEDETAILS
GROUP BY DEPARTMENT
HAVING AVG(EAGE) BETWEEN 20 AND 25;

--6) Find the city where the number of emplyees is greater than 2 and having avrage salary 
--less than 50,000.
SELECT CITY, COUNT(CITY) AS COUNT_CITY, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEEDETAILS
GROUP BY CITY
HAVING COUNT(CITY)>2 AND AVG(SALARY) < 50000;

SELECT * FROM EMPLOYEEDETAILS;

---------------------------------------------------------------------------------
--10-02-2025-- (PRIMARY KEY AND FOREIGN KEY)
---------------------------------------------------------------------------------
--INSERT ORDER DOSENT MATTER PRIMARY KEY ALWAYS ARANGE RECORDS IN INCREASING ORDER
--CANT DELETE DATA IN THE PRIMARY KEY TABLE
--DELETE DATA IN FOREIGN TABLE 

--PK TABLE(REFERENCED TABLE) 
--INSERT --> YES
--UPDATE --> NO
--DELETE --> NO

--FK TABLE(REFERNCING TABLE)
--INSERT --> 50-50
--UPDATE --> NO
--DELETE --> YES

--CREATE A NEW TABLE 

CREATE TABLE DEPARTMENT (
DID INT PRIMARY KEY,
DNAME VARCHAR(40),
LOCATION VARCHAR(40)
);

INSERT INTO DEPARTMENT 
VALUES (10,'FULLSTACK','FIRSTFLOOR'),
(20,'CLOUD','SECONDFLOOR'),
(30,'QA','GROUNDFLOOR');

CREATE TABLE EMP (
EID INT,
ENAME VARCHAR(20),
DID INT FOREIGN KEY REFERENCES DEPARTMENT(DID)
);

INSERT INTO EMP VALUES (1,'SURESH',10);
INSERT INTO EMP VALUES (2,'MAHESH',20);
INSERT INTO EMP VALUES (3,'JAYESH',30);
INSERT INTO EMP VALUES (4,'NARESH',40); --- GIVES ERROR

SELECT * FROM EMP;
SELECT * FROM DEPARTMENT;

------------------------------------------------------------------------------------------
CREATE TABLE DEPARTMENT1 (
DID INT PRIMARY KEY,
DNAME VARCHAR(40),
LOCATION VARCHAR(40)
);

INSERT INTO DEPARTMENT1 
VALUES (10,'FULLSTACK','FIRSTFLOOR'),
(20,'CLOUD','SECONDFLOOR'),
(30,'QA','GROUNDFLOOR');

CREATE TABLE EMP1 (
EID INT,
ENAME VARCHAR(20),
DID INT FOREIGN KEY REFERENCES DEPARTMENT (DID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO EMP1 VALUES (1,'SURESH',10);
INSERT INTO EMP1 VALUES (2,'MAHESH',20);
INSERT INTO EMP1 VALUES (3,'JAYESH',30);

SELECT * FROM EMP1;
SELECT * FROM DEPARTMENT1;

-- SET OERATORS --(UNION, INTERSECT, EXCEPT)
--NUMBER OF COLUMNS MUST BE SAME
--ORDER OF THE COLUMN MUST BE SAME 
--DATATYPE OF THE COLUMN  MUST BE SAME 

CREATE TABLE BANK_BRD(
BID INT,
BNAME VARCHAR(20),
LOCATION VARCHAR(20)
);

INSERT INTO BANK_BRD
VALUES (10,'SBI','ATLADRA'),
(20,'HDFC','AKOTA'),
(30,'ICICI','ALKAPURI');

CREATE TABLE BANK_AHMD(
BID INT,
BNAME VARCHAR(20),
LOCATION VARCHAR(20)
);

INSERT INTO BANK_AHMD
VALUES (10,'SBI','ATLADRA'),
(40,'AXIS','CTM'),
(50,'KOTAK','AMBAWADI');

-- UNION :- GIVE ALL RECORDS NOT DUPLICATE
-- UNION ALL :- GIVE ALL RECORDS WITH DUPLICATE VALUES
SELECT * FROM BANK_BRD
UNION 
SELECT * FROM BANK_AHMD;

--INTERSECT :- GIVE SAME RECORD, WHICH IS PRESENT IN BOTH TABLE 
SELECT * FROM BANK_BRD
INTERSECT
SELECT * FROM BANK_AHMD;

--EXCEPT :- DISPLAYS DATA FROM LEFT TABLE WHICH IS NOT PRESENT IN RIGHT TABLE
SELECT * FROM BANK_BRD
EXCEPT
SELECT * FROM BANK_AHMD;

-------------------------------------------------------------------------------------------
--11-02-2025-- [AdventureWorks2022] DATABASES
-------------------------------------------------------------------------------------------
--1. In the person.person table, how many people are associated with each PersomType?
SELECT COUNT(*) AS TOTAL, PERSONTYPE 
FROM PERSON.PERSON
GROUP BY PERSONTYPE;

--2. Using only one query, find out how many products in production.product are the color 
--"red" and how many "black".
SELECT COLOR, COUNT(*) AS PRODUCT_COUNT 
FROM Production.Product
WHERE COLOR IN('RED','BLACK')
GROUP BY COLOR;

--3. Using only sale.saleorderheader, how many sale occurred in each territory between
--july 1, 2005 and december 31,2006? order the results by the sale count in descending order.
SELECT TerritoryID, COUNT(*) AS SALE_COUNT 
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2005/07/01' AND '2006/12/31'
GROUP BY TerritoryID;

--4. Expanding on the previous example, group the result not by the territoryID but by the 
--name of the territory(found in the sale.saleterritory table).
SELECT st.[Name] AS TerritoryName, SUM(soh.[TotalDue]) AS TotalSales
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesTerritory AS st 
ON soh.TerritoryID = st.TerritoryID
GROUP BY st.[Name]
ORDER BY TotalSales DESC

-------------------------------------------------------------------------------------------
--Sorting using the ORDER BY Clause Practice Problems 
-------------------------------------------------------------------------------------------

--1) From the HumanResources.vEmployeeDepartment view, return the FirstName, 
--LastName and JobTitle columns.  Sort the results by the FirstName column in 
--ascending order. 
SELECT FirstName, LastName, JobTitle 
FROM HumanResources.vEmployeeDepartment
ORDER BY FirstName;

--2) Modify the query from question 1 to sort the results by the FirstName column in 
--ascending order and then by the LastName column in descending order. 
SELECT FirstName, LastName 
FROM HumanResources.vEmployeeDepartment
ORDER BY FirstName, LastName desc;

--3) From the Sales.vIndividualCustomer view, return the FirstName, LastName and 
--CountryRegionName columns.  Sort the results by the CountryRegionName column.  
--Use the column ordinal in the ORDER BY clause. 
SELECT FirstName, LastName, CountryRegionName 
FROM Sales.vIndividualCustomer
ORDER BY 3 ASC;

--4) From the Sales.vIndividualCustomer view, return the FirstName, LastName and 
--CountryRegionName columns for those rows with a CountryRegionName that is 
--either “United States” or “France”.  Sort the results by the CountryRegionName 
--column in ascending order. 
SELECT FirstName, LastName, CountryRegionName 
FROM Sales.vIndividualCustomer
WHERE CountryRegionName in ('United States','France')
ORDER BY CountryRegionName;

--5)  From the Sales.vStoreWithDemographics view, return the Name, AnnualSales, 
--YearOpened, SquareFeet, and NumberEmployees columns.  Give the SquareFeet 
--column the alias “Store Size” and the NumberEmployees column the alias “Total 
--Employees”.  Return only those rows with AnnualSales greater than 1,000,000 and 
--with NumberEmployees greater than or equal to 45.  Order your results by the 
--“Store Size” alias in descending order and then by the “Total Employees” alias in 
--descending order. 
SELECT Name, AnnualSales, YearOpened, SquareFeet AS 'Store Size', NumberEmployees AS 'Total Employees'
FROM Sales.vStoreWithDemographics
WHERE AnnualSales > 1000000 AND NumberEmployees >= 45
ORDER BY 'Store Size' DESC, 'Total Employees' DESC;

--6) Find number of employee by gender in HumanResources.Employee.
SELECT Gender, count(*) AS 'Total Employees' 
FROM HumanResources.Employee
GROUP BY Gender;

--7) Count number of products by ProductLine in Production.Product
SELECT COUNT(ProductLine) AS PRODUCTS 
FROM Production.Product;

--8) Write query for number of work orders by status using Production.Workorder
SELECT * FROM Production.Workorder;

SELECT Status, COUNT(WorkOrderID) AS TotalWorkOrders
FROM Production.WorkOrder
GROUP BY Status
ORDER BY TotalWorkOrders DESC;

--9) Fetch number of credit cards by card type.
SELECT CardType, COUNT(CreditCardID) AS TotalCards
FROM Sales.CreditCard
GROUP BY CardType
ORDER BY TotalCards DESC;

------------------------------------------------------------------------------------------
--12-02-2025  -- Joins
------------------------------------------------------------------------------------------

Create Table Student(
ID INT ,
Name VARCHAR(20),
CourseID INT
)

INSERT INTO Student Values
(1, 'Suresh', 10),
(2, 'Mahesh', 20),
(3, 'Jayesh', 30),
(4, 'Ramesh', 40)

Create table Course (
CourseID INT,
Name VARCHAR(20),
Fee Varchar (20)
)

INSERT INTO Course VALUES
(10, 'CLOUD', '20000' ),
(20, 'QA', '15000'),
(30, 'FULLSTACK', '25000'),
(50, 'DEVOPS', '30000'),
(60, 'DATA SCIENCE', '35000')

SELECT * FROM Student
SELECT * FROM Course

SELECT * FROM Student
INNER JOIN Course
ON Student.CourseID = Course.CourseID

SELECT * FROM Student
LEFT JOIN Course
ON Student.CourseID = Course.CourseID

SELECT * FROM Student
RIGHT JOIN Course
ON Student.CourseID = Course.CourseID

SELECT * FROM Student
FULL JOIN Course
ON Student.CourseID = Course.CourseID

SELECT * FROM Student S  -- S IS ALIAS THAT WILL CHANGE TABLENAME OF STUDENT TO S
LEFT JOIN Course C			-- C IS ALIAS THAT WILL CHANGE TABLENAME OF COURSE TO C 
ON S.CourseID = C.CourseID

SELECT * FROM Student
RIGHT JOIN Course
ON Student.CourseID = Course.CourseID

----------------Equi Join-----------------------------------------------------
SELECT * FROM Student, Course WHERE Student. CourseID = Course.CourseID;
----------------NON- Equi Join------------------------------------------------
SELECT * FROM Student, Course WHERE Student. CourseID > Course.CourseID;

--------------------------------------------------------------------------------------------------------------

CREATE TABLE Department2(
DID INT PRIMARY KEY,
DName VARCHAR(30)
)

INSERT INTO Department2 VALUES
(1, 'CLOUD'),
(2, 'AI'),
(3,'QA'),
(4, 'FSW')

CREATE TABLE Employee1(
EID INT PRIMARY KEY,
EName VARCHAR(25),
Salary MONEY,
DID INT Foreign key References Department2 (DID)
)

INSERT INTO Employee1 Values
(101, 'Kartik', 25000, 4),
(102, 'OM', 15000, 3),
(103, 'Sahil', 35000, 1),
(104, 'Dhruv', 40000, 2),
(105, 'Abhishek', 20000, 4)

SELECT * FROM Department2 
INNER JOIN Employee1
on Department2.DID = Employee1.DID

SELECT * FROM Department2 
RIGHT JOIN Employee1
on Department2.DID = Employee1.DID

SELECT * FROM Department2 
LEFT JOIN Employee1
on Department2.DID = Employee1.DID

SELECT * FROM Department2 
FULL JOIN Employee1
on Department2.DID = Employee1.DID

SELECT * FROM Department2
LEFT OUTER JOIN Employee1
on Department2.DID = Employee1.DID

SELECT * FROM Department2 
RIGHT OUTER JOIN Employee1
on Department2.DID = Employee1.DID

SELECT * FROM Department2 
FULL OUTER JOIN Employee1
on Department2.DID = Employee1.DID

SELECT  * FROM Department2
LEFT JOIN Employee1
ON Department2.DID = Employee1.DID
WHERE Employee1.DID is NULL;

SELECT * FROM Department2
RIGHT JOIN Employee1
ON Department2.DID = Employee1.DID
WHERE Department2.DID IS NULL;

SELECT * FROM Department2 
FULL OUTER JOIN Employee1
ON Department2.DID = Employee1.DID
WHERE Department2.DID IS NULL OR Employee1.DID IS NULL;

--------------------------------------------------------------------------------------------
--13-02-2025 -- Continue Joins
--------------------------------------------------------------------------------------------

ALTER TABLE Department2
ADD  Manger_name VARCHAR(25);

UPDATE Department2 set Manger_name = 'Suresh' WHERE DID = 2;
UPDATE Department2 set Manger_name = 'Kamlesh' WHERE DID = 1;
UPDATE Department2 set Manger_name = 'Pooja' WHERE DID = 3;
UPDATE Department2 set Manger_name = 'Elvish' WHERE DID = 4;

--1.List all Employees and their Department Names
SELECT Employee1.EID, Employee1.EName, Department2.DName
FROM Employee1
INNER JOIN Department2 ON Employee1.DID = Department2.DID;

--2.List all Employees and their Department Names, including Employees who  are not assigned.
SELECT Employee1.EID, Employee1.EName, Department2.DName
FROM Employee1
LEFT JOIN Department2 ON Employee1.DID =  Department2.DID;

--3.List all Departments and the Number of Employees in each Department.
SELECT Department2.DID, Department2.DName, COUNT(Employee1.EID) AS employee_count
FROM Department2
JOIN Employee1 ON Department2.DID = Employee1.DID
GROUP BY Department2.DID, Department2.DName;

--4.Find the Employee with Highest Salary.
SELECT TOP 1 * FROM Employee1  
ORDER BY Salary DESC;

--5.List all Employee who  work in the QA Department.
SELECT E.* FROM Employee1 E  
INNER JOIN Department D ON E.DID = D.DID  
WHERE D.DName = 'QA';

--6.List all Departments Managed by 'Suresh'
SELECT * FROM Department2  
WHERE Manger_name = 'Suresh';

--7.List all Employees who work in Departments managed by 'Suresh'.
SELECT E.* FROM Employee1 E  
INNER JOIN Department2 D ON E.DID = D.DID  
WHERE D.Manger_name = 'Suresh';

SELECT * FROM Department2 , Employee1; -------cross join 

SELECT * FROM Department2;
SELECT * FROM Employee1;

------------------------------------------------------------------------------------------
--14-02-2025-- Multiple Joins (DATABASE :- JAN2025)
------------------------------------------------------------------------------------------

CREATE TABLE Employee3 (
EID NVARCHAR(20),
Ename NVARCHAR(40),
Salary MONEY,
MID NVARCHAR(20),
DID NVARCHAR(20)
);

CREATE TABLE Department3 (
DID NVARCHAR(20),
Dname NVARCHAR(40)
);

CREATE TABLE Manager3 (
MID NVARCHAR(20),
Mname NVARCHAR(40),
DID NVARCHAR(20)
);

CREATE TABLE Project3 (
PID NVARCHAR(20),
Pname NVARCHAR(40),
EID NVARCHAR(20)
);

-- Insert into Department3
INSERT INTO Department3 
VALUES ('D001', 'IT'),
('D002', 'HR'),
('D003', 'Finance');

-- Insert into Manager3
INSERT INTO Manager3 
VALUES ('M001', 'Ramesh', 'D001'),
('M002', 'Suresh', 'D002'),
('M003', 'Mahesh', 'D003');

-- Insert into Employee3
INSERT INTO Employee3 
VALUES ('E001', 'Amit', 50000, 'M001', 'D001'),
('E002', 'Sunita', 60000, 'M002', 'D002'),
('E003', 'Ravi', 55000, 'M003', 'D003'),
('E004', 'Anjali', 45000, 'M001', 'D001'),
('E005', 'Raj', 70000, 'M002', 'D002'),
('E006', 'Priya', 52000, NULL, 'D003');

-- Insert into Project3
INSERT INTO Project3 
VALUES ('P001', 'Walmart', 'E001'),
('P002', 'Amazon', 'E002'),
('P003', 'Flipkart', 'E001'),
('P004', 'Snapdeal', 'E004'),
('P005', 'Myntra', 'E003');

/* QUERIES */ --Real Industry Queries--
--(probability)
--90% inner join
--10% left join

/*
inner = match_value
left = inner + left
right = inner + right
full = inner + left + right
*/

--Multiple Joins query
--1. Fetch Employee name & department name they belongs to
SELECT E.Ename, D.Dname
FROM Employee3 E
JOIN Department3 D 
ON E.DID = D.DID;

--2. Fetch all Employee & department name. ---> (All means use left join)
SELECT E.Ename, D.Dname
FROM Employee3 E
LEFT JOIN Department3 D 
ON E.DID = D.DID;

--3. Fetch Employee name, department name, manager name & Project name they are working on
SELECT E.Ename, D.Dname, M.Mname, P.Pname
FROM Employee3 E
LEFT JOIN Department3 D ON E.DID = D.DID
LEFT JOIN Manager3 M ON E.MID = M.MID
LEFT JOIN Project3 P ON E.EID = P.EID;

--4. Fetch Employee who are working on more than 1 project
SELECT E.Ename
FROM Employee3 E
JOIN Project3 P ON E.EID = P.EID
GROUP BY E.Ename
HAVING COUNT(P.PID) > 1;

--5. Fetch Employee who Not working on any project
SELECT E.Ename
FROM Employee3 E
LEFT JOIN Project3 P 
ON E.EID = P.EID
WHERE P.PID IS NULL;

--6. Fetch Employee who are working on Project - Walmart
SELECT E.Ename
FROM Employee3 E
JOIN Project3 P 
ON E.EID = P.EID
WHERE P.Pname = 'Walmart';

----INNER JOIN Practice Problems ---- AdventureWorks2022 DATABASE----

/*
1) Using the Person.Person and Person.Password tables, INNER JOIN the two tables 
using the BusinessEntityID column and return the FirstName and LastName 
columns from Person.Person and then PasswordHash column from 
Person.Password 
*/
SELECT A.FirstName, A.LastName, B.PasswordHash
FROM Person.Person A
inner join Person.Password B
on A.BusinessEntityID = B.BusinessEntityID;

SELECT * FROM PERSON.Person 
SELECT * FROM PERSON.Password

/*
2) Join the HumanResources.Employee and the 
HumanResources.EmployeeDepartmentHistory tables together via an INNER JOIN 
using the BusinessEntityID column.  Return the BusinessEntityID, 
NationalIDNumber and JobTitle columns from HumanResources.Employee and the 
DepartmentID, StartDate, and EndDate columns from 
HumanResources.EmployeeDepartmentHistory.  Notice the number of rows 
returned.  Why is the row count what it is? 
*/
SELECT A.BusinessEntityID, A.NationalIDNumber, A.JobTitle, B.DepartmentID, B.StartDate, B.EndDate
FROM HumanResources.Employee A
INNER JOIN HumanResources.EmployeeDepartmentHistory B
ON A.BusinessEntityID = B.BusinessEntityID;

/*
3) Expand upon the query used in question 1.  Using the existing query, add another 
INNER JOIN to the Person.EmailAddress table and include the EmailAddress column 
in your select statement. 
*/
SELECT A.FirstName, A.LastName, B.PasswordHash, c.EmailAddress
FROM Person.Person A
inner join Person.Password B
ON A.BusinessEntityID = B.BusinessEntityID
inner join Person.EmailAddress C
ON B.BusinessEntityID = C.BusinessEntityID;

/*
4) Using the Book, BookAuthor and Author tables, join them together so that you 
return the Title and ISBN columns from Book and the AuthorName column from 
Author.  (Hint: You must start with the BookAuthor table in your FROM clause even 
though we will not be returning any columns from this table) 
*/
--THERE ARE NOT TABLES AVAILABLE IN DATABASE AdventureWorks2022
SELECT * FROM BOOK
SELECT * FROM BookAuthor
SELECT * FROM Author

------------------------------------------------------------------------------------------------------------------------------------
-- 3/3/2025 FUNCTIONS (LOWER, UPPER, LENGTH,MONTH,YEAR,FORAMT ETC...		
------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE S1(
ID INT,
FIRSTNAME VARCHAR(40),
LASTNAME VARCHAR(40),
DOB DATE,
DOMAIN VARCHAR(40)
);

INSERT INTO S1 
VALUES
(101,'ZAYN','MALIK','2014-04-07','DATA SCIENCE'),
(102,'GEORGE','BRIAN','2010-06-09','FULL STACK'),
(103,'LIZA','DRINE','2000-01-01','MACHINE LEARNING'),
(104,'ROMA','DSUZA','2013-10-25','DATA ANALYTICS')

DROP TABLE S1
 SELECT * FROM S1

SELECT										--EXTRACTING EXTREME RIGHT
RIGHT(DOMAIN,2)
FROM S1

SELECT 
LEFT(DOMAIN,2)						--EXTRACTING EXTREME LEFT
FROM S1
 
SELECT RIGHT(LEFT(DOMAIN,2),1)				--EXTRACTING FROM MIDDLE
FROM S1

SELECT LOWER(DOMAIN)						--LOWER CASE
FROM S1

SELECT UPPER(DOMAIN)						--UPPER CASE
FROM S1

SELECT										--TO DERIVE LENGTH
LEN(FIRSTNAME)
FROM S1

SELECT										--CONCATENATION
LEFT(FIRSTNAME,1) + '.'+
LEFT(LASTNAME,1)+'@'+'OUTLOOK.COM' AS 'EMAILID'
FROM S1

SELECT										--MONTH AND YEAR
MONTH(DOB) AS MONTH,
YEAR(DOB) AS YEAR
FROM S1
 
SELECT * FROM S1

SELECT 
DATENAME(MONTH,DOB)+' '+
CAST(YEAR(DOB) AS VARCHAR (4))
FROM S1

-------------------------------------------------------------------------------------------------------------------------------------
-- 4/3/2025 CREATING PROCEDURE	
------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE GETEMPDEPTCITY
AS 
BEGIN
	SELECT DEPARTMENT,CITY FROM EMPLOYEEDETAILS
END

GETEMPDEPTCITY									--EXECUTE WAY 1
EXEC GETEMPDEPTCITY							    --EXECUTE WAY 2
EXECUTE GETEMPDEPTCITY							--EXECUTE WAY 3

CREATE PROCEDURE EMPDEPTCITY
@DEPARTMENT VARCHAR (20),@CITY VARCHAR(20)		--@ IS USED FOR USER INPUT WHERE DATA TYPE MUST BE SAME
AS 
BEGIN
	SELECT DEPARTMENT,CITY FROM EMPLOYEEDETAILS
	WHERE DEPARTMENT = @DEPARTMENT AND CITY= @CITY
END

EMPDEPTCITY 'FS','VADODARA';						--USER INPUT

DROP PROC GETEMPDEPTCITY
DROP PROCEDURE EMPDEPTCITY

-----------------------------------------------------------------------------------------------------------------

SELECT * FROM EMPLOYEEDETAILS;

alter table EMPLOYEEDETAILS 
add gender varchar(20); 

update EMPLOYEEDETAILS 
set gender = 'M' where EID in (1,6,7,10,11);

update EMPLOYEEDETAILS 
set gender = 'F' where EID in (2,5,8,9,12);

----------------------------------------------------------------------------------------------------

CREATE PROCEDURE GETGENDER
@ID INT, @GENDER VARCHAR(20)
AS 
BEGIN
	SELECT EID,gender FROM EMPLOYEEDETAILS 
	WHERE EID=@ID AND gender=@GENDER
END

GETGENDER 6,'M';                    -- if there is only one input wrong it will give empty output 

CREATE TABLE ORDERS(								--ORDER TABLE
OID INT,
CID INT, 
ORDERDATE DATE,
QTY INT,
TOTALAMT MONEY)

INSERT INTO ORDERS VALUES
(1,105,'2024-12-06',5,4600),
(1,115,'2025-10-14',2,1600),
(1,123,'2024-09-28',1,800),
(1,101,'2023-01-01',3,1000),
(1,120,'2025-04-23',10,9600);

select * from ORDERS;

CREATE PROCEDURE GETCUSTDETAILS
@CID INT
AS 
BEGIN
	SELECT OID,CID,ORDERDATE,TOTALAMT FROM ORDERS
	WHERE CID=@CID
END;

GETCUSTDETAILS 120;

CREATE PROCEDURE ADDORDERS
@OID INT, @QTY INT, @TOTALAMT MONEY
AS 
BEGIN
	INSERT INTO ORDERS (OID,QTY,TOTALAMT) VALUES (@OID,@QTY,@TOTALAMT)
END

ADDORDERS 6,7,8000;

SELECT * FROM ORDERS

SP_HELPTEXT EMPDEPTCITY							--TO VIEW SYNTAX OF THE PROCEDURE

ALTER PROC EMPDEPTCITY				
@DEPARTMENT VARCHAR (20),						
@CITY VARCHAR(20)
WITH ENCRYPTION								--TO ADD SECURITY SO THAT NOBODY CAN VIEW THE SYNTAX USING ENCRYPTION
AS 
BEGIN
	SELECT DEPARTMENT,CITY FROM EMPDETAILS
	WHERE DEPARTMENT = @DEPARTMENT AND CITY = @CITY
END;

SP_HELPTEXT EMPDEPTCITY

-------------------------------------------------------------------------------------------------------------------------------------
-- 5/3/2025 PART 2 : CREATING PROCEDURE	WITH OUTPUT/OUT PARAMETER	
------------------------------------------------------------------------------------------------------------------------------------4

CREATE PROCEDURE DOUBLENUMBER
@INPUTNUMBER INT,
@OUTPUTNUMBER INT OUTPUT
AS 
BEGIN
	SET @OUTPUTNUMBER = @INPUTNUMBER * 2
END

DECLARE @RESULT INT							 --EXECUTING WAY
EXEC DOUBLENUMBER 5, @RESULT OUTPUT
SELECT @RESULT AS RESULT

ALTER PROCEDURE DOUBLENUMBER
@INPUTNUMBER INT,
@OUTPUTNUMBER INT OUTPUT
AS BEGIN
SET @OUTPUTNUMBER = @INPUTNUMBER * 3
END

DECLARE @RESULT INT							 --EXECUTING WAY
EXEC DOUBLENUMBER 5, @RESULT OUT
SELECT @RESULT AS RESULT

CREATE PROCEDURE CALCULATEBILL
@NUMEBROFCOFFEE DECIMAL,
@PRICEPERCOFFEE DECIMAL,
@TOTALBILL DECIMAL OUTPUT
AS BEGIN
	SET @TOTALBILL = @NUMEBROFCOFFEE * @PRICEPERCOFFEE
END

DECLARE @CUSTOMERBILL DECIMAL
EXEC CALCULATEBILL 2,500, @CUSTOMERBILL OUTPUT
SELECT @CUSTOMERBILL AS BILLAMT

CREATE PROCEDURE spGETSTUDCOUNTBYGENDER
@GENDER VARCHAR(30),
@STUDCOUNT INT OUTPUT
AS BEGIN
	SELECT @STUDCOUNT=COUNT(EID)
	FROM Employeedetails
	WHERE GENDER=@GENDER
END

DECLARE @STUDTOTAL INT
EXEC spGETSTUDCOUNTBYGENDER 'M', @STUDTOTAL OUTPUT
SELECT @STUDTOTAL AS TOTAL

--POPULAR INTERVIEW QUESTION: DIFFERENCE BETWEEN SP_HELP AND SP_HELPTEXT
SP_HELPTEXT CALCULATEBILL						--WILL PROVIDE SYNTAX OF THE PROCEDURE
SP_HELP CALCULATEBILL							--WILL SHOW DATATYPE, CREATION DATE
SP_DEPENDS EMPLOYEEDETAILS						--WILL CHECK DEPENDENCIES

--ASSESSMENT OF STROED POCEDURES--

/*
1. Get Customer Details:
o Create a stored procedure that takes a CustomerID as input and returns the
customer's FirstName, LastName, and Email from a Customers table.
*/
CREATE TABLE CUSTOMERS (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	Email VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO CUSTOMERS
VALUES (1, 'John', 'Doe', 'john01@gmail.com', 'IT'),
(2, 'Jane', 'Smith', 'jane02@gmail.com', 'HR'),
(3, 'Mike', 'Johnson', 'mike03@gmail.com', 'IT'),
(4, 'Anna', 'Brown', 'anna04gmail.com', 'Marketing');

CREATE PROCEDURE spGETDETAILS
@EID INT
AS BEGIN 
	SELECT FirstName, LastName, Email 
	FROM CUSTOMERS
	WHERE EmployeeID = @EID
END

EXECUTE spGETDETAILS 2
SELECT * FROM CUSTOMERS

/*
2. Add a New Product:
o Create a stored procedure that takes ProductID, ProductName, Description, and
Price as input and inserts a new product into a Products table.
*/
CREATE TABLE PRODUCTS (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    DESCRIPTION NVARCHAR(MAX),
    PRICE DECIMAL(10,2) NOT NULL,
);

INSERT INTO PRODUCTS (ProductID, ProductName, DESCRIPTION, PRICE) 
VALUES (001, 'Laptop', 'High-performance laptop', 999.99),
(002, 'T-Shirt', 'Cotton t-shirt', 19.99),
(003, 'Microwave Oven', 'Compact microwave oven', 129.99),
(004, 'Novel', 'Best-selling novel', 14.99),
(005, 'Basketball', 'Standard size basketball', 29.99),
(006, 'Shampoo', 'Herbal shampoo', 9.99),
(007, 'Toy Car', 'Remote control car', 39.99);

CREATE PROCEDURE spADDPRODUCT
@ProductID int, @ProductName NVARCHAR(255), @Description NVARCHAR(255), @Price DECIMAL (10,2)
AS BEGIN 
	INSERT INTO PRODUCTS 
	VALUES (@ProductID, @ProductName, @Description, @Price)
END

EXECUTE spADDPRODUCT 008, 'Car Charger', 'Fast charging car adapter', 24.99
SELECT * FROM PRODUCTS

/*
3. Update Product Price:
o Create a stored procedure that takes a ProductID and a NewPrice as input and
updates the price of the specified product in the Products table.
*/
CREATE PROCEDURE spUPDATEPRICE
@ProductID int, @NewPrice DECIMAL(10,2)
AS BEGIN 
	UPDATE PRODUCTS 
	SET PRICE = @NewPrice
	WHERE ProductID = @ProductID
END

EXECUTE spUPDATEPRICE 6,12.00
SELECT * FROM PRODUCTS;

/*
4. Get Orders by Date Range:
o Create a stored procedure that takes StartDate and EndDate as input and returns all
orders placed within that date range from an Orders table.
*/
CREATE TABLE ORDERS_FOR_SP (
    OrderID INT PRIMARY KEY,
	OrderDate DATE,
	Quantity int,
	Price MONEY
);

INSERT INTO ORDERS_FOR_SP (OrderID, OrderDate, Quantity, Price) 
VALUES (1, '2023-05-10', 10, 120.50),
(2, '2024-06-18', 20, 230.75),
(3, '2024-08-25', 15, 175.00),
(4, '2025-02-10', 30, 450.25),
(5, '2023-11-20', 25, 325.60);

CREATE PROCEDURE spGETORDERS
@StartDate DATE, @EndDate DATE
AS BEGIN 
	SELECT * FROM ORDERS_FOR_SP 
	WHERE OrderDate BETWEEN @StartDate AND @EndDate
END

EXECUTE spGETORDERS '2024-01-01','2025-01-01'
SELECT * FROM ORDERS_FOR_SP;

/*
5. Calculate Order Total:
o Create a stored procedure that takes an OrderID as input and calculates the total
amount of the order (sum of Quantity * UnitPrice from an OrderDetails table).
Return the total amount as an output parameter.
*/
CREATE PROCEDURE spCALCULATEORDER
@OrderID INT,@TotalAmount MONEY OUTPUT
AS BEGIN
    SELECT @TotalAmount = (Quantity * Price)
    FROM ORDERS_FOR_SP
    WHERE OrderID = @OrderID;
END

DECLARE @Result DECIMAL(10,2)
EXECUTE spCALCULATEORDER 2, @Result OUTPUT
SELECT @Result AS 'TOTAL AMOUNT'

SELECT * FROM ORDERS_FOR_SP;

/*
6. Get Top N Products:
o Create a stored procedure that takes a number N as an input, and returns the top N
products by total sales from a products table, and an order details table.
*/
CREATE PROCEDURE spGETTOPPRODUCTS
@NUMBER INT
AS BEGIN
	SELECT TOP (@NUMBER) P.ProductID, SUM(O.Quantity) AS [Total Quantity sold],
	SUM(O.Quantity * P.PRICE) AS [TotalSales]
	FROM ORDERS_FOR_SP O
    JOIN PRODUCTS P ON O.OrderID = P.ProductID
    GROUP BY P.ProductID
    ORDER BY TotalSales DESC
END

execute spGETTOPPRODUCTS 3 
SELECT * FROM ORDERS_FOR_SP;
SELECT * FROM PRODUCTS;

---------------------------------------------------------------------------------------------------------------
--06--03--2025 TRIGGERS WITH DML COMMANDS 
---------------------------------------------------------------------------------------------------------------

CREATE TABLE tblEmployee				--CREATING TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

exec sp_rename tblEmp, tblEmployee

Insert into tblEmployee 
values (1,'John', 5000, 'Male', 3),
(2,'Mike', 3400, 'Male', 2),
(3,'Pam', 6000, 'Female', 1);


CREATE TABLE tblEmployeeAudit					--CREATING AUDIT TABLE
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
);

CREATE TRIGGER tr_tblEMployee_ForInsert			--CREATING TRIGGER to insert
ON tblEmployee
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted					--inserted is temparary table which trigger is creating 
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END

insert into tblEmployee values (7,'Mona',2300,'Female',3)
select * from tblEmployeeAudit 

CREATE TRIGGER tr_tblEMployee_ForDelete			--CREATING TRIGGER to delete
ON tblEmployee
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted					--deleted is temparary table which trigger is creating 
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + cast(Getdate() as nvarchar(20)))
END

delete from tblEmployee where id = 1;
select * from tblEmployeeAudit 

delete trigger tr_tblEMployee_ForInsert on tblEmoloyee		--to delete trigger

disable trigger tr_tblEMployee_ForInsert on tblEmployee		--to disable trigger

enable trigger tr_tblEMployee_ForInsert	on tblEmployee		--to eneable trigger

--To prevent the stockQuantity  in a ORDERS_FOR_SP table from becoming negative 

CREATE TRIGGER PreventNegativeStock							--WILL RAISE ERROR WHEN QUANTITY IS LESS THAN 0
ON ORDERS_FOR_SP
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT 1 FROM INSERTED WHERE QUANTITY< 0)
	BEGIN
		RAISERROR('STOCK QUANTITY CANNOT BE NEGATIVE.' , 16, 1);
		ROLLBACK TRANSACTION;

	END
END;

Create trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
	Select * from deleted				--WILL DISPLAY DELETED VALUES FROM THE TABLE
	Select * from inserted				--WILL DISPLAY RECENTLY UPDATED VALUE IN THE TABLE
End

Update tblEmployee set Name = 'Tods', Salary = 2000, 
Gender = 'Female' where Id = 3

--------------------------------------------------------------------------------------------------------------------------------------
-- 07/03//2025	TRIGGERS
--------------------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER <TRIGGERNAME>
ON <TABLENAME>
FOR DELETE
AS 
BEGIN
	ROLLBACK;
	PRINT"YOU ARE NOT ALLOWED TO DELETE THE PROCESS"
	END;
	GO;

--CRETAING TRIGGER ON DATABASE
CREATE TRIGGER tr_LimitCreatingTable
ON DATABASE
FOR CREATE_TABLE
AS BEGIN
	ROLLBACK;
	PRINT'YOU ARE NOT ALLOW TO CREATE THE TABLE'
END;
GO;

select * from ORDERS
select name from sys.tables


------------------------------------------------------------------------------------------------
--11/03/2025      IF EXISTS THAN GO TO BEGIN
------------------------------------------------------------------------------------------------
DECLARE @EID INT =1
DECLARE @ENAME VARCHAR (20) = ''
IF EXISTS (SELECT 1 FROM EMPDETAILS WHERE EID=@EID)
BEGIN
	UPDATE EMPDETAILS
	SET ENAME = @ENAME
	WHERE EID=@EID
	PRINT 'NAME ADDED SUCCESSFULLY'
END
ELSE 
BEGIN
	PRINT 'NAME NOT ADDED SUCCESSFULLY'
END


DECLARE @EID INT = 1
IF EXISTS (SELECT 1 FROM EMPDETAILS WHERE EID = @EID)
BEGIN
	DELETE FROM EMPDETAILS
	WHERE EID = 1
	PRINT 'EMPLOYEE DELETED SUCCESSFULLY'
END
ELSE
BEGIN
	PRINT 'NAME NOT DELETED SUCCESSFULLY'
END

SELECT * FROM EMPDETAILS

SET STATISTICS TIME OFF

---------------------------------------------------------------------------------------------------------
Triggers - Assignment 
---------------------------------------------------------------------------------------------------------
--1. Create a triegger for logging of deleted employees
create table EmployeeDeleteLog (
  EmployeeID int,
  DeleteDate Datetime
  );

Create Trigger tr_LogDeletedEmployee
on Employees
After Delete
As
BEGIN
	INSert into EmployeeDeleteLog (EmployeeID, DeleteDate)
	Select EmployeeID, GetDate
	From deleted;
END;
Delete from Employee where EmployeeID = 1  //  IN (1,2) // (--will delete the EmployeeID on the index 1,2.)


--2. create a trigger for Updating Employee's Last Modified Date on Update,
Create  Trigger tr_EmployeeUpdateModified
on Employee,
After Update
As 
BEGIN
	Update Employees
	SET LastModified = GetDate()
	From inserted i
	Where Employee.EmployeeID= i.EmployeeID;
END;

--3. Trigger to keep log of department IDs that have been deleted.
Create table DepartmentDeleteLog(
DepartmentID int,
DeleteDate DateTime
);

create trigger Tr_DepartmentDeleteLog
on Departments
After Delete 
As
BEGIN
	Insert into DepartmentDeleteLog (DepartmentID, DeleteDate)
    Select DepartmentID, Getdate()
    From deleted;
End;

--4. Create Trigger to prevent Duplicate Email address From being entered in the Employee table
Create trigger Tr_UniqueEmployeeEmail
on Employees
After Insert, Update
As
BEGIN 
    if Exists (Select 1 from inserted i
	  join Employees e on i.email = e.email
	  where i.EmployeeID <> e.EmployeeID
BEGIN 
	RaiseError ('Email address already exists',16,1);
	Rollback Transaction;
END;
END;

--5. create trigger if a column named status is not provided during an insert, set defualt value to pending 
create trigger Tr_setDefaultStatus
Instead of insert
on Orders
as 
BEGIN
	Insert into orders (orderID,Status)
    Select OrderID, ISNULL (Status, 'Pending')
    From inserted;
END;
