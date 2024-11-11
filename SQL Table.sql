create database jobplacement;
use jobplacement;
show TABLES;
select * from job_placement;
select DISTINCT college_name from job_placement;  
-- number function
select round (4.354211,2);
select abs(-123) result;

select ceiling(6.8);
select floor(5.8);

select sqrt(25);
select truncate(4.3222,2);

-- string func
select * from job_placement;
select name , lower(name) updated_name from job_placement;
select name , upper(name) updated_name from job_placement;

select length('Hello world');
select count(college_name) from job_placement;
SELECT count(DISTINCT college_name) from job_placement;

select replace('Mikhthad mikku','mikku','T T') result;
-- space contoll
SELECT TRIM(" hello world ");
select ltrim(" hello world ");
select rtrim(" hello world ");

select max(age) max_age from job_placement;
select count(DISTINCT stream) from job_placement;
select count(*) from job_placement where years_of_experience in(3);

-- limit 
select * from job_placement limit 5;

-- 
select * from job_placement order by salary desc;
select * from job_placement where placement_status = "placed" order by salary desc;
select count(*) from job_placement where placement_status = "placed" order by salary asc;
select * from job_placement order by years_of_experience asc;
select * from job_placement order by years_of_experience desc,salary asc;
select placement_status from job_placement;

-- subquery
select name,age,gender,stream,years_of_experience,salary from job_placement where years_of_experience > 
( select min(years_of_experience) from job_placement) and salary > 60000 ;

select min(years_of_experience) from job_placement where salary > 60000;

select name,age,gender,stream,placement_status from job_placement where stream in 
(select stream from job_placement where stream = 'computer science') and placement_status = 'placed';

select name,age,placement_status from job_placement where age in (select age from job_placement where age > 25) and placement_status = 'Not Placed';
select * from job_placement;
select DISTINCT placement_status from job_placement; 
select name,age,placement_status,salary from job_placement where placement_status in 
(select placement_status from job_placement where placement_status = 'placed') and salary > 60000;

-- case conditional statement
select name,age,salary, 
case 
when salary<25000
then "Low salary"
when salary between 25000 and 50000
then "medium salary"
else
"high salary"
end as salary_range
from job_placement;

select name,salary,years_of_experience,
case
when years_of_experience < 1
then "Fresher"
when years_of_experience < 2
then "Junior"
else
"Senior"
end as Job_position
from job_placement;

-- groupby
select stream,avg(salary) as Avg_salary from job_placement group by stream ;
-- Q) how many candidates are in each stream?
select stream,count(id) as total_candidates from job_placement group by stream;

select stream,count(*) as plced from job_placement where placement_status='placed' group by stream;

select years_of_experience,count(*) as year from job_placement group by years_of_experience;
select * from job_placement;

select gender,count(*) as total_gender from job_placement group by gender;

select placement_status,AVG(years_of_experience) as avg_experience from job_placement group by placement_status;

select placement_status,count(*) as total from job_placement group by placement_status;

select stream,min(salary)min_salary,max(salary)max_salary,avg(salary) avg_saalry from job_placement group by stream ;

-- any 
select name,stream,salary from job_placement where salary > any ( select salary from job_placement where stream = 'computer science');
select name,stream,salary from job_placement where salary > any ( select salary from job_placement where stream = 'computer science') and stream <> 'computer science';

select name,years_of_experience,stream,salary from job_placement where years_of_experience > any 
( select years_of_experience from job_placement where stream = 'information technology') 
and stream <> 'information technology';

-- exists
select name,stream,placement_status from job_placement jp where EXISTS 
(select 1 from job_placement where stream = 'computer science' 
and jp.stream = stream) and placement_status = 'placed';

select name,stream,placement_status from job_placement jp where EXISTS 
(select 1 from job_placement where jp.placement_status = 'placed' and stream = 'computer science' 
and jp.stream = stream);

-- having clause

select stream,count(*) from job_placement where placement_status = 'placed' group by stream;
select stream , count(*) as total_placed from job_placement where placement_status = 'placed' group by stream having count(*)>100;
select stream , count(*) as total_placed from job_placement where placement_status = 'placed' group by stream having total_placed>100;

select stream , max(salary) as max_salary from job_placement  group by stream having max_salary>60000;
select stream , max(salary) as max_salary , years_of_experience from job_placement  group by stream, years_of_experience having max_salary>60000;
select stream ,years_of_experience, max(salary) as max_salary from job_placement where years_of_experience = 1 group by stream having max_salary>60000;

select stream,max(salary) as max_salary,years_of_experience from job_placement GROUP BY stream,years_of_experience having max_salary > 60000 ORDER BY years_of_experience;