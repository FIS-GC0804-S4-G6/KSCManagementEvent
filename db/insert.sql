use KSCManagementEvent
go



insert into Category (CategoryName) values
(N'Seminar'),
(N'Paper Presentation'),
(N'Symposium'),
(N'Techno-Feat')
go

insert into Event(Title, Logo, Description, Speaker, Address, Slogan, StartDate, EndDate, Cate_Id) values
('Moon Soon 2014', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Here, There and Anywhere', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Yellow Submarine', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('She said she said', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Good Day Sunshine', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('And Your Bird Can Sing', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('For No One', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Doctor Robert', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('I Want To Tell You', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Got To Get You Into My Life', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Tomorrow Never Knows', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('The Fool On The Hill', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Flying', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Blue Jay Way', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Your Mother Should Know', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('I Am The Walrus', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Hello Goodbye', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Strawberry Fields Forever', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Penny Lane', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Baby You''re A Rich Man', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('All You Need Is Love', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Sgt.Pepper''s Lonely Hearts Club Band', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('With A Little Help From My Friends', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Lucy In The Sky With Diamonds', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Getting Better', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Fixing A Hole', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('She''s Leaving Home', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Being For The Benefit Of Mr Kite', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Within You Without You', 'icon.jpg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '1 Oct 2014 23:00', '1'),
('Tea Break With Dilmah', 'icon.jpg', 'Comon comon comon comon', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '9 Nov 2014 18:00', '9 Nov 2014 23:00', '1'),
('I Will', 'icon.jpg', 'Comon comon comon comon', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '9 Nov 2014 18:00', '15 Nov 2014 06:00', '1'),
('Noise', 'icon.jpg', 'Comon comon comon comon', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '19 Dec 2014 18:00', '29 Dec 2014 18:00', '1'),
('Rain', 'icon.jpg', 'Comon comon comon comon', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2015 19:30', '19 Dec 2015 18:00', '1'),
('Through Our Love', 'people.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Oct 2014 19:30', '7 Nov 2014 23:00', '1'),
('My Love', 'affinity.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Jan 2014 19:30', '7 Feb 2014 23:00', '1'),
('Nhung Ten Toi Trum Pham Ma Tuy', 'cinelli.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '5 Jan 2016 19:30', '19 Jan 2016 23:00', '1'),
('Vu Giet Nguoi Tren San Gon', 'surly.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '3 Dec 2015 19:30', '24 Jan 2016 23:00', '1'),
('Chang Re Quy', 'people.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '7 Jan 2016 19:30', '25 Feb 2016 23:00', '1'),
('Giai Dieu Tinh Yeu', 'affinity.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Jan 2000 19:30', '1 Jan 2016 23:00', '1'),
('Silly Love Song', 'cinelli.jpeg', 'Buổi hòa nhạc gần như im lặng', 'Steve', 'Hoang Thanh', 'Cang dong cang vui', '1 Jan 2000 19:30', '10 Feb 2016 23:00', '1')
go

insert into Event_Price(Event_Id, Price, Description) values
('1', '20', null),
('1', '30', null),
('1', '40', null),
('40', '20', null),
('40', '30', null),
('40', '40', null)
go

insert into University(Name, Address, Email, Home, Mobile) values
('FPT', '8 Ton That Thuyet', 'fptgc@fpt.edu.vn', '0437610944', '01639668883'),
('Making Up', 'Ner Fpt university', 'Makingup@mku@gmail.com', '047530232', '016442663')
go

insert into Role(Roletype) values
('Customer'),
('Subadmin')
go

insert into Customer(Email, FullName, Password, Gender, DateOfBirth, Address, Mobile, Home, IDCard,
Avatar, Role_Id, Univercode, Active) values
('haindgc00605@fpt.edu.vn', 'Nguyen Duc Hai', '12345', '1', '1 Jan 1991', 'Lieu Giai', '0166893456', null, null, null, '3', '1', '1')go

insert into Payment_Option(Payment_Type) values
('Demand Draft'),
('Cheque'),
('Cash'),
('Cash/No Pay')
go
insert into Cust_Event (Cust_Id, Price_Id, Price, Payment_Id, Event_Id, TicketCode) values
('1', '1', '100', '1', '1', '001'),
('2', '1', '120', '1', '1', '002'),
('3', '1', '120', '2', '1', '003'),
('1', '1', '100', '1', '2', '001'),
('2', '1', '120', '1', '2', '002'),
('3', '1', '120', '2', '2', '003'),
('3', '1', '120', '2', '2', '004'),
('4', '6', '100', '1', '3', '001'),
('1', '6', '100', '1', '3', '002')
go

insert into Event_Picture (Event_Id, PicturePath) values 
(1, '5.jp'),
(1, '6.jp'),
(2, '5.jp')
go