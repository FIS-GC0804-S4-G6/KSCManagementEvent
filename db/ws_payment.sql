--use master
--go
--drop database PaymentService
go
create database PaymentService
go
use PaymentService
go
create table Account(
	id int identity,
	bankCode varchar(11),
	fullName varchar(max),
	address varchar(max),
	money float,
	status bit
)
go
create table ExchangeHistory(
	id int identity,
	idClient int,
	idCompany int,
	moneyTransfer float
)
go
alter table Account
add primary key (id)
go
alter table ExchangeHistory
add primary key (id),
constraint fk_bankCodeClient foreign key (idClient) references Account(Id),
constraint fk_bankCodeCompany foreign key (idCompany) references Account(Id)
go
create procedure spCheckAccountExist
	@bankCode varchar(11)
as
begin
	select * from Account
	where Account.bankCode = @bankCode
end
go
create procedure spTransfer
	@bankCodeClient varchar(11),
	@bankCodeCompany varchar(11),
	@money float
as
begin
	declare @idBankCodeClient int
	set @idBankCodeClient = (select id from Account where Account.bankCode = @bankCodeClient);
	declare @idBankCodeCompany int
	set @idBankCodeCompany =(select id from Account where Account.bankCode = @bankCodeCompany);
	declare @cacheMoneyClient float
	set @cacheMoneyClient = (select money from Account where Account.id = @idBankCodeClient);
	declare @cacheMoneyCompany float
	set @cacheMoneyCompany = (select money from Account where Account.id = @idBankCodeCompany);
	
	update Account set Account.money = (@cacheMoneyClient - @money) where Account.id = @idBankCodeClient;
	update Account set Account.money = (@cacheMoneyCompany + @money) where Account.id = @idBankCodeCompany;

	insert into ExchangeHistory
	values(@idBankCodeClient, @idBankCodeCompany, @money)
end
go
insert into Account
values
('444-444-444', 'MrA', 'abc', 500, 1),
('555-555-555', 'MrB', 'abc', 200, 1)
go
exec spTransfer '444-444-444', '555-555-555', 20;