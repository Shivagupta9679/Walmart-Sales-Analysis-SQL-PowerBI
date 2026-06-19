CREATE DATABASE IF NOT EXISTS salesDataWalmart;

USE salesDataWalmart;
CREATE TABLE IF NOT EXISTS walmart_sales(
invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
quantity INT NOT NULL,
VAT DECIMAL(6,4) NOT NULL,
total DECIMAL(12,4) NOT NULL,
date DATETIME NOT NULL,
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL,
cogs DECIMAL(10,2) NOT NULL,
gross_margin_pct DECIMAL(11,9),
gross_income DECIMAL(12,4) NOT NULL,
rating DECIMAL(2,1)
);
SELECT * FROM Walmart_sales;

--------------------------------------------------------------------------------------------------------------
----------------------Feature Engineering---------------------------------------------------------------------

-- time_of_day
SELECT
    time,
    (CASE
       WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
       WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
       ELSE 'Evening'
	 END
     ) AS time_of_date
FROM walmart_sales;
ALTER TABLE walmart_sales ADD COLUMN time_of_day VARCHAR(20);
SELECT * FROM walmart_sales;

UPDATE walmart_sales
SET time_of_day = (
    CASE 
      WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
	  WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
	  ELSE 'Evening'
	 END
);
SELECT * FROM walmart_sales;
-----------------------------------------------------------------------------
-- day_name 
SELECT
     date,
     DAYNAME(date) AS day_name
FROM walmart_sales;
ALTER TABLE walmart_sales ADD COLUMN day_name VARCHAR(10);
SELECT * FROM walmart_sales

UPDATE walmart_sales
SET day_name = DAYNAME(date);
--------------------------------------------------------------------------------
-- month_name 

SELECT 
   date,
   MONTHNAME(date)
FROM walmart_sales;

ALTER TABLE walmart_sales ADD COLUMN month_name VARCHAR(10);
UPDATE walmart_sales
SET month_name = MONTHNAME(date);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------- Generic -------------------------------------------------------------------------------------------------------------------------------------------------------

--- How many unique cities does the data have?
SELECT
   DISTINCT city
FROM walmart_sales;

--- In which city is each branch?
SELECT
    DISTINCT branch
FROM walmart_sales;

SELECT
   DISTINCT city,
   branch
FROM walmart_sales;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------Product------------------------------------------------------------------------------------------------------------

-- How many unique product lines does the data have?
SELECT
    count(DISTINCT product_line)
FROM walmart_sales;

-- What is the most common payment method?
SELECT
   payment_method,
   COUNT(payment_method) AS cnt
FROM walmart_sales
GROUP BY payment_method
ORDER BY cnt DESC;

-- What is the most selling product line?
SELECT 
   product_line,
   COUNT(product_line) AS cnt
FROM walmart_sales
GROUP BY product_line
ORDER BY cnt DESC;

-- What is the total revenue by month ?
SELECT 
   month_name AS month,
   SUM(total) AS total_revenue
FROM walmart_sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- What month Had the largest COGS?
SELECT 
   month_name AS month,
   SUM(cogs) AS cogs 
FROM walmart_sales
GROUP BY month_name
ORDER BY cogs;

-- What product line had the largest revenue?
SELECT
   product_line,
   SUM(total) AS total_revenue
FROM walmart_sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT 
   branch,
   city,
   SUM(total) AS total_revenue
FROM walmart_sales
GROUP BY city,branch
ORDER BY total_revenue DESC;

-- What product line had the largest VAT?
SELECT
   product_line,
   AVG(VAT) AS avg_tax
FROM walmart_sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- Which branch sold more product than average product sold
SELECT
   branch,
   SUM(quantity) AS qty
FROM walmart_sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM walmart_sales);

-- What is the most common product line by gender
SELECT 
    gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM walmart_sales
GROUP BY gender,product_line
ORDER BY total_cnt DESC;

-- What is the average rating of each product line?
SELECT
   AVG(rating) AS avg_rating,
   product_line
FROM walmart_sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- What is the average rating of each product_line?
SELECT
   AVG(rating) AS avg_rating,
   product_line
FROM walmart_sales
GROUP BY product_line
ORDER BY avg_rating DESC;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------- Sales -----------------------------------------------------------------------------------------------------------------------------------------
-- Number of sales made in each time of the day per weekday
SELECT
   time_of_day,
   COUNT(*) AS total_sales
FROM walmart_sales
WHERE day_name = 'Monday'
GROUP BY time_of_day
ORDER BY total_sales DESC;

-- Which of the customer types brings the most revenue?
SELECT
   customer_type,
   SUM(total) AS total_rev
FROM walmart_sales
GROUP BY customer_type
ORDER BY total_rev DESC;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT
   city,
   AVG(VAT) AS VAT
FROM walmart_sales
GROUP BY city
ORDER BY VAT DESC;

-- Which customer type pays the most in VAT 
SELECT
   customer_type,
   AVG(VAT) AS VAT
FROM walmart_sales
GROUP BY customer_type
ORDER BY VAT DESC;

-- Compare sales of different branches.
SELECT
    branch,
    COUNT(*) AS total_transactions,
    SUM(total) AS revenue
FROM walmart_sales
GROUP BY branch
ORDER BY revenue DESC

-- Show all unique cities and branches.
SELECT city AS location
FROM walmart_sales

UNION

SELECT branch
FROM walmart_sales;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------Customers-----------------------------------------------------------------------------------------------------------------------------------------------

-- How many unique customer types does the data have?
SELECT
   DISTINCT customer_type
FROM walmart_sales;

-- How many unique payment methods does the data have?
SELECT
   DISTINCT payment_method
FROM walmart_sales;

-- Which customer type buys the most?
SELECT
   customer_type,
   COUNT(*) AS cstm_cnt
FROM walmart_sales
GROUP BY customer_type;

-- What is the gender of most of the customer?
SELECT
   gender,
   COUNT(*) AS gender_cnt
FROM walmart_sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?
SELECT
   gender,
   COUNT(*) as gender_cnt
FROM walmart_sales
WHERE branch = 'C'
GROUP BY gender
ORDER BY gender_cnt DESC;

-- Which time  of the day do customer give most ratings?
SELECT
   time_of_day,
   AVG(rating) AS avg_rating 
FROM walmart_sales
GROUP BY time_of_day
ORDER BY avg_rating;

-- Which time of the day do customers give most ratings per branch?
SELECT
   time_of_day,
   AVG(rating) AS avg_rating
FROM walmart_sales
WHERE branch = 'A'
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which day of the week has the best avg rating?
SELECT
   day_name,
   AVG(rating) AS avg_rating
FROM walmart_sales
GROUP BY day_name
ORDER BY avg_rating DESC;

-- Which day of the week has the best average ratings per branch?
SELECT
    day_name,
    AVG(rating) AS avg_rating
FROM walmart_sales
   




