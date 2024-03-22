-- temp tables

-- you can use the temp table multiple times unlike cte or subqueries

create temporary table temp_emp
(
EmployeeID int,
JobTitle varchar(100),
Salary int);


select * from temp_emp;

insert into temp_emp 
select * from employeesalary;


insert into temp_emp values
(1001,'HR',45000);

-- another example
drop table if exists temp2;
create temporary table temp2
(JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSal int);

insert into temp2
select jobtitle, count(JobTitle), avg(age), avg(salary)
from employeedemographics ed
join employeesalary es 
	on ed.employeeid=es.employeeid
group by jobtitle;

select * from temp2;

-- temp tables are mostly used in stored procedures
-- processing speed and storage do research on if you want to pursue being a DBA

show tables;