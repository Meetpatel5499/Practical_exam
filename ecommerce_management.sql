--Table creation 
-- 1. Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- 2. Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category_id INT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    added_date DATE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 3. Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT,
    registration_date DATE
);

-- 4. Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Order_Items table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 6. Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method ENUM('Credit Card', 'PayPal', 'UPI'),
    payment_status ENUM('Paid', 'Pending', 'Failed'),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 7. Shipping table
CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    shipping_date DATE,
    delivery_date DATE,
    shipping_status ENUM('Dispatched', 'In Transit', 'Delivered'),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);




--Insertions
-- Insert into Categories
INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Sports'),
('Beauty'),
('Toys'),
('Food & Beverages'),
('Automotive'),
('Health');

-- Insert into Products
INSERT INTO Products (name, category_id, price, stock_quantity, added_date) VALUES
('Smartphone', 1, 699.99, 50, '2024-01-15'),
('Laptop', 1, 999.99, 30, '2024-01-20'),
('T-Shirt', 2, 19.99, 100, '2024-02-01'),
('Novel Book', 3, 12.99, 80, '2024-02-05'),
('Coffee Maker', 4, 49.99, 40, '2024-02-10'),
('Basketball', 5, 29.99, 60, '2024-02-15'),
('Perfume', 6, 39.99, 70, '2024-02-20'),
('Action Figure', 7, 14.99, 90, '2024-03-01'),
('Chocolate Box', 8, 9.99, 120, '2024-03-05'),
('Car Wax', 9, 24.99, 45, '2024-03-10');

-- Insert into Customers
INSERT INTO Customers (name, email, phone_number, address, registration_date) VALUES
('John Smith', 'john.smith@email.com', '123-456-7890', '123 Main St, New York, NY', '2024-01-01'),
('Emma Johnson', 'emma.j@email.com', '123-456-7891', '456 Oak Ave, Los Angeles, CA', '2024-01-05'),
('Michael Brown', 'michael.b@email.com', '123-456-7892', '789 Pine Rd, Chicago, IL', '2024-01-10'),
('Sarah Davis', 'sarah.d@email.com', '123-456-7893', '321 Elm St, Houston, TX', '2024-01-15'),
('David Wilson', 'david.w@email.com', '123-456-7894', '654 Maple Dr, Phoenix, AZ', '2024-01-20'),
('Lisa Miller', 'lisa.m@email.com', '123-456-7895', '987 Cedar Ln, Philadelphia, PA', '2024-01-25'),
('James Taylor', 'james.t@email.com', '123-456-7896', '159 Birch St, San Antonio, TX', '2024-02-01'),
('Jennifer Lee', 'jennifer.l@email.com', '123-456-7897', '753 Spruce Ave, San Diego, CA', '2024-02-05'),
('Robert Clark', 'robert.c@email.com', '123-456-7898', '486 Walnut Blvd, Dallas, TX', '2024-02-10'),
('Maria Garcia', 'maria.g@email.com', '123-456-7899', '264 Cherry St, San Jose, CA', '2024-02-15');

-- Insert into Orders
INSERT INTO Orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-03-01', 719.98, 'Delivered'),
(2, '2024-03-02', 1039.98, 'Shipped'),
(3, '2024-03-03', 32.98, 'Pending'),
(4, '2024-03-04', 69.98, 'Delivered'),
(5, '2024-03-05', 149.97, 'Shipped'),
(6, '2024-03-06', 24.99, 'Cancelled'),
(7, '2024-03-07', 54.98, 'Delivered'),
(8, '2024-03-08', 999.99, 'Pending'),
(9, '2024-03-09', 19.99, 'Shipped'),
(10, '2024-03-10', 39.99, 'Delivered');

-- Insert into Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, subtotal) VALUES
(1, 1, 1, 699.99),
(1, 10, 1, 19.99),
(2, 2, 1, 999.99),
(2, 3, 2, 39.99),
(3, 4, 1, 12.99),
(3, 8, 1, 14.99),
(4, 5, 1, 49.99),
(4, 9, 2, 19.99),
(5, 6, 5, 149.97),
(6, 10, 1, 24.99),
(7, 7, 1, 39.99),
(7, 9, 1, 9.99),
(8, 2, 1, 999.99),
(9, 3, 1, 19.99),
(10, 7, 1, 39.99);

