CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- To display all the orders and sales details
SELECT * FROM Orders;
SELECT * FROM details;

-- Orders from delhi
SELECT *
FROM Orders
WHERE City = 'Delhi';

-- High value orders
SELECT *
FROM Details
WHERE Amount > 3000;

-- Sort orders by amount
SELECT *
FROM Details
ORDER BY Amount DESC;

-- Sales by category
SELECT Category,
SUM(Amount) AS Total_Sales
FROM Details
GROUP BY Category;

-- Sales by profit
SELECT Category,
SUM(Profit) AS Total_Profit
FROM Details
GROUP BY Category;

-- Sales by payment mode
SELECT PaymentMode,
SUM(Amount) AS Sales
FROM Details
GROUP BY PaymentMode
ORDER BY Sales DESC;

-- Top 5 highest sales orders
SELECT Order_ID,Amount
FROM Details
ORDER BY Amount DESC
LIMIT 5;

-- Aggregate (Sum,Avg,Max,Min)
SELECT
    SUM(Amount) AS Total_Sales,
    AVG(Amount) AS Average_Sales,
    MAX(Amount) AS Highest_Sale,
    MIN(Amount) AS Lowest_Sale
FROM Details;

-- Subquery (Above avg sales)
SELECT *
FROM Details 
WHERE Amount >
(
    SELECT AVG(Amount)
    FROM Details
);

-- View
CREATE VIEW Category_Sales AS
SELECT Category,
SUM(Amount) AS Total_Sales
FROM Details
GROUP BY Category;
-- View data
SELECT * FROM Category_Sales;

-- Most used payment mode
SELECT PaymentMode,
COUNT(*) AS Orders_Count
FROM Details
GROUP BY PaymentMode
ORDER BY Orders_Count DESC;

-- Inner join
SELECT *
FROM Orders o
INNER JOIN Details d
ON o.`Order ID` = d.`Order ID`;

-- Left join
SELECT
    o.`Order ID`,
    o.CustomerName,
    o.State,
    d.Category,
    d.Amount,
    d.Profit
FROM Orders o
LEFT JOIN Details d
ON o.`Order ID` = d.`Order ID`;

-- Right join
SELECT
    o.`Order ID`,
    o.CustomerName,
    o.State,
    d.Category,
    d.Amount,
    d.Profit
FROM Orders o
RIGHT JOIN Details d
ON o.`Order ID` = d.`Order ID`;

-- Most profitable category
SELECT Category,
SUM(Profit) AS Profit
FROM Details
GROUP BY Category
ORDER BY Profit DESC
LIMIT 1;

-- Profit by state
SELECT
o.State,
SUM(d.Profit) AS Total_Profit
FROM Orders o
INNER JOIN Details d
ON o.Order_ID = d.Order_ID
GROUP BY o.State
ORDER BY Total_Profit DESC;

