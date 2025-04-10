USE JAN2025;

-- 1.	Students
   CREATE TABLE Students (
       StudentID INT PRIMARY KEY,
       FirstName VARCHAR(50),
       LastName VARCHAR(50),
       Age INT,
       MajorID INT
   );
---2.	Majors
   CREATE TABLE Majors (
       MajorID INT PRIMARY KEY,
       MajorName VARCHAR(50)
   );
-- 3.	Courses
   CREATE TABLE Courses (
       CourseID INT PRIMARY KEY,
       CourseName VARCHAR(50),
       Credits INT
   );
-- 4.	Enrollments
   CREATE TABLE Enrollments (
       EnrollmentID INT PRIMARY KEY,
       StudentID INT,
       CourseID INT,
       Grade CHAR(1),
       FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
       FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
   );

INSERT INTO Majors (MajorID, MajorName) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Civil Engineering'),
(5, 'Mathematics');

INSERT INTO Students (StudentID, FirstName, LastName, Age, MajorID) VALUES
(101, 'Dhruv', 'Dudhat', 20, 1),
(102, 'Mayur', 'Panchal', 21, 2),
(103, 'Darshit', 'Patel', 19, 3),
(104, 'Uchit', 'Desai', 22, 1),
(105, 'Riya', 'Sharaf', 20, 1),
(106, 'Ayushi', 'Panchal', 20, 4),  
(107, 'Vraj', 'Patel', 23, 5);

INSERT INTO Courses (CourseID, CourseName, Credits) VALUES
(201, 'Database Systems', 4),
(202, 'Operating Systems', 4),
(203, 'Data Structures', 3),
(204, 'Mathematics I', 3),
(205, 'Physics', 3);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade) VALUES
(301, 101, 201, 'A'),  
(302, 101, 202, 'B'),  
(303, 101, 203, 'A'),  
(304, 102, 201, 'C'),  
(305, 102, 203, 'B'),
(306, 103, 204, 'A'),  
(307, 103, 201, 'C'),
(308, 104, 202, 'A'),  
(309, 104, 203, 'B'),
(310, 105, 201, 'B'),
(311, 105, 202, 'C'),
(312, 105, 203, 'A'),
(313, 107, 201, 'C'),
(314, 107, 202, 'B'),
(315, 107, 205, 'A');


--1.Retrieve the names of students and their corresponding major names using a join.
   SELECT s.FirstName, s.LastName, m.MajorName
   FROM Students s
   JOIN Majors m ON s.MajorID = m.MajorID;

--2.Find the courses that have more than 5 students enrolled using a subquery.
   SELECT CourseName
   FROM Courses
   WHERE CourseID IN (
       SELECT CourseID
       FROM Enrollments
       GROUP BY CourseID
       HAVING COUNT(StudentID) > 5);

--3.Retrieve the list of students along with the courses they are enrolled in and their grades using a join.
   SELECT s.FirstName, s.LastName, c.CourseName, e.Grade
   FROM Students s
   JOIN Enrollments e ON s.StudentID = e.StudentID
   JOIN Courses c ON e.CourseID = c.CourseID;

--4.Find the names of students who are not enrolled in any courses using a subquery.
   SELECT FirstName, LastName
   FROM Students
   WHERE StudentID NOT IN (SELECT StudentID FROM Enrollments);

--5.Retrieve the names of students who have enrolled in the course 'Database Systems' using a join.
   SELECT s.FirstName, s.LastName
   FROM Students s
   JOIN Enrollments e ON s.StudentID = e.StudentID
   JOIN Courses c ON e.CourseID = c.CourseID
   WHERE c.CourseName = 'Database Systems';

--6.Retrieve the list of majors along with the number of students enrolled in each major using a join.
   SELECT m.MajorName, COUNT(s.StudentID) AS NumberOfStudents
   FROM Majors m
   LEFT JOIN Students s ON m.MajorID = s.MajorID
   GROUP BY m.MajorName;
--7.Find the names of students who have received an 'A' grade in any course using a subquery.
   SELECT FirstName, LastName
   FROM Students
   WHERE StudentID IN (
       SELECT StudentID
       FROM Enrollments
       WHERE Grade = 'A' );

--8.Retrieve the list of courses along with the total number of credits for students enrolled in each course using a join.
   SELECT c.CourseName, SUM(c.Credits) AS TotalCredits
   FROM Courses c
   JOIN Enrollments e ON c.CourseID = e.CourseID
   GROUP BY c.CourseName;

--9.Find the names of students who are enrolled in both 'Database Systems' and 'Operating Systems' using a subquery.
	SELECT FirstName, LastName
	FROM Students
	WHERE StudentID IN (
	    SELECT StudentID
    FROM Enrollments
    WHERE CourseID = (SELECT CourseID FROM Courses WHERE CourseName = 'Database Systems'))
	AND StudentID IN (
    SELECT StudentID
	    FROM Enrollments
    WHERE CourseID = (SELECT CourseID FROM Courses WHERE CourseName = 'Operating Systems')	);

--10.Retrieve the names of students along with their major names and the courses they are enrolled in using a join.
	SELECT s.FirstName, s.LastName, m.MajorName, c.CourseName
	FROM Students s
	JOIN Majors m ON s.MajorID = m.MajorID
	JOIN Enrollments e ON s.StudentID = e.StudentID
	JOIN Courses c ON e.CourseID = c.CourseID;

--11.Find the names of students who have enrolled in more than 2 courses using a subquery.
	SELECT FirstName, LastName
	FROM Students
	WHERE StudentID IN (
	    SELECT StudentID
	    FROM Enrollments
	    GROUP BY StudentID
	    HAVING COUNT(CourseID) > 2	);

--12.Retrieve the list of courses along with the number of students who received an 'A' grade in each course using a join.
	SELECT c.CourseName, COUNT(e.StudentID) AS NumberOfAStudents
	FROM Courses c
	JOIN Enrollments e ON c.CourseID = e.CourseID
	WHERE e.Grade = 'A'
	GROUP BY c.CourseName;

--13.Find the names of students who have not received any 'A' grades using a subquery.
	SELECT FirstName, LastName
	FROM Students
	WHERE StudentID NOT IN (
	    SELECT StudentID
	    FROM Enrollments
	    WHERE Grade = 'A');

--14.Retrieve the list of students along with their major names and the total number of credits they have enrolled in using a join.

	SELECT s.FirstName, s.LastName, m.MajorName, SUM(c.Credits) AS TotalCredits
	FROM Students s
	JOIN Majors m ON s.MajorID = m.MajorID
	JOIN Enrollments e ON s.StudentID = e.StudentID
	JOIN Courses c ON e.CourseID = c.CourseID
	GROUP BY s.FirstName, s.LastName, m.MajorName;
