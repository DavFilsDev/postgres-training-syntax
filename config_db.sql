create database employe_management;

\c employe_management;

create table Leave (
    id serial primary key,
    start_date date,
    end_date date
);

create table Employee (
    id serial primary key,
    first_name varchar(100),
    last_name varchar(100),
    contract_type varchar(50),
    salary int,
    leave_id int references Leave(id)
);

create table Team (
    id serial primary key,
    name varchar(50),
    employee_id int references Employee(id)
);