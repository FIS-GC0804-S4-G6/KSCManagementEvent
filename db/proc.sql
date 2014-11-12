use KSCManagementEvent

-- =============================================================== --
-- ============================ Category ============================ --
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

-- 2.Select all events
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
-- 5.Delete Logo
	drop proc sp_event_delete_logo_by_eventId
	go
	create proc sp_event_delete_logo_by_eventId
		@Event_Id int
	as
	begin
		update Event set Logo = null where Event_Id = @Event_Id
	end
	exec sp_event_delete_logo_by_eventId 1
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
		@Gender varchar(6)
	as
	begin
		insert into Customer (Email, FullName, Password, Gender) values (@Email, @FullName, @Password, @Gender);
	end
	go
	exec spRegister 'a@gmail.com', 'Nguyen Hoang Giap', '123456abc', 'Male'
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


	--SELECT EVENT AND SHOW CUSTOMER IN EVENT
	go
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
		where Event_Id = @Event_Id;
	end
	go
	exec showEventDetail 1
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
	select * from Customer
	select * from Cust_Event
	select * from Payment_Option

	go
	drop proc showEventPrice
	go
	create proc showEventPrice
		@Event_Id int
	as
	begin
		select Event_Price.Price
		from Event_Price
		where Event_Id = @Event_Id
	end
	go
	exec showEventPrice 1
	go
	select * from Event_Price