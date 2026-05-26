create database project;
use project;

1)Table:-
create table customer(
    cust_id int primary key,
    name varchar(20),
    email varchar(30),
    address varchar(40)
)
insert into customer values(1,'Krishna','krish@26gmail.com','57,swapnshrusti')
insert into customer values(2,'Soham','soham@13gmail.com','87,shyam residency');
insert into customer values(3,'Hinal','hinal11@gmail.com','45,swapnshrusti');
insert into customer values(4,'jatin','jatin@07gmail.com','154,kailasnagar');
insert into customer values(5,'Hemani','Hemani@4gmail.com','128,Riya banglows');

1)
select *from customer;

update customer set address='Rami park,24' where cust_id=2;

delete from customer where cust_id=3;

select *from customer where name='Soham';

2)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    orderDate DATE,
    totalamount DECIMAL(10,2),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

INSERT INTO orders VALUES (101, 1, '2024-01-10', 500);
INSERT INTO orders VALUES (102, 2, '2024-02-15', 1200);
INSERT INTO orders VALUES (103, 1, '2024-03-01', 800);
INSERT INTO orders VALUES (105, 4, '2024-03-20', 700);`

select *from orders
select *from orders where cust_id=1;
update orders set totalamount=900 where order_id=103;
select MAX(totalamount) AS Highest,MIN(totalamount) AS Lowest,AVG(totalamount) AS Average FROM orders;


CREATE TABLE product (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO product VALUES (1, 'Laptop', 50000, 10);
INSERT INTO product VALUES (2, 'Mobile', 20000, 15);
INSERT INTO product VALUES (3, 'Tablet', 15000, 5);
INSERT INTO product VALUES (4, 'Headphones', 2000, 0);
INSERT INTO product VALUES (5, 'Keyboard', 1000, 20);

select *from product;
select *from product order by price desc;
update product set price=1800 Where p_id=5;
delete from product where stock=0;
+------+----------+----------+-------+
| p_id | p_name   | price    | stock |
+------+----------+----------+-------+
|    1 | Laptop   | 50000.00 |    10 |
|    2 | Mobile   | 20000.00 |    15 |
|    3 | Tablet   | 15000.00 |     5 |
|    5 | Keyboard |  1800.00 |    20 |
+------+----------+----------+-------+

select *from product where price between 500 and 2000;
+------+----------+---------+-------+
| p_id | p_name   | price   | stock |
+------+----------+---------+-------+
|    5 | Keyboard | 1800.00 |    20 |
+------+----------+---------+-------+

select MAX(price) AS HighestPric,MIN(price) AS LowestPrice FROM product;
+-------------+-------------+
| HighestPric | LowestPrice |
+-------------+-------------+
|    50000.00 |     1800.00 |
+-------------+-------------+

create table OrderDetail(
  O_Detail_Id int primary key Auto_Increment,
  order_id int,
  p_id int,
  quentity int,
  Subtotal Decimal(10,2),
  Foreign  key (order_id) References orders(order_id),
  foreign key (p_id) References product(p_id)
)


insert into OrderDetail (order_id,p_id,quentity,Subtotal) values(101,1,2,6000) 
insert into OrderDetail (order_id,p_id,quentity,Subtotal) values(102,2,1,6000) 
insert into OrderDetail (order_id,p_id,quentity,Subtotal) values(102,3,4,7800)
insert into OrderDetail (order_id,p_id,quentity,Subtotal) values(103,3,10,18000);
insert into OrderDetail (order_id,p_id,quentity,Subtotal) values(105,5,9,70000) 
+-------------+----------+------+----------+----------+
| O_Detail_Id | order_id | p_id | quentity | Subtotal |
+-------------+----------+------+----------+----------+
|           1 |      101 |    1 |        2 |  6000.00 |
|           2 |      102 |    2 |        1 |  6000.00 |
|           3 |      102 |    3 |        4 |  7800.00 |
|           4 |      103 |    3 |       10 | 18000.00 |
|           5 |      105 |    5 |        9 | 70000.00 |
+-------------+----------+------+----------+----------+

 select *from OrderDetail where order_id=102;
+-------------+----------+------+----------+----------+
| O_Detail_Id | order_id | p_id | quentity | Subtotal |
+-------------+----------+------+----------+----------+
|           2 |      102 |    2 |        1 |  6000.00 |
|           3 |      102 |    3 |        4 |  7800.00 |
+-------------+----------+------+----------+----------+

select sum(Subtotal)As TotalRevenue from OrderDetail;
+--------------+
| TotalRevenue |
+--------------+
|    107800.00 |
+--------------+

 select p_id ,sum(quentity) As TotalSold from OrderDetail Group by p_id order by totalSold desc limit 3;
+------+-----------+
| p_id | TotalSold |
+------+-----------+
|    3 |        14 |
|    5 |         9 |
|    1 |         2 |
+------+-----------+


select p_id,count(*) As TimeSold from OrderDetail where p_id=102 group by p_id;
Empty set (0.013 sec)