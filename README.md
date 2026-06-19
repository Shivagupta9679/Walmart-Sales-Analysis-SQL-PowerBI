# Walmart-Sales-Analysis-SQL-PowerBI

## Project Overview
This project explores Walmart Sales data to understand top-performing 
branches and products, sales trends, and customer behaviour using 
SQL queries and Power BI dashboard. The aim is to study how sales 
strategies can be improved and optimized.

##  Purposes Of The Project
To gain insight into Walmart sales data and understand the different 
factors that affect sales across branches located in:
- 📍 Mandalay
- 📍 Yangon  
- 📍 Naypyitaw

## About Data

The dataset was obtained from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting). This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |

## Project Structure
```text
Walmart-Sales-Analysis-SQL-PowerBI/
│
├── Dataset/
│   └── walmart_sales.csv
│
├── SQL/
│   └── walmart_analysis.sql
│
├── Dashboard/
│   └── Walmart_Sales_Dashboard.pbix
│
├── Images/
│   └── dashboard_screenshot.png
│
└── README.md
```
## Tools & Technologies
- SQL (Data Cleaning & Analysis)
- Power BI (Dashboard Development)
- Excel (Data Preparation)
- GitHub (Version Control)

##  Approach Used 
### 1. Data Wrangling
- Built database and created table
- Inserted data with NOT NULL constraints
- No NULL values found — filtered at table creation stage

### 2. Feature Engineering
New columns created from existing data:
- `time_of_day` → Morning / Afternoon / Evening sales insight
- `day_name` → Mon, Tue, Wed, Thu, Fri (busiest branch day)
- `month_name` → Jan, Feb, Mar (highest sales & profit month)

### 3. Exploratory Data Analysis (EDA)
SQL queries written to answer all business questions listed below.

## SQL Analysis List

### 1. Product Analysis
Analyzed different product lines to identify best and 
worst performing lines and areas needing improvement.

### 2. Sales Analysis
Answered sales trend questions to measure effectiveness 
of each sales strategy and identify modifications needed 
to increase sales.

### 3. Customer Analysis
Uncovered different customer segments, purchase trends, 
and profitability of each customer segment.

##  Power BI Dashboard Feature
The interactive dashboard includes:
- Total Revenue,Rating,Quantity Sold and Average Transaction
- Sales by Branch & City
- Product Line Performance
- Customer Type & Gender Analysis
- Sales by Time of Day
- Monthly Revenue Trend
- Payment Method Breakdown

 ## Dashboard Preview
  <img width="1327" height="743" alt="Screenshot 2026-06-19 161130" src="https://github.com/user-attachments/assets/5ed56b7e-7401-4609-b849-b626b033d6bf" />

 ##  Key Insights
- **Branch C** generated the highest total revenue
- **Food & Beverages** was the top-selling product line
- **Evening hours (6–9 PM)** had the highest footfall
- **E-wallet** was the most preferred payment method
- **Member customers** spent more on average than Normal customers
 
## Author

**Shiva Gupta**

Aspiring Data Scientist | SQL | Power BI | Machine Learning

- GitHub: https://github.com/Shivagupta9679/Walmart-Sales-Analysis-SQL-PowerBI
- LinkedIn: www.linkedin.com/in/shiva-gupta-63b277375 
  
