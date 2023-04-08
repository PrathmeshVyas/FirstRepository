create table EMPLOYEE (
	EMPLOYEE_ID int,
    FIRST_NAME varchar(255),
	LAST_NAME varchar(255),
    SALARY int,
    JOINING_DATE datetime,
    DEPARTMENT varchar(255)
);

insert into EMPLOYEE values (1, 'John', 'Abraham', 1000000, '01-01-13 12:00:00', 'Banking');
insert into EMPLOYEE values (2, 'Michael', 'Clarke', 800000, '01-01-13 12:00:00', 'Insurance');
insert into EMPLOYEE values (3, 'Roy', 'Thomas', 700000, '01-02-13 12:00:00', 'Banking');
insert into EMPLOYEE values (4, 'Tom', 'Jose', 600000, '01-02-13 12:00:00', 'Insurance');
insert into EMPLOYEE values (5, 'Jerry', 'Pinto', 650000, '01-02-13 12:00:00', 'Insurance');
insert into EMPLOYEE values (6, 'Philip', 'Mathew', 750000, '01-01-13 12:00:00', 'Services');
insert into EMPLOYEE values (7, 'TestName1', '123', 650000, '01-01-13 12:00:00', 'Services');
insert into EMPLOYEE values (8, 'TestName2', 'Lname%', 600000, '01-02-13 12:00:00', 'Insurance');

Select * from EMPLOYEE;
select FIRST_NAME, LAST_NAME from EMPLOYEE;
select EmployeeName.FIRST_NAME from EMPLOYEE EmployeeName;
select EmployeeName.* from EMPLOYEE EmployeeName where EmployeeName.FIRST_NAME = 'John';
select EmployeeName.* from EMPLOYEE EmployeeName where EmployeeName.FIRST_NAME IN ('John', 'Roy');
select EmployeeName.* from EMPLOYEE EmployeeName where EmployeeName.FIRST_NAME NOT IN ('John', 'Roy');
select EmployeeName.* from EMPLOYEE EmployeeName where EmployeeName.FIRST_NAME like 'J%';
select EmployeeName.* from EMPLOYEE EmployeeName where EmployeeName.FIRST_NAME like '%o%';
select EmployeeName.* from EMPLOYEE EmployeeName where EmployeeName.SALARY BETWEEN 500000 AND 800000;
select DISTINCT(DEPARTMENT) from EMPLOYEE;
select SALARY from EMPLOYEE ORDER BY SALARY DESC LIMIT 2;


WITH emp_details
AS (select EmployeeName.* from EMPLOYEE EmployeeName where EmployeeName.SALARY BETWEEN 500000 AND 800000) 
select AVG(SALARY) AS AVG_SAL from emp_details;

select EmployeeName.* from EMPLOYEE EmployeeName where EmployeeName.LAST_NAME like '%\%%';
UPDATE EMPLOYEE SET SALARY = SALARY + SALARY/10 WHERE EMPLOYEE_ID is not NULL;
select * FROM EMPLOYEE WHERE SALARY>=(SELECT SALARY from EMPLOYEE where SALARY/10 >= 100000);




 
 
