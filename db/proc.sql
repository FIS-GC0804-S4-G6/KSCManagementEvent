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
		@Cate_Id int
	AS
	BEGIN
		INSERT INTO [Event](Title, Logo, Description, Speaker, Address, Slogan, StartDate, EndDate, Cate_Id)
		VALUES (@Title, @Logo, @Description, @Speaker, @Address, @Slogan, @StartDate, @EndDate, @Cate_Id);
	END

	execute sp_event_creating
		@Title = 'Magical',
		@Logo = 'Walrus.png',
		@Description = 'super fun',
		@Speaker = 'Mr.Walrus',
		@Address = 'Sea',
		@Slogan = 'You''re gonna lose that girl',
		@StartDate = '2014-09-01 09:11',
		@EndDate = '2014-09-01 09:23',
		@Cate_Id = '1'
	go

