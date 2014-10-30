--create database KSCManagementEvent;
--go
--drop database KSCManagementEvent

--use KSCManagementEvent
--go

/* drop statement? try your own type. I'm so lazy. F*ck */
drop table MailingList;
drop table Cust_Event;
drop table Event_Price;
drop table [Session];
drop table Event_Picture;
drop table Event;
drop table Category;
drop table Customer;
drop table University;
drop table Role;
go


create table Role(
	Role_Id int identity primary key,
	Roletype text
)
go
create table University(
	Univercode int identity primary key,
	Name text,
	Address text,
	Email text,
	Home text,
	Mobile text
)
go
create table Customer(
	Cust_Id int identity primary key,
	Email text,
	FullName text,
	Password text,
	Gender varchar(6),
	DateOfBirth date,
	Address text,
	Mobile text,
	Home text,
	IDCard varchar(14),
	Avatar text,
	Role_Id int,
	Univercode int,
	Active bit,
	constraint FK_Customer_Role foreign key (Role_Id) references Role(Role_Id),
	constraint FK_Customer_University foreign key (Univercode) references University(Univercode)
)
go
create table Category(
	Cate_Id int identity primary key,
	CategoryName text
)
go
create table Event(
	Event_Id int identity primary key,
	Title text not null,
	Logo text,
	Description text,
	Speaker text,
	Address text not null,
	Slogan text,
	StartDate datetime not null,
	EndDate datetime not null,
	Hometag bit default '0',
	Status bit default '0',
	Cate_Id int not null,
	constraint FK_Event_Category foreign key (Cate_Id) references Category(Cate_Id)
)
go
create table Event_Picture(
	Eventpic_Id int identity primary key,
	Event_Id int,
	PicturePath text,
	constraint FK_Event_EventPicture foreign key (Event_Id) references Event(Event_Id)
)
go
create table [Session](
	SID_Id int identity primary key,
	Cust_Id int,
	Device text,
	SID_Device text,
	constraint FK_Session_Customer foreign key (Cust_Id) references Customer(Cust_Id)
)
go
create table Event_Price(
	Price_Id int identity primary key,
	Event_Id int,
	Price float,
	Description text,
	constraint FK_EventPrice_Event foreign key(Event_Id) references Event(Event_Id)
)
go
create table Cust_Event(
	Cust_Id int,
	Price_Id int,
	Payment int,
	constraint FK_CustEvent_Customer foreign key(Cust_Id) references Customer(Cust_Id),
	constraint FK_CustEvent_EventPrice foreign key(Price_Id) references Event_Price(Price_Id),
	constraint PK_CustEvent primary key(Cust_Id, Price_Id)
)
go
create table MailingList(
	Email varchar(200) primary key,
	Status bit
)