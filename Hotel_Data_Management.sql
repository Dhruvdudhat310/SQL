CREATE DATABASE HOTEL_MANAGEMENT;

USE HOTEL_MANAGEMENT;

CREATE TABLE Hotel(
HOTEL_NO CHAR(4) NOT NULL,
NAME VARCHAR(20) NOT NULL,
ADDRESS VARCHAR(50) NOT NULL
);

CREATE TABLE Room(
ROOM_NO VARCHAR(4) NOT NULL,
HOTEL_NO CHAR(4) NOT NULL,
TYPE CHAR(1) NOT NULL,
PRICE DECIMAL(5,2) NOT NULL
);

CREATE TABLE Booking(
HOTEL_NO CHAR(4) NOT NULL,
GUEST_NO CHAR(4) NOT NULL,
DATE_FROM DATETIME NOT NULL,
DATE_TO DATETIME NULL,
ROOM_NO CHAR(4) NOT NULL
);

CREATE TABLE Guest(
GUEST_NO CHAR(4) NOT NULL,
NAME VARCHAR(20) NOT NULL,
ADDRESS VARCHAR(50) NOT NULL
);

-- Inserting into Hotel table
INSERT INTO Hotel (HOTEL_NO, NAME, ADDRESS)
VALUES
('H111', 'Grosvenor Hotel', 'London'),
('H112', 'Park Lane Hotel', 'New York'),
('H113', 'Ritz Paris', 'Paris'),
('H114', 'Marriott Hotel', 'Los Angeles'),
('H115', 'Hilton Garden Inn', 'San Francisco'),
('H116', 'Four Seasons', 'Tokyo'),
('H117', 'The Plaza', 'New York'),
('H118', 'Sheraton Hotel', 'Sydney'),
('H119', 'The Westin', 'Chicago'),
('H120', 'Radisson Blu', 'Berlin'),
('H121', 'Holiday Inn', 'Dubai');

-- Inserting into Room table
INSERT INTO Room (ROOM_NO, HOTEL_NO, TYPE, PRICE)
VALUES
('1', 'H111', 'S', 72.00),
('2', 'H111', 'D', 120.00),
('3', 'H112', 'S', 85.00),
('4', 'H112', 'D', 150.00),
('5', 'H113', 'S', 100.00),
('6', 'H113', 'D', 180.00),
('7', 'H114', 'S', 95.00),
('8', 'H114', 'D', 170.00),
('9', 'H115', 'S', 80.00),
('10', 'H115', 'D', 160.00),
('11', 'H116', 'S', 120.00);

-- Inserting into Guest table
INSERT INTO Guest (GUEST_NO, NAME, ADDRESS)
VALUES
('G111', 'John Smith', 'London'),
('G112', 'Alice Johnson', 'New York'),
('G113', 'Robert Brown', 'Paris'),
('G114', 'Maria Garcia', 'Los Angeles'),
('G115', 'James Lee', 'San Francisco'),
('G116', 'Sophia Williams', 'Tokyo'),
('G117', 'Michael Davis', 'New York'),
('G118', 'Olivia Martinez', 'Sydney'),
('G119', 'William Taylor', 'Chicago'),
('G120', 'Isabella Harris', 'London'),
('G121', 'Lucas Clark', 'Dubai');

-- Inserting into Booking table
INSERT INTO Booking (HOTEL_NO, GUEST_NO, DATE_FROM, DATE_TO, ROOM_NO)
VALUES
('H111', 'G111', '1999-01-01', NULL, '1'),
('H112', 'G112', '2025-03-17', '2025-03-18', '2'),
('H113', 'G113', '2025-03-17', '2025-03-19', '3'),
('H114', 'G114', '2025-03-18', '2025-03-20', '7'),
('H115', 'G115', '2025-03-20', '2025-03-22', '9'),
('H116', 'G116', '2025-03-22', '2025-03-24', '11'),
('H117', 'G117', '2025-03-23', NULL, '5'),
('H118', 'G118', '2025-03-24', '2025-03-26', '8'),
('H119', 'G119', '2025-03-25', NULL, '10'),
('H120', 'G120', '2025-03-26', '2025-03-28', '6'),
('H121', 'G121', '2025-03-27', '2025-03-29', '4');

UPDATE room SET price = price*1.05;

CREATE TABLE Booking_old(
HOTEL_NO CHAR(4) NOT NULL,
GUEST_NO CHAR(4) NOT NULL,
DATE_FROM DATETIME NOT NULL,
DATE_TO DATETIME NULL,
ROOM_NO VARCHAR(4) NOT NULL
);

INSERT INTO Booking_old
SELECT * FROM booking
WHERE DATE_TO < '2000-01-01';
	
DELETE FROM Booking
WHERE DATE_TO < '2000-01-01';

--Simple queries

--1. List full details of all hotels.
SELECT * FROM Hotel;

