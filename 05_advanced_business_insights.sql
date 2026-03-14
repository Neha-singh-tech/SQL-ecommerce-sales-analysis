use Data_Analyst_Project
select * from Ecommerce_Sales
-------------------advanced_business_insights----------------------------------

--Which product categories drive the largest share of company revenue?

 select Category,
 sum(Sales)as Category_Revenue,
 sum(sales)*100/ sum(sum(Sales))over() as Revenue_Contribution_Percentage	 
 from Ecommerce_Sales
 group by Category
 order by Category_Revenue DESC

-- Which regions generate the most revenue and profit?
  select Region,
  sum(sales) as Total_Revenue,
  sum(Profit_Payment) as Total_Profit,
  Sum(Quantity) as Total_Unit_Sold
  from Ecommerce_Sales 
  Group by Region
  order by  Total_Revenue DESC

--Which cities generate the most sales?
  select City,
  Sum(Sales) as City_Revenue,
  rank() over (order by  Sum(Sales) DESC) As City_Rank
  from Ecommerce_Sales
  Group by City
  order by City_Revenue DESC

--Which products sell the most units?
  select Product_Name,
  sum (Quantity) as Total_Units_Sold,
  Sum ( Sales) as Revenue 
  from Ecommerce_Sales 
  group by Product_Name
  order by sum (Quantity) DESC
