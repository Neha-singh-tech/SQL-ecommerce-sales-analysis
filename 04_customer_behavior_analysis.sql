use Data_Analyst_Project
select * from Ecommerce_Sales

--------Customer Revenue Contribution-----------------

--Which customers generate the most revenue?
  select Customer_Name,
  sum(Sales) as Revenue,
  RANK() over(order by sum(Sales) DESC) as Revenue_Rank
  from Ecommerce_Sales
  group by Customer_Name
  order by Revenue DESC

--Who are the most frequent buyers?
  select Customer_Name,
  sum(Sales) as Revenue,
  count(*) as Order_Count 
  from Ecommerce_Sales
  group by Customer_Name
  order by Order_Count DESC 

--Average Order Value per Customer
  select Count(distinct(Customer_Name))as Total_Customer,
  count(*) as Total_Order_count,
  sum(Sales) as Total_Revenue,
  Sum(Sales)/Count(*) as Avg_Order_Value
  from Ecommerce_Sales

--Customer Revenue Segmentation
  select
  case
  when Total_Revenue <50000 Then 'Low_Revenue_Customer'
  when Total_Revenue between 50000 and 100000 Then 'Medium_Revenue_Customer'
  else 'High_Revenue_Customer'
  end as Customer_Type,
  count(customer_Name) as Customer_Count,
  sum(Total_Revenue) as Total_Revenue
  from(select Customer_Name,
  SUM(Sales)as Total_Revenue 
  from Ecommerce_Sales 
  group by Customer_Name
  ) as Customer_Revenue
  group by
  case
  when Total_Revenue <50000 Then 'Low_Revenue_Customer'
  when Total_Revenue between 50000 and 100000 Then 'Medium_Revenue_Customer'
  else 'High_Revenue_Customer'
  end

