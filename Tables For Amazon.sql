create database Amazon;
use Amazon;

--IDENTITY(START, INCREMENT BY VALUE /*DEFAULT INCREMENT VALUE IS 1*/) :- AUTO INCREMENT
--VARCHAR :- SUPPORT ONLY ENG.. BUT TAKES 1 BYTE PER CHARACTER (SUPPORT ASCII CHAR..)
--NVARCHAR :- GIVES MULTILINGUAL SUPPORT BUT TAKES 2 BYTES PER CHARACTER (SUPPORT UNICODE CHAR..)
--GETDATE() :- GIVE CURRENT DATE AND TIME (format: YYYY-MM-DD HH:MM:SS.mmm)
--DATETIME :- Default format: YYYY-MM-DD HH:MI:SS.mmm (8 BYTES)

CREATE TABLE USERS (
    USER_ID INT IDENTITY(1,1) PRIMARY KEY,
    NAME NVARCHAR(100) NOT NULL,
    EMAIL NVARCHAR(255) UNIQUE NOT NULL,
    PASSWORD NVARCHAR(255) NOT NULL,
    PHONE NVARCHAR(15) UNIQUE,
    ADDRESS NVARCHAR(MAX),
    CREATED_AT DATETIME DEFAULT GETDATE()
);

INSERT INTO USERS (NAME, EMAIL, PASSWORD, PHONE, ADDRESS) 
VALUES ('John Doe', 'john@example.com', 'pass1', '1234567890', '123 Street, NY'),
('Alice Smith', 'alice@example.com', 'pass2', '2345678901', '456 Avenue, CA'),
('Bob Johnson', 'bob@example.com', 'pass3', '3456789012', '789 Road, TX'),
('Emma Brown', 'emma@example.com', 'pass4', '4567890123', '159 Blvd, FL'),
('Michael Lee', 'michael@example.com', 'pass5', '5678901234', '753 Lane, IL'),
('Sophia White', 'sophia@example.com', 'pass6', '6789012345', '852 St, WA'),
('David Wilson', 'david@example.com', 'pass7', '7890123456', '321 Drive, AZ'),
('Olivia Davis', 'olivia@example.com', 'pass8', '8901234567', '654 Plaza, NV'),
('William Martin', 'william@example.com', 'pass9', '9012345678', '951 Court, NJ'),
('Isabella Moore', 'isabella@example.com', 'pass10', '0123456789', '357 Park, MA');

SELECT * FROM USERS;

CREATE TABLE CATEGORIES (
    CATEGORY_ID INT IDENTITY(1,1) PRIMARY KEY,
    NAME NVARCHAR(100) UNIQUE NOT NULL,
    DESCRIPTION NVARCHAR(MAX)
);

INSERT INTO CATEGORIES (NAME, DESCRIPTION) 
VALUES ('Electronics', 'Devices and gadgets'),
('Clothing', 'Men and women fashion'),
('Home & Kitchen', 'Household items'),
('Books', 'All kinds of books'),
('Sports', 'Sports equipment'),
('Beauty', 'Beauty and personal care'),
('Toys', 'Toys and games'),
('Automotive', 'Car accessories'),
('Health', 'Healthcare products'),
('Jewelry', 'Fashion jewelry');

SELECT * FROM CATEGORIES;

CREATE TABLE PRODUCTS (
    PRODUCT_ID INT IDENTITY(1,1) PRIMARY KEY,
    NAME NVARCHAR(255) NOT NULL,
    DESCRIPTION NVARCHAR(MAX),
    PRICE DECIMAL(10,2) NOT NULL,
    STOCK INT NOT NULL DEFAULT 0,
    CATEGORY_ID INT NULL,
    CREATED_AT DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID) ON DELETE SET NULL
);

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, STOCK, CATEGORY_ID) 
VALUES ('Laptop', 'High-performance laptop', 999.99, 50, 1),
('T-Shirt', 'Cotton t-shirt', 19.99, 200, 2),
('Microwave Oven', 'Compact microwave oven', 129.99, 30, 3),
('Novel', 'Best-selling novel', 14.99, 100, 4),
('Basketball', 'Standard size basketball', 29.99, 80, 5),
('Shampoo', 'Herbal shampoo', 9.99, 150, 6),
('Toy Car', 'Remote control car', 39.99, 75, 7),
('Car Charger', 'Fast charging car adapter', 24.99, 90, 8),
('Vitamin C', 'Immunity booster', 11.99, 120, 9),
('Necklace', 'Gold-plated necklace', 49.99, 60, 10);

SELECT * FROM PRODUCTS;

CREATE TABLE ORDERS (
    ORDER_ID INT IDENTITY(1,1) PRIMARY KEY,
    USER_ID INT NOT NULL,
    TOTAL_PRICE DECIMAL(10,2) NOT NULL,
    ORDER_DATE DATETIME DEFAULT GETDATE(),
    STATUS NVARCHAR(20) DEFAULT 'Pending' CHECK (status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID) ON DELETE CASCADE
);