-- Insert into Payments
INSERT INTO Payments (order_id, payment_date, payment_method, payment_status) VALUES
(1, '2024-03-01', 'Credit Card', 'Paid'),
(2, '2024-03-02', 'PayPal', 'Paid'),
(3, '2024-03-03', 'UPI', 'Pending'),
(4, '2024-03-04', 'Credit Card', 'Paid'),
(5, '2024-03-05', 'UPI', 'Paid'),
(6, '2024-03-06', 'Credit Card', 'Failed'),
(7, '2024-03-07', 'PayPal', 'Paid'),
(8, '2024-03-08', 'Credit Card', 'Pending'),
(9, '2024-03-09', 'UPI', 'Paid'),
(10, '2024-03-10', 'Credit Card', 'Paid');

-- Insert more realistic shipping data
INSERT INTO Shipping (order_id, shipping_date, delivery_date, shipping_status) VALUES
(1, '2024-03-02', '2024-03-05', 'Delivered'),
(2, '2024-03-03', '2024-03-07', 'Delivered'),  
(3, '2024-03-04', NULL, 'In Transit'),         
(4, '2024-03-05', '2024-03-08', 'Delivered'),
(5, '2024-03-06', NULL, 'In Transit'),         
(6, '2024-03-07', '2024-03-10', 'Delivered'),  
(7, '2024-03-08', '2024-03-11', 'Delivered'),
(8, '2024-03-09', NULL, 'In Transit'),         
(9, '2024-03-10', NULL, 'In Transit'),         
(10, '2024-03-11', '2024-03-14', 'Delivered');



-- TASKs

--CURD
-- Insert a new product
INSERT INTO Products (name, category_id, price, stock_quantity, added_date)
VALUES ('Smart Watch', 1, 149.99, 40, CURDATE());

-- Insert a new customer
INSERT INTO Customers (name, email, phone_number, address, registration_date)
VALUES ('Olivia White', 'olivia.w@email.com', '9876543210', '12 River St, Austin, TX', CURDATE());

-- Insert a new order for that customer
INSERT INTO Orders (customer_id, order_date, total_amount, status)
VALUES (11, CURDATE(), 149.99, 'Pending');

-- Add the product to the order
INSERT INTO Order_Items (order_id, product_id, quantity, subtotal)
VALUES (11, 11, 1, 149.99);

-- Insert payment record
INSERT INTO Payments (order_id, payment_date, payment_method, payment_status)
VALUES (11, CURDATE(), 'UPI', 'Pending');

-- Insert shipping record
INSERT INTO Shipping (order_id, shipping_date, delivery_date, shipping_status)
VALUES (11, CURDATE(), NULL, 'In Transit');



UPDATE Products 
SET stock_quantity = stock_quantity - 2 
WHERE product_id = 1;

-- Update order status from Pending to Shipped
UPDATE Orders 
SET status = 'Shipped' 
WHERE order_id = 1;

-- Update customer phone number
UPDATE Customers 
SET phone_number = '9998887777' 
WHERE customer_id = 1;


--we can not directly delete in order table
-- Delete related data from child tables first
DELETE FROM Order_Items
WHERE order_id IN (
    SELECT order_id FROM Orders
    WHERE status = 'Cancelled'
    AND order_date < (CURDATE() - INTERVAL 30 DAY)
);

DELETE FROM Payments
WHERE order_id IN (
    SELECT order_id FROM Orders
    WHERE status = 'Cancelled'
    AND order_date < (CURDATE() - INTERVAL 30 DAY)
);

DELETE FROM Shipping
WHERE order_id IN (
    SELECT order_id FROM Orders
    WHERE status = 'Cancelled'
    AND order_date < (CURDATE() - INTERVAL 30 DAY)
);

-- Then delete from parent table
DELETE FROM Orders
WHERE status = 'Cancelled'
AND order_date < (CURDATE() - INTERVAL 30 DAY);




-- Use SQL Clauses (WHERE, HAVING, LIMIT)
SELECT * 
FROM Orders
WHERE order_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 MONTH) AND CURDATE();

SELECT *
FROM Products
ORDER BY price DESC
LIMIT 5;

/* need to put some extra orders for this query 
INSERT INTO Orders (customer_id, order_date, total_amount, status)
VALUES (1, CURDATE(), 59.99, 'Delivered'),
       (1, CURDATE(), 99.99, 'Delivered'),
       (1, CURDATE(), 39.99, 'Pending'),
       (1, CURDATE(), 19.99, 'Shipped');
*/

SELECT C.customer_id, C.name, COUNT(O.order_id) AS total_orders
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.name
HAVING COUNT(O.order_id) > 3;




--Apply SQL Operators (AND, OR, NOT)
SELECT O.order_id, O.customer_id, O.status, P.payment_status
FROM Orders O
JOIN Payments P ON O.order_id = P.order_id
WHERE O.status = 'Pending' 
AND P.payment_status = 'Paid';
-- there are no orders which has mach both this conditions so it will return no rows

