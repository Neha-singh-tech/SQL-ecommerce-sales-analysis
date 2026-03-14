use Data_Analyst_Project
select * from Ecommerce_Sales

--Business KPI Overview------------

--Total revenue & profit
 select SUM(Sales) as Total_Revenue,
 SUM(Profit_Payment) as Total_Profit,
 (SUM(Profit_Payment)/SUM(Sales) )*100
 as Overall_Profit_Margin 
 from Ecommerce_Sales

 --Average Order Value (AOV)
 select AVG(Sales)as Average_Order_Value
 from Ecommerce_Sales

 --How is the company performing overall?
  select COUNT(distinct(order_ID))as Total_Orders,
  count(distinct(Customer_Name)) as Total_Customer,
  SUM(sales)as Total_revenue,
  sum(profit_payment) as Total_Profit,
  avg(Sales) as Avg_Order_Value,
   sum(profit_Payment)/sum(sales)*100 as Profit_Margin
  from Ecommerce_Sales
  
--Is revenue growing or declining over time?
  select YEAR(Order_Date) as Sale_Year,
  month(Order_Date) as Sale_Month,
  sum(sales)as Revenue
  from Ecommerce_Sales
  Group by YEAR(Order_Date),
  month(Order_Date)
  order by YEAR(Order_Date),
  month(Order_Date) DESC

--and Month-over-Month Growth
  select YEAR(order_Date)as years,
  MONTH(order_Date) as Months,
  SUM(Sales) as Total_Revenue,
  LAG(sum(sales)) over (order by YEAR(order_Date),MONTH(order_Date)) as Privous_Month_revenue ,
  (Sum(sales)- Lag(sum(Sales)) Over ( order by YEAR(order_Date),MONTH(order_Date)))
  /Lag(sum(sales)) over(order by Year(Order_Date),month(Order_Date)) *100 as Month_Growth_Percentage
  from Ecommerce_Sales
  group by  YEAR(order_Date),
  MONTH(order_Date)

--Are we relying on many small orders or fewer large orders?
 select
 case
 when Sales <5000 Then 'Low Value Orders'
 when Sales between 5000 and 20000 then 'Medium Value Orders'
 else 'high Value Orders'
 End as Order_type,
 sum(sales)as revenue,
 count(*) as Order_count
 from Ecommerce_Sales
 group by
 case
 when Sales <5000 Then 'Low Value Orders'
 when Sales between 5000 and 20000 then 'Medium Value Orders'
 else 'high Value Orders'
 end
 order by SUM(sales) DESC

---Are customers returning or mostly one-time buyers?
  select
  case
  when Order_count = 1 Then 'One-Time Buyer'
  when Order_count between 2 and 5 then 'Occasional Buyer'
  else 'Loyal Customer'
  end as Customer_type,
  count(*)as Customer_count
  from( select Customer_Name,
  COUNT(order_ID) as Order_Count
  from Ecommerce_Sales  
  group by Customer_Name)
  as Tem
  group by
  case
  when Order_count =1 Then 'One-Time Buyer'
  when Order_count between 2 and 5 then 'Occasional Buyer'
  else 'Loyal Customer'
  end