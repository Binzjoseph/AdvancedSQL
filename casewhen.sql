-- case when

select *
from employeedemographics ed;

select employeeid, firstname, lastname, age,
case 
	when age > 30 then 'Old'
    when age between 27 and 30 then 'Young'
    else 'Baby'
end as agebracket
from employeedemographics
where age is not null
order by age;

-- if two conditions are true the first one is only returned

select employeeid, firstname, lastname, age,
case 
	when age > 30 then 'Old'
    when age = 38 then 'Stanley'
    when age between 27 and 30 then 'Young'
    else 'Baby'
end as agebracket
from employeedemographics
where age is not null
order by age;


select firstname, lastname, jobtitle, salary,
case 
	when jobtitle ='Salesman' then salary + (Salary * .10)
    when jobtitle ='Accountant' then salary + (salary * .05)
    when jobtitle ='HR' then salary + (salary *.000001)
    else salary + (salary * 0.03)
end as salaryafter
from employeedemographics ed
join employeesalary es
	on ed.employeeid=es.employeeid;