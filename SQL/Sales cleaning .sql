select*
from sale_data

--Check for dupicates
SELECT Order_ID,
	  COUNT(*) AS Duplicate
	 FROM Sale_data
	 GROUP BY Order_ID
	 HAVING COUNT(*) >1;

--Check for NULL values 
SELECT*
FROM sales_data
WHERE  Order_ID IS NULL and 
Unit_Cost IS NULL and 
Price IS NULL and 
Order_Qty IS NULL and 
Cost_of_Sales IS NULL and 
ChanelKey IS NULL and
PromotionKey IS NULL and 
ProductKey IS NULL and 
ProductSubcategoryKey IS NULL and 
StateID IS NULL; 
 
 -- standardise data
SELECT DISTINCT ProductName
FROM product_name
 ORDER BY  1;

 SELECT DISTINCT Manufacturer
FROM product_name
 ORDER BY  1;

 UPDATE product_name
SET Manufacturer =  trim(Manufacturer);

SELECT DISTINCT Product_Category
FROM Sales_category
 ORDER BY  1;

SELECT DISTINCT ChannelName
FROM Sales_channel
 ORDER BY  1;

 SELECT DISTINCT PromotionName
FROM Sales_promotion
 ORDER BY  1;

 UPDATE Sales_promotion
 SET PromotionName = 'Christmas Promotion'
 WHERE PromotionName LIKE 'Xmas%'; 

 SELECT DISTINCT State
 FROM Sales_state;
 
 --Remove column and create view 
CREATE VIEW Sales AS
 SELECT 
 sd. Order_Date, 
  sd.Unit_Cost,
 sd. Price,
 sd. Order_Qty,
 sd. Cost_of_Sales,
 pn. ProductName,
 pn. Manufacturer,
  pn.BrandName,
 spsc. Product_Category,
 sc. ChannelName,
 spr. PromotionName,
 spr. PromotionType,
  ss.State
 FROM Sale_data sd
JOIN product_name pn ON sd.ProductKey = pn.ProductKey
JOIN Sales_Category spsc ON sd.ProductSubCategoryKey = spsc.ProductSubCategoryKey
JOIN Sales_Promotion spr ON sd.PromotionKey = spr.PromotionKey
JOIN Sales_State ss ON sd.StateID = ss.StateID
JOIN Sales_Channel sc ON sd.ChannelKey = sc.ChannelKey
 
 
