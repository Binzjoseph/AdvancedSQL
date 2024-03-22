use sql_tutorial;

-- syntax for stored procedure

DELIMITER //
CREATE PROCEDURE test()
BEGIN
    select * from employee_demographics;
END //
    
DELIMITER ;

call test;

delimiter //
create procedure temp_employee (in job varchar(100))
begin
create temporary table temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
);

insert into temp_employee
select JobTitle, count(jobtitle), avg(Age), avg(salary)
from employeedemographics ed
join employeesalary sal
	on ed.employeeid=sal.employeeid
where jobtitle=job
group by jobtitle;
end//
delimiter ;

select * from temp_employee;

call temp_employee ('Receptionist');

set @job='Accountant';
select JobTitle, count(jobtitle), avg(Age), avg(salary)
from employeedemographics ed
join employeesalary sal
	on ed.employeeid=sal.employeeid
-- where jobtitle=@job
group by jobtitle;