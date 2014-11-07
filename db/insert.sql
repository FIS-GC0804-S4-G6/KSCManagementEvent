use KSCManagementEvent
go



insert into Category (CategoryName) values
(N'Seminar'),
(N'Paper Presentation'),
(N'Symposium'),
(N'Techno-Feat')

insert into Event(Title, Logo, Description, Speaker, Address, Slogan, StartDate, EndDate, Cate_Id) values
('Moon Soon 2014', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Here, There and Anywhere', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Yellow Submarine', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('She said she said', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Good Day Sunshine', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('And Your Bird Can Sing', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('For No One', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Doctor Robert', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('I Want To Tell You', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Got To Get You Into My Life', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Tomorrow Never Knows', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('The Fool On The Hill', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Flying', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Blue Jay Way', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Your Mother Should Know', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('I Am The Walrus', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Hello Goodbye', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Strawberry Fields Forever', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Penny Lane', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Baby You''re A Rich Man', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('All You Need Is Love', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Sgt.Pepper''s Lonely Hearts Club Band', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('With A Little Help From My Friends', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Lucy In The Sky With Diamonds', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Getting Better', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Fixing A Hole', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('She''s Leaving Home', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Being For The Benefit Of Mr Kite', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Within You Without You', null, 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1')

insert into Event_Price(Event_Id, Price, Description) values
('1', '20', null),
('1', '30', null),
('1', '40', null)

select * from Event_Price
select * from Event
go