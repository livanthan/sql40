create database Employee;
use Employee;
create table employee_details(EMPLOYEE_ID int,FIRST_NAME varchar(50),
LAST_NAME varchar(50),
SALARY int,
JOINING_DATE varchar(10),
DEPARTMENT varchar(50),
primary key(EMPLOYEE_ID));

insert into employee_details(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) values 
(1,'Venkatesh','S',100000,'08/28/2015','BANKING'),
(2,'Ragavi','P',75000,'08/28/2015','BUSINESS'),
(3,'Gopinath','C',50000,'03/02/2016','PHARMA'),
(4,'Dinesh','G',50000,'03/02/2016','INSURANCE'),
(5,'Saibabu','E',40000,'07/08/2017','SOFTWARE'),
(6,'Hasan','S',29000,'07/08/2017','MANUFACTURING'),
(7,'Divya','P',33000,'07/08/2017','HEALTHCARE'),
(8,'Aravindan','R',40000,'07/08/2017','HEALTHCARE'),
(9,'Sathish','MD',45000,'03/02/2016','AUTOMOBILE'),
(10,'Prasanth','PKP',34000,'03/02/2016','INSURANCE'),
(11,'Vijay','R',25684,'03/02/2016','BUSINESS'),
(12,'Sivakumar','K',54789,'03/02/2016','SOFTWARE');

select * from employee_details;
create table incentives(EMPLOYEE_REF_ID int ,
INCENTIVE_DATE VARCHAR(50),
INCENTIVE_AMOUNT INT,
foreign key (EMPLOYEE_REF_ID) references employee_details(EMPLOYEE_ID)
);
INSERT into incentives values 
(1,'01-feb-16',5000),
(2,'01-feb-16',3000),
(3,'01-feb-17',4000),
(1,'01,jan-17',4500),
(2,'01-jan-17',3500);

-- 1.) get all emplyee details from the employee table
    select * from employee_details;
    
-- 2.) get Frist_name,last_name from employee table
      select FIRST_NAME, LAST_NAME from employee_details;
      
-- 3.)get first_name from emplyee table using alias names"employee name"
      select  FIRST_NAME as employee_name from employee_details;
      
-- 4.)get first_name fromemployee table in uppercase
        select upper(FIRST_NAME) from employee_details;
        
-- 5.) get first_name from employee table in lowercase
         select lower(FIRST_NAME) FROM employee_details;

-- 6.) get unique department from employee table 
       select distinct DEPARTMENT FROM employee_details;
       
-- 7.) select fisrt 3 characters of first name from employee
      select substring(FIRST_NAME,1,3) from employee_details;
      
-- 8.) get position of 'a' in name 'ragavi' from employee table
       select position('a' in 'ragavi');
       
-- 9.)get first_name from empolyee table after removing while spaces from right side
          select rtrim(FIRST_NAME) from employee_details;

-- 10.)get first_name from empolyee table after removing while spaces from left side
       select ltrim(FIRST_NAME) from employee_details;
       
-- 11.) get length of first_name from employee table
        select length(FIRST_NAME) FROM employee_details;
        
-- 12.) get first_name from employee table after replacing 'a' with $
 select replace(FIRST_NAME,'a','$') from employee_details;
 
 -- 13.) get first_name and last_name as single column from employee table separated by a '_'
      select concat(FIRST_NAME ,'_',LAST_NAME) from employee_details;
      
-- 14.)get first_name ,joining year, joining month and joing date from employee table
          select FIRST_NAME,  
          substring(JOINING_DATE,7,12) as year,
          substring(JOINING_DATE,1,2) as month,
          substring(JOINING_DATE,4,2) as date
           from employee_details;
           
-- 15.) get all employee details from the table order by first_name ascending
select * from employee_details order by FIRST_NAME asc;

-- 16.) get all employee details from the table order by first_name descending
select * from employee_details order by FIRST_NAME desc;

-- 17.) get all employee details from the employee table order by first_name ascending and salary descending
 select * from employee_details order by FIRST_NAME asc,SALARY desc;
 
  -- 18.) get employee details from employee table whose empolyee name is" Dinesh"
  select * from employee_details where FIRST_NAME ='Dinesh';
   
   -- 19.) get employee detail from employee table whose empolyee name are 'Dinesh' and 'roy'
   select * from employee_details where FIRST_NAME ='Dinesh' AND 'roy';
   
   -- 20.) get empolyee details from employee table whose empolyee name are not 'Dinesh' and 'Ray'
   select * from employee_details where FIRST_NAME not in ('Dinesh' and 'Roy');
    
    -- 21.) get employee details from employee table where first name starts with 's'
    select * from employee_details where FIRST_NAME like 's%';
     
     -- 22.) get empolyee details from employee table whose first name contains 'v'
     select * from employee_details where FIRST_NAME LIKE '%v%';
 
 -- 23.) get empolyee details from employee table whose first name end 'n'
     select * from employee_details where FIRST_NAME LIKE '%n';
     
-- 24.) get names of employee from employee table who has '%' in last_name
     select * from employee_details where LAST_NAME like '%';
     
-- 25.) get last name from employee table after replacing speacial character with white space
SELECT replace(LAST_NAME, '@#$%^&*', '       ') FROM employee_details;
 
 -- 26.) get department,total salary, with respect to a department from employee table
 select department,sum(salary) from employee_details group by department;
 
 -- 27.)  get department,total salary, with respect to a department from employee table order by total salary descending
 select department,sum(salary) as total_salary from employee_details group by department 
 order by total_salary desc;
  
  -- 28.)get department no of employee in a department.total salary with respect to a department from employee table order salary descending
         select department,count(department),sum(salary) as total_salary from employee_details group by department 
 order by total_salary desc;
 
 -- 29.) get department wise average salary from employee table order by salary ascending
 select department,avg(salary) as total_salary from employee_details group by department 
 order by total_salary asc;
 
 -- 30.)get department wise maximum salary from employee table order by salary ascending
 select department,max(salary) as total_salary from employee_details group by department 
 order by total_salary asc;
 
 -- 31.)get department wise minimum salary from employee table order by salary ascending
 select department,min(salary) as total_salary from employee_details group by department 
 order by total_salary asc;
   
   -- 32.)select no of employee joined with respect to year and month from empolyee table
    select count(*) as total_employee,  
          substring(JOINING_DATE,7,12) as year,
          substring(JOINING_DATE,1,2) as month
           from employee_details group by year,month;
           
-- 33.)select department,total salary with respect to a department from employee table where total salary greater than800000 total salary descending
select department ,salaryfrom employee_details where salary >800000;

-- 34.)select first_name incertive amount from employee and incertives table for those emploee who have incertives
select first_name,incentive_amount from employee_details d join incentives i on d.first_name=i.employee_ref_id;