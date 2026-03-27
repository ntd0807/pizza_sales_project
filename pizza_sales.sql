SELECT *
FROM pizza_sales.dbo.pizza_sales
;

SELECT SUM(total_price) as total_revenue
FROM pizza_sales.dbo.pizza_sales
;

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_value
FROM pizza_sales.dbo.pizza_sales
;

SELECT SUM(quantity) AS total_pizza_sold
FROM pizza_sales.dbo.pizza_sales
;

SELECT COUNT(DISTINCT order_id) AS total_order 
FROM pizza_sales.dbo.pizza_sales
;

SELECT CAST(CAST(SUM(quantity) as DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) as DECIMAL(10,2)) as DECIMAL(10,2)) AS Avg_pizza_sold_per_order
FROM pizza_sales.dbo.pizza_sales
;

--Daily Trend 
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales.dbo.pizza_sales
GROUP BY DATENAME(DW, order_date)
;

--Hourly Trend for total Orders
SELECT DATEPART(HOUR, order_time) AS order_hours, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales.dbo.pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)
;

--Percentage of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales.dbo.pizza_sales) AS DECIMAL(10,2)) AS pct_sales
FROM pizza_sales.dbo.pizza_sales
GROUP BY pizza_category

--Percentage of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales.dbo.pizza_sales) AS DECIMAL(10,2)) AS pct_sales
FROM pizza_sales.dbo.pizza_sales 
GROUP BY pizza_size
ORDER BY pct_sales DESC
;

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales.dbo.pizza_sales
GROUP BY pizza_category
;

--TOP 5 best sellers by total pizza sold
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
;

--Bottom 5 worst sellers by total pizza sold
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
;

