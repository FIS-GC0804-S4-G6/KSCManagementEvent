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
exec spLoginMember 'ducndgc00467@fpt.edu.vn', 12345;
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