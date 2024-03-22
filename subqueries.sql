-- subqueries

-- for select

select * from employeesalary;

select employeeid, salary, (select avg(salary) from employeesalary) as avg from employeesalary e;

-- for partition by

select employeeid, salary, avg(salary) over () as avg from employeesalary;

-- will not be the same using group by
select employeeid, salary, avg(salary) 
from employeesalary
group by 1, 2
order by 1, 2;



-- subquery in from

select a.employeeid, a.allavgsalary from (select employeeid, salary, avg(salary) over () as allavgsalary from employeesalary) a;

select * from employeedemographics;
-- subquery in where in where statement mostly only one column or field can be returned unlike the from one
select es.employeeid, jobtitle, salary from employeesalary es
where es.employeeid in (select ed.employeeid from employeedemographics ed where ed.age>30);