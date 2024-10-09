select * from pizza_sales

select round(sum(total_price),0)
from pizza_sales

select round(sum(total_price)/count(distinct order_id),0) as average_order_value
from pizza_sales

select sum(quantity) as total_pizza_sold
from pizza_sales

select count(distinct(order_id)) as total_orders
from pizza_sales

select sum(quantity)/count(distinct(order_id)) as average_pizzas_sold_peroder
from pizza_sales

select datename(dw,order_date) as day,count(distinct order_id) as total_orders_on_day
from pizza_sales
group by datename(dw,order_date)

select datename(month,order_date) as month,count(distinct order_id) as total_orders
from pizza_sales
group by datename(month,order_date)
order by total_orders desc

select * from pizza_sales

select pizza_category,concat(round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2),'%') as percentage_sales
from pizza_sales
group by pizza_category
order by percentage_sales desc

select pizza_category,concat(round(sum(total_price)/(select sum(total_price) from pizza_sales where month(order_date)=1)*100,2),'%') as monthly_sales,round(sum(total_price),0)
from pizza_sales
where month(order_date)=1
group by pizza_category
order by monthly_sales desc

select pizza_category,concat(round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2),'%') as quarter_percentage_sales
from pizza_sales
where datepart(quarter,order_date)=1
group by pizza_category
order by quarter_percentage_sales desc

select DATENAME(month,order_date) as month,concat(round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2),'%') as percentage_sales
from pizza_sales
group by DATENAME(month,order_date)
order by percentage_sales desc

select pizza_size,sum(total_price) as total_sales,concat(round(sum(total_price)/(select sum(total_price) from pizza_sales) *100,2),'%') as total_sales_percentage
from pizza_sales
group by pizza_size
order by total_sales_percentage desc

select pizza_size,sum(total_price) as total_sales,concat(round(sum(total_price)/(select sum(total_price) from pizza_sales) *100,2),'%') as total_sales_percentage
from pizza_sales
where datepart(quarter,order_date)=1
group by pizza_size
order by total_sales_percentage desc

select top 5 pizza_name,sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales desc


select top 5 pizza_name,sum(total_price) as total_sales
from pizza_sales
group by pizza_name
order by total_sales asc


select top 5 pizza_name,sum(quantity) as total_sales
from pizza_sales
group by pizza_name
order by total_sales desc

select top 5 pizza_name,count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc

