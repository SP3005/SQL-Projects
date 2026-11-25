create database Data_Digger;
use Data_Digger
create table Customers(
Cust_id int primary key,
Cust_name varchar(30),
Cust_email varchar(30),
Cust_address varchar(30));

insert into Customers(Cust_id, Cust_name, Cust_email, Cust_address) values
(101,"Sujal","sujal@gmail.com","Ahmedabad"),
(102,"Harsh","harsh14@gmail.com","Gandhinagar"),
(103,"Raj","raj0102@gmail.com","Rajkot"),
(104,"Mosam","mosam16@gmail.com","Surat"),
(105,"Jaya","jaya03@gmail.com","Mehsana");

select * from Customers;

update Customers set Cust_address = "Mumbai" where Cust_id = 102;
select * from Customers;

delete from Customers where Cust_id = 105;
select * from Customers;

select * from Customers where Cust_name = "Sujal";

create table Orders(
Order_id int primary key,
Cust_id int,
Order_date date,
Total_amount decimal(10,2),
foreign key(Cust_id)
references Customers(Cust_id));

insert into Orders(Order_id, Cust_id, Order_date, Total_amount) values
(1,101,"2026-11-20",14790),
(2,103,"2026-11-01",15350),
(3,104,"2026-11-10",10230),
(4,101,"2026-10-23",19230),
(5,102,"2026-11-09",9230);

select * from Orders;

select * from Orders where Cust_id = 101;

update Orders set Total_amount = 13500 where Order_id = 1;
select * from Orders;

delete from Orders where Order_id = 5;
select * from Orders;

select * from Orders where Order_date >= "2026-10-26" and Order_date >= "2026-10-26";

select max(Total_amount) as Hightest_Amount, min(Total_amount) as Lowest_Amount, avg(Total_amount) as Average_Amount from Orders;

create table Products (
    Product_ID int primary key,
    Product_Name varchar(30),
    Price decimal(10,2),
    Stock int
);

insert into Products (Product_ID, Product_Name, Price, Stock) values
(11,"Laptop", 70000, 10),
(12,"Mobile", 25000, 15),
(13,"Keyboard", 1500, 20),
(14,"Mouse", 700, 30),
(15,"Monitor", 12000, 8);

select * from Products;

select * from Products order by Price desc;

update Products set Price = 75000 where Product_ID = 11;
select * from Products;

update Products set Stock = 0 where Product_ID = 15;
delete from Products where Stock = 0;
select * from Products;

select * from Products where Price >= 500 and Price <= 2000;

select max(Price) as Most_Expensive, min(Price) as Cheapest from Products;

create table Order_details(
Order_details_id int primary key,
Order_id int,
Product_ID int,
Quantity int,
Sub_total decimal(10,2),
foreign key(Order_id)
references Orders(Order_id),
foreign key(Product_ID)
references Products(Product_ID));

insert into Order_details (Order_details_id, Order_id, Product_ID, Quantity, Sub_total) values
(111,1,11,1,70000),
(222,2,12,2,50000),
(333,3,13,3,4500),
(444,4,14,2,1400),
(555,1,13,1,12000);

select * from Order_details;

select * from Order_details where Order_id = 1;

select sum(sub_total) as Total_Revenue from Order_details;

select Product_ID, sum(Quantity) as Total_Quantity from Order_details group by Product_ID order by Total_Quantity desc limit 3;

select count(Order_id) as Times_Sold from Order_details where Product_ID = 11;
