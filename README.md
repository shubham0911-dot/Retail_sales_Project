# Retail_sales_Project
SQL-based data analytics project that analyzes retail sales transactions to generate insights such as total revenue, product performance, city-wise sales distribution, and monthly trends using joins, aggregations, and window functions.
# Retail Sales Analytics – SQL Project

## Project Overview

This project focuses on analyzing retail sales data using SQL.
The goal of the project is to generate business insights such as total revenue, top-selling products, city-wise sales performance, and monthly sales trends.

This project demonstrates SQL skills commonly used by Data Analysts including joins, aggregations, window functions, and relational database design.

---

## Tools Used

* MySQL
* SQL
* GitHub

---

## Database Schema

The project uses three tables:

### Customers Table

| Column        | Description           |
| ------------- | --------------------- |
| customer_id   | Unique ID of customer |
| customer_name | Name of the customer  |
| city          | Customer location     |

### Products Table

| Column       | Description       |
| ------------ | ----------------- |
| product_id   | Unique product ID |
| product_name | Product name      |
| category     | Product category  |
| price        | Product price     |

### Orders Table

| Column       | Description                   |
| ------------ | ----------------------------- |
| order_id     | Unique order ID               |
| customer_id  | Customer who placed the order |
| product_id   | Product purchased             |
| order_date   | Date of purchase              |
| sales_amount | Sales value                   |

---

## Table Creation

```sql
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
price INT
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
order_date DATE,
sales_amount INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

---

## Sample Data

```sql
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
```

---

## Key SQL Analysis

### Total Revenue

```sql
SELECT SUM(sales_amount) AS total_revenue
FROM orders;
```

### Top Selling Products

```sql
SELECT p.product_name,
SUM(o.sales_amount) AS total_sales
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;
```

### Sales by City

```sql
SELECT c.city,
SUM(o.sales_amount) AS total_sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.city;
```

### Monthly Sales Trend

```sql
SELECT MONTH(order_date) AS month,
SUM(sales_amount) AS monthly_sales
FROM orders
GROUP BY MONTH(order_date);
```

### Product Ranking using Window Function

```sql
SELECT p.product_name,
SUM(o.sales_amount) AS total_sales,
RANK() OVER (ORDER BY SUM(o.sales_amount) DESC) AS rank_position
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name;
```

---

## Key Insights

* Identified top revenue generating products
* Analyzed city-wise sales performance
* Evaluated monthly sales trends
* Ranked products based on revenue contribution

---

## Author

**Shubham Lanjekar**
Aspiring Data Analyst
Skills: SQL | Python | Power BI | Excel