SELECT *
FROM Products
WHERE NOT stock_quantity = 0;


SELECT C.*
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id
HAVING C.registration_date > '2022-12-31'
   OR SUM(O.total_amount) > 10000;



--Sorting & Grouping Data (ORDER BY, GROUP BY)
SELECT * 
FROM Products
ORDER BY price DESC;


SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;


SELECT Cat.category_id, Cat.category_name, SUM(OI.subtotal) AS total_revenue
FROM Categories Cat
JOIN Products P ON Cat.category_id = P.category_id
JOIN Order_Items OI ON P.product_id = OI.product_id
GROUP BY Cat.category_id, Cat.category_name;




--Use Aggregate Functions (SUM, AVG, MAX, MIN, COUNT)

SELECT SUM(subtotal) AS total_revenue
FROM Order_Items;


SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1;


SELECT AVG(total_amount) AS average_order_value
FROM Orders;





--Establish Primary & Foreign Key Relationships
/*All primary and foreign key relationships in the database have been successfully created. Orders are linked 
to customers, order items are linked to both orders and products, and payments and shipping are linked to orders, 
ensuring proper connections between all related tables.*/



--Implement Joins
SELECT P.product_id, P.name AS product_name, C.category_name
FROM Products P
INNER JOIN Categories C ON P.category_id = C.category_id;


SELECT O.order_id, O.order_date, O.status, C.customer_id, C.name AS customer_name
FROM Orders O
LEFT JOIN Customers C ON O.customer_id = C.customer_id;


SELECT O.order_id, O.status, S.shipping_status, S.shipping_date, S.delivery_date
FROM Orders O
RIGHT JOIN Shipping S ON O.order_id = S.order_id
WHERE S.delivery_date IS NULL;


SELECT C.customer_id, C.name
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id
WHERE O.order_id IS NULL;




--Use Subqueries
SELECT *
FROM Orders
WHERE customer_id IN (
    SELECT customer_id
    FROM Customers
    WHERE registration_date > '2022-12-31'
);


SELECT *
FROM Customers
WHERE customer_id = (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    ORDER BY SUM(total_amount) DESC
    LIMIT 1
);


SELECT *
FROM Products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id
    FROM Order_Items
);





--Implement Date & Time Functions
SELECT MONTH(order_date) AS order_month, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY order_month;


SELECT order_id, shipping_date, delivery_date,
       DATEDIFF(delivery_date, shipping_date) AS delivery_days
FROM Shipping
WHERE delivery_date IS NOT NULL;


SELECT order_id, DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_order_date
FROM Orders;




--Use String Manipulation Functions
SELECT product_id, UPPER(name) AS product_name_upper
FROM Products;


SELECT customer_id, TRIM(name) AS customer_name_trimmed
FROM Customers;


SELECT customer_id, 
       IFNULL(email, 'Not Provided') AS customer_email
FROM Customers;





--Implement Window Functions
SELECT C.customer_id, C.name, SUM(O.total_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(O.total_amount) DESC) AS spending_rank
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.name;


SELECT MONTH(order_date) AS order_month,
       SUM(total_amount) AS monthly_revenue,
       SUM(SUM(total_amount)) OVER (ORDER BY MONTH(order_date)) AS cumulative_revenue
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);


SELECT order_id, order_date, 
       COUNT(order_id) OVER (ORDER BY order_date) AS running_total_orders
FROM Orders
ORDER BY order_date;


SELECT order_id, order_date, total_amount,
       SUM(total_amount) OVER (ORDER BY order_date) AS running_total_amount
FROM Orders
ORDER BY order_date;





--Apply SQL CASE Expressions
SELECT C.customer_id, C.name, SUM(O.total_amount) AS total_spent,
       CASE 
           WHEN SUM(O.total_amount) > 900 THEN 'Gold'
           WHEN SUM(O.total_amount) BETWEEN 400 AND 900 THEN 'Silver'
           ELSE 'Bronze'
       END AS Loyalty_Status
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.name;




SELECT P.product_id, P.name, SUM(OI.quantity) AS total_units_sold,
       CASE
           WHEN SUM(OI.quantity) > 4 THEN 'Best Seller'
           WHEN SUM(OI.quantity) BETWEEN 2 AND 4 THEN 'Popular'
           ELSE 'Regular'
       END AS Product_Category
FROM Products P
LEFT JOIN Order_Items OI ON P.product_id = OI.product_id
GROUP BY P.product_id, P.name;





