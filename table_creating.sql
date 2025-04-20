-- -- add table 01 Employees -- --
CREATE TABLE Employees (
    employeeid INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hiredate DATE
);

INSERT INTO Employees (employeeid, employee_name, department, salary, hiredate) VALUES
(1, 'Alice', 'HR', 50000, '2020-01-15'),
(2, 'Bob', 'IT', 60000, '2019-03-10'),
(3, 'Charlie', 'IT', 55000, '2021-07-23'),
(4, 'Diana', 'Marketing', 52000, '2018-11-05'),
(5, 'Eva', 'HR', 51000, '2022-04-17'),
(6, 'Frank', 'Finance', 58000, '2020-06-30'),
(7, 'Grace', 'IT', 62000, '2019-08-01'),
(8, 'Hannah', 'Marketing', 54000, '2021-09-10'),
(9, 'Ian', 'Finance', 56000, '2023-01-05'),
(10, 'Jane', 'HR', 49500, '2020-02-28'),
(11, 'Kevin', 'IT', 61000, '2018-05-15'),
(12, 'Laura', 'Finance', 63000, '2020-12-12'),
(13, 'Mike', 'Marketing', 47000, '2021-01-19'),
(14, 'Nina', 'HR', 52000, '2019-11-23'),
(15, 'Oscar', 'IT', 59000, '2022-06-15'),
(16, 'Paula', 'Finance', 61000, '2018-07-07'),
(17, 'Quinn', 'Marketing', 48000, '2021-03-03'),
(18, 'Rachel', 'HR', 50000, '2023-04-04'),
(19, 'Steve', 'IT', 64000, '2020-09-09'),
(20, 'Tina', 'Finance', 65000, '2022-02-20');





































-- -- add table 02 Department -- -- 
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO Department (dept_id, dept_name, location) VALUES
(1, 'HR', 'New York'),
(2, 'IT', 'San Francisco'),
(3, 'Marketing', 'Chicago'),
(4, 'Finance', 'Boston'),
(5, 'Operations', 'Seattle'),
(6, 'Legal', 'Washington D.C.'),
(7, 'Customer Service', 'Denver'),
(8, 'Sales', 'Atlanta'),
(9, 'Research', 'Austin'),
(10, 'Product Management', 'Los Angeles'),
(11, 'Engineering', 'Palo Alto'),
(12, 'Data Science', 'San Diego'),
(13, 'Security', 'Phoenix'),
(14, 'Quality Assurance', 'Portland'),
(15, 'Training', 'Orlando'),
(16, 'Procurement', 'Dallas'),
(17, 'Public Relations', 'Philadelphia'),
(18, 'Design', 'San Jose'),
(19, 'Business Development', 'Miami'),
(20, 'Strategy', 'Minneapolis');



