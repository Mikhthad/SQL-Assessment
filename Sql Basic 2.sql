CREATE DATABASE course;
use course;
CREATE TABLE course(std_id int,std_name varchar(10) , course varchar(10) , fees int);
show tables;
alter table course add column duration int;
alter table course RENAME column std_name to name;
alter TABLE course MODIFY column duration varchar(20);
alter table course add column join_date date;
-- add cuntraint
alter table course add CONSTRAINT pk_std_id PRIMARY KEY (name);
alter table course add CONSTRAINT uq_std_id UNIQUE(name);
show tables;
-- TRUNCATE course;
-- drop table course;
-- insert
insert into course(std_id,name,course,fees,duration,join_date)values(1,'Mikku','DA',65000,'6 Months','2024-1-1');
insert into course(std_id,name,course,fees,duration,join_date)values(2,'Hannesha','DA',65000,'6 Months','2024-1-1'),(3,'Fabina','DA',65000,'6 Months','2024-1-1'),(4,'Nemi','DS',80000,'1 Year','2024-2-5'),(5,'Adnan','DS',80000,'1 year','2024-3-10');
select * from course;

-- update
update course set name = 'Naheema' where std_id = 4;
update course set course = 'DS' where std_id = 1;


-- delete
DELETE from course where std_id = 5;
select * from course;

CREATE table students_info (std_id int primary key,std_name varchar(20),age int not null);
Create table department(dep_id int primary key );
select * from department;
-- drop table department;

-- Data Query Language(DQL)
-- 1 SELECT all columns
select * from course;
-- 2 select specific column
select std_id,name from course;

alter table department add column dept_name varchar(20);
alter table department add column room_no int;

insert into department(dep_id,dept_name,room_no) values(1,'DA',200),(2,'DS',400),(3,'Flutter',500),(4,'Python',100),(5,'Jango',200);
SELECT * from department;
SELECT * from department where dept_name = 'DS';

-- drop DATABASE course;
insert into department(dep_id,dept_name,room_no) values(6,'DA',600),(7,'DS',800);
select * from students_info;
insert into students_info(std_id,std_name,age) values(1,'Mikku',20),(2,'Fabina',25),(3,'Haneesha',24);
select * from students_info where age in(25,24);
select * from students_info where age >= 24;

CREATE table staff_info(staff_id int PRIMARY KEY , staff_name varchar(20),dep_id int,CONSTRAINT fk_dep_id FOREIGN KEY (dep_id) REFERENCEs department(dep_id));
insert into staff_info(staff_id, staff_name, dep_id) VALUES(1,'Haneesha',1),(2,'Fabina',2),(3,'Asif',3),(4,'Nayana',4),(5,'Aysha',5);
-- TRUNCATE staff_info;

-- Transaction Controll Language (TCL)  Savepoint,Commit,Rollback
select * from staff_info;
BEGIN;
savepoint x;
DELETE from staff_info where staff_id = 1;
select * from staff_info;
ROLLBACK to x;
COMMIT;
select * from staff_info;


CREATE TABLE Employee(employee_id INT PRIMARY KEY , first_name VARCHAR(50) ,
 last_name varchar(50) ,department varchar(50) , salary DECIMAL(10,2) ,
 Hire_date DATE , email VARCHAR(100) , Active BOOLEAN);
 select * from Employee ;
