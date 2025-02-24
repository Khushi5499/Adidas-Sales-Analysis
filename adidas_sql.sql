SELECT * FROM adidas.`adidas sales`;
SELECT City, `Total Sales`  FROM adidas.`adidas sales`  ORDER BY `Total Sales` DESC  LIMIT 5;
SELECT Retailer, Region, max(`Operating Profit`) from adidas.`adidas sales` group by Region, Retailer order by Region, Retailer desc;
SELECT State, `Total Sales`  FROM adidas.`adidas sales`  ORDER BY State DESC  LIMIT 1;

WITH RankedProducts AS (
    SELECT State, Product, SUM(`Units sold`) AS TotalUnits,
           RANK() OVER (PARTITION BY State ORDER BY SUM(`Units sold`) DESC) AS rnk
    FROM adidas.`adidas sales`
    GROUP BY State, Product
)
SELECT State, Product, TotalUnits
FROM RankedProducts
WHERE rnk = 1;
SELECT `Sales Method`, SUM(`Units sold`) AS TotalUnitsSold
FROM adidas.`adidas sales`
GROUP BY `Sales Method`
ORDER BY TotalUnitsSold DESC;
SELECT DISTINCT `Price per Unit` 
FROM adidas.`adidas sales`
ORDER BY `Price per Unit`;
SELECT State, MIN(`Operating Margin`) AS LowestMargin
FROM adidas.`adidas sales`
GROUP BY State
ORDER BY LowestMargin ASC
LIMIT 1;
SELECT Retailer, SUM(`Operating Profit`) AS TotalProfit
FROM adidas.`adidas sales`
GROUP BY Retailer
ORDER BY TotalProfit DESC;
SELECT Retailer, SUM(`Units sold`) AS TotalUnits
FROM adidas.  `adidas sales`
GROUP BY Retailer
ORDER BY TotalUnits DESC
LIMIT 3;
SELECT State, SUM(`Units sold`) AS TotalUnits
FROM adidas. `adidas sales`
WHERE Product = "Men's Athletic Footwear"
GROUP BY State
ORDER BY TotalUnits DESC
LIMIT 5;









