--1.用脚本创建数据库dbsupply，保存到某个目录下-----建数据库
create database dbsupply
on primary
( name='dbsupply',
filename='D:\SQL\dbsupply.mdf',
size=10mb,
filegrowth=10mb)
log on
(name='dbsupply.log',
filename='D:\SQL\dbsupply_log.ldf',
size=5mb,
filegrowth=10%
)

----2.建立供应商表S（供应商编号，供应商名称，供应商城市），
use dbsupply
create table S
( sno int not null primary key,
  sname nvarchar(20),
  scity nvarchar(20),
)

select * from  S

----3.建立零件表P（零件编号，零件名称，零件颜色，零件重量），
use dbsupply
create table P
( pno int not null primary key,
  pname nvarchar(20),
  pcolor nvarchar(20),
  pweight nvarchar(20),
)
select * from  P
----4.建立项目表J（项目编号，项目名称，项目城市），
use dbsupply
create table J
( jno int not null primary key,
  jname nvarchar(20),
  jcity nvarchar(20),
)
select * from  J

----5.建立供应表SPJ（供应商编号，零件编号，项目编号，几个），
use dbsupply
create table SPJ
( sno int not null,
  pno int not null,
  jno int not null,
  n int not null,
  primary key(sno,jno),
  foreign key (sno) references S(sno),
  foreign key (pno) references P(pno),
  foreign key (jno) references J(jno)
)
select * from  SPJ

----向供应商添加数据
----1.增加若干记录
insert into S
values(1,'上海集团','上海'),
(2,'北京集团','北京'),
(3,'深圳集团','深圳')

----向零件添加数据
insert into P
values (110,'螺丝','black',1),
(119,'轮胎','black',10),
(120,'方向盘','blue',5)

---向项目中添加数据
insert into J
values (0,'拧螺丝','济南'),
(1,'分装','天津'),
(2,'生产','青岛'),
(3,'土木工程','吉林')

insert into SPJ
values (1,110,1,4),
(2,119,2,3),
(3,120,2,1),
(1,110,3,2)

select *from S
select *from P
select *from J
select *from SPJ


----1.查询供应商总和
use dbsupply
select sum(sno) S_sum from S

---2.查询sno为1的供应次数
select count(*) as S_num from S
where sno=1

---3.查询jname的个数
select count(*) as J_num from J

--4.查询最高供应量
select max(n) as n_max from SPJ

---5. 查询sno 为1的最高供应量
select max(n) as one_n_max from SPJ
where sno=1;

---6.输出sname为天_的供应商的平均供应量

select avg(n) as p_cname from SPJ
inner join S on s.sno=SPJ.sno
where S.sname like '天_'

---作业4
---1. 列出每个供应商供应的总数，列出sno、总数

select sno,sum(n) as 总数 from SPJ
group by sno

-----2.列出每个供应商供应每个项目的总数，列出sno，jno 总数

select sno,jno,sum(n) as 总数 from SPJ
group by sno,jno

----3列出每个供应商供应每个零件的总数，列出sname pname， 总数

select sname,pname,sum(n) as 总数 from SPJ
inner join s on s.sno=SPJ.sno
inner join p on p.pno=SPJ.pno
group by sname,pname

----4.将sno和pno 合并 去掉重复值

select sno from S
union
select pno from P

-----5.求sno和jon的交集

select sno from S
intersect
select pno from P

----6.将SPJ的所有信息存到一个表SPJ2中
drop table SPJ2
select * into SPJ2 from SPJ


----7.将表J的表结构存入表J2中 数据不复制
select * into J2 from J
where 1>2

select * from SPJ2
select * from J2
