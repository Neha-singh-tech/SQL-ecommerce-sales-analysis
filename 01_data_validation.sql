use Data_Analyst_Project
select * from Ecommerce_Sales

--Data Quality Audit
 
select * from Ecommerce_Sales 
where Customer_Name is null 
or Category is null or 
Sales is null or
Mode is null

select Order_ID,count(*) as duplicate_Count 
from Ecommerce_Sales
group by Order_ID 
having count(*) >1

select top 20 Sales,Profit_Payment,(Profit_Payment/Sales)*100 as Profit_Margin
from Ecommerce_Sales
order by Profit_Margin DESC

select * from Ecommerce_Sales
where Sales<0
or Profit_Payment > Sales
or Quantity<=0












