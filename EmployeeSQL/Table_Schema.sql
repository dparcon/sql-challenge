-- Create all tables

-- Create Titles table
CREATE TABLE titles (
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(32) NOT NULL,
	CONSTRAINT pk_titles PRIMARY KEY (
		title_id
	)
);

-- Create Departments table
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(32) NOT NULL,
	CONSTRAINT pk_departments PRIMARY KEY (
		dept_no
	)
);

-- Create Employees table
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(16) NOT NULL,
	last_name VARCHAR(16)NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT pk_employees PRIMARY KEY (
		emp_no
	)
);

-- Create Salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salaries INT NOT NULL
);

-- Create dept_emp table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL
);

-- Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL
);

-- Add constraints after creating tables (best practice)
ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles(title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);