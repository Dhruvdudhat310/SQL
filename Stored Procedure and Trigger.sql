USE JAN2025;

CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Department NVARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Experience INT NOT NULL,
    LastModified DATETIME DEFAULT GETDATE()
);

INSERT INTO Employee (Name, Department, Salary, Experience)  
VALUES  
('Alice Johnson', 'HR', 55000.00, 5),  
('Bob Smith', 'IT', 75000.00, 8),  
('Charlie Brown', 'Finance', 67000.00, 6),  
('David Wilson', 'Marketing', 62000.00, 4),  
('Emma Davis', 'IT', 80000.00, 10),  
('Frank Thomas', 'Sales', 58000.00, 3),  
('Grace Miller', 'HR', 60000.00, 7),  
('Henry White', 'Finance', 72000.00, 9),  
('Ivy Scott', 'IT', 77000.00, 6),  
('Jack Taylor', 'Sales', 59000.00, 4);

SELECT * FROM EMPLOYEE;

--1. Create a Stored Procedure to Retrieve details of All Employees 
CREATE PROCEDURE spGET_EMPLOYEE_DETAILS
AS
BEGIN
	SELECT * FROM Employee;
END;

EXECUTE spGET_EMPLOYEE_DETAILS;

--2. Create a stored procedure that retrieves details of a specific employee by their ID. 
CREATE PROCEDURE spGET_SPECIFIC_EMP_DETAILS
@ID INT
AS 
BEGIN 
	SELECT * FROM EMPLOYEE
	WHERE EmployeeID = @ID;
END;

EXECUTE spGET_SPECIFIC_EMP_DETAILS 2;

--3. Create a procedure to insert a new employee into the Employees table. 
CREATE PROCEDURE spINSERT_NEW_EMPLOYEE
@NAME NVARCHAR(100), @DEPARTMENT NVARCHAR(50), @SALARY DECIMAL(10,2), @EXPERIENCE INT 
AS 
BEGIN
	INSERT INTO EMPLOYEE (Name, Department, Salary, Experience)
	VALUES
	(@NAME, @DEPARTMENT, @SALARY, @EXPERIENCE);
END;

EXECUTE spINSERT_NEW_EMPLOYEE 'Dhruv Dudhat', 'DS', 100000, 2;

--4. Create a procedure that returns the total number of employees with respect to their department.
CREATE PROCEDURE spCOUNT_EMP_IN_DEPARTMENT
AS 
BEGIN 
	SELECT DEPARTMENT, COUNT(EMPLOYEEID) AS [EMPLOYEE COUNT]
	FROM EMPLOYEE
	GROUP BY DEPARTMENT;
END;	 

EXECUTE spCOUNT_EMP_IN_DEPARTMENT;

--5. Create a procedure to update the Experience of an employee by their ID. 
CREATE PROCEDURE spUPDATE_EXPERIENCE
@ID INT, @EXPERIENCE INT
AS 
BEGIN
	UPDATE EMPLOYEE 
	SET EXPERIENCE = @EXPERIENCE
	WHERE EmployeeID = @ID;
END;

EXECUTE spUPDATE_EXPERIENCE 11, 4;

--6. Create a trigger to log insert operations into a LogTable.
CREATE TABLE Log_Emp(
EmployeeID INT,
Name NVARCHAR(100) NOT NULL,
Department NVARCHAR(50) NOT NULL,
Salary DECIMAL(10,2) NOT NULL,
Experience INT NOT NULL,
LastModified DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER tr_INSERT_INTO_LOG_EMP 
ON Employee
AFTER INSERT
AS
BEGIN
    INSERT INTO Log_Emp (EmployeeID, Name, Department, Salary, Experience, LastModified)
    SELECT EmployeeID, Name, Department, Salary, Experience, GETDATE()
    FROM inserted;
END;

INSERT INTO Employee (Name, Department, Salary, Experience)
values
('Ayushi', 'DS', 80000, 3);

SELECT * FROM Employee;
SELECT * FROM Log_Emp;

--7. Create a trigger that logs whenever an employee's salary is updated.
CREATE TRIGGER tr_UPDATE_INTO_LOG_EMP
ON EMPLOYEE
AFTER UPDATE 
AS
BEGIN 
	IF UPDATE(SALARY)
	INSERT INTO Log_Emp (EmployeeID, Name, Department, Salary, Experience, LastModified)
    SELECT EmployeeID, Name, Department, Salary, Experience, GETDATE()
    FROM inserted;
END;

UPDATE EMPLOYEE 
SET Salary = 100000
WHERE EmployeeID = 12;

SELECT * FROM Employee;
SELECT * FROM Log_Emp;

--8. Create a trigger to log when an employee record is deleted.
CREATE TRIGGER tr_DELETE_INTO_LOG_EMP
ON EMPLOYEE
AFTER DELETE
AS 
BEGIN 
	INSERT INTO Log_Emp (EmployeeID, Name, Department, Salary, Experience, LastModified)
    SELECT EmployeeID, Name, Department, Salary, Experience, GETDATE()
    FROM deleted;
END;

DELETE FROM EMPLOYEE
WHERE EmployeeID = 12;

SELECT * FROM Employee;
SELECT * FROM Log_Emp;

--9. Create a trigger to prevent inserting a salary below 20,000. 
CREATE TRIGGER tr_prevent_salary_below_20000
ON EMPLOYEE
FOR INSERT,UPDATE 
AS 
BEGIN 
	IF EXISTS (SELECT 1 FROM INSERTED 
			   WHERE SALARY < 20000)
	BEGIN 
		PRINT 'YOU ARE NOT ALLOWED TO ENTER SALARY LESS THAN 20000';
		ROLLBACK TRANSACTION;
	END;
END;

UPDATE EMPLOYEE
SET SALARY = 1500
WHERE EmployeeID = 8;

INSERT INTO Employee (Name, Department, Salary, Experience)
values
('Ayushi', 'DS', 150, 3);

--10. Create a trigger to automatically update the LastModified field with the current 
--	timestamp when a record is updated.
CREATE TRIGGER tr_UPDATE_LAST_MODIFIED
ON EMPLOYEE
AFTER UPDATE
AS
BEGIN
    UPDATE EMPLOYEE
    SET LastModified = GETDATE()
    FROM employees
    INNER JOIN inserted ON employees.employeeID = inserted.employeeID;
END;

UPDATE EMPLOYEE
SET SALARY = 130000
WHERE EMPLOYEEID = 11;

SELECT * FROM Employee;
SELECT * FROM Log_Emp;