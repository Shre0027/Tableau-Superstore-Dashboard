-- SUPERSTORE ANALYSIS


SELECT * FROM superstore LIMIT 10;

-- 💰 1. Total Sales & Profit by Category
SELECT 
    Category, 
    ROUND(SUM(Sales), 2) AS Total_Sales, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 📈 2. Monthly Sales Trend
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Month
ORDER BY Month;


-- 🏙 3. Top 5 Cities by Sales
SELECT 
    City, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;


-- 🚛 4. Shipping Mode & Profitability
SELECT 
    `Ship Mode`, 
    ROUND(SUM(Sales), 2) AS Total_Sales, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Ship Mode`
ORDER BY Total_Profit DESC;


-- 🎯 5. Most Profitable Customer Segments
SELECT 
    Segment, 
    ROUND(SUM(Sales), 2) AS Total_Sales, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Segment
ORDER BY Total_Profit DESC;


-- 📦 6. Impact of Discounts on Profitability
SELECT 
    Discount, 
    COUNT(*) AS Num_Orders, 
    ROUND(SUM(Sales), 2) AS Total_Sales, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount ASC;


-- ⏳ 7. Average Shipping Time per Region
SELECT 
    Region, 
    ROUND(AVG(DATEDIFF(`Ship Date`, `Order Date`)), 2) AS Avg_Shipping_Days
FROM superstore
GROUP BY Region
ORDER BY Avg_Shipping_Days DESC;
