create database smartclocksrldb;

use smartclocksrldb;

create TABLE roles(
  id int IDENTITY(1,1) PRIMARY KEY,
  type varchar(40),
  creationdate DATE DEFAULT GETDATE(),
  description VArchar(225)
);

create table position(
  id int identity(1,1) primary key,
  name varchar(40),
  description varchar(225)
);

create TABLE employees(
  id INT IDENTITY(1,1) PRIMARY KEY,
  name varchar(40),
  lastname varchar(40), 
  address varchar(40),
  birthdate DATE DEFAULT GETDATE(),
  phone varchar(40),
  email varchar(40),
  huella varbinary(MAX),
  admissionDate DATE DEFAULT GETDATE(),
  idPosition int FOREIGN KEY REFERENCES position(id),
  gender varchar(40),
  images varbinary(MAX)
);

create table users(
  id int identity(1,1) primary key,
  username varchar(40),
  password varchar(40),
  idRol int foreign key references roles(id)
);

create table checkin(
  id int identity(1,1) primary key,
  employeeID int foreign key references employees(id),
  checkDate date DEFAULT GETDATE(),
  checkHour varchar(40) DEFAULT FORMAT(GETDATE(),'hh:mm:ss'),
  observations varchar(255)
);

create table checkout(
  id int identity(1,1) primary key,
  employeeID int foreign key references employees(id),
  checkDate date DEFAULT GETDATE(),
  checkHour varchar(40) DEFAULT FORMAT(GETDATE(),'hh:mm:ss'),
  observations varchar(255)
);

insert into roles(type, description) values('ADMIN', 'Administrator description');
insert into users values ('admin@smartclock.com', 'admin', 1);
insert into position values ('Desarrollador','Crea aplicaciones para la empresa');
insert into employees(name, lastname, address, birthdate, phone, email, huella, idPosition,gender) values('Felix','Garcia','Alma Rosa', '10-26-2000','80959590012','felix@gmail.com',1, 1,'Masculino');
