create database project2;

use project2;

create table Tender(Tender_no text, Railway_Location text, Zone text,
Division text, DateofOpen date, Nature text, Awarded_to text,
L1_Price float, Basic float, Qty int, Category text, Customer_1 float,
Customer_2 float, Customer_3 float, Customer_4 float, Customer_5 float, 
Customer_6 float, Customer_7 float, Customer_8 float, Customer_9 float, 
Customer_10 float, Customer_11 float, Customer_12 float);

select * from tender;

set sql_safe_updates = 0;
SHOW VARIABLES LIKE 'sql_safe_updates';

show variables like 'secure_file_priv';
show variables like '%local%';

DESCRIBE tender;

SELECT * FROM tender LIMIT 10;

#Get the count of rows
SELECT COUNT(*) AS total_rows FROM tender;

#Get the count of distinct values in a column (example with Tender_no)
SELECT Tender_no, COUNT(DISTINCT Tender_no) AS unique_values
FROM tender
GROUP BY Tender_no;

#Frequency distribution for a categorical column (example with Category)
SELECT Category, COUNT(*) AS frequency
FROM tender
GROUP BY Category
ORDER BY frequency DESC;


#Check for duplicate rows
SELECT Tender_no, Railway_Location, Zone, Division, DateofOpening, Nature, Awarded_to, L1_Price, Basic, Qty, Category, 
       Customer_1, Customer_2, Customer_3, Customer_4, Customer_5, Customer_6, Customer_7, Customer_8, Customer_9, 
       Customer_10, Customer_11, Customer_12, COUNT(*) AS duplicate_count
FROM tender
GROUP BY Tender_no, Railway_Location, Zone, Division, DateofOpening, Nature, Awarded_to, L1_Price, Basic, Qty, Category, 
         Customer_1, Customer_2, Customer_3, Customer_4, Customer_5, Customer_6, Customer_7, Customer_8, Customer_9, 
         Customer_10, Customer_11, Customer_12
HAVING COUNT(*) > 1;

#Cross-tabulation for two categorical columns (example with Zone and Category)
SELECT Zone, Category, COUNT(*) AS frequency
FROM tender
GROUP BY Zone, Category
ORDER BY frequency DESC;


#Group by and aggregate functions (example with Zone and AVG(L1_Price))
SELECT Zone, AVG(L1_Price) AS avg_L1_Price
FROM tender
GROUP BY Zone;

#Window functions for moving averages or cumulative sums (example with moving average of L1_Price over Zone)
select Zone, L1_Price, 
    AVG(L1_Price) OVER (PARTITION BY Zone ORDER BY DateofOpening) AS moving_avg_L1_Price
FROM tender;

-- Calculate the mean (1st moment) for each numeric column
SELECT 
    AVG(L1_Price) AS mean_L1_Price,
    AVG(Basic) AS mean_Basic,
    AVG(Qty) AS mean_Qty
FROM 
    tender;


-- Calculate the variance (2nd moment) for each numeric column
SELECT 
    VAR_SAMP(L1_Price) AS variance_L1_Price,
    VAR_SAMP(Basic) AS variance_Basic,
    VAR_SAMP(Qty) AS variance_Qty
FROM 
    dataset;


-- Calculate the skewness (3rd moment) for each numeric column
SELECT 
    AVG(POWER((L1_Price - mean_L1_Price) / stddev_L1_Price, 3)) AS skewness_L1_Price,
    AVG(POWER((Basic - mean_Basic) / stddev_Basic, 3)) AS skewness_Basic,
    AVG(POWER((Qty - mean_Qty) / stddev_Qty, 3)) AS skewness_Qty
FROM (
    SELECT 
        L1_Price,
        Basic,
        Qty,
        AVG(L1_Price) OVER () AS mean_L1_Price,
        AVG(Basic) OVER () AS mean_Basic,
        AVG(Qty) OVER () AS mean_Qty,
        STDDEV_SAMP(L1_Price) OVER () AS stddev_L1_Price,
        STDDEV_SAMP(Basic) OVER () AS stddev_Basic,
        STDDEV_SAMP(Qty) OVER () AS stddev_Qty
    FROM 
        dataset
) subquery;


-- Calculate the kurtosis (4th moment) for each numeric column
SELECT 
    AVG(POWER((L1_Price - mean_L1_Price) / stddev_L1_Price, 4)) - 3 AS kurtosis_L1_Price,
    AVG(POWER((Basic - mean_Basic) / stddev_Basic, 4)) - 3 AS kurtosis_Basic,
    AVG(POWER((Qty - mean_Qty) / stddev_Qty, 4)) - 3 AS kurtosis_Qty
FROM (
    SELECT 
        L1_Price,
        Basic,
        Qty,
        AVG(L1_Price) OVER () AS mean_L1_Price,
        AVG(Basic) OVER () AS mean_Basic,
        AVG(Qty) OVER () AS mean_Qty,
        STDDEV_SAMP(L1_Price) OVER () AS stddev_L1_Price,
        STDDEV_SAMP(Basic) OVER () AS stddev_Basic,
        STDDEV_SAMP(Qty) OVER () AS stddev_Qty
    FROM 
        dataset
) subquery;
