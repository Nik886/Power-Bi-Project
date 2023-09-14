CREATE TABLE Employee (
EmpID int NOT NULL,
EmpName Varchar(10),
Gender Char,
Salary int,
City Char(20) )
--- first run the above code then below code
INSERT INTO Employee
VALUES (1, 'Arjun', 'M', 75000, 'Pune'),
(2, 'Ekadanta', 'M', 125000, 'Bangalore'),
(3, 'Lalita', 'F', 150000 , 'Mathura'),
(4, 'Madhav', 'M', 250000 , 'Delhi'),
(5, 'Visakha', 'F', 120000 , 'Mathura')

drop table EmployeeDetail

CREATE TABLE EmployeeDetail (
EmpID int NOT NULL,
Project Varchar(10),
EmpPosition Char(20),
DOJ date)

--- first run the above code then below code
INSERT INTO EmployeeDetail
VALUES (1, 'P1', 'Executive', '2019-01-26'),
(2, 'P2', 'Executive', '2020-05-04'),
(3, 'P1', 'Lead', '2021-10-21'),
(4, 'P3', 'Manager', '2019-11-29'),
(5, 'P2', 'Manager', '2020-08-01')
 
drop table emp    --it completly remove table
delete emp        --it delete table all data but table name exits

select * from Employee

select empname,salary from Employee where 
Salary > 200000 and  salary< 300000

select empname,salary from Employee where Salary between 200000 and 300000

select e1.empname,e2.city from Employee e1 , Employee e2
where e1.city=e2.city and e1.EmpName!= e2.EmpName


select e1.empname ,e1.salary from Employee e1 inner join Employee e2
on e1.City = e2.City where e1.EmpName!=e2.EmpName


select * from Employee
where empid is null

select Empid,empname,salary, sum(salary) over (order by empid )as cumulative_salary from Employee

select count(*) from Employee where Gender = 'M'

select * from Employee 
where EmpID <= (select count(*)/2 from Employee)

select empname ,salary,left(salary,len(salary)-2)+'XX' from Employee

select * from employee
where EmpID%2 = 0


select * from 
  ( select * , row_number() over (order by empid) as rownumber from employee) as emp
where emp.rownumber % 2 =1  -- for odd 1 and even use 0

select * from Employee 
where empname like 'A%'

select * from Employee
where EmpName like 

select * from Employee

select * from Employee
where city = 'Mathura'

select * from Employee where  empid <= (select count(*)/2 from Employee)

select distinct EmpName  from Employee 
where EmpName like '[a,e,i,o,u]%'

select distinct empname from Employee
where EmpName like '%[a,e,i,o,u]'

select distinct empname from Employee
where empname like '[aeiou]%[aeiou]'

select * from Employee where salary =(select max(salary) from Employee)

select EmpID,EmpName,Gender,Salary,City ,count(*) as DC from Employee
group by EmpID,EmpName,Gender,Salary,City
having COUNT(*) > 1

delete  from employee where empid in 
(select empid from Employee
group by EmpID
having COUNT(*)>1)



select e1.empid ,e1.Project from EmployeeDetail e1 inner join EmployeeDetail e2
on e1.Project = e2.Project where e1.EmpID!= e2.EmpID


select * from EmployeeDetail
select * from Employee

Ekadanta	Visakha	P2
Arjun	Lalita	P1]

2	Ekadanta	P2
3	Lalita	P1
5	Visakha	P2
1	Arjun	P1


WITH CTE AS
(SELECT e.EmpID, e.EmpName, ed.Project
FROM Employee AS e
INNER JOIN EmployeeDetail AS ed
ON e.EmpID = ed.EmpID)
SELECT c1.EmpName, c2.EmpName, c1.project
FROM CTE c1, CTE c2
WHERE c1.Project = c2.Project AND c1.EmpID != c2.EmpID AND c1.EmpID < c2.EmpID



select * from Employee
where city = 'Mathura'

select e1.empname , e1.city from Employee e1 inner join Employee e2
 on e1.City = e2.City where e1.EmpName != e2.EmpName


 select aa.id,aa.name_,aa.project from((
 select e1.empid id ,e1.empname name_,e2.project  project from Employee e1 inner join EmployeeDetail e2
 on e1.EmpID = e2.EmpID )as aa  inner join (select e1.empid id ,e1.empname name_,e2.project  project from Employee e1 inner join EmployeeDetail e2
 on e1.EmpID = e2.EmpID)as bb
 on aa.project = bb.project )where aa.id != bb.id




 select * from 


 EmployeeDetail e1 join EmployeeDetail e2
 on e1.project=e2.project
 select * from Employee

 select * from Employee
 select * from EmployeeDetail


 select  max(salary) from Employee 
 where salary != (select max(salary) from Employee)

 with cte as(
 select empid,empname,gender,salary,city from Employee e1
 where 4 = (select COUNT(distinct salary) 
 from Employee e2 where e2.Salary > e1.Salary)
 ),
 cte1 as (
 select EmpPosition from EmployeeDetail)

 select a.empid ,a.empname ,b.EmpPosition from  cte a, cte1 b



  select * from Employee where Gender = 'f'

  create view abc as
  select * from Employee where Gender = 'f' 

  select * from abc


  update abc
  set Salary = 50000
  where Empid = 3


  -- you can create read only view to stop user to edit view

    select * from Employee
	union
	select * from Employee

	select empname ,timestamp from Employee

with abb as(
	 select empname,empid,gender ,
	 ROW_NUMBER() over (partition by empid,empname,gender order by empid) as rnum from Employee
	)

delete from abb 
where rnum>1

select * from abb


select * from Employee where salary not in (select max(salary) from Employee)


select e1.empid,e1.empname,e1.salary from Employee e1
where 2= (select count(distinct e2.salary) from Employee e2 
 where e2.Salary > e1.Salary)

 select empname,empid,salary,sum(salary) over (order by empid)  as c from Employee 

 with abb as(
	 select empname,empid,gender ,
	 ROW_NUMBER() over (partition by empname order by empid) as rnum from Employee
	)

--delete from abb 
--where rnum>1

select * from abb


create table main 
(id int,
salary int)

insert into main values(1,500000),(2,600000)
select * from main

create table back_up 
(id int,
salary int)


create  trigger t1
on main 
before DELETE
begin 
insert into back_up values(:old.id,:old.salary);
end;



-- Assuming "main" and "back_up" are tables in your SQL Server database
-- Create a trigger that inserts deleted rows into the "back_up" table
CREATE  TRIGGER t1
ON main
AFTER DELETE
AS 
BEGIN
    -- Insert deleted rows into the "back_up" table
    INSERT INTO back_up (id, salary)
    SELECT deleted.id, deleted.salary
    FROM deleted;
END;


select * into copytable from Employee

select * from copytable

