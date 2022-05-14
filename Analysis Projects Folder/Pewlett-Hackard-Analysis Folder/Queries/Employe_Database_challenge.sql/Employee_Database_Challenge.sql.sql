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






