use KSCManagementEvent

-- =============================================================== --
-- ============================ Category ========================= --
-- =============================================================== --
go
--1.Select Category
	drop proc sp_category_select
	go

	create proc sp_category_select
	as
	begin
		select * from Category
	end
	go

	exec sp_category_select
	go
-- =============================================================== --
-- ============================ EVENT ============================ --
-- =============================================================== --
go
-- 1.Event Creating
	drop proc sp_event_creating
	go
	create procedure sp_event_creating
		@Title nvarchar(max),
		@Logo nvarchar(max),
		@Description nvarchar(max),
		@Speaker nvarchar(max),
		@Address nvarchar(max),
		@Slogan nvarchar(max),
		@StartDate datetime,
		@EndDate datetime,
		@Cate_Id int,
		@Event_Id int out
	AS
	BEGIN
		INSERT INTO [Event](Title, Logo, Description, Speaker, Address, Slogan, StartDate, EndDate, Cate_Id)
		VALUES (@Title, @Logo, @Description, @Speaker, @Address, @Slogan, @StartDate, @EndDate, @Cate_Id);
		set @Event_Id = SCOPE_IDENTITY()
	END
	go
	select * from Event_Price
	execute sp_event_creating
		@Title = 'Magical Mystery tour',
		@Logo = null,
		@Description = 'super fun',
		@Speaker = 'Mr.Walrus',
		@Address = 'Sea',
		@Slogan = 'You''re gonna lose that girl',
		@StartDate = '2014-09-01 09:11',
		@EndDate = '2014-09-01 09:23',
		@Cate_Id = '1',
		@Event_Id = 0
	go

-- 2.Select events
	drop proc sp_event_select
	go
	create proc sp_event_select
		@PageNumber int,
		@RowsPage int
	as
		declare
			@current datetime = GETDATE()
		select CE.AmountPaticipants, CE.SumPrice, "TimeStatus" =
		case
			when EndDate < GETDATE() then 'Past'
			when StartDate <= @current and @current < EndDate then 'In Processing'
			when GETDATE() < StartDate then 'In the Future'
			end,
			C.CategoryName, E.*
		from Event as E
		left outer join
		(
			select Event_Id, count(*) as AmountPaticipants, sum(Price) as SumPrice from Cust_Event
			where IsDelete = 0
			group by Event_Id
		) CE
		on E.Event_Id = CE.Event_Id
		join Category as C on
		E.Cate_Id = C.Cate_Id
		where E.IsDelete = 0
		order by E.Event_Id
		offset ((@PageNumber - 1) * @RowsPage) rows
		fetch next @RowsPage rows only
	go

	exec sp_event_select 1, 100
	go
-- 3.Select event by event_Id
	drop proc sp_event_select_by_eventId
	go
	create proc sp_event_select_by_eventId
		@Event_Id int
	as
	begin
		select E.*, C.CategoryName from Event as E
		join Category as C
		on E.Cate_Id = C.Cate_Id
		where E.Event_Id = @Event_Id and E.isDelete = '0'
	end
	go

	execute sp_event_select_by_eventId 1
	go
-- 4.Update Logo
	drop proc sp_event_update_logo
	go
	create proc sp_event_update_logo
		@Logo nvarchar(max),
		@Event_Id int
	as
	begin
		update Event set Logo = @Logo where Event_Id = @Event_Id
	end
	go
-- 5.Delete Logo
	drop proc sp_event_delete_logo_by_eventId
	go
	create proc sp_event_delete_logo_by_eventId
		@Event_Id int
	as
	begin
		update Event set Logo = null where Event_Id = @Event_Id
	end
	go
	exec sp_event_delete_logo_by_eventId 1

-- 6.Count all Events
	drop proc sp_count_all_event
	go

	create proc sp_count_all_event
		@AmountEvent int = -1 out
	as
		select @AmountEvent = count(*) from Event as E
		where E.IsDelete = 0
	go

	declare @AmountEvent int
	exec sp_count_all_event @AmountEvent out
	select @AmountEvent
	go
