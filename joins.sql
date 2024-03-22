/* joins */


use sql_tutorial;

select *
from employeedemographics e
join employeesalary es on e.employeeid = es.employeeid;

select *
from employeedemographics e
left join employeesalary es on e.employeeid = es.employeeid
union
select *
from employeedemographics e
right join employeesalary es on e.employeeid = es.employeeid;


select e.employeeid, firstname,lastname, jobtitle, salary
from employeedemographics e
right join employeesalary es on e.employeeid = es.employeeid;


select e.employeeid, firstname, lastname, salary
from employeedemographics e
 join employeesalary es
	on e.employeeid = es.employeeid
where firstname <> 'Michael'
order by salary desc;


select jobtitle, avg(salary)
from employeesalary es
join employeedemographics e on e.employeeid=es.employeeid
where jobtitle = 'Salesman'
group by jobtitle;