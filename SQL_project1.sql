-- SQL Retail Sales Aanlysis - P1
Create Database sql_project_P1;
-- Create Table
CREATE TABLE retail_sales
(
transactions_id	INT PRIMARY KEY,
sale_date	DATE,
sale_time	TIME,
customer_id	INT,
gender	VARCHAR(15),
age	INT,
category VARCHAR(15),	
quantiy	INT,
price_per_unit FLOAT,	
cogs	FLOAT,
total_sale FLOAT
);

SELECT * FROM retail_sales
WHERE 
quantiy;


SELECT * FROM retail_sales
WHERE 
transactions_id IS NULL
or 
sale_date is NULL
or
sale_time is NULL
or
customer_id is NULL
or
gender is NULL
or
age is NULL
or
category is NULL
or 
quantiy is NULL
or 
price_per_unit is NULL
or 
cogs is NULL 
or 
total_sale is NULL ;

SELECT count(*) FROM retail_sales

-- DATA EXPLORATION

-- HOW MANY SALES WE HAVE ?
SELECT  count(*) as total_sale FROM retail_sales

-- HOW MANY UNIQUE CUSTOMERS WE HAVE ?
SELECT count(DISTINCT customer_id) as total_sale FROM retail_sales

-- HOW MANY UNIQUE CATEGORY WE HAVE ?
SELECT count(DISTINCT category) as total_sale FROM retail_sales
SELECT DISTINCT category FROM retail_sales;

-- DATA ANALYSIS & BUSINESS KEY PROBLEMS & ANSWERS

-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT  * 
FROM retail_sales WHERE sale_date = '2022-11-05';

-- Q2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT * FROM retail_sales 
WHERE 
    category = 'Clothing' 
    AND DATE_FORMAT(STR_TO_DATE(sale_date, '%Y-%m-%d'), '%Y-%m') = '2022-11'
    AND quantiy >= 4
    
-- Q3 Write a SQL query to calculate the total sales (total_sale) for each category?

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1;

-- Q4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category

SELECT 
   AVG (age) as AVG_AGE
FROM retail_sales
WHERE category = 'Beauty'

-- Q5 Write a SQL query to find all transactions where the total_sale is greater than 1000?
SELECT * FROM retail_sales
WHERE total_sale > 1000;

-- Q6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
 SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1;
   
SELECT 
    year,
    month,
    avg_sale
FROM (
    SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rnk
    FROM retail_sales
    GROUP BY year, month
) AS t1
WHERE rnk = 1;

-- END OF PROJECT
