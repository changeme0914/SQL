----------------------------------------------建库-----------------------------------------------

--1.新建数据库dbstudy
create database dbstudy
on primary
(name='dbstudy100',
filename='D:\SQL\dbstudy100.mdf',--
size=10mb,
filegrowth=10mb
)
log on
(name='dbstudy100.log',
filename='D:\SQL\dbstudy100_log.ldf',
size=5mb,
filegrowth=10%
)
--------------------------------------------建表----------------------------------------------

--2.建班级表（班号，班名）-------需要在学生信息表建立之前建立，因为学生信息表中的班号必须与班级表的班号对应
use dbstudy
create table classinfo
(cid int not null primary key identity(1,1),
cname  nvarchar(10)

)
--3.建学生信息表（学号，姓名，性别，年龄，系名，班号）-----学号为主键---班号为外键
use dbstudy
create table studentinfo
(stid int not null primary key identity(1,1),
sname  nvarchar(10),
sgender bit,
sage int,
sdept nvarchar(10),
cid int ,
foreign key(cid) references classinfo (cid)
)

--4.建课程表（课号，课名,先修课号，学分）---------先修课号为外键
use dbstudy
create table subjectinfo
(subid int not null primary key identity(1,1),
subname  nvarchar(10),
pnoid  int,
subcredit int ,
foreign key(pnoid ) references  subjectinfo(subid)
)


--5.建选课表（学号，课程号，分数）---------学号+课程号为主键，学号为外键，课程号为外键
use dbstudy
create table sc
(stid int ,
subid int,
grade decimal(4,1),
primary key(stid,subid),------学号+课程号为主键

foreign key( stid) references  studentinfo(stid),-----学号为外键
foreign key(subid ) references  subjectinfo(subid)-----课程号为外键

)
------------------------------------------填加数据--------------------------------------------
--6.向班级表中添加数据
use  dbstudy
insert into classinfo 
values ('jike'),('wangluo'),('shumei')

insert into classinfo 
values ('jike1'),('wangluo1'),('shumei1')

insert into classinfo 
values ('jike2'),('wangluo2'),('shumei2')
select * from classinfo

--7.向学生信息表中添加数据
use dbstudy
insert into studentinfo 
values 
('黄磊',1,23,'cs',2),
('姚明',0,24,'cs',1 ),
('李冰冰',1,23,'cs',2),
('刘诗诗',0,24,'cs',1 ),
('鹿晗',1,23,'cs',2),
('肖战',0,24,'cs',1 ),
('周笔畅',1,23,'cs',2),
('王俊凯',0,24,'cs',1 ),
('赵丽颖',1,23,'cs',2),
('唐嫣',0,24,'cs',1 )
insert into studentinfo 
values (null,1,23,'cs',2)


--8.向课程表中添加数据
insert into subjectinfo
values 
('c语言',1,3),
('数据结构',3,3 ),
('线性代数',2,4),
('大学物理',1,1),
('c++程序设计',4,2),
('英语1',2,4 ),
('英语2',1,5),
('数据库系统',3,3 ),
('高等数学',1,5),
('网络',3,24 )
select * from subjectinfo
--9.向选课表中添加数据

insert into sc
values 
(2,3,90),(2,4,98),(3,4,80),(2,5,90),(2,9,98),(8,9,80),(8,2,70),(9,6,98),(6,4,80),(7,5,90),(6,5,98),(3,9,80),(4,6,70)
select * from sc
-----------------------------------修改表结构------------------------------

--10.为学生表添加属性电话号码-------修改表结构,添加字段
alter table studentinfo
add telphone  varchar(11)
--11.为学生表添加属性邮箱-------修改表结构,添加字段
alter table studentinfo
add semail varchar(50)

--12.给电话号码赋值-------更新数据,给电话号码赋值
update studentinfo 
set telphone='14112345678' where stid=7
update studentinfo 
set telphone='15112345678' where stid=8
update studentinfo 
set telphone='16112345678' where stid=9
update studentinfo 
set telphone='17112345678' where stid=10
update studentinfo 
set telphone='19112345678' where stid=11
update studentinfo 
set telphone='16112345678' where stid=12
update studentinfo 
set telphone='13112345678' where stid=13
select * from studentinfo
--13. 给邮箱赋值-------更新数据
update studentinfo 
set semail='14112345678@qq.com' where stid=7
update studentinfo 
set semail='15112345678@126.com' where stid=8
update studentinfo 
set semail='16112345678@126.com' where stid=9
update studentinfo 
set semail='17112345678@qq.com' where stid=10
update studentinfo 
set semail='19112345678@qqq.com' where stid=11
update studentinfo 
set semail='16112345678@163.com' where stid=12
update studentinfo 
set semail='13112345678@2qq.com' where stid=13


----1. 查询邮箱是qq邮箱 电话是以15-19开头的学生
select * from studentinfo 
where telphone like '1[5_7_9]%'and semail like '%@qq.com%'---------5 或7或9

----2.查询名字为三个字的学生
select *from studentinfo
where len(sname)=3;

---3.查询学号 姓名 课名 分数 按分数降序排序
select b.stid ,b.sname,c.subname,a.grade from sc as a
inner join studentinfo  as  b on a.stid=b.stid
inner join  subjectinfo as  c on c.subid=a.subid
order by a.grade desc

----4.查询学生姓名 课名 分数  班级名字按分数降序排序
select b.sname,d.cname ,c.subname,a.grade from sc as a
inner join studentinfo  as  b on a.stid=b.stid
inner join  subjectinfo as c on c.subid=a.subid
inner join  classinfo as d on d.cid=b.cid
order by a.grade desc
