use ecommercedb ;
/*Write a query to find the number of orders for each customer.
 Show CustomerID and OrderCount.*/
select
CustomerID,
count(*) NumOfOrders 
from orders
group by CustomerID ;

/* Write a query to find the total amount spent by each customer.
 Show CustomerID and TotalSpent.*/
 
select CustomerID,
sum(TotalAmount) TotalSales
from orders
group by CustomerID ;

/*Write a query to find the average order amount for each customer.
 Show CustomerID and AvgOrderAmount.*/
select 
CustomerID,
avg(TotalAmount) AvgOrderAmount
from orders
group by CustomerID ;

/*Write a query to find the total quantity sold for 
each product in each order.
 Show OrderID, ProductID, and TotalQuantity.*/
 
 select ProductID ,
 OrderID , 
 sum(Quantity) 
 from orderdetails
 group by ProductID , OrderID ;
 
 /*Write a query to find, for each subcategory, 
 the number of products and the highest price.
 Show SubcategoryID, ProductCount, and MaxPrice*/
select SubcategoryID , 
count(*) ProductVount ,
max(price) 
from products
group by SubcategoryID ;

/*Write a query to find customers who have placed more than 5 orders.
 Show CustomerID and OrderCount.*/
 select CustomerID ,
 count(*) OrderCount 
 from orders
 group by  CustomerID
 having OrderCount >5 ;

/*Write a query to find customers who have spent more than $1000 in total.
 Show CustomerID and TotalSpent.*/
 select CustomerID ,
 sum(TotalAmount) TotalSpent
 from orders
 group by CustomerID
 having TotalSpent > 1000 ;
 
 /*Write a query to find products that have an 
 average order quantity greater than 3.
 Show ProductID and AvgQuantity.*/
 select ProductID ,
 avg(Quantity) AvgQuantity
 from orderdetails
 group by ProductID
 having AvgQuantity > 3 ;
 
 /*Write a query to find customers who have placed more than 3 orders,
 but only counting orders with TotalAmount greater than $50.
 Show CustomerID and OrderCount.*/
 select CustomerID ,
 count(*) NumOfOrders 
 from orders
 where TotalAmount > 50
 group by CustomerID
 having NumOfOrders >3 ;
 
 /*Write a query to find the top 5 products (by total quantity sold)
 , but only include products that have been sold more than 100 total units.
 Show ProductID and TotalQuantitySold.
*/
select ProductID ,
 sum(Quantity) TotalQuantitySold 
 from orderdetails
 group by ProductID
 having TotalQuantitySold  > 100 
 order by TotalQuantitySold desc
 limit 5 ;
 
 -- JOIN -- 
 /*Write a query to show all customers and their orders*/
 select c.CustomerID ,c.FirstName , o.OrderID from customers c
 inner join orders o 
 on c.CustomerID = o.CustomerID;
 
/*Write a query to show all customers, even those who have no orders*/
select c.CustomerID , c.FirstName , o.orderid  from customers c
left join orders o
on c.CustomerID = o.CustomerID ;

/*Write a query to list all orders with the customer name*/
select o.orderid , c.FirstName , c.LastName , o.totalamount
from customers c
right join orders o
on c.CustomerID = o.CustomerID ;

/*Write a query to show all products included in each order*/
select * from orders;
select * from orderdetails;
select * from customers;
select * from products ;

select 
o.OrderID,
p.productname,
od.Quantity 
from orders o
join orderdetails od on o.OrderID = od.OrderID
join products p on p.ProductID = od. ProductID ;

/*Write a query to show customer name and the products they bought*/
 select c.FirstName , p.productname , od.quantity from customers c
 join orders o on c.CustomerID = o.CustomerID
 join orderdetails od on o.OrderID = od.OrderID
 join products p on p.ProductID = od.ProductID ;
 
 /*Write a query to show each product with its subcategory name.*/
select p.ProductName , sc.SubcategoryName
 from products p 
 join subcategories sc 
 on p.SubcategoryID = sc.SubcategoryID ;

/*Write a query to show each product with its category name.*/
select * from products;
select * from subcategories ;
select * from categories;

select p.ProductName , cg.CategoryName from products p
join subcategories sc
on p.SubcategoryID = sc.SubcategoryID
join categories cg
on cg.CategoryID = sc.CategoryID ;

/*Write a query to find the total amount spent by each customer.
Show:CustomerID FirstName TotalSpent*/
select c.CustomerID , c.FirstName , sum(o.totalamount ) totalSpent
from customers c
join orders o
on c.CustomerID = o.CustomerID 
group by c.CustomerID , c.FirstName;

/*Write a query to find the total quantity sold for each product.*/
select p.ProductName , sum(od.Quantity) TotalQuantitySold
from products p
join orderdetails od
on p.ProductID = od.ProductID
group by p.ProductName ;

/*Write a query to find the number of orders per customer.*/
select * from orderdetails;
select c.CustomerID , c.FirstName , count(o.OrderID) orderCount
 from customers c
join orders o 
on c.CustomerID = o.CustomerID
group by c.CustomerID , c.FirstName ;


