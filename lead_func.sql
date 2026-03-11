create database lead_func;
use lead_func;

/* lead function */


create table sales_table(
employee_name varchar(45) not null,
year int not null,
country varchar(45) not null,
product varchar(45) not null,
sale decimal(12,2) not null,
primary key(employee_name,year));

INSERT INTO sales_table VALUES  
('Stephen', 2017, 'India', 'Laptop', 10000),    
('Stephen', 2018, 'India', 'Laptop', 15000),    
('Stephen', 2019, 'India', 'TV', 20000),    
('Bob', 2017, 'US', 'Computer', 15000),    
('Bob', 2018, 'US', 'Computer', 10000),    
('Bob', 2019, 'US', 'TV', 20000),    
('Mandy', 2017, 'Canada', 'Mobile', 20000),    
('Mandy', 2018, 'Canada', 'Calculator', 1500),    
('Mandy', 2019, 'Canada', 'Mobile', 25000);

select * from sales_table;

/* LEAD FUNCTION

 This function allows us to look forward rows or succeding rows to get the value of that row
 from the current row.it is a very useful method to calculate  between the current and
 subsequent rows within the same output  */

select COUNTRY,year,product,sale,lead(sale,1)
over (partition by year order by
country) as next_sale from sales_table;


/*LAG function

this function allows us to look information about backward rows or preceding rows the value of a previous
row from the current row.it is a very useful method to calculate the diff.between the current and the previous row within same
*/

select year,product,sale,lag(sale,1)over(
partition by year
order by country)as previous_sale_lag
from sales_table;


/*  NTILE

NTILE IS A RANKING FUNCTION IN SQL SERVER TO DISTRIBUTE ROWS INTO A SPECIFIED NUMBER OF GROUPS 
AND ASSIGN A NUMBER TO EACH GROUP IN INCREMENTAL ORDER STARTING WITH ONE
NITLE FUNCTION WORKS WITH ORDER BY CLAUSE TO SORT THE ROWS IN THE SPECIFIED ORDER AND SPLITS 

LET US ASSUME WE HAVE 10 FOWS IN A TABLE AND USING NTILE(5) FUNCTION.
CONSIDERING WE HAVE EVEN NUMBER OF ROWS IN EACH GROUPS AS 10 DIVIDED BY NTILE(5) COMES TO 2 ROWS
THUS NTILE FUNCTION WILL DISTRIBUTE 2 ROWS IN EACH GROUP AND ASSIGN THEM A NUMBER FROM 1 TO 5

IN CASE OF AN ODD NUMBER OF ROWS IN A TABLE.assuming we have 11 rows and using NTILE(5) function
 NTILE FUNCTION DETERMINES THE NUMBER OF ROWS 
IN A TABLE BEFORE SPLITTING THEM INTO GROUPS.

COUNT OF ROWS IN A TABLE DIVIDED BY THE NUMBER OF GROUPS SPECIFIED WITH NTILE CREATE GROUPS WITH
UNEQUAL NUMBER OF ROWS.GROUPS WITH ABIGGER NUMBER OF ROWS WILL BE LISTED AHEAD OF GROUPS WITH

IN CASE WE HAVE 11 ROWS DIVIDED BY ntile(5) COMES TO 3 ROWS IN THE FIRST GROUP FOLLOWED BY 
2 REST OF THE FOUR GROUPS */

