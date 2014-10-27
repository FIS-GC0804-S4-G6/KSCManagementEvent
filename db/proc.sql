use KSCManagementEvent


-- =============================================================== --
-- ============================ EVENT ============================ --
-- =============================================================== --
	create procedure sp_event_creating
		@Title text,
		@Logo text,
		@Description text,
		@Speaker text,
		@Address text,
		@Slogan text,
		@StartDate datetime,
		@EndDate datetime
	AS
	BEGIN
		INSERT INTO [Event](Title, Logo, Description, Speaker, Address, Slogan, StartDate, EndDate)
		VALUES (@Title, @Logo, @Description, @Speaker, @Address, @Slogan, @StartDate, @EndDate);
	END
go

execute sp_event_creating @Title = 'Magical',
@Logo = 'Walrus.png',
@Description = 'super fun',
@Speaker = 'Mr.Walrus',
@Address = 'Sea',
@Slogan = 'You''re gonna lose that girl',
@StartDate = '2014-09-01 09:11',
@EndDate = '2014-09-01 09:23'

select * from Event