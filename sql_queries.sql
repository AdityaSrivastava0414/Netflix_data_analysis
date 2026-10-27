-- Netflix Data Analytics Project
-- Analysis queries for the cleaned Netflix customer dataset
-- Database: netflix_customers_db
-- Table: netflix_customers

-- Run these first to verify the database and table names.
SHOW DATABASES;
USE netflix_customers_db;
SHOW TABLES;
DESCRIBE netflix_customers;

-- 1. Preview the cleaned data
SELECT *
FROM netflix_customers
LIMIT 10;

-- 2. Total customers
SELECT COUNT(*) AS Total_Customers
FROM netflix_customers;

-- 3. Active customers
SELECT COUNT(*) AS Active_Customers
FROM netflix_customers
WHERE Account_Status = 'Active';

-- 4. Customers by subscription plan
SELECT
    Subscription_Plan,
    COUNT(*) AS Customers
FROM netflix_customers
GROUP BY Subscription_Plan
ORDER BY Customers DESC;

-- 5. Revenue by subscription plan
SELECT
    Subscription_Plan,
    ROUND(SUM(Customer_Revenue), 2) AS Revenue
FROM netflix_customers
GROUP BY Subscription_Plan
ORDER BY Revenue DESC;

-- 6. Popular genres
SELECT
    Genre,
    COUNT(*) AS Views
FROM netflix_customers
GROUP BY Genre
ORDER BY Views DESC;

-- 7. Country-wise customers
SELECT
    Country,
    COUNT(*) AS Customers
FROM netflix_customers
GROUP BY Country
ORDER BY Customers DESC;

-- 8. Device usage
SELECT
    Device,
    COUNT(*) AS Users
FROM netflix_customers
GROUP BY Device
ORDER BY Users DESC;

-- 9. Average watch hours by subscription plan
SELECT
    Subscription_Plan,
    ROUND(AVG(Watch_Hours), 2) AS Avg_Watch_Hours
FROM netflix_customers
GROUP BY Subscription_Plan
ORDER BY Avg_Watch_Hours DESC;

-- 10. Top 10 customers by revenue
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(Customer_Revenue, 2) AS Customer_Revenue
FROM netflix_customers
ORDER BY Customer_Revenue DESC
LIMIT 10;

-- 11. Movie versus TV show
SELECT
    Content_Type,
    COUNT(*) AS Total
FROM netflix_customers
GROUP BY Content_Type
ORDER BY Total DESC;

-- 12. Average rating by genre
SELECT
    Genre,
    ROUND(AVG(Avg_Rating), 2) AS Avg_Rating
FROM netflix_customers
GROUP BY Genre
ORDER BY Avg_Rating DESC;

-- 13. Customers by account status
SELECT
    Account_Status,
    COUNT(*) AS Customers
FROM netflix_customers
GROUP BY Account_Status
ORDER BY Customers DESC;

-- 14. Average monthly sessions by subscription plan
SELECT
    Subscription_Plan,
    ROUND(AVG(Monthly_Sessions), 2) AS Avg_Monthly_Sessions
FROM netflix_customers
GROUP BY Subscription_Plan
ORDER BY Avg_Monthly_Sessions DESC;

-- 15. Downloads by genre
SELECT
    Genre,
    SUM(Download_Count) AS Total_Downloads
FROM netflix_customers
GROUP BY Genre
ORDER BY Total_Downloads DESC;

-- 16. Customer count and revenue by country
SELECT
    Country,
    COUNT(*) AS Customers,
    ROUND(SUM(Customer_Revenue), 2) AS Revenue
FROM netflix_customers
GROUP BY Country
ORDER BY Revenue DESC;

-- 17. High-value customers: top 10 by engagement score
SELECT
    Customer_ID,
    Customer_Name,
    Subscription_Plan,
    ROUND(Customer_Revenue, 2) AS Customer_Revenue,
    ROUND(Engagement_Score, 2) AS Engagement_Score
FROM netflix_customers
ORDER BY Engagement_Score DESC, Customer_Revenue DESC
LIMIT 10;

-- 18. Customer distribution by age group
SELECT
    Age_Group,
    COUNT(*) AS Customers
FROM netflix_customers
GROUP BY Age_Group
ORDER BY Age_Group;

-- 19. Customer distribution by watch category
SELECT
    Watch_Category,
    COUNT(*) AS Customers
FROM netflix_customers
GROUP BY Watch_Category
ORDER BY Customers DESC;
