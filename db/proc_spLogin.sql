use KSCManagementEvent
go
drop procedure spLoginMember
go
create procedure spLoginMember
	@Email varchar(max),
	@Password varchar(max)
as
begin
	select Customer.Cust_Id, Customer.Email, Customer.FullName, Customer.Gender, Customer.DateOfBirth, Customer.Address, Customer.Mobile, Customer.Home, Customer.IDCard, Customer.Avatar, University.Name as UniversityName 
	from Customer
	inner join Role
	on Role.Role_Id = Customer.Role_Id
	inner join University
	on University.Univercode = Customer.Univercode
	where @Email = Customer.Email and @Password = Customer.Password and Role.Role_Id = 1 and Customer.Active = 1
end
go
exec spLoginMember 'giapnhgc00561@fpt.edu.vn', 12345;
go
select * from Customer
select * from University
go
drop procedure spLoginAdmin
go
create procedure spLoginAdmin
	@Email varchar(max),
	@Password varchar(max)
as
begin
	select Customer.Cust_Id, Customer.Email, Customer.FullName, Customer.Gender, Customer.DateOfBirth, Customer.Address, Customer.Mobile, Customer.Home, Customer.IDCard, Customer.Avatar, University.Name as UniversityName, Role.Roletype from Customer
	inner join Role
	on Role.Role_Id = Customer.Role_Id
	inner join University
	on University.Univercode = Customer.Univercode
	where @Email = Customer.Email and @Password = Customer.Password and Role.Role_Id != 1 and Customer.Active = 1
end
go
exec spLoginAdmin 'giapnhgc@gmail.com', 12345;
go
select * from Customer

go
drop proc spRemember
go
create proc spRemember
	@cust_Id int,
	@sid_device varchar(max),
	@device varchar(max)
as
begin
	insert into Session
	values (@cust_Id, @sid_device, @device)
end
go
select * from Session
select * from Customer
go

drop proc spSignout
go
create proc spSignout
	@email int,
	@Device nvarchar(max),
	@SID_Device nvarchar(max)
as
begin
	declare @custID int
	select @custID = cust_Id from Customer where Email = @email

	delete from Session where Cust_Id = @custID and Device = @Device and SID_Device = @SID_Device 
end
go
drop proc spSession
go
create proc spSession
	@cust_Id int,
	@SID_Device nvarchar(max)
as
begin
	select Cust_Id, Device, SID_Device from Session where Cust_Id = @cust_Id and SID_Device = @SID_Device
end