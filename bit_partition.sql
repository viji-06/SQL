create database bit_partition;
use bit_partition;

create table bit_course(
course_name varchar(50),
course_id int,
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
couse_fee int,
course_mentor varchar(60),
course_lauch_year int);
drop table bit_course;
select * from bit_course;
insert into bit_course values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ;

select * from bit_course;


select * ,
case
when course_lauch_year='2019' then 'course launch 2019'
when course_lauch_year='2020' then 'course launch 2020'
when course_lauch_year='2021' then 'course launch 2021'
else "there is no course selected"
end as statement
from bit_course;

update bit_course
set course_name= case
when course_name='java' then 'machine learning'
else
course_name
end;

update bit_course
set course_mentor=case
when course_mentor="jalpa" then 'Vijayalakshmi'
else
course_mentor
end;
select * from bit_course;


create table bit_courses1(
course_name varchar(50),
course_id int,
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
couse_fee int,
course_mentor varchar(60),
course_lauch_year int)

partition by range(course_lauch_year)
(partition p0 values less than (2019),
partition  p1 values less than (2020),
partition  p2 values less than (2021),
partition  p3 values less than (2022),
partition  p4 values less than (2023));
select * from bit_courses1;
drop table bit_courses1;
insert into bit_courses1 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ;
select * from bit_courses1 where course_lauch_year=2020;
/*select * from bit_course where course_lauch_year=2020*/

select partition_name,table_name,table_rows 
from information_schema.partitions 
where table_name='bit_courses1';

select * from bit_courses1 partition(p0,p1,p2,p3,p4);
select * from bit_courses1 partition(p4);

create table bit_courses2(
course_name varchar(50),
course_id int,
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
couse_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 5;

insert into bit_courses2 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ;

select partition_name,table_name,table_rows from 
information_schema.partitions where table_name ='bit_courses2';

select * from bit_courses2 partition(p2);

create table bit_courses33(
course_name varchar(50),
course_id int,
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
couse_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 10;


insert into bit_courses33 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ;

select partition_name,table_name,table_rows from 
information_schema.partitions where table_name ='bit_courses33';



create table if not exists bit_courses4(
course_name varchar(50),
course_id int primary key,
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
couse_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by key()
partitions 10;

select partition_name,table_name,table_rows from 
information_schema.partitions where table_name ='bit_courses4';

insert into bit_courses4 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ;

create table if not exists bit_courses6711(
course_name varchar(50),
course_id int,
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
couse_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list(course_launch_year)(
partition p0 values in (2019,2020),
partition p1 values in (2022,2021));

insert into bit_courses6711 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ;

select partition_name,table_name,table_rows from 
information_schema.partitions where table_name ='bit_courses6711';

create table if not exists bit_courses89001(
course_name varchar(50),
course_id int,
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
couse_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range columns(course_name,course_launch_year)
(
partition p0 values less than ('aiops',2019),
partition p1 values less than ('fsds',2021),
partition p2 values less than ('MERN',2022)
);
select partition_name,table_name,table_rows from 
information_schema.partitions where table_name ='bit_courses89001';

insert ignore into bit_courses89001 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ;

create table  bit_courses10(
course_name varchar(50),
course_id int,
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
couse_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range columns(course_launch_year)
subpartition by hash(course_launch_year)
subpartitions 5
(
partition p0 values less than (2019),
partition p1 values less than (2020),
partition p2 values less than (2021),
partition p3 values less than (2022)
);

select partition_name,table_name,table_rows from 
information_schema.partitions where table_name ='bit_courses10';

insert into bit_courses10 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ;

select *,

case
when length(course_name)=4 then 'len 4'
when length(course_name)=2 then 'len 2'
else 'other legth'
end as statement2
from bit_course;