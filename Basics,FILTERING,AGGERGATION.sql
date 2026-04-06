use ecommercedb;
-- Basic queries
select * from customers;

select * from products
where SubcategoryID = 1 ;

select * from products
where Price > 500 ;

select * from products
order by Price asc ;

select * from customers
limit 5 ;

select * from products
where SubcategoryID = 2 and StockQuantity>50 ;

select * from orders
order by CustomerID asc , OrderDate desc ;

select * from customers
where Email like "%@example.com" and FirstName like '%1%';

select * from products
order by Price desc
limit 3 ;

select * from products
where (SubcategoryID = 3 or Price < 200) and StockQuantity <10 ;


select ProductName , (Price * StockQuantity) as totalValue 
from products 
order by totalValue desc
limit 5;

select ProductID , Quantity from orderdetails
order by Quantity desc 
limit 5 ;

-- filtering
select * from products
where Price > 300 and StockQuantity < 50;

select * from customers
where Address like '%street%' or Phone like '123-456%';

select * from orders
where TotalAmount between 100 and 500 ;

select * from products
where ProductName regexp '[0-9]$';

select * from products
where SubcategoryID in (1,2,3,4);

select * from products
where (SubcategoryID = 1 and Price >800) or
	  (SubcategoryID = 2 and Price < 400) ;
      
select * from orders
WHERE OrderDate BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE();

select * from customers
where FirstName like '__________';

select * from products
where SubcategoryID != 3 ;

select * from orders
where CustomerID in (1,5,10) and TotalAmount > 200 
and year(orderDate)=2025 
order by TotalAmount desc
limit 5;

-- aggregation
select count(*) from customers ;

select sum(totalAmount) from orders;

select avg(price) from products ;

select max(price) from products ;

select min(TotalAmount) from orders;

select count(*) from products
where Price > 500 ;

select sum(Quantity) from orderdetails
where ProductID = 10 ;

select avg(Totalamount) from orders
where CustomerID = 5 ;

select count(*)as totalNumOfOrder ,
avg(TotalAmount) totalAmount ,
max(TotalAmount) HightOrder,
min(TotalAmount) LowestOrder,
sum(TotalAmount) totalRevenu
 from orders;
 
select count(distinct CustomerID) uniqueCustomer  from orders;

select max(OrderDate) latestOrderDate from orders;

select count(*) NumOfProduct, 
avg(Price) AvgPriceOfProduct,
max(Price) HightProduct,
min(Price) cheapestProduct,
sum(Price*StockQuantity) as TotalValue
from products;
