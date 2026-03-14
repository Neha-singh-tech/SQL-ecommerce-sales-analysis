use Data_Analyst_Project
select * from Ecommerce_Sales

--Which product category drives the most revenue and profit?
  select Category,
  sum(sales) as Revenue,
  sum(Profit_Payment) as Total_Profit,
  Sum( Quantity) as Total_Unit_Sold
  from Ecommerce_Sales 
  group by Category
  
--Which subcategories generate the most revenue?
  select Category, Sub_Category,
  SUM(sales) as Revenue
  from Ecommerce_Sales
  group by Category,Sub_Category
  order by Category,Sub_Category,SUM(sales) DESC

--Which products generate the most revenue? 
  select Product_Name, 
  sum (Sales) as revenue,
  rank() over(order by Sum(Sales)DESC) as Rank_Status
  from Ecommerce_Sales
  group by product_name

---Top 10 Revenue Products :- 
  select Top 10 Product_Name, 
  sum (Sales) as revenue,
  rank() over(order by Sum(Sales)DESC) as Rank_Status
  from Ecommerce_Sales
  group by product_name

----Profit Margin by Category
  select category,
  sum(sales) as Total_revenue,
  sum(Profit_Payment)as Total_Profit,
  Sum(Profit_Payment)/ Sum(Sales)*100 as Profit_Margin
  from Ecommerce_Sales
  group by Category
  order by Sum(Profit_Payment)/ Sum(Sales)*100 DESC


