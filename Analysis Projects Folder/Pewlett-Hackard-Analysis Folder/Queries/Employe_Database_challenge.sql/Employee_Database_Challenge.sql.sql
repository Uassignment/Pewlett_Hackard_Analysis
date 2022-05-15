--- Deliverable 1


---joining data from employees and titles tables to create retirement_titles file 

select 
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
into retirement_titles
from employees as e
inner join titles as t
on (e.emp_no = t.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by emp_no asc

drop table retirement_titles;

select
*
from
retirement_titles;


select
emp_no,
first_name,
last_name,
title
from
retirement_titles;


-- Creating unique_titles using 'distinct on'

select distinct on (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

into unique_titles
from retirement_titles as rt
order by emp_no asc, to_date desc;

select 
*
from 
unique_titles;


select count 
(ut.emp_no), 
ut.title
from 
unique_titles as ut
group by title
order by count(title) desc;


---Deliverable 2 - Mentorship Eligibility

select 
*
from
dept_emp;

drop table dept_emp;

CREATE TABLE dept_emp(
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

select distinct on (e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join titles as t
on (e.emp_no = t.emp_no)
where (e.birth_date between '1965-01-01' and '1965-12-31')
and (de.to_date = '9999-01-01')
order by emp_no, t.to_date desc;

select count (emp_no)
from 

CREATE TABLE mentorship_eligibilty(
  emp_no INT NOT NULL,
  first_name varchar NULL,
  last_name varchar NULL,
  birth_date date NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  title varchar NOT NULL,
  --FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  --FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no)
);

select
*
from
mentorship_eligibilty;

select title, count (emp_no) as title_count
from mentorship_eligibilty
group by title
order by title_count desc;


