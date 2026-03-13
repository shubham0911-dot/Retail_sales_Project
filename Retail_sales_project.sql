CREATE DATABASE retail_sales_db;

USE retail_sales_db;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);

select*from customers;

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
price INT
);

select*from products;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
order_date DATE,
sales_amount INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

select*from orders;

INSERT INTO customers VALUES
(1,'Rahul Sharma','Mumbai'),
(2,'Amit Verma','Delhi'),
(3,'Priya Patel','Ahmedabad'),
(4,'Neha Singh','Pune'),
(5,'Rohit Gupta','Bangalore');

INSERT INTO products VALUES
(101,'Laptop','Electronics',60000),
(102,'Smartphone','Electronics',30000),
(103,'Headphones','Accessories',2000),
(104,'Keyboard','Accessories',1500),
(105,'Monitor','Electronics',12000);

INSERT INTO orders VALUES
(1001,1,101,'2024-01-10',60000),
(1002,2,102,'2024-01-12',30000),
(1003,3,103,'2024-01-15',2000),
(1004,4,104,'2024-02-02',1500),
(1005,5,105,'2024-02-10',12000),
(1006,1,102,'2024-03-01',30000),
(1007,2,101,'2024-03-05',60000);

SELECT SUM(sales_amount) AS total_revenue
FROM orders;

SELECT p.product_name,
SUM(o.sales_amount) AS total_sales
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

SELECT c.city,
SUM(o.sales_amount) AS total_sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.city;

SELECT MONTH(order_date) AS month,
SUM(sales_amount) AS monthly_sales
FROM orders
GROUP BY MONTH(order_date);

SELECT p.product_name,
SUM(o.sales_amount) AS total_sales,
RANK() OVER (ORDER BY SUM(o.sales_amount) DESC) AS rank_position
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name;

