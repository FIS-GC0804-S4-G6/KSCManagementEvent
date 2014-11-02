use KSCManagementEvent
go



insert into Category (CategoryName) values
(N'Seminar'),
(N'Paper Presentation'),
(N'Symposium'),
(N'Techno-Feat')

insert into Event(Title, Logo, Description, Speaker, Address, Slogan, StartDate, EndDate, Cate_Id) values
('Moon Soon 2014', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1')

insert into Event_Price(Event_Id, Price, Description) values
('1', '20', null),
('1', '30', null),
('1', '40', null)

select * from Event_Price
select * from Event
go