INSERT INTO ORDERS (USER_ID, TOTAL_PRICE, STATUS) 
VALUES (1, 1019.98, 'Shipped'),
(2, 34.98, 'Pending'),
(3, 159.98, 'Delivered'),
(4, 44.98, 'Cancelled'),
(5, 29.99, 'Shipped'),
(6, 9.99, 'Pending'),
(7, 39.99, 'Delivered'),
(8, 24.99, 'Shipped'),
(9, 11.99, 'Pending'),
(10, 49.99, 'Delivered');

SELECT * FROM ORDERS;

CREATE TABLE ORDER_ITEMS (
    ORDER_ITEM_ID INT IDENTITY(1,1) PRIMARY KEY,
    ORDER_ID INT NOT NULL,
    PRODUCT_ID INT NOT NULL,
    QUANTITY INT NOT NULL CHECK (QUANTITY > 0),
    PRICE DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE,
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID) ON DELETE CASCADE
);

INSERT INTO ORDER_ITEMS (ORDER_ID, PRODUCT_ID, QUANTITY, PRICE) 
VALUES (1, 1, 1, 999.99),
(1, 2, 1, 19.99),
(2, 4, 2, 14.99),
(3, 3, 1, 129.99),
(3, 5, 1, 29.99),
(4, 6, 2, 9.99),
(5, 7, 1, 39.99),
(6, 8, 1, 24.99),
(7, 9, 1, 11.99),
(8, 10, 1, 49.99);

SELECT * FROM ORDER_ITEMS;

CREATE TABLE PAYMENTS (
    PAYMENT_ID INT IDENTITY(1,1) PRIMARY KEY,
    ORDER_ID INT NOT NULL,
    PAYMENT_METHOD NVARCHAR(50) NOT NULL CHECK (payment_method IN ('Credit Card', 'Debit Card', 'PayPal', 'Cash on Delivery')),
    STATUS NVARCHAR(20) DEFAULT 'Pending' CHECK (STATUS IN ('Pending', 'Completed', 'Failed', 'Refunded')),
    TRANSACTION_ID NVARCHAR(255),
    PAYMENT_DATE DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE
);

INSERT INTO PAYMENTS (order_id, payment_method, status, transaction_id) 
VALUES (1, 'Credit Card', 'Completed', 'TXN12345'),
(2, 'PayPal', 'Pending', 'TXN12346'),
(3, 'Debit Card', 'Completed', 'TXN12347'),
(4, 'Credit Card', 'Failed', 'TXN12348'),
(5, 'Cash on Delivery', 'Pending', NULL),
(6, 'Credit Card', 'Completed', 'TXN12349'),
(7, 'Debit Card', 'Completed', 'TXN12350'),
(8, 'PayPal', 'Completed', 'TXN12351'),
(9, 'Credit Card', 'Pending', 'TXN12352'),
(10, 'Cash on Delivery', 'Completed', NULL);

SELECT * FROM PAYMENTS;

CREATE TABLE SHIPPING (
    SHIPPING_ID INT IDENTITY(1,1) PRIMARY KEY,
    ORDER_ID INT NOT NULL,
    ADDRESS NVARCHAR(MAX) NOT NULL,
    DELIVERY_DATE DATE NULL,
    STATUS NVARCHAR(20) DEFAULT 'Processing' CHECK (STATUS IN ('Processing', 'Shipped', 'Delivered', 'Returned')),
    TRACKING_NUMBER NVARCHAR(255),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE
);

INSERT INTO SHIPPING (ORDER_ID, ADDRESS, DELIVERY_DATE, STATUS, TRACKING_NUMBER) 
VALUES (1, '123 Street, NY', '2025-02-10', 'Shipped', 'TRACK123'),
(2, '456 Avenue, CA', NULL, 'Processing', NULL),
(3, '789 Road, TX', '2025-02-12', 'Delivered', 'TRACK124'),
(4, '159 Blvd, FL', NULL, 'Returned', 'TRACK125'),
(5, '753 Lane, IL', '2025-02-14', 'Shipped', 'TRACK126'),
(6, '852 St, WA', NULL, 'Processing', NULL),
(7, '321 Drive, AZ', '2025-02-16', 'Delivered', 'TRACK127'),
(8, '654 Plaza, NV', '2025-02-18', 'Shipped', 'TRACK128'),
(9, '951 Court, NJ', NULL, 'Processing', NULL),
(10, '357 Park, MA', '2025-02-20', 'Delivered', 'TRACK129');

SELECT * FROM SHIPPING;

--ALL TABLES OF AMAZON DATABASE
SELECT NAME FROM SYS.TABLES;

SELECT * FROM PRODUCTS;

