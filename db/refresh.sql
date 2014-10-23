--create database KSCManagementEvent;
--go

--drop database KSCManagementEvent

--use KSCManagementEvent
--go

/* drop statement? try your own type. I'm so lazy. F*ck */
drop table Customer;
drop table [Role];
drop table EventPicture;


create table Role(
	Role_Id int identity primary key,
	Roletype text
)

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
	constraint FK_Customer_Role foreign key (Role_Id) references Role(Role_Id)
)

create table Event(
	Event_Id int identity primary key,
	Title text,
	Logo text,
	Description text,
	Speaker text,
	Address text,
	Slogan text,
	StateDate datetime,
	EndDate datetime,
	Hometag bit,
	Status bit
)

create table Event_Picture(
	Eventpic_Id int identity primary key,
	Event_Id int,
	PicturePath text,
	constraint FK_Event_EventPicture foreign key (Event_Id) references Event(Event_Id)
)

create table [Session](
	SID_Id int identity primary key,
	Cust_Id int,
	Device text,
	SID_Device text
)

create table Event_Price(
	Price_Id int identity primary key,
	Event_Id int,
	Price float,
	Description text,
	constraint FK_EventPrice_Event foreign key(Event_Id) references Event(Event_Id)
)

create table Cust_Event(
	Cust_Id int,
	Event_Id int,
	Price_Id int,
	constraint FK_CustEvent_Customer foreign key(Cust_Id) references Customer(Cust_Id),
	constraint FK_CustEvent_Event foreign key(Event_Id) references Event(Event_Id),
	constraint FK_CustEvent_EventPrice foreign key(Price_Id) references Event_Price(Price_Id),
	constraint PK_CustEvent primary key(Cust_Id, Event_Id, Price_Id)
)

create table Category(
	Cate_Id int identity primary key,
	CategoryName text
)

create table Event_Category(
	Event_Id int,
	Cate_Id int,
	constraint FK_EventCategory_Event foreign key(Event_Id) references Event(Event_Id),
	constraint FK_EventCategory_Category foreign key(Cate_Id) references Category(Cate_Id),
	constraint PK_EventCategory primary key(Event_Id, Cate_Id)
)

create table MailingList(
	Email varchar(200) primary key,
	Status bit
)

create table University(
	Univercode int identity primary key,
	Name text,
	Address text,
	Email text,
	Home text,
	Mobile text
)