create database DBNAME;
show databases;
use DBNAME;
select database();

drop database DBNAME;
drop table TABLENAME;
describe TABLENAME;

-- create a new table
create table employees (
    employee_id int unsigned auto_increment primary key,
    email varchar(320),
    gender varchar(1),
    notes text,
    employment_date date,
    designation varchar(100)
) engine = innodb;
-- // PUT IN engine = innodb, so that foreign key will work

-- inserting rows
insert into employees (
    email, gender, notes, employment_date, designation
) value ('asd@asd.com', 'm', 'Newbie', curdate(), "Intern");

-- see all the rows in a table
select * from employees;

-- update one row in a table
update employees set email="asd@gmail.com" where employee_id = 1;

-- delete one row
delete from employees where employee_id = 1;

-- add a new column to an existing table
alter table employees add column name varchar(100);
alter table employees rename column name to first_name;

-- add a fk between employees and departments
-- step 1: add the column
alter table employees add column department_id int unsigned not null;
-- step 2: indicate the newly added column to be a fk
alter table employees add constraint fk_employment_departments
    foreign key (department_id) references departments(department_id);

-- ===============
create table departments (
    department_id int unsigned auto_increment primary key,
    name varchar(100)
) engine innodb;

insert into departments (name) values ("Accounting"),("Human Resources"),("IT");
 
--  ==============
