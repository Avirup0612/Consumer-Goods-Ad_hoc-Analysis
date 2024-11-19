								-- Consumer Goods Ad_hoc analysis for a computer hardware manufacturing company -- 
														-- CREATED BY - AVIRUP MITRA --
####################################################################################################################################################################

-- 1) Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

select market from dim_customer
where customer="Atliq Exclusive" and region = "APAC";

-- ---------------------------------------------------------------------------------------------------------------

-- 2) What is the percentage of unique product increase in 2021 vs. 2020?

with products as (select fm.cost_year, dp.product_code, dp.product 
from dim_product dp join fact_manufacturing_cost fm
on dp.product_code=fm.product_code),

yearwise_product (unique_products_2020, unique_products_2021) as 
(select (select count(distinct product_code) from products where cost_year=2020), 
(select count(distinct product_code) from products where cost_year=2021) )

select unique_products_2020, unique_products_2021,
concat(round(((unique_products_2021-unique_products_2020)/unique_products_2020)*100,2),"%") percentage_increased
from yearwise_product;

-- ---------------------------------------------------------------------------------------------------------------

-- 3) Provide a report with all the unique product counts for each segment and sort them in descending order of product counts.

select segment, count(distinct product_code) product_count 
from dim_product group by 1 order by 2 desc;

-- ---------------------------------------------------------------------------------------------------------------

-- 4) Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?

with products as (select fm.cost_year, dp.product_code, dp.segment, dp.product 
from dim_product dp join fact_manufacturing_cost fm
on dp.product_code=fm.product_code),

yearwise_segment as (select segment, count(distinct case when cost_year=2020 then product_code end) product_count_2020, 
count(distinct case when cost_year=2021 then product_code end) product_count_2021
from products group by 1)

select segment, product_count_2020, product_count_2021,
concat(round(((product_count_2021-product_count_2020)/product_count_2020)*100,2),"%") percentage_increased
from yearwise_segment;

-- ---------------------------------------------------------------------------------------------------------------

-- 5) Get the products that have the highest and lowest manufacturing costs.

select dp.product_code, dp.category, dp.product, dp.variant, fm.manufacturing_cost
from dim_product dp join fact_manufacturing_cost fm
on dp.product_code=fm.product_code
where fm.manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost)
or fm.manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost);

-- ---------------------------------------------------------------------------------------------------------------

-- 6) Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.

select dc.customer_code, dc.customer, 
round(avg(pid.pre_invoice_discount_pct)*100,2) average_discount_percentage 
from dim_customer dc join fact_pre_invoice_deductions pid 
on dc.customer_code=pid.customer_code
where pid.fiscal_year=2021 and dc.market="India"
group by 1,2 order by average_discount_percentage desc limit 5;

-- ---------------------------------------------------------------------------------------------------------------

-- 7) Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month.

with monthly_sales as (select dc.customer, sm.fiscal_year, 
concat(DATE_FORMAT(date, '%M')," ",year(date)) months,
round((sm.sold_quantity*gp.gross_price),2) gross_sales_amount
from dim_customer dc join fact_sales_monthly sm on sm.customer_code=dc.customer_code
join fact_gross_price gp on sm.product_code=gp.product_code and sm.fiscal_year=gp.fiscal_year order by year(date))

select fiscal_year, months, sum(gross_sales_amount) total_sales_amount from monthly_sales
where customer="Atliq Exclusive" group by fiscal_year, months;

-- ---------------------------------------------------------------------------------------------------------------

-- 8) In which quarter of 2020, got the maximum total_sold_quantity?

with qtr_mon_sales as (select quarter(date_sub(date, interval 8 month)) quarters_2020, date_format(date, '%M') months, 
sum(sold_quantity) total_quantity_sold 
from fact_sales_monthly where fiscal_year=2020 group by 1, month(date), months)

select concat(months," - ","Qtr ",quarters_2020) monthly_sales, total_quantity_sold from qtr_mon_sales;

select quarter(date_sub(date, interval 8 month)) quarters_2020, 
sum(sold_quantity) total_quantity_sold 
from fact_sales_monthly where fiscal_year=2020 group by 1;

-- ---------------------------------------------------------------------------------------------------------------

-- 9) Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

with channelwise_sales as (select c.channel, sum(sm.sold_quantity) channelwise_sold
from dim_customer c join fact_sales_monthly sm
on c.customer_code=sm.customer_code
where sm.fiscal_year=2021
group by c.channel),

channelwise_sales2 as (select *, sum(channelwise_sold) over() total_qty_sold 
from channelwise_sales)

select channel, channelwise_sold, 
concat(round((channelwise_sold/total_qty_sold)*100,2),"%") 'contribution_%'
from channelwise_sales2;

-- ---------------------------------------------------------------------------------------------------------------

-- 10) Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?

with divisionwise_product_sales as 
(select dp.division, dp.product_code, concat(dp.product," - ",dp.variant) products, 
sum(sm.sold_quantity) total_sold_quantity
from dim_product dp join fact_sales_monthly sm 
on dp.product_code=sm.product_code
where sm.fiscal_year=2021
group by 1,2,3),

sale_ranks as 
(select *,dense_rank() over(partition by division order by total_sold_quantity desc) ranks
from divisionwise_product_sales)

select * from sale_ranks
where ranks in (1,2,3);