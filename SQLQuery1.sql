create database Airlines
use Airlines

create table flight(f_id int Primary key , f_name nvarchar(20),f_to nvarchar(20),f_from nvarchar(20), seat_no numeric,timing nvarchar(20))
create table customers(c_id int Primary key , c_name nvarchar(20),c_to nvarchar(10), c_from nvarchar(10), c_mail nvarchar(20), f_id int,foreign key (f_id) references flight(f_id))

insert into flight values ( 101, 'SpiceJet', 'Delhi','Mumbai', 14, '11:30' )
insert into flight values ( 102, 'Vistara','kolkata','Goa', 21, '10:45')
insert into flight values ( 103, 'kingfisher', 'Mumbai','Chnadigarh',12,'7:59' )
insert into flight values ( 104, 'AirIndia','Chennai','Delhi',51, '16:00')
insert into flight values ( 105, 'Vistara',  'Lucknow','Mumbai', 4,'18:30')
insert into flight values ( 106, 'Indigo',  'Banglore','Goa', 19,'21:55')
insert into flight values ( 107, 'Vistara',  'Delhi','Kolakata',10, '06:45' )
insert into flight values ( 108, 'SpiceJet','Mumbai','Gujrat', 01, '17:15') 

drop table flight

insert into Customers values ( 201, 'Mansi', 'Mumbai','Gujrat','mansi@gmail.com',108)
insert into Customers values ( 202, 'Shweta','Mumbai','Chnadigarh','shweta@gmail.com',106)
insert into Customers values ( 203, 'Arjit', 'Delhi','Kolakata','arjit@gmail.com',101)
insert into Customers values ( 204, 'Shivam','Delhi','Mumbai','shivam@gmail.com',103)
insert into Customers values ( 205, 'Riya',  'Lucknow','Mumbai','riya@gmail.com',104)
insert into Customers values ( 206, 'Ankita','Chennai','Delhi','ankita@gmail.com',107 )
insert into Customers values ( 207, 'Ram','kolkata','Goa','ram@gmail.com',105)
insert into Customers values ( 208, 'Kanha','Banglore','Goa','kanha@gmail.com',102)
insert into Customers values ( 209, 'Shwet','Mumbai','Chnadigarh','shwet@gmail.com',106)
insert into Customers values ( 210, 'Rita','Chennai','Delhi','rita@gmail.com',107 )



select count(f_id), count(c_name),  count(c_from) ,count(c_to) from customers group  by f_id

--details of customers whose seat no is greater than 10:
select * from flight where seat_no > 10



--name of the flights and id whose destination with G:
select f_id, f_name from flight where f_from like 'G%'


--information about the customer who is going to Mumbai
select c_id, c_name, c_mail from customers where c_to like 'Mumbai'


--details of customers coming from Delhi
select * from customers where c_from like 'Delhi'


--inner join
select c_id ,c_name, f_name from customers as c inner join flight as f 
on
c.c_name = f.f_name

--using left join
select c_id, c_name, c_mail from customers left join flight on customers.c_to = flight.f_to


--using right join 
select f_name, seat_no from flight right join customers on flight.f_from = customers.c_from




create procedure sp_flightlist
as
begin
select c_id, c_name from customers
end 
exec sp_flightlist


create procedure sp_insertflightlist
(
@f_id int , 
@f_name nvarchar(20),
@f_to nvarchar(20),
@f_from nvarchar(20), 
@seat_no numeric,
@timing nvarchar(20)
)
as 
begin
insert into flightlist(f_id, f_name, f_to, f_from, seat_no, timing) values(@f_id, @f_name, @f_to,@f_from,@seat_no,@timing)
end

call sp_flightlist(10,'Vistara','Mumbai','Delhi', 40, '12:35')


