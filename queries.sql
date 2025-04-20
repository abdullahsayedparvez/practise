-- -- Get all employee names from the Employees table.-- --
select 
	Name 
from employees;

-- -- Find all employees who work in the IT department. -- --
select 
	Name
from employees
Where department = 'IT';

-- -- List the names and salaries of employees earning more than 52000. -- --
SELECT 
	Name,
    salary
FROM employees 
where salary > 52000;

-- -- Show the employee names sorted alphabetically. -- --
select 
	Name
from employees
order by employee_name asc;

-- -- Count how many employees are there in total. -- --
select 
	COUNT(employee_name) as total_employee
from employees;

-- -- Count how many employees are in each department.-- -- 
select 
	count(employee_name),
    department
from employees
group by department;

-- -- Get the highest salary in the company. -- --
select 
    max(salary)
from employees;

-- -- Get the average salary of employees. -- --
select 
    avg(salary)
from employees;

-- --Find all employees hired after January 1, 2020.-- --
select 
	employee_name,
    hiredate
from employees
where hiredate > '2020-01-15';

-- -- Show the names and departments of employees, sorted by department. -- --
select 
	employee_name,
    department
from employees
order by department asc;

-- -- -- -- second table added  department -- -- -- --
-- -- Get the total number of employees in each department along with department location. --  --
select 
	d.dept_name,
    d.location,
    COUNT(e.employeeid) as employe_count
from employees as e
join department as d 
on e.department = d.dept_name
group by d.dept_name, d.location;


-- -- Find the average salary for each department, but only show departments where the average salary is greater than 55000.-- -- 
select
	department,
	avg(salary) as avg_salary
from employees
group by department
having avg_salary > 55000;


-- -- Find all employees who earn more than the average salary of their department. -- --
select 
	e.employee_name,
    e.salary,
    e.department
from employees as e
where e.salary > (
	select 
		avg(ee.salary)
	from employees as ee
    where e.department = ee.department
);

-- -- List departments with fewer than 5 employees. -- --
select 
	count(employeeid) as employee_in_depart,
    department
from employees
group by department
having employee_in_depart < 5;

-- --Employees who joined in 2022 -- --
select
	employee_name,
    hiredate
from employees
where year(hiredate) = 2022;


-- -- Highest-paid employee in each department -- --
SELECT 
	department, 
    employee_name, 
    salary
FROM Employees e
WHERE salary = (
    SELECT 
		MAX(salary)
    FROM Employees
    WHERE department = e.department
);


-- -- All employees with their department’s location -- --
select
	e.employee_name,
    e.department,
    d.location
from employees e
join department d 
on e.department = d.dept_name;

-- Number of employees hired each year -- 
select 
	YEAR(hiredate),
	count(employee_name) as employees_fired
from employees
group by YEAR(hiredate)
order by YEAR(hiredate) asc;

-- Employees earning within 5000 of the top salary -- 
select
	*
from employees
where salary >= (
	SELECT 
		MAX(salary) - 5000 
	FROM Employees);
    
-- --  All departments with total salary paid, including empty ones -- --
select
	sum(e.salary) as total_salary_paid,
    e.department
from employees e
group by e.department ;


-- -- Show the names of all employees who work in departments ending with the letter ‘e’. -- --
select
	*
from employees
where department like '%e';

 -- -- Find employees whose names start with the letter 'S' -- --
 select 
	*
from employees
where employee_name like 'S%';

-- -- Show employee names that have exactly 5 characters. -- -- 
select 
	*
from employees
where length(employee_name) = 5;

-- Find all employees hired in June (any year).--
select
	employee_name,
    hiredate
from employees
where month(hiredate) = 6;

-- -- Show department-wise average salary but only for departments with more than 3 employees. -- --
select 
	count(employee_name) as total_employee,
	avg(salary) as avg_salary,
    department
from employees
group by department
having total_employee > 3;

-- -- Find the total salary paid to employees whose names contain the letter ‘a’ -- --
select
    SUM(salary)
from employees
where employee_name like '%a%';

-- -- Show employees who joined in the first quarter (Jan–Mar) of any year. -- --
select
	employee_name
from employees
where month(hiredate) between 1 and 3;

-- -- Find the average salary of employees whose names start and end with the same letter. -- --
select 
	avg(salary)
from employees
where right(employee_name,1) = left(employee_name,1);

-- -- Show employees whose name contains exactly 6 letters. -- --
select 
	employee_name
from employees
where length(employee_name) =6;

-- -- Show employees who are in departments ‘HR’ or ‘Marketing’. -- --
select 
	employee_name,
    department
from employees
where department in('HR','Marketing');

-- -- Count number of employees in each department, only show departments with more than 4 people. -- --
select
	count(employee_name),
    department
from employees
group by department
having count(employee_name) > 4;
-- Display employee names in uppercase --
select
	upper(employee_name)
from employees ;


-- Show employees who were hired in an odd-numbered year.--
select
	*
from employees 
where mod(year(hiredate),2) = 1;

-- -- Show each employee’s salary as a percentage of the highest salary. -- --
SELECT 
  employee_name, 
  salary,
  ROUND((salary / (SELECT MAX(salary) FROM Employees)) * 100,2) AS salary_percent
FROM Employees;