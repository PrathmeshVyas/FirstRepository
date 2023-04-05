create table Employee (
    employee_id int PRIMARY KEY NOT NULL,
    employee_name varchar(255),
    number_of_sales int,
    employee_number int,
    employee_address varchar(255),
    years_worked int
);

create table Inventory (
	car_id varchar(255) PRIMARY KEY NOT NULL,
    car_name varchar(225),
    mode_number varchar(225),
    category varchar (225),
    car_price int,
    launch_year int
);

create table Customer (
	customer_id int PRIMARY KEY NOT NULL,
    customer_name varchar(255),
    customer_address varchar(255),
    car_id varchar(225),
    FOREIGN KEY(car_id) references Inventory(car_id)
);

create table Sales (
	sales_id int PRIMARY KEY NOT NULL,
    car_name varchar(225),
    car_id varchar(225),
    employee_id int,
    sales_amount int,
    employee_commission int,
    sales_year int,
    customer_id int,
    FOREIGN KEY(car_id) references Inventory(car_id),
    FOREIGN KEY(employee_id) references Employee(employee_id),
    FOREIGN KEY(customer_id) references Customer(customer_id)
);

insert into Customer values (101, 'Abhi', 'Ahmedabad', 'FOR25');
insert into Customer values (102, 'Kush', 'Ahmedabad', 'END25');
insert into Customer values (103, 'Shivam', 'Ahmedabad', 'MS07');

insert into Inventory values ('lxi01', 'Bmw ZX', 'zx1552', 'Sports', 7500000, 2020);
insert into Inventory values ('MS07', 'Mustang GT', 'GT007', 'Sports', 7500000, 2021);
insert into Inventory values ('END25', 'FORD ENDEAVOUR', 'tat25', 'SUV', 4500000, 2019);
insert into Inventory values ('FOR25', 'Fortuner', 'FR1552', 'SUV', 4000000, 2018);
insert into Inventory values ('RR07', 'Range Rover', 'RR007', 'SUV', 10000000, 2022);

select * from Employee;
select * from Inventory;
select * from Customer;
select * from Sales;

INSERT INTO Sales (sales_id, car_name, car_id, employee_id, sales_amount, sales_year, customer_id)
values (11, 'Fortuner', 'FOR25', 1, 4000000, 2018, 101);

Update Sales set employee_commission = sales_amount/40 where employee_id =1;






