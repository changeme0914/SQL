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
use dbstudy
create table classinfo
(cid int not null primary key identity(1,1),
came nvarchar(10)
)
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




insert into subjectinfo
values
('c语言',1,3),
('数据结构',3,3),
('线性代数',2,4)
select *from subjectinfo

------3.将学生表中班级号大于等于2的学生性别改为1---更新数据
update studentinfo
set sgender=1
where cid>=2

select *from studentinfo
------4.将所有学生的邮箱改为空---更新数据
alter table studentinfo
add semail varchar(50)

update studentinfo
set semail='1234567890@qq.com' where stid=1
update studentinfo
set semail='1122334455@qq.com' where stid=2
update studentinfo
set semail='2233445566@qq.com' where stid=3

update studentinfo
set semail =null
select *from studentinfo

-------6.删除班级为1的学生-----删除数据
delete from studentinfo
where cid=1
select *from studentinfo

--------7. 给学生表插入多条数据
insert into studentinfo
values
(9,'徐斌',1,20,'cs',3,'33@qq.com'),
(23,'需长期',0,23,'cs',4,'44@.com'),
(51,'秃子',1,24,'cs',2,'55@.com')

select *from studentinfo
-------11.查询前10%条数据的姓名和性别
select top 50 percent sname,sgender from studentinfo
------12按照学号降序排序
select top 3*from studentinfo
order by cid asc
------13. 按照班级升序排列,当班级号相同时按照学号降序排列------排序
select * from studentinfo
order by cid asc ,stid desc
------14 显示`所有班级的班级号-------消除重复行
select distinct cid from studentinfo
---select cid from studentinfo
-----
--use dbstudy 
--alter table studentinfo 
--drop column semail