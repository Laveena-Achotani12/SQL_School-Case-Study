/**************************************************************************************************
Name   : Code for School_ DB
Author : Laveena Achotani
Date   :  15 feb 2024

Purpose - Script will create db and tables in it
*****************************************************************************************************/

Use master
go

create database School_
go

--Schema of School_
sp_helpdb School_

--Change the context 
use School_
go

--CourseMaster
create table CourseMaster
(
	CID			Int				Primary Key,
	CourseName	Varchar(40)		Not null,
	Category	Char(1)			Null check (Category= 'B' or Category='M' or Category= 'A'),
	Fee			Smallmoney		Not Null check (Fee>0)
	)
go

--Schema of db
sp_helpdb School_

--Schema of table
sp_help c

--Read the table data
Select * from CourseMaster

--insert data
insert into CourseMaster values( 10, 'Java', 'B', 5000)
insert into CourseMaster values( 20, 'Adv Java', 'A', 1000)
insert into CourseMaster values( 30, 'Bigdata', 'A', 50000)
insert into CourseMaster values( 40, 'SQL Server', 'M', 6000)
insert into CourseMaster values( 50, 'Python', 'M', 60000)
insert into CourseMaster values( 60, 'C+', 'B', 6000)
insert into CourseMaster values( 70, 'C++', 'A', 6000)
insert into CourseMaster values( 80, 'Data Science', 'A', 6000)
go

--StudentMaster
create table StudentMaster
(
STD		Tinyint			Primary Key,
Name	Varchar(40)		Not null,
Origin	Char(1)			Not Null check (Origin='L' or Origin='F'),
Type	Char(1)			Not Null check (Type='G' or Type='U')
)
go

--Read the table data
select * from StudentMaster

--insert data
insert into StudentMaster values (1,'Laveena', 'F', 'G')
insert into StudentMaster values (2,'Yash', 'L', 'U')
insert into StudentMaster values (3,'Tejal', 'F', 'G')
insert into StudentMaster values (4,'Mala', 'L', 'G')
insert into StudentMaster values (5,'Bhagwna', 'L', 'U')

insert into StudentMaster values (1,'Laveena', 'F', 'G')

--EnrollmentMaster
create table EnrollmentMaster
(
	CID		Int			Not Null Foreign Key references CourseMaster(CID),
	STD		Tinyint		Not Null Foreign Key references StudentMaster(STD),
	DOE		Datetime	Not Null,
	FWF		Bit			Not Null,
	Grade	Char(1)		Null check (Grade='O' or Grade='A' or Grade='B' or Grade='C')
)
go

--Read the table data
select * from EnrollmentMaster

--insert data
insert into EnrollmentMaster values (40,1,'2021/01/14',0, 'O')
insert into EnrollmentMaster values (70,2,'2021/01/26',1, 'A')
insert into EnrollmentMaster values (20,5,'2020/05/18',0, 'B')
insert into EnrollmentMaster values (30,3,'2021/01/24',1, 'A')
insert into EnrollmentMaster values (70,5,'2022/01/04',1, 'C')
insert into EnrollmentMaster values (50,4,'2021/03/14',0, 'O')

