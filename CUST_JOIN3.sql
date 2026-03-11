use world;

create table customers(customer_id int,
name varchar(30));

insert into customers values(
1,'alice'),
(2,'BOB'),
(3,'CHARLIE'),
(4,'DAVID');

CREATE TABLE PRODUCTS(
PRODUCT_ID INT,
PRODUCT_NAME VARCHAR(20),
PRICE FLOAT);

INSERT INTO PRODUCTS VALUES(

201,'LAPTOP',800.00),
(202,'KEYBOARD',50.00),
(203,'MOUSE',30.00),
(204,'MONITOR',200.00);

CREATE TABLE ORDERS(
ORDER_ID INT,
CUSTOMER_ID INT,
PRODUCT_ID INT,
QUANTITY INT);
INSERT INTO ORDERS VALUES
(101,1,201,2),
(102,2,202,1),
(103,1,203,1),
(104,3,201,4);

SELECT NAME,PRODUCT_NAME,QUANTITY,PRICE,(QUANTITY*PRICE)AS TOTAL
FROM ORDERS O
INNER JOIN PRODUCTS P ON P.PRODUCT_ID=O.PRODUCT_ID
INNER JOIN CUSTOMERS C ON C.CUSTOMER_ID=O.CUSTOMER_ID
ORDER BY C.NAME;


SELECT NAME,PRODUCT_NAME,QUANTITY,PRICE,(QUANTITY*PRICE)AS TOTAL
FROM ORDERS O
LEFT JOIN PRODUCTS P ON P.PRODUCT_ID=O.PRODUCT_ID
RIGHT JOIN CUSTOMERS C ON C.CUSTOMER_ID=O.CUSTOMER_ID
ORDER BY C.NAME;

SELECT NAME,PRODUCT_NAME,QUANTITY,PRICE,(QUANTITY*PRICE)AS TOTAL
FROM ORDERS O
 JOIN PRODUCTS P ON P.PRODUCT_ID=O.PRODUCT_ID
 JOIN CUSTOMERS C ON C.CUSTOMER_ID=O.CUSTOMER_ID
ORDER BY C.NAME;

/*correspond to the values of the primary key in another table*/

create database customer;


use customer;
create table customer_x(
id int not null,
name varchar(20) not null,
age int not null,
address varchar(25),
salary decimal (18,2),
primary key(id));

insert into customer_x(id,name,age,address,salary)
values
(1,'jalpa',30,'patel',5000),
(2,'xyz',34,'xxl',6000),
(3,'xyz1',45,'xx2',7000),
(4,'xyz2',32,'xx3',8000),
(5,'xyz3',33,'xx4',9000),
(6,'xyz4',34,'xx5','null');

create table customers(
id int,
first_name varchar(40),
last_name varchar(40),
age int,
country varchar(10),
constraint customerPK primary key(id));

create table orders1(
order_id int,
product varchar(40),
total int,
customer_id int,
constraint orderspk primary key(order_id),
foreign key (customer_id) references customers(id));

insert into customers(



