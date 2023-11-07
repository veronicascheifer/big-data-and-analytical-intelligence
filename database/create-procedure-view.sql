#Create procedure
DELIMITER |
create procedure increase_salary (IN increase float)
begin
	start transaction;
    update employee
       set salary = salary + (salary * (increase/100));
	commit;
end;

|
DELIMITER ;

call increase_salary(10);



DELIMITER |
#Create view
create view employee_data as 
select e.name as employee_name
     , d.name as employee_dependents
  from employee e
 inner join dependents d 
    on e.idEmployee = d.idEmployee;
|
DELIMITER ;


#Name of employee with highest salary;  
select q1.name
  from (
select name 
     , max(salary)
  from employee) q1;

#Name of employee with highest salary and the salary value;
select name
     , max(salary)
  from employee;

#Name of the employee and respective salary, ordering from highest to lowest value;

select name 
     , salary
  from employee
 order by salary; 

#The average salary of male employees;
select AVG(salary)
     , gender 
  from employee
 where gender = 0;
 
#The average salary of female employees;
select AVG(salary)
     , gender 
  from employee
 where gender = 1;

#The name of employees who are managers;
select e.name
  from Employee e
 inner join role c
    on e.idRole = c.idRole
 where c.supervisor = 1;

#The name of employees working on one or more projects;
select distinct e.name
  from employee e 
 inner join ProjectEmployee p 
    on e.idEmployee = p.idEmployee;
