﻿use KSCManagementEvent
go



insert into Category (CategoryName) values
(N'Seminar'),
(N'Paper Presentation'),
(N'Symposium'),
(N'Techno-Feat')
go
insert into Event(Title, Logo, Description, Speaker, Address, Slogan, StartDate, EndDate, Cate_Id) values
('Moon Soon 2014', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Here, There and Anywhere', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Yellow Submarine', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('She said she said', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Good Day Sunshine', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('And Your Bird Can Sing', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('For No One', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Doctor Robert', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('I Want To Tell You', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Got To Get You Into My Life', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Tomorrow Never Knows', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('The Fool On The Hill', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Flying', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Blue Jay Way', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Your Mother Should Know', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('I Am The Walrus', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Hello Goodbye', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Strawberry Fields Forever', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Penny Lane', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Baby You''re A Rich Man', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('All You Need Is Love', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Sgt.Pepper''s Lonely Hearts Club Band', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('With A Little Help From My Friends', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Lucy In The Sky With Diamonds', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Getting Better', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Fixing A Hole', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('She''s Leaving Home', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Being For The Benefit Of Mr Kite', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Within You Without You', 'lib/img/icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Tea Break With Dilmah', 'lib/img/icon.jpg', 'Comon comon comon comon', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '9 Nov 2014 18:00', '9 Nov 2014 23:00', '1'),
('I Will', 'lib/img/icon.jpg', 'Comon comon comon comon', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '9 Nov 2014 18:00', '15 Nov 2014 06:00', '1'),
('Noise', 'lib/img/icon.jpg', 'Comon comon comon comon', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '19 Dec 2014 18:00', '29 Dec 2014 18:00', '1'),
('Rain', 'lib/img/icon.jpg', 'Comon comon comon comon', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2015 19:30', '19 Dec 2015 18:00', '1'),
('Through Our Love', 'lib/img/people.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '7 Nov 2014 23:00', '1'),
('My Love', 'lib/img/affinity.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Jan 2014 19:30', '7 Feb 2014 23:00', '1'),
('Nhung Ten Toi Trum Pham Ma Tuy', 'lib/img/cinelli.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '5 Jan 2016 19:30', '19 Jan 2016 23:00', '1'),
('Vu Giet Nguoi Tren San Gon', 'lib/img/surly.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '3 Dec 2015 19:30', '24 Jan 2016 23:00', '1'),
('Chang Re Quy', 'lib/img/people.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '7 Jan 2016 19:30', '25 Feb 2016 23:00', '1'),
('Giai Dieu Tinh Yeu', 'lib/img/affinity.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Jan 2000 19:30', '1 Jan 2016 23:00', '1'),
('Silly Love Song', 'lib/img/cinelli.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Jan 2000 19:30', '10 Feb 2016 23:00', '1')
go
insert into Event_Price(Event_Id, Price, Description) values
('1', '20', null),
('1', '30', null),
('1', '40', null),
('40', '20', null),
('40', '30', null),
('40', '40', null)
select * from Event
select * from Event_Price
go
insert into University(Name, Address, Email, Home, Mobile) values
('FPT', '8 Ton That Thuyet', 'fptgc@fpt.edu.vn', '0437610944', '01639668883'),
('Making Up', 'Ner Fpt university', 'Makingup@mku@gmail.com', '047530232', '016442663')
go
insert into Role(Roletype) values
('Guest'),
('Admin'),
('User')

go
insert into Customer(Email, FullName, Password, Gender, DateOfBirth, Address, Mobile, Home, IDCard,
Avatar, Role_Id, Univercode, Active) values
('rengar1404@gmail.com', 'Nguyen Duc Hiep', '12345', '1', '1 Jan 1994', 'Lieu Giai', '016445590', null, null, null, '3', '1', '1'),
('giapnhgc00561@fpt.edu.vn', 'Nguyen Hoang Giap', '12345', '1', '1 Jan 1994', 'Lieu Giai', '0166893456', null, null, null, '3', '1', '1'),
('ducndgc00467@fpt.edu.vn', 'Nguyen Duy Duc', '12345', '1', '1 Jan 1994', 'Lieu Giai', '0166893456', null, null, null, '1', '1', '1'),
('haindgc00605@fpt.edu.vn', 'Nguyen Duc Hai', '12345', '1', '1 Jan 1991', 'Lieu Giai', '0166893456', null, null, null, '3', '1', '1')
go

insert into Payment_Option(Payment_Type) values
('Demand Draft'),
('Cheque'),
('Cash'),
('Active')
go
insert into Cust_Event (Cust_Id, Price_Id, Price, Payment_Id, Event_Id, TicketCode) values
('1', '1', '100', '1', '1', '001'),
('2', '1', '120', '1', '1', '002'),
('3', '1', '120', '2', '1', '003'),
('1', '1', '100', '1', '2', '001'),
('2', '1', '120', '1', '2', '002'),
('3', '1', '120', '2', '2', '003'),
('3', '1', '120', '2', '2', '004'),
('4', '6', '100', '1', '44', '001'),
('1', '6', '100', '1', '44', '002')
go
insert into Event_Picture (Event_Id, PicturePath) values 
(1, 'lib/img/5.jp'),
(1, 'lib/img/6.jp'),
(2, 'lib/img/5.jp')
go

select * from Event_Price
select * from Event
select * from Customer
select * from Event_Picture
go
