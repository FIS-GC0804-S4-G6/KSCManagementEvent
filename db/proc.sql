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
		@Title text,
		@Logo text,
		@Description text,
		@Speaker text,
		@Address text,
		@Slogan text,
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

	execute sp_event_creating
		@Title = 'Magical Mystery tour',
		@Logo = null,
		@Description = 'super fun',
		@Speaker = 'Mr.Walrus',
		@Address = 'Sea',
		@Slogan = 'You''re gonna lose that girl',
		@StartDate = '2014-09-01 09:11',
		@EndDate = '2014-09-01 09:23',
		@Cate_Id = '1'
	go

-- 2.Select all events
	drop proc sp_event_select
	go
	create proc sp_event_select
	as
	select * from [Event]
-- 3.Select event by event_Id
	drop proc sp_event_select_by_eventId
	go
	create proc sp_event_select_by_eventId
		@Event_Id int
	as
	begin
		select * from Event where Event_Id = @Event_Id
	end
	go

	execute sp_event_select_by_eventId 1
	go
	select * from Event

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
		@Description text
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
	select * from Event_Price
	go

	--insert EVENT_PRICE
	drop proc sp_event_price_inserting
	go

	create proc sp_event_price_inserting
		@Event_Id int,
		@Price float,
		@Description text,
		@Price_Id int out
	as
	begin
		insert into Event_Price (Event_Id, Price, Description) values (@Event_Id, @Price, @Description)
		set @Price_Id = SCOPE_iDENTITY()
	end