-- =============================================================== --
-- ============================ EVENT_PRICE ============================ --
-- =============================================================== --
go
	--select EVENT_PRICE by Event_Id
	drop proc sp_event_price_select_by_eventId
	go

	create proc sp_event_price_select_by_eventId
		@Event_Id int
	as
	begin
		select Price_Id, Price, Description from Event_Price where Event_Id = @Event_Id and IsDelete = '0'
	end
	go

	exec sp_event_price_select_by_eventId 1
	go

	--edit EVENT_PRICE
	drop proc sp_event_price_editing
	go
	create proc sp_event_price_editing
		@Price_Id int,
		@Price float,
		@Description nvarchar(max)
	as
	begin
		update Event_Price set Price=@Price, Description=@Description where Price_Id = @Price_Id and IsDelete = '0'
	end
	go

	exec sp_event_price_editing '1', '100', 'Tien To'
	go
	select * from Event_Price

	--delete EVENT_PRICE_by_priceId
	drop proc sp_event_price_deleting_by_priceId
	go

	create proc sp_event_price_deleting_by_priceId
		@Price_Id int
	as
	begin
		update Event_Price set IsDelete = '1' where Price_Id = @Price_Id
	end
	go

	exec sp_event_price_deleting_by_priceId '1'
	go

	--insert EVENT_PRICE
	drop proc sp_event_price_inserting
	go

	create proc sp_event_price_inserting
		@Event_Id int,
		@Price float,
		@Description nvarchar(max),
		@Price_Id int out
	as
	begin
		insert into Event_Price (Event_Id, Price, Description) values (@Event_Id, @Price, @Description)
		set @Price_Id = SCOPE_iDENTITY()
	end
	go

	--CUSTOMER REGISTER
	drop proc spRegister;
	go
	create proc spRegister
		@Email nvarchar(max),
		@FullName nvarchar(max),
		@Password nvarchar(max),
		@Gender bit
	as
	begin
		insert into Customer (Email, FullName, Password, Gender) values (@Email, @FullName, @Password, @Gender);
	end
	go
	exec spRegister 'a@gmail.com', 'Nguyen Hoang Giap', '123456abc', 1
	go

	DROP proc spActiveLink
	go
	create procedure spActiveLink
		@email varchar(max),
		@active bit
	as
	begin
		update Customer
		set Active = @active
		where @email = Email
	end
	go

	--select event and payment type
	drop proc showEventDetail
	go

	create proc showEventDetail
		@Event_Id int
	as
	begin
		select Title, Logo, Description, Speaker, Address, Slogan, StartDate, EndDate, Category.CategoryName
		from Event 
		inner join Category
		on Event.Cate_Id = Category.Cate_Id
		where Event.Event_Id = @Event_Id;
	end
	go

	exec showEventDetail 1
	go
	
	drop proc showEventPicture
	go
	create proc showEventPicture
		@Event_Id int
	as
	begin
		select Event_Picture.PicturePath from Event_Picture
		where Event_Picture.Event_Id = @Event_Id
	end
	go
	exec showEventPicture 1
	go

	select * from Event	
	go
	select * from Event
	go
	select* from Category
	go

	drop proc showCustEvent
	go
	create proc showCustEvent
		@Event_Id int
	as
	begin
		select Customer.FullName, Customer.Avatar, Customer.Email, Payment_Option.Payment_Type
		from Cust_Event
		inner join Customer
		on Cust_Event.Cust_Id =  Customer.Cust_Id
		inner join Payment_Option
		on Cust_Event.Cust_Id = Payment_Option.Payment_Id
		where Event_Id = @Event_Id
	end
	go

	exec showCustEvent 1
	go

	drop proc showEventPrice
	go
	create proc showEventPrice
		@Event_Id int
	as
	begin
		select Event_Price.Price_Id, Event_Price.Price
		from Event_Price
		where Event_Id = @Event_Id
	end
	go

	exec showEventPrice 1
	go
	select * from Event_Price

	--CUSTOMERS PAY THERE PRICE

go
drop proc choosePriceAndPayment
go
create proc choosePriceAndPayment
	@Cust_Id  int, 
	@Price_Id int, 
	@Payment_Id int, 
	@Event_Id int, 
	@TicketCode varchar(20),
	@Price float
as
begin
	insert into Cust_Event (Cust_Id, Price_Id, Payment_Id, Event_Id, TicketCode, Price)
	values (@Cust_Id, @Price_Id , @Payment_Id, @Event_Id, @TicketCode, @Price)
end
go
exec choosePriceAndPayment 3, 3, 3, 2, '297', 40
go
select * from Cust_Event
select * from Payment_Option
select * from Customer
select * from Event_Price

go
drop proc showPaymentType
go
create proc showPaymentType
as
begin
	--select Payment_Id, Payment_Type from Payment_Option where Payment_Type='Demand Draft' or Payment_Type = 'Cheque' or Payment_Type = 'Cash'
	select Payment_Id, Payment_Type from Payment_Option where Payment_Id != 4
end
go
exec showPaymentType

-- =============================================================== --
-- ============================ CUSTOMER ========================= --
-- =============================================================== --
go
--1. Select paticipants from an event
drop proc sp_select_participants_from_event
go

create proc sp_select_participants_from_event
	@Event_Id int
as
begin
	select CE.TicketCode, CE.Price as [RealPrice], CE.Price_Id
	, PO.Payment_Type
	, C.Email
	from Cust_Event as CE
	join Customer as C
	on CE.Cust_Id = C.Cust_Id
	join Event as E
	on CE.Event_Id = E.Event_Id
	join Event_Price as EP
	on CE.Price_Id = EP.Price_Id
	join Payment_Option as PO
	on CE.Payment_Id = PO.Payment_Id
	where E.IsDelete = 0 and CE.IsDelete = 0 and CE.Event_Id = @Event_Id
