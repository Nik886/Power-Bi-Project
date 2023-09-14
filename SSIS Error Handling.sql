create table test(
id varchar(50),
first_name varchar(50),
last_name varchar(50),
Gender varchar(50),
Company_Name varchar(50))

drop table test
create table Error_log(id int identity,Machinename varchar(200) ,Packagename varchar(200),Taskname varchar(200),
Errorcode int, Errordescription varchar(max), Dated datetime)

select * from test
select * from Error_log

truncate table test
update test
set first_name = ''
where id=1a

insert into Error_log
values ('Machinename','Packagename','Taskname',0,'Errordescription',getdate())