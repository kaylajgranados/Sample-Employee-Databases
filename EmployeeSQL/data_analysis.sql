-- Create tables and import data
CREATE TABLE employees ( 
	emp_no INT NOT NULL,
  	emp_title_id VARCHAR(5),
  	birth_date DATE,
  	first_name VARCHAR(40),
  	last_name VARCHAR(40),
	sex VARCHAR(1), 
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
	
CREATE TABLE titles (
	title_id VARCHAR(5),
	title VARCHAR(30),
	PRIMARY KEY (title_id)
);

CREATE TABLE department (
	dept_no VARCHAR(5),
	dept_name VARCHAR(30), 
	PRIMARY KEY (dept_no));
	
CREATE TABLE dept_manager (
	dept_no VARCHAR(5),
	emp_no INT NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no), 
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
	);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

-- List the employee number, last name, first name, sex, and salary of each employee. 
SELECT emp_table.emp_no, 
emp_table.last_name, 
emp_table.first_name, 
emp_table.sex, 
sal_table.salary 
FROM employees as emp_table
LEFT JOIN salaries as sal_table 
ON (emp_table.emp_no = sal_table.emp_no); 

-- List the first name, last name, and hire date for the employees who were hired in 1986.  
SELECT first_name, last_name, hire_date
FROM employees
WHERE extract(year from hire_date) = 1986; 

--List the manager of each department along with their department number, department name, employee number, last name, and first name. 
SELECT dept_manager.emp_no, 
dept_manager.dept_no, 
dept_table.dept_name, 
emp_table.last_name, 
emp_table.first_name
FROM dept_manager as dept_manager
LEFT JOIN department as dept_table 
ON (dept_table.dept_no = dept_manager.dept_no) 
LEFT JOIN employees as emp_table 
ON (emp_table.emp_no = dept_manager.emp_no);

--List the department number for each employee along with that employee's employee number, last name, first name, and department name. 
SELECT emp_table.emp_no, 
emp_table.last_name, 
emp_table.first_name, 
dept_table.dept_no,
dept_table.dept_name
FROM employees as emp_table
LEFT JOIN dept_emp as dept_emp 
ON (emp_table.emp_no = dept_emp.emp_no)
LEFT JOIN department as dept_table
ON (dept_emp.dept_no = dept_table.dept_no);

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, 
last_name, 
sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

--List the frequency counts, in descending order, of all the employees last names (that is, how many employees share each last name). 

SELECT last_name,COUNT(last_name) AS Frequency 
FROM employees
GROUP BY last_name 
ORDER BY 
COUNT(last_name)DESC; 









