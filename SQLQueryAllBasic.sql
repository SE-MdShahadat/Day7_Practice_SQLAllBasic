create database SQLpracticeDB
use SQLpracticeDB

--create table
CREATE TABLE student_info(
ID int,
Name varchar(50),
Age int,
PRIMARY KEY(ID)
);

--verify table
SELECT * from student_info;
SELECT ID,Name from student_info;

--drop table
DROP TABLE student_info

--insert value into able
INSERT INTO student_info  VALUES (1,'Shahadat',24)
INSERT INTO student_info  VALUES (2,'Basar',20)
INSERT INTO student_info  VALUES (3,'Sagar',25)
INSERT INTO student_info  VALUES (4,'Shifat',21)
INSERT INTO student_info(ID,Name)  VALUES (5,'Jui')

--where clause
SELECT Name from student_info where Age>22

--update data
UPDATE student_info set Age=20 where ID=5

--delete row
DELETE from student_info where Name='Jui'


