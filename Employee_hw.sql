create table Titles (
		title_id VARCHAR NOT NULL,
		title VARCHAR NOT NULL,
		PRIMARY KEY (title_id)
);

select * from Titles;

--make sure to include DATE on birth_date, hire_date
create table Employees (
		emp_no INT NOT NULL,
		emp_title_id VARCHAR NOT NULL,
		birth_date VARCHAR NOT NULL,
		first_name VARCHAR NOT NULL,
		last_name VARCHAR NOT NULL,
		sex VARCHAR NOT NULL,
		hire_date VARCHAR NOT NULL,
		PRIMARY KEY (emp_no),
		FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

select * from Employees;
--changing birth_date column to display birthdate as year 19--.
UPDATE employees SET birth_date = employees.birth_date + INTERVAL '1900 years';

select * from Employees;

Create table Departments(
		dept_no VARCHAR NOT NULL,
		dept_name VARCHAR NOT NULL,
		Primary key(dept_no)
);

select * from departments;

create table Department_employees (
		emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
		dept_no VARCHAR NOT NULL,
		Foreign key (dept_no) references departments (dept_no),
		Primary Key (emp_no,dept_no)
);

select * from Department_employees;

create table Salaries (
	--id Serial primary key,
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	--Foreign key (emp_no) references Employees (emp_no),
	Primary Key (emp_no,salary)
);

select * from Salaries;

Create Table Department_managers (
		dept_no VARCHAR NOT NULL,
		emp_no INT NOT NULL,
		Primary Key (emp_no),
		Foreign Key (dept_no) references Departments (dept_no),
		Foreign Key (emp_no) references Employees (emp_no)
);

select * from Department_managers;

--Problem 1:
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
Inner JOIN salaries ON
employees.emp_no=salaries.emp_no;

--Problem 2: 
select employees.first_name, employees.last_name, employees.hire_date 
from employees
Where hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

--Problem 3:
select * from department_managers;
select * from departments;
select * from employees;

SELECT department_managers.dept_no, department_managers.emp_no, departments.dept_name, employees.last_name, employees.first_name
FROM department_managers
JOIN departments ON
department_managers.dept_no=departments.dept_no
JOIN employees ON
department_managers.emp_no = employees.emp_no;

--Problem 4: department of each employee with the following information: 
--employee number, last name, first name, and department name.

select * from departments;
select * from department_employees;
select * from employees;

SELECT employees.emp_no, employees.last_name, employees.first_name, department_employees.dept_no, departments.dept_name
FROM employees
JOIN department_employees ON
employees.emp_no=department_employees.emp_no
Join departments ON
department_employees.dept_no = departments.dept_no;


--Problem 5:List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
select employees.first_name, employees.last_name, employees.sex 
from employees
Where first_name = 'Hercules' and last_name like 'B%';

--Problem 6: List all employees in the Sales department,
--their employee number, last name, first name, and department name.
select * from employees;
select * from departments; --sales = d007
select * from department_employees
where dept_no = 'd007'

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON
employees.emp_no=department_employees.emp_no
Join departments ON
department_employees.dept_no = departments.dept_no
Where departments.dept_no = 'd007'


--Problem 7: List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select *from departments; --development= d005

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON
employees.emp_no=department_employees.emp_no
Join departments ON
department_employees.dept_no = departments.dept_no
Where departments.dept_no = 'd007' or departments.dept_no= 'd005';

--Problem 8: In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

select employees.last_name, count (employees.last_name) as lastnamecount
from employees 
group by employees.last_name
Order by lastnamecount desc;


