# Practical Exam SQL Project

## E-Commerce Management System

This project demonstrates the implementation of a **relational database** using MySQL / phpMyAdmin, including table creation, relationships, CRUD operations, aggregate functions, joins, subqueries, window functions, date/time functions, string manipulation, and CASE expressions.

---

## Database Tables

- **Categories** – Stores product categories.  
- **Products** – Stores product details, linked to categories.  
- **Customers** – Stores customer information.  
- **Orders** – Stores orders placed by customers.  
- **Order_Items** – Stores items in each order, linked to orders and products.  
- **Payments** – Stores payment information linked to orders.  
- **Shipping** – Stores shipping details linked to orders.  

---

## Key Features Implemented

### CRUD Operations
- Insert new products, customers, and orders.  
- Update stock when orders are placed.  
- Delete cancelled orders older than 30 days.  

### Relationships
- Primary and foreign keys established:  
  - `Orders → Customers`  
  - `Order_Items → Orders & Products`  
  - `Payments → Orders`  
  - `Shipping → Orders`  

### Sorting & Grouping
- Products sorted by price.  
- Number of orders per customer.  
- Total revenue per category.  

### Aggregate Functions
- Total revenue of the store.  
- Most purchased products.  
- Average order value.  

### Joins
- **INNER JOIN** to display products with category names.  
- **LEFT JOIN** to show all orders with customer details.  
- **RIGHT JOIN** to find orders not shipped.  
- **FULL OUTER JOIN** for customers with no orders.  

### Subqueries
- Orders by customers registered after 2022.  
- Customer with maximum spending.  
- Products never ordered.  

### Date & Time Functions
- Extract month from order date.  
- Calculate delivery time.  
- Format order date.  

### String Functions
- Convert product names to uppercase.  
- Trim whitespace from customer names.  
- Replace missing emails with “Not Provided”.  

### Window Functions
- Rank customers by total spending.  
- Cumulative revenue per month.  
- Running total of orders / revenue.  

### CASE Expressions
- Customer loyalty status: Gold, Silver, Bronze.  
- Product categories: Best Seller, Popular, Regular.  

---

## Technologies Used
- **MySQL / phpMyAdmin** – For database creation and queries  
- **SQL** – CRUD operations, joins, subqueries, window functions, and aggregate functions  

---

## Conclusion
This project demonstrates a **complete database workflow**, from table creation and data insertion to advanced SQL operations, ensuring **data integrity, efficient retrieval, and meaningful reporting**. It is a practical example of **real-world e-commerce / course management database systems**.
