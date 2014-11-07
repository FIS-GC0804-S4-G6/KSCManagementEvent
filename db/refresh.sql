--create database KSCManagementEvent;
--go
--drop database KSCManagementEvent

use KSCManagementEvent
--go

/* drop statement? try your own type. I'm so lazy. F*ck */
drop table MailingList;
drop table Cust_Event;
drop table Event_Price;
drop table [Session];
drop table Event_Picture;
drop table Event;
drop table Payment_Option;
drop table Category;
drop table Customer;
drop table University;
drop table Role;
go

create table Role(
	Role_Id int identity primary key,
	Roletype nvarchar(max),
)
go
create table University(
	Univercode int identity primary key,
	Name nvarchar(max),
	Address nvarchar(max),
	Email nvarchar(max),
	Home nvarchar(max),
	Mobile nvarchar(max)
)
go
create table Customer(
	Cust_Id int identity primary key,
	Email nvarchar(max),
	FullName nvarchar(max),
	Password nvarchar(max),
	Gender varchar(6),
	DateOfBirth date,
	Address nvarchar(max),
	Mobile nvarchar(max),
	Home nvarchar(max),
	IDCard varchar(14),
	Avatar nvarchar(max),
	Role_Id int,
	Univercode int,
	Active bit,
	constraint FK_Customer_Role foreign key (Role_Id) references Role(Role_Id),
	constraint FK_Customer_University foreign key (Univercode) references University(Univercode)
)
go
create table Category(
	Cate_Id int identity primary key,
	CategoryName nvarchar(max)
)
go
create table Payment_Option
(
	Payment_Id int identity primary key,
	Payment_Type nvarchar(max),
)
create table Event(
	Event_Id int identity primary key,
	Title nvarchar(max) not null,
	Logo nvarchar(max),
	Description nvarchar(max),
	Speaker nvarchar(max),
	Address nvarchar(max) not null,
	Slogan nvarchar(max),
	StartDate datetime not null,
	EndDate datetime not null,
	Hometag bit default '0',
	IsDelete bit default '0',
	Cate_Id int not null,
	constraint FK_Event_Category foreign key (Cate_Id) references Category(Cate_Id)
)
go
create table Event_Picture(
	Eventpic_Id int identity primary key,
	Event_Id int,
	PicturePath nvarchar(max),
	constraint FK_Event_EventPicture foreign key (Event_Id) references Event(Event_Id)
)
go
create table [Session](
	SID_Id int identity primary key,
	Cust_Id int,
	Device nvarchar(max),
	SID_Device nvarchar(max),
	constraint FK_Session_Customer foreign key (Cust_Id) references Customer(Cust_Id)
)
go
create table Event_Price(
	Price_Id int identity primary key,
	Event_Id int,
	Price float,
	Description nvarchar(max),
	IsDelete bit default '0',
	constraint FK_EventPrice_Event foreign key(Event_Id) references Event(Event_Id)
)
go
create table Cust_Event(
	Cust_Id int,
	Price_Id int,
	Payment_Id int,
	Event_Id int,
	TicketCode varchar(20) not null,
	Price float not null,
	IsDelete bit,
	constraint FK_CustEvent_PaymentOption foreign key (Payment_Id) references Payment_Option(Payment_Id),
	constraint FK_CustEvent_Customer foreign key(Cust_Id) references Customer(Cust_Id),
	constraint FK_CustEvent_Event foreign key(Event_Id) references Event(Event_Id),
	constraint PK_CustEvent primary key(Event_Id, TicketCode)
)
go
create table MailingList(
	Email varchar(200) primary key,
	Status bit
)