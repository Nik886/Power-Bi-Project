create table Employee (id int identity(1,1) primary key,Fname varchar (20),Lname Varchar (20),comapany varchar(20),Age int)

insert into Employee(comapany) values ('Tcs','a','ad')




select * from employee
sp_rename abc ,employee , abc

update Employee
set comapany= 'Tcs'


delete from Employee
where id = 4

select count(*) from Employee