insert into Employee(employee_id,first_name,last_name,department,salary,Hire_date,email,Active) values
(1, 'John', 'Doe', 'Sales', 55000.00, '2018-07-15', 'john.doe@example.com',TRUE),
(2, 'Jane', 'Smith', 'Marketing', 62000.50, '2019-04-22', 'jane.smith@example.com',TRUE),
(3, 'Michael', 'Brown', 'HR', 48000.00, '2020-10-10', 'michael.brown@example.com',FALSE),
(4, 'Emily', 'Davis', 'IT', 71000.00, '2017-02-05', 'emily.davis@example.com',TRUE),
(5, 'Chris', 'Wilson', 'Finance', 85000.00, '2021-06-18', 'chris.wilson@example.com',TRUE),
(6, 'Sophia', 'Lee', 'Sales', 46000.00, '2016-11-30', 'sophia.lee@example.com',FALSE),
(7, 'David', 'Johnson', 'IT', 67000.00, '2018-09-25', 'david.johnson@example.com',TRUE),
(8, 'Emma', 'Garcia', 'Marketing', 58000.25, '2022-01-19', 'emma.garcia@example.com',TRUE),
(9, 'Daniel', 'Martinez', 'HR', 49500.00, '2020-03-17', 'daniel.martinez@example.com',TRUE),
(10, 'Ava', 'Rodriguez', 'Finance', 93000.00, '2015-05-11', 'ava.rodriguez@example.com',FALSE);

 select * from Employee ;
 -- Q) Employees who have salary greater than 65000?
 SELECT * from Employee where salary > 65000 ;
 -- Q) find the name of the employee who's the email david.johnson@example.com?
 select * from employee where email = 'david.johnson@example.com';
 -- where department IT and Finance employees full details?
 select * from Employee where department in('IT','Finance');
 select * from Employee where salary != 55000;
 
 -- Arithemtic Operators
 -- 1) + addition
 -- 2) - subtraction
 -- 3) * multipication
 -- 4) % division
 
 select employee_id,salary,salary*1.10 as 'salary_bonus' from Employee;
 
 select employee_id,salary,salary+500 as 'salary_increment' from Employee;
 
 select * from Employee where department = 'Sales' and Active = True;
 select * from Employee where department= 'IT'  or Active = True ;
 select * from Employee where department = 'IT' or salary > 70000 ;
 select * from Employee where department in("HR","Finance");
 select * from Employee where not department = 'Sales' ; 
 select * from Employee where not department = 'Finance' and salary > 60000;
 
 -- Special Operator 
 -- 1. in
 -- 2. not in
 -- 3. between
 -- 4. not between
 -- 5. is null
 -- 6.is not null
 -- 7. like
 -- 8. not like
 -- 9. as
 -- 10. distinct
 
 -- in 
 select * from Employee where department in('IT','Sales','Finance');
 -- not in
 select * from Employee where department not in ('IT','Sales','Finance');
 -- between
 select * from Employee where Salary between 55000 and 80000;
 -- not between
  select * from Employee where Salary not between 60000 and 70000 ;
  -- is null
 select * from Employee where email is null ;
 -- is not null
 select * from Employee where email is not null ;
  -- like
 select * from Employee where last_name like 'D%';
 -- not like
 select * from Employee where first_name not like '%a';
 select * from Employee where first_name like '%h%';
 select * from Employee where first_name like 'd_%';
 
 -- As
select first_name as 'First_Name',last_name as "Last_Name" from Employee;
-- Distinct
select DISTINCT department from Employee;
select distinct department,salary from Employee;

-- string func
select * from Employee;
select concat(first_name," ",last_name)full_name,salary from employee;

-- date related func
select curdate();
select current_time();
select current_timestamp();
select now();

select Hire_date,adddate(Hire_date,7) future_date from employee;
select Hire_date,subdate(Hire_date,7) future_date from employee;

select Hire_date,date_add(Hire_date, interval 4 day) future_date from employee;
select Hire_date,date_sub(Hire_date, interval 4 day) future_date from employee;

select datediff(curdate(),Hire_date) as day_since_joined from employee;

select first_name, Hire_date,year(Hire_date) year from Employee;
select first_name,Hire_date,month(Hire_date) month from employee;
select first_name,Hire_date,day(Hire_date) day from employee;
select first_name,Hire_date,monthname(Hire_date) month_name from employee;
select first_name,Hire_date,dayname(Hire_date) day_name from employee;

select sum(salary) Total_salary from employee;
select MAX(salary) maximum_salary from employee;
select min(salary) minimum_salary from employee;
select AVG(salary) Avg_salary from employee;

-- any

select first_name,salary
from employee
where salary > any(select salary from employee where department = 'marketing');
select * from employee;

select first_name,salary from employee where salary > any (select salary from employee where salary > 60000);

-- join

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50)
);


INSERT INTO Customers (customer_id, customer_name, country)
VALUES 
    (1, 'Alice', 'USA'),
    (2, 'Bob', 'Canada'),
    (3, 'Charlie', 'UK'),
    (4, 'David', 'Australia'),
    (5, 'Eve', 'India');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity)
VALUES 
    (101, 1, 1001, '2024-01-15', 2),
    (102, 2, 1002, '2024-02-10', 1),
    (103, 1, 1003, '2024-02-15', 1),
    (104, 4, 1001, '2024-03-05', 3),
    (105, 5, 1004, '2024-03-12', 2),
    (106, NULL, 1005, '2024-03-15', 1);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, product_name, price)
