--1.用脚本创建数据库dbstu1，保存到某个目录下-----建数据库
create database dbstu1
on primary
( name='dbstu1',
filename='C:\database1\dbstu1.mdf',
size=10mb,
filegrowth=10mb)
log on
(name='dbstu1.log',
filename='C:\database1\dbstu1_log.ldf',
size=5mb,
filegrowth=10%
)


----2.用脚本创建dbstu1中的表 classinfo（编号，名称），--要求编号从0开始自动加1-----建表

use dbstu1
create table classinfo
( cid int not null primary key identity(0,1),
  ctitle nvarchar(10)
)
select * from  classinfo 



---3.向classinfo表中批量插入5条数据------添加数据
---方式1，不指定列名
insert into classinfo
values ('计科181'),('计科182'),('网络181'),('网络182'),('计科183')
select * from classinfo
----方式2，指定列名
insert into classinfo(ctitle)
values ('计科181'),('计科182'),('网络181'),('网络182'),('计科183')
select * from classinfo


-----4.用脚本创建dbstu1中的表  studentinfo（编号，姓名，性别，出生日期，电话，邮箱，班级）

use dbstu1
create table studentinfo
(sid int  not null primary key ,
sname nvarchar(10),
sgender bit ,
sbirth date,
sphone char (11),
semail varchar (20),
cid  int not null foreign key (cid) references classinfo(cid)
)


---5.向studentinfo表中插入3条数据

insert into studentinfo
values (14,'张三',1, '2020/2/3','12345678900','22@126.com', 2),
(100,'张三',0,'2020/2/3','12345678900','22@126.com', 2),
(109,'张三',1,'2020/2/3','12345678900','',1)
select * from studentinfo

---6.建立学生表3，删除表studentinfo3
use dbstu1
create table studentinfo3---建表
(sid int  not null primary key ,
sname nvarchar(10),
sgender bit ,
sbirth date,
sphone char (11),
semail varchar (20),
cid  int not null foreign key (cid) references classinfo(cid)
)
select * from studentinfo3
drop table studentinfo3 ----删表


----7. 向学生表中增加字段address---修改表的结构
use dbstu1  
alter table studentinfo 
add address  nvarchar(100)

select * from studentinfo

----8. 删除学生表中的字段address----修改表的结构
use dbstu1 
alter table studentinfo 
drop column address

select * from studentinfo
----9.向学生表中增加入学时间一列----修改表的结构
alter table studentinfo 
add st_entrance date
select * from studentinfo

---10.将学生表中入学时间字符段改为datetime ----修改表的结构
alter table studentinfo 
alter column st_entrance  datetime
select * from studentinfo

----11.增加学生表中姓名必须取值唯一的约束条件
drop table studentinfo---删除原学生表
use dbstu1
create table studentinfo---新建学生表
(sid int  not null primary key ,
sname nvarchar(10),
sgender bit ,
sbirth date,
sphone char (11),
semail varchar (20),
cid  int not null foreign key (cid) references classinfo(cid)
)
select * from studentinfo---查看表

insert into studentinfo----插入数据，保证学生名字没有重复的，否则无法添加姓名必须取唯一的约束
values (1080,'张',1, '2020/2/3','12345678900','22@126.com', 2),
(1040,'张yi',0,'2020/2/3','12345678900','22@126.com', 2),
(1100,'张三',1,'2020/2/3','12345678900','dd',1)

select * from studentinfo---查看表中所有数据

alter table studentinfo -----修改表结构
add unique(sname)     -------添加姓名取唯一值的约束

select * from studentinfo




