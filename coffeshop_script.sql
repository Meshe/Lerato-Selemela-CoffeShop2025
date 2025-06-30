SELECT
-- Aggregated,
     COUNT(DISTINCT transaction_id)AS Transaction_Number,
    SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '') AS DECIMAL(10,2))) AS Total_Per_Sale,
    SUM(transaction_qty)AS Quantity,
--transaction_date,
    --Daily Sale
    
    --Weekly Sales

    --Monthly Sales
    
    
-- Dates
DAYNAME(TO_DATE(transaction_date)) AS Day_Of_The_Week,
TO_DATE(transaction_date) as Purchase_Date,
TRIM(TO_CHAR(transaction_date, 'MON')) AS Month_Name,

case
   when transaction_time between '00:05:00' and '11:59:59' then 'Morning'
   when transaction_time between '12:00:00' and '16:59:59' then 'Afternoon'
   when transaction_time between '17:00:00' and '20:59:59' then 'Evening'
   else 'Night'
end as Time_Of_Day, 
   


  store_location,
  product_category,
  product_detail,
  product_type,
FROM
  "COFFEE"."SALES_SCHEMA"."SALES_TRANSACTION"

GROUP BY
  Purchase_Date,
  Month_Name,
  store_location,
  product_category,
  product_detail,
  product_type,
  transaction_date,
  Time_Of_Day,
  transaction_time
Order by Transaction_Number asc;
  
