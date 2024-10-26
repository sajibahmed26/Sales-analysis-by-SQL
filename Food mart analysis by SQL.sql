
--select full table
SELECT
*
FROM
aw_work.customers
;

--- Year ,Month, Day convert from BirthdayDate
SELECT
BirthDate,
year(BirthDate) as Year_,
MONTH(BirthDate) as Month_,
MONTHNAME(BirthDate) as Month_name,
DAY(BirthDate) as Date_
FROM
aw_work.customers
;

--"Retrieve Products with More Than 150 Orders in 2015, Ordered by Total Orders"
SELECT
ProductKey,
count(ProductKey) Total_order
FROM
aw_work.sales
WHERE
YEAR(OrderDate)=2015
GROUP BY
ProductKey
HAVING COUNT(ProductKey) >150
ORDER BY
Total_order
;

--"List of Male Customers Over 60 with Birth Year and Annual Income Details"
SELECT 
    BirthDate,
    YEAR(BirthDate) as year_,
    AnnualIncome,
    DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), BirthDate)), '%Y')+0 AS age
FROM 
    aw_work.customers
   
WHERE
DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), BirthDate)), '%Y')+0>60
And Gender = 'M'
GROUP BY
year_
;


--"Customers with College-Level Education"
SELECT
FirstName,
EducationLevel

FROM
aw_work.customers
WHERE 
EducationLevel like '%college%'
;

--"Categorize Customer Gender into Male, Female, or Other"

SELECT
Gender,
CASE
WHEN Gender='M' THEN 'Male'
WHEN Gender='F'THEN 'Female'
ELSE 'Other'
end AS Gender_BREAK 

FROM
aw_work.customers
;


SELECT
MaritalStatus,
CASE
WHEN MaritalStatus='M' THEN 'Married'
WHEN MaritalStatus='S' THEN 'Single'
ELSE 'Others'
end as MaritalStatus_new
FROM
aw_work. customers
;

--To get the total sum of OrderQuantity only:
SELECT
OrderQuantity,
Sum(OrderQuantity)
FROM
sales;


--Inner join

SELECT
    s.CustomerKey,
    c.FirstName
FROM
    aw_work.sales AS s
INNER JOIN
    aw_work.customers AS c ON s.CustomerKey = c.CustomerKey
GROUP BY
    s.CustomerKey, c.FirstName;




SELECT
c.*
FROM 
aw_work.customers as c 
INNER JOIN
aw_work.sales as s 
on
c.CustomerKey = s.CustomerKey
group by 
c.CustomerKey
;

--"List of Customers with Annual Income, Including Those Without Sales Records"
SELECT
c.FirstName,
c.AnnualIncome
FROM 
aw_work.customers as c 
LEFT JOIN
aw_work.sales as s 
on
c.CustomerKey = s.CustomerKey
group by 
c.CustomerKey
;

--"Retrieve all records from both sales and customers tables, including unmatched rows, using a full outer join with UNION."

SELECT
s.*,
c.name
FROM
sales as s 
LEFT JOIN
customers as c 
on 
s.Customer_id = c.id 
UNION
SELECT
s.*,
c.name
FROM
sales as s 
Right JOIN
customers as c 
on 
s.Customer_id = c.id 
;
--"Retrieve the top 10 customers by total order quantity, displaying their names and total orders, ordered from highest to lowest."
SELECT
s.Customerkey,
concat (c.Firstname," ",c.lastname) as name,
SUM (s.orderQuantiy) as total_order
FROM
sales.s 
customers as c 
WHERE
s.CustomerKey = c.CustomerKey
GROUP BY 
CustomerKey,name 
order by 
total_order desc 
limit 10
;