--2. List full details of all hotels in London.
SELECT * FROM Hotel
WHERE ADDRESS = 'London';

--3. List the names and addresses of all guests in London, alphabetically ordered by name.
SELECT NAME, ADDRESS 
FROM Guest
WHERE ADDRESS = 'LONDON'
ORDER BY NAME;

--4. List all double or family rooms with a price below £200.00 per night, in ascending order of price.
SELECT * FROM Room
WHERE TYPE = 'D' AND PRICE < 200.00
ORDER BY PRICE;

--5. List the bookings for which no date_to has been specified.
SELECT * FROM BOOKING 
WHERE DATE_TO IS NULL;

--Queries on Aggregate Functions

--1. How many hotels are there?
SELECT COUNT(HOTEL_NO) AS [NUMBER OF HOTELS] FROM HOTEL;

--2. What is the average price of a room?
SELECT AVG(PRICE) AS [AVERAGE PRICE]FROM ROOM;

--3. What is the total revenue per night from all double rooms?
SELECT SUM(PRICE) AS [TOTAL REVENUE] FROM ROOM
WHERE TYPE = 'D';

--4. How many different guests have made bookings for August? 
SELECT COUNT(DISTINCT GUEST_NO) AS [GUEST_COUNT]
FROM Booking
WHERE MONTH(DATE_FROM) = 8; 

--Queries on Subqueries and Joins

--1. List the price and type of all rooms at the Grosvenor Hotel.
SELECT ROOM_NO, TYPE, PRICE 
FROM ROOM R
JOIN HOTEL H ON R.HOTEL_NO = H.HOTEL_NO
WHERE H.NAME = 'Grosvenor Hotel';

SELECT ROOM_NO, TYPE, PRICE  FROM ROOM
WHERE HOTEL_NO = (SELECT HOTEL_NO FROM HOTEL WHERE NAME = 'Grosvenor Hotel')

--2. List all guests currently staying at the Grosvenor Hotel.
SELECT G.GUEST_NO, G.NAME
FROM GUEST G 
JOIN BOOKING B ON G.GUEST_NO = B.GUEST_NO
JOIN HOTEL H ON B.HOTEL_NO = H.HOTEL_NO
WHERE H.NAME = 'Grosvenor Hotel' 
	AND B.DATE_FROM <= GETDATE() 
	AND (B.DATE_TO IS NULL OR B.DATE_TO >= GETDATE());

--3. List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying 
--in the room, if the room is occupied.
SELECT R.ROOM_NO, R.TYPE, R.PRICE, G.NAME AS [GUEST NAME] 
FROM ROOM R 
JOIN HOTEL H ON H.HOTEL_NO = R.HOTEL_NO
LEFT JOIN BOOKING B ON R.ROOM_NO = B.ROOM_NO AND B.HOTEL_NO = H.HOTEL_NO
LEFT JOIN GUEST G ON B.GUEST_NO = G.GUEST_NO
WHERE H.NAME = 'Grosvenor Hotel';

--4. What is the total income from bookings for the Grosvenor Hotel today?
SELECT SUM(R.PRICE * DATEDIFF(DAY, B.DATE_FROM, GETDATE())) AS total_income
FROM Booking B
JOIN Room R ON B.ROOM_NO = R.ROOM_NO
JOIN Hotel H ON B.HOTEL_NO = H.HOTEL_NO
WHERE H.NAME = 'Grosvenor Hotel'
  AND B.DATE_FROM <= GETDATE() 
  AND (B.DATE_TO IS NULL OR B.DATE_TO >= GETDATE());

--5. List the rooms that are currently unoccupied at the Grosvenor Hotel.
SELECT R.ROOM_NO, R.TYPE, R.PRICE
FROM ROOM R
JOIN HOTEL H ON R.HOTEL_NO = H.HOTEL_NO
LEFT JOIN BOOKING B ON R.ROOM_NO = B.ROOM_NO AND B.HOTEL_NO = H.HOTEL_NO 
    AND B.DATE_FROM <= GETDATE() 
    AND (B.DATE_TO IS NULL OR B.DATE_TO >= GETDATE())
WHERE H.NAME = 'Grosvenor Hotel'
  AND B.ROOM_NO IS NULL;

--6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?
SELECT SUM(R.PRICE) AS LOST_INCOME
FROM ROOM R
JOIN HOTEL H ON R.HOTEL_NO = H.HOTEL_NO
LEFT JOIN BOOKING B ON R.ROOM_NO = B.ROOM_NO AND B.HOTEL_NO = H.HOTEL_NO 
    AND B.DATE_FROM <= GETDATE() 
    AND (B.DATE_TO IS NULL OR B.DATE_TO >= GETDATE())
WHERE H.NAME = 'Grosvenor Hotel'
  AND B.ROOM_NO IS NULL;

select * from hotel;
SELECT * FROM Room;
SELECT * FROM Booking;
SELECT * FROM Guest;
