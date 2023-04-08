create table EMPLOYEE (
	EMPLOYEE_ID int PRIMARY KEY NOT NULL,
    FIRST_NAME varchar(255),
	LAST_NAME varchar(255),
    SALARY int,
    JOINING_DATE datetime,	
    DEPARTMENT varchar(255),
    MANAGER_ID int
);
insert into EMPLOYEE values (1, 'John', 'Abraham', 1000000, '01-01-13 12:00:00', 'Banking', NULL);
insert into EMPLOYEE values (2, 'Michael', 'Clarke', 800000, '01-01-13 12:00:00', 'Insurance', 1);
insert into EMPLOYEE values (3, 'Roy', 'Thomas', 700000, '01-02-13 12:00:00', 'Banking', 1);
insert into EMPLOYEE values (4, 'Tom', 'Jose', 600000, '01-02-13 12:00:00', 'Insurance', 2);
insert into EMPLOYEE values (5, 'Jerry', 'Pinto', 650000, '01-02-13 12:00:00', 'Insurance', 3);
insert into EMPLOYEE values (6, 'Philip', 'Mathew', 750000, '01-01-13 12:00:00', 'Services', 3);
insert into EMPLOYEE values (7, 'TestName1', '123', 650000, '01-01-13 12:00:00', 'Services', 2);
insert into EMPLOYEE values (8, 'TestName2', 'Lname%', 600000, '01-02-13 12:00:00', 'Insurance', 2);

create table INCENTIVE (
	EMPLOYEE_REF_ID int, 
    INCENTIVE_DATE date,
    INCENTIVE_AMOUNT int,
    FOREIGN KEY (EMPLOYEE_REF_ID) references EMPLOYEE(EMPLOYEE_ID)
);
insert into INCENTIVE values (1, '2013-02-01', 5000);
insert into INCENTIVE values (2, '2013-02-01', 3000);
insert into INCENTIVE values (3, '2013-02-01', 4000);
insert into INCENTIVE values (1, '2013-01-13', 4500);
insert into INCENTIVE values (2, '2013-01-13', 3500);

select * from EMPLOYEE;
select * from INCENTIVE;

CREATE VIEW EMPLOYEE_DETAILS AS
SELECT CASE WHEN DEPARTMENT ='Insurance' THEN 'Insurance Dept'
	   WHEN DEPARTMENT = 'Banking' THEN 'Bank Dept' 
       WHEN DEPARTMENT = 'Services' THEN 'Services Dept'
       ELSE NULL END FROM EMPLOYEE;
       
select * from EMPLOYEE e RIGHT JOIN INCENTIVE i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;
SELECT SALARY FROM EMPLOYEE WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE FIRST_NAME = 'Roy');

create view emp_info as
select e.FIRST_NAME, e.LAST_NAME, e.SALARY, e.JOINING_DATE, i.INCENTIVE_DATE, i.INCENTIVE_AMOUNT FROM EMPLOYEE e LEFT JOIN INCENTIVE i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;
select * from emp_info;	

create view employee_incentives as
select e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM EMPLOYEE e LEFT JOIN INCENTIVE i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID where i.INCENTIVE_AMOUNT > 3000;
select * from employee_incentives;

ALTER TABLE EMPLOYEE ADD COLUMN LOCATION varchar(255);

CREATE TABLE E_DEPARTMENT (
	EMP_REF_ID int,
    D_NAME varchar(255),
	D_NUMBER int,
    FOREIGN KEY (EMP_REF_ID) references EMPLOYEE(EMPLOYEE_ID)
);
INSERT INTO E_DEPARTMENT VALUES(1, 'Banking', 90);
INSERT INTO E_DEPARTMENT VALUES(2, 'Insurance', 102);
INSERT INTO E_DEPARTMENT VALUES(3, 'Banking', 90);
INSERT INTO E_DEPARTMENT VALUES(4, 'Insurance', 102);
INSERT INTO E_DEPARTMENT VALUES(5, 'Insurance', 102);
INSERT INTO E_DEPARTMENT VALUES(6, 'Services', 103);
INSERT INTO E_DEPARTMENT VALUES(7, 'Services', 103);
INSERT INTO E_DEPARTMENT VALUES(8, 'Insurance', 102);  
select * from E_DEPARTMENT;


CREATE view emp_location as
select e.FIRST_NAME, e.LAST_NAME , d.D_NAME, d.D_NUMBER FROM EMPLOYEE e JOIN E_DEPARTMENT d ON e.EMPLOYEE_ID = d.EMP_REF_ID where e.LOCATION = 'LONDON';
select * from emp_location;

CREATE view emp_dept as
select d.D_NAME, COUNT(e.FIRST_NAME) as no_of_emp FROM EMPLOYEE e JOIN E_DEPARTMENT d ON e.EMPLOYEE_ID = d.EMP_REF_ID GROUP BY 1;
select * from emp_dept;

create table JOB_HISTORY (
	EMP_REF_ID int,
    JOB_TITLE varchar(255),
    START_DATE date,
    END_DATE date,
    EMP_DEP_REF int,
    FOREIGN KEY (EMP_REF_ID) references EMPLOYEE(EMPLOYEE_ID)
);

INSERT INTO JOB_HISTORY values(1, 'Bank_manager', '2013-01-01', '2033-01-01',  90);
INSERT INTO JOB_HISTORY values(2, 'Insurance_manager', '2013-01-01', '2030-01-01',  102);
INSERT INTO JOB_HISTORY values(3, 'Bank_manager', '2013-02-01', '2017-01-01',  90);
INSERT INTO JOB_HISTORY values(4, 'Insurance_manager', '2013-02-01', '2033-01-01',  102);
INSERT INTO JOB_HISTORY values(5, 'Insurance_manager', '2013-02-01', '2023-01-10',  102);
INSERT INTO JOB_HISTORY values(6, 'Service_manager', '2013-01-01', '2035-01-11',  103);
INSERT INTO JOB_HISTORY values(7, 'Service_manager', '2013-01-01', '2016-01-01',  103);
INSERT INTO JOB_HISTORY values(8, 'Insurance_manager', '2013-02-01', '2015-01-02',  102);
select * from JOB_HISTORY;
select EMP_REF_ID, JOB_TITLE, (YEAR(END_DATE)-YEAR(START_DATE))*365 as num_of_day FROM JOB_HISTORY WHERE EMP_DEP_REF = 90;
select e.FIRST_NAME as manager, i.D_NAME, e.LOCATION FROM EMPLOYEE e JOIN E_DEPARTMENT i ON e.EMPLOYEE_ID = i.EMP_REF_ID;

alter table E_DEPARTMENT add column MANAGER_Id int; 

create view expmorethan15yrs as
select DATEDIFF(now(), JOINING_DATE)/365 as exprience, FIRST_NAME, LAST_NAME, JOINING_DATE, SALARY, DEPARTMENT FROM E_DEPARTMENT d JOIN EMPLOYEE e ON e.EMPLOYEE_ID = d.EMP_REF_ID where DATEDIFF(now(), JOINING_DATE)/365 > 15;
select * from expmorethan15yrs;
drop view expmorethan15yrs; 