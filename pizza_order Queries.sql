
select * from pizza_sales;

select sum(total_price) as Total_Revenue from pizza_sales;

--Avg Order Value--

select sum(total_price) / count(distinct order_id) as Avg_order_value from pizza_sales;

--Total Pizza Sold--

Select sum(quantity) as total_pizza_sold from pizza_sales;

-- Total Order place--

Select count (distinct order_id) as total_order_Place from pizza_sales;

--Avg pizza per order--

select cast(Cast(sum(quantity) as decimal (10,2)) / 
Cast(COUNT (distinct order_id) as decimal(10,2)) as decimal(10,2))  as Avg_pizza_per_order from pizza_sales;

--Daily trend for the orders--

select DATENAME(DW,order_date) as Order_day , count(distinct order_id) as Total_Orders from pizza_sales
group by DATENAME(DW,order_date)
order by count(distinct order_id) desc;

-- Monthly trend of order--

select DATENAME(Month,order_date) as Order_month , count(distinct order_id) as Total_Orders from pizza_sales
group by DATENAME(Month,order_date)
order by total_orders desc;

--percentage of total sales as per category---

select pizza_category, cast(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as decimal(10,2)) as percentage_total_sales
from pizza_sales
group by pizza_category
order by percentage_total_sales desc;

--percentage of total sales as per pizza size (where Datepart(quarter,order_date) = 1) for Quarter 1---

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_sales, cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales where Datepart(quarter,order_date) = 1) as decimal(10,2)) as percentage_total_sales
from pizza_sales
where Datepart(quarter,order_date) = 1
group by pizza_size
order by percentage_total_sales desc;

---- Top 5 sellers by revenue  ---

select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
Order by total_revenue desc;


---- Bottom 5 sellers by revenue ---

select Top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
Order by total_revenue asc;

---- Top 5 sellers by QTY  ---

select top 5 pizza_name, sum(quantity) as total_Quantity from pizza_sales
group by pizza_name
Order by total_Quantity desc;


---- Bottom 5 sellers by QTy ---

select Top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
Order by total_quantity asc;

---- Top 5 sellers by orders  ---

select top 5 pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
Order by total_order desc;


---- Bottom 5 sellers by orders ---

select Top 5 pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
Order by total_order asc;

