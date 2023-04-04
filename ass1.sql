create table Employee (
    employee_id int PRIMARY KEY NOT NULL,
    employee_name varchar(255),
    number_of_sales int,
    employee_number int,
    employee_address varchar(255)
    );
    
select * from Employee;

create table Inventory (
	car_id int PRIMARY KEY NOT NULL,
    car_name varchar(225),
    mode_number varchar(225),
    category varchar (225),
    car_price int,
    launch_year int
);

create table Sales (
	sales_id int PRIMARY KEY NOT NULL,
    car_name varchar(225),
    car_id varchar(225),
    employee_id int,
    sales_amount int,
    employee_commission int,
    sales_year int,
    FOREIGN KEY(car_id) references Inventory(car_id),
    FOREIGN KEY(employee_id) references Employee(employee_id),
    CONSTRAINT CHECK WHEN (select years_worked from Employee)
);