end
go
exec sp_select_participants_from_event 1
go



-- =============================================================== --
-- ========================= PAYMENT_OPTION ====================== --
-- =============================================================== --
go

--1. select all Payment_Option
drop proc sp_payment_option_select
go

create proc sp_payment_option_select
as
	select * from Payment_Option
go

exec sp_payment_option_select
go


-- =============================================================== --
-- ========================== STATISTIC ========================== --
-- =============================================================== --
go
--1. select sum price from specific month
drop proc sp_select_sumPrice_month
go

create proc sp_select_sumPrice_month
	@Year int,
	@Month int
as
begin
	select Sum(Price) as [Sum] from Cust_Event as CE
	join Event as E on CE.Event_Id = E.Event_Id
	where CE.IsDelete = 0 and E.IsDelete = 0 and Year(StartDate) = @Year and Month(StartDate) = @Month
end
go

exec sp_select_sumPrice_month 2015, 10
go

--2. select amount event from specific month
drop proc sp_select_amount_event_month
go

create proc sp_select_amount_event_month
	@Year int,
	@Month int
as
	select count(*) as [Amount] from Event
	where IsDelete = 0
	and (
		(Year(StartDate) = @Year and Month(StartDate) = @Month and
		Year(EndDate) = @Year and Month(EndDate) = @Month)
		or
		(
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
				or 
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
		)
		or
		(
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) > @Year)
				or
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
		)
		or
		(
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
				or
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) > @Month) 
				or
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) > @Year)
				or 
			(Year(StartDate) < @Year and Year(EndDate) > @Year)
		)
	)

go

exec sp_select_amount_event_month 2014, 10
go

--3. select amount participants from specific month
drop proc sp_select_amount_participants_month
go

create proc sp_select_amount_participants_month
	@Year int,
	@Month int
as
begin
	select count(*) as [AmountParticipants] from Cust_Event as CE
	join Event as E
	on CE.Event_Id = E.Event_Id
	where E.IsDelete = 0 and cE.IsDelete = 0 and Year(E.StartDate) = @Year and Month(StartDate) = @Month
end
go

exec sp_select_amount_participants_month 2014, 9
go

--4. count events in specific month depend on events include
--	+ in month
--	+ before month
--	+ month after
--	+ before month after
drop proc sp_select_amount_classify_events_month
go

create proc sp_select_amount_classify_events_month
	@Year int,
	@Month int
as
begin
	select count([Type]) as [Amount], [Type] from
	(
	select Title, StartDate, EndDate,
	case
		when
			Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) = @Year and Month(EndDate) = @Month
		then 'in month'
		when
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
				or 
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
		then 'before month'
		when
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) > @Year)
				or
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
		then 'month after'
		when
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
				or
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) > @Month) 
				or
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) > @Year)
				or 
			(Year(StartDate) < @Year and Year(EndDate) > @Year)
		then 'before month after'
		end as [Type]
	from Event
	where IsDelete = 0
	and (
		(Year(StartDate) = @Year and Month(StartDate) = @Month and
		Year(EndDate) = @Year and Month(EndDate) = @Month)
		or
		(
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
				or 
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
		)
		or
		(
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) > @Year)
				or
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
		)
		or
		(
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
				or
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) > @Month) 
				or
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) > @Year)
				or 
			(Year(StartDate) < @Year and Year(EndDate) > @Year)
		)
	)
	) as sub
	group by [Type]
end
go

exec sp_select_amount_classify_events_month 2016, 1
go

--5. select event at specific month
drop proc sp_select_events_month
go

create proc sp_select_events_month
	@Year int,
	@Month int
as
begin
	select Title, StartDate, EndDate,
	case
		when
			Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) = @Year and Month(EndDate) = @Month
		then 'in month'
		when
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
				or 
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
		then 'before month'
		when
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) > @Year)
				or
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
		then 'month after'
		when
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
				or
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) > @Month) 
				or
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) > @Year)
				or 
			(Year(StartDate) < @Year and Year(EndDate) > @Year)
		then 'before month after'
		end as [YouAreHere]
	from Event
	where IsDelete = 0
	and (
		(Year(StartDate) = @Year and Month(StartDate) = @Month and
		Year(EndDate) = @Year and Month(EndDate) = @Month)
		or
		(
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
				or 
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) = @Month)
		)
		or
		(
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) > @Year)
				or
			(Year(StartDate) = @Year and Month(StartDate) = @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
		)
		or
		(
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) = @Year and Month(EndDate) > @Month)
				or
			(Year(StartDate) < @Year and
			Year(EndDate) = @Year and Month(EndDate) > @Month) 
				or
			(Year(StartDate) = @Year and Month(StartDate) < @Month and
			Year(EndDate) > @Year)
				or 
			(Year(StartDate) < @Year and Year(EndDate) > @Year)
		)
	)
end
go

exec sp_select_events_month 2015, 11
go

