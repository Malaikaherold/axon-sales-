use classicmodels

 1.Top 10 customers who have placed the most orders. Display customer name and the count of orders placed.
 
 select customername,count(ordernumber) as orderCount from customers  c
inner join orders o on o.customernumber=c.customernumber 
group by customername 
order by count(ordernumber) desc
limit 10

2.Top 10 customers who have placed the least orders. Display customer name and the count of orders placed.

 select customername,count(ordernumber) as orderCount from customers  c
inner join orders o on o.customernumber=c.customernumber 
group by customername 
order by count(ordernumber) 
limit 10

3.Retrieve the list of customers who have placed orders but have not made any payments yet 

select customername from customers
where customernumber not in(select customernumber from payments)


4.Retrieve a product that has been ordered the least number of times. 
Display the product code, product name, and the number of times it has been ordered


select p.productcode,p.productname,o.quantityordered as ordercount from products p 
left join orderdetails o  on o.productcode=p.productcode
order by ordercount asc
limit 1 


5. customers whose credit limit is above 100000
select customernumber,customername,creditlimit from customers 
where creditlimit>100000

6.-- Top 5 Customers by Total Sales
SELECT customerName, 
SUM(quantityordered * priceEach) AS Total_Sales
FROM orders ord 
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
JOIN customers c ON ord.customerNumber=c.customerNumber
GROUP BY customerName
ORDER BY Total_Sales DESC
LIMIT 5;

7. Top 5 Customers by orders
SELECT customerName, 
count(DISTINCT orderNumber) AS Total_orders
FROM orders o 
JOIN customers c ON o.customerNumber=c.customerNumber
GROUP BY customerName
ORDER BY Total_orders DESC
LIMIT 5;

8. Total profit
SELECT 
    selling_price,
    cost_price,
    (selling_price - cost_price) AS Profit
FROM (
    SELECT 
        SUM(quantityordered * priceEach) AS selling_price,
        SUM(quantityordered * buyprice) AS cost_price
    FROM orderdetails 
    INNER JOIN products ON products.productcode=orderdetails.productCode
)Profit;

9. Total sales by product line
SELECT productLine, 
SUM(quantityordered * priceEach) AS Total_Sales
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
GROUP BY productLine
ORDER BY Total_Sales DESC;

10.Top 5 Total Sales by Year and Month
SELECT LEFT(orderDate, 7) AS Year_Mon,
SUM(quantityordered * priceEach) AS Total_Sales 
FROM orders ord 
JOIN orderdetails ordl ON ord.orderNumber=ordl.orderNumber
GROUP BY Year_Mon
ORDER BY Total_Sales DESC
LIMIT 5;




 