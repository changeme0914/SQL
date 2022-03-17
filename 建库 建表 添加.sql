---char (11):固定长度 不可以有中文
---nchar(3):固定长度可以有中文---
---varchar(11)可边长不可有中文
----nvarchar(11) 可边长可以有中文--邮件  地址

-----drop ---修改时 可用                                                                                                                                                                                                                                                                                                                                                   
---bit 0.1
---------------------------------建库
create database dbstudy
on primary
(name='dbstudy',
filename='E:\SQL\dbstudy.mdf',
size=10mb,
filegrowth=10mb
)
log on
(
name='dbstudy.log',
filename='E:\SQL\dbstudy_log.ldf',
size=5mb,
filegrowth=10%
)
------------------------------------建表
-----建立班级表（班号，班名）
use dbstudy
create table classinfo
(cid int not null primary key identity(1,1),
came nvarchar(10)
)
------建立学生信息表（学号，姓名，性别，年龄，系好，班号）--学号为主码-班号为外码
use dbstudy
create table studentinfo
(stid int not null primary key identity(1,1),
sname nvarchar(10),
sgender bit,
sage int,
sdept nvarchar(10),
cid int,
foreign key(cid) references classinfo(cid)
)
------建课程表（课号，课名，选修课号，学分）---选修课为外码
use dbstudy 
create table subjectinfo
(subid int not null primary key identity(1,1),
subname nvarchar(10),
pnoid int,
subcredit int,
foreign key(pnoid) references subjectinfo(subid)
)
------------建选课表（学号，课程表，分数）----学号和课程号是主码
use dbstudy
create table sc
(stid int,
subid int,
grade decimal(4,1),
primary key(stid,subid),-----学号和课程号为主码
foreign key(stid) references studentinfo(stid),---学号为外码
foreign key(subid) references subjectinfo(subid)---课程号为外码
)
----------添加数据
--6.向课程表中添加数据
insert into classinfo
values ('计数'),('数媒'),('网络')
select * from classinfo
--7.向学生信息表中添加数据
use dbstudy
insert into studentinfo
values
('黄磊',1,23,'cs',2),
('姚明',0,24,'cs',1),
('李冰冰',1,23,'cs',2),
('朱俣铖',0,24,'cs',1),
('方乐',1,23,'cs',2),
('徐斌',0,24,'cs',1)
insert into studentinfo
values (null,1,23,'cs',2)

select *from studentinfo
-------向课程表中添加数据
insert into subjectinfo
values
('c语言',1,3),
('数据结构',3,3),
('线性代数',2,4)

select *from subjectinfo

