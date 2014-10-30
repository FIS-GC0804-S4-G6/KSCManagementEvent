use KSCManagementEvent
go



insert into Category (CategoryName) values
(N'Seminar'),
(N'Paper Presentation'),
(N'Symposium'),
(N'Techno-Feat')

select * from Event
go


insert into Event_Price(Event_Id, Price, Description) values
('1', '20', null),
('1', '30', null),
('1', '40', null)

select * from Event_Price
go