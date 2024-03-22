-- common table expressions

-- cte is similar to subquery also known as with queries
-- just like querying of a temp table
-- CTE is not saved anywhere each time we run it it is running and not being saved so just using the select statement
-- to query of the cte won't work
-- the select statement will only work directly after the cte statement which was created

with cte_emp as 
(select firstname, lastname, gender, salary,
count(gender) over (partition by gender) as totalgender,
avg(salary) over (partition by gender) as avgsal
from employeedemographics emp
join employeesalary sal 
	on emp.EmployeeID=sal.EmployeeID
where Salary> 45000)
select firstname, avgsal from cte_emp;