VALUES 
    (1001, 'Laptop', 1200.00),
    (1002, 'Smartphone', 800.00),
    (1003, 'Tablet', 600.00),
    (1004, 'Smartwatch', 200.00),
    (1005, 'Headphones', 150.00);
    
    select * from customers;
    select * from orders;
    
    -- inner join
    
    -- Find all customers who have placed an order. Show each customer's name product id  and the order ID.
    select orders.order_id,
    orders.product_id,
    customers.customer_name
    from customers inner join orders
    on customers.customer_id = orders.customer_id;
    
    select * from products;
    
    -- Get a list of product names and the order ID where they were ordered
    select p.product_id,
    p.product_name,
    o.quantity from
    products p inner join orders o
    on p.product_id = o.product_id;
    
    -- Retrieve each customer’s name along with the product they ordered
    select c.customer_name,
    p.product_name from customers c inner join orders o 
    on c.customer_id = o.customer_id
    inner join products p
    on o.product_id = p.product_id;

-- left join

-- Q) Show all customers and their order IDs, including customers who have not placed any orders.
select c.customer_name,o.order_id from customers c left join  orders o
on c.customer_id = o.customer_id;

select p.product_name,o.order_id from products p left join orders o on p.product_id = o.product_id;

-- right join 
-- Q) List all orders and the customer names associated with them, including any orders without a customer.
select o.order_id,c.customer_name from orders o right join customers c  on c.customer_id = o.customer_id;

select p.product_name,o.order_id from orders o right join products p on o.product_id = p.product_id;

-- outer join

select * 
from customers c left join orders o 
on c.customer_id = o.customer_id
union
select * 
from customers c right join orders o 
on c.customer_id = o.customer_id;

-- Get a list of all customers and orders, showing all customers and all orders, even if they don’t match.
-- select c.customer_name, o.order_id FROM Customers c   FULL OUTER JOIN orders o on c.customer_id=o.customer_id ; 
-- MySQL or another database that doesn’t support FULL OUTER JOIN, you can simulate it with a combination of LEFT JOIN and RIGHT JOIN using UNION

-- cross join

select * from customers cross join orders ; 

-- set operators
-- 1.union
-- 2. intersect
-- 3 .except
-- 4. union all

-- Get a unique list of all customer names and all product names
select customer_name as name from customers
union
select product_name as name from products;

select customer_id from customers 
union all 
select customer_id as name from orders;

-- Find any customer_ids that exist in both the Customers and Orders tables.
select customer_id from customers 
intersect
select customer_id from orders;

-- List customer_ids of customers who have not placed any orders.
select customer_id from customers
except
select customer_id from orders;

-- SQL Constraints
-- 1) Not null 
-- 2) Unique
-- 3) primery key

-- 1) not null
create table staff(id int PRIMARY key,first_name varchar(20) not null ,last_name varchar(20) not null,email varchar(30));
insert into staff(id,first_name,last_name,email)values(1,'Mikhtahd','TT',' ');

create table staff1( id int AUTO_INCREMENT PRIMARY key,first_name varchar(20) not null ,last_name varchar(20) not null);
insert into staff1(first_name,last_name)values('Mikhtahd','TT');
select * from staff1;

-- 2) unique
create table insta (id int AUTO_INCREMENT PRIMARY KEY,USERNAME VARCHAR(20) unique,pasworde varchar(10) UNIQUE);
insert into insta (username,pasworde) values('mikku','1234567891'),('mikku','9857461331');
-- we will get errors due to duplicate entry of user_name
insert into insta (username,pasworde) values('mikku','1234567891'),('haneesha','9857461331');
select * from insta;

-- 3) PRIMERY KEY
CREATE TABLE order_s(c_id int AUTO_INCREMENT PRIMARY key,c_name varchar(20) not null,quantity int not null);
insert into order_s (c_name,quantity)values('mikku',5);
alter table order_s add CONSTRAINT unique_name UNIQUE (c_name);
select * from order_s;

-- 4) froeign key
create table customer(id int AUTO_INCREMENT PRIMARY key,first_name varchar (20),c_id int ,FOREIGN KEY(c_id) REFERENCES order_s(c_id));
insert into customer (first_name,c_id)values('mikku',1);
select * from customer;

