# Sample Employee Databases SQL Challenge

For this project, I designed tables to hold the sample employee data, built the SQL database in PostgreSQL, and then wrote SQL queries to pull lists of employees. This was a project for the UCI Data Analytics and Visualization Bootcamp. 

**Data Modeling**

I inspected the six CSV files and then sketched an ERD of the tables. 
![Screenshot 2023-02-23 at 12 12 01 PM](https://user-images.githubusercontent.com/83734241/220994370-0dbb44b9-aee9-47f2-80cf-8fcbfe776700.png)

**Data Engineering**

I created a table schema for each of the six CSV files and specified the data types, primary keys, and foreign keys. 

I imported each CSV file into its corresponding SQL table.

**Data Analysis**

I wrote SQL queries to display: 
*the employee number, last name, first name, sex, and salary of each employee.
*the first name, last name, and hire date for the employees who were hired in 1986.
*the manager of each department along with their department number, department name, employee number, last name, and first name.
*the department number for each employee along with that employee’s employee number, last name, first name, and department name.
*the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
*the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