-- 5) Check Condtraint
create table product (id int AUTO_INCREMENT PRIMARY key , prd_name varchar(20),price decimal(10,2) check (price>0));
alter table product add CONSTRAINT f_id FOREIGN KEY (id) references order_s(c_id);

-- 6) Default Constraints
create table employee_s(id int AUTO_INCREMENT PRIMARY key,e_name varchar(20),email varchar(20),salary int default 10000);
insert into employee_s (e_name,email) values('mikhthad','mikku@'),('haneesha','hannesha@');
select * from employee_s;

-- index
create index i_ename on employee_s(e_name);
show index from employee_s;

-- window function
-- 1) row_number
-- 2) rank
-- 3) Dense_rank
-- 4) aggegrate function(max,min,avg,sum)
-- 5) value Function(lag(),lead(),first_value(),last_value(),nth_value())

-- row_number
select * from employee;
select employee_id,first_name,department,salary,
ROW_NUMBER() over(PARTITION BY department order by salary desc) 
as row_num from employee;

insert into employee(employee_id,department,salary) values(11,'sales',46000),(12,'sales',30000);

-- rank
select employee_id,first_name,department,salary,
rank () over(PARTITION BY department order by salary desc) as ranks from employee;

insert into employee(employee_id,department,salary) values(11,'sales',46000),(12,'sales',30000);

create table student(id int AUTO_INCREMENT PRIMARY key not null,std_name varchar(20) not null,
class varchar(20) not null,std_subject varchar(20) not null,marks int);
insert into student(std_name,class,std_subject,marks)values('Haneesha','A','Maths',10),('Mikku','B','Physics',100),('Fabina','C','Chemistry',80),
("Nayana",'A',"Physics",52),('Shifna','B','Maths',50),('Rifby','A','Chemistry',100),('Haneesha','A','Physics',50),('Mikku','B','Maths',90),
('Fabina','C','Physics',40),('Nayana','A','Chemistry',20);
select * from student;

select *,rank()over(PARTITION BY std_subject ORDER BY marks desc) as ranks from student;
select *,ROW_NUMBER()over (partition by class) as row_num from student;
select *, rank()over(PARTITION BY class order by marks desc)as ranks from student;

-- Dense_rank
select * ,DENSE_RANK()over(order by marks desc) as ranks from student;
select * from employee;
select *,DENSE_RANK()over (PARTITION BY department order by salary desc) as ranks from employee;

-- max,min,avg,sum
select *,max(marks)over(PARTITION BY std_subject order by marks desc)as max_marks from student;

select *,min(marks)over(PARTITION BY std_subject)as min_mark from student;

select *,max(marks)over(PARTITION BY std_subject order by marks desc)as max_marks,
min(marks)over(PARTITION BY std_subject)as min_mark from student;

select *,avg(marks)over(PARTITION BY std_subject)as avg_mark from student;
select * ,sum(marks)over(PARTITION BY std_name)as total from student order by total desc;

-- value function - lag()
select * ,lag(salary,1,0)over 
(PARTITION BY department ORDER BY salary desc)as previous_salary from employee;

select * , lag(marks,1,0)over (PARTITION BY Std_subject ORDER BY marks desc) 
previous_mark from student;

-- lead()
select * ,lead(salary,1,0)over (PARTITION BY department ORDER BY salary)
as future_salary from employee;

select * ,lead(marks,1,0)over(PARTITION BY std_subject ORDER BY marks) as marks from student;

-- first_value
select first_name,department,salary,FIRST_VALUE(salary)over (PARTITION BY department ORDER BY salary desc)
 as first_salary from employee;
 
 -- last value()
 select first_name,department,salary,LAST_VALUE(salary)over (PARTITION BY department ORDER BY salary desc 
 RANGE between unbounded preceding and unbounded following) as last_salary from employee;
 
select *,last_value(marks)over(PARTITION BY std_name ORDER BY marks desc 
range between unbounded preceding and unbounded following)as marks from student;

-- nth_value()
select first_name,department,salary from employee GROUP BY first_name,department,salary order by salary desc;

select first_name,department,salary,NTH_VALUE(salary,2)over (partition by department order by salary desc 
range between unbounded preceding and unbounded following)as salary from employee;

select *,NTH_VALUE(marks,2)over(partition by std_subject ORDER BY marks desc 
range between unbounded preceding and unbounded following)as marks from student;