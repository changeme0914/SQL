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
insert into S
values(1,'上海集团','上海'),
(2,'北京集团','北京'),
(3,'深圳集团','深圳')

----向零件添加数据
insert into P
values (110,'螺丝','black',1),
(119,'轮胎','black',10),
(120,'方向盘','blue',5)

select *from S
select *from P

---向项目中添加数据
insert into J
values (0,'拧螺丝','济南'),
(1,'分装','天津'),
(2,'生产','青岛'),
(3,'土木工程','吉林')

select *from J

insert into SPJ
values (1,110,1,4),
(2,119,2,3),
(3,120,2,1),
(1,110,3,2)

select *from SPJ

----2.模糊查询
----2.查询供应商名字中有 北字的信息

select *from S
where sname like '%北%'
----3.查询项目名中第一个字为土的信息

select *from J
where jname like '土%'
---4.查询以1或者3开头的供应商

select *from SPJ
where sno like '[1_3]%'
--5.查询零件颜色有红字的零件信息

select *from P
where pcolor like '%black%'
-----连接查询

---6.查询供应商号 名 城市 及供应数量
select a.*,d.n from S as a
inner join SPJ as d on a.sno=d.sno

---7.查询供应商名 零件名 项目名 供应商数量
select b.sname,c.pname,d.jname,a.n from SPJ as a
inner join S as b on a.sno=b.snoinner join P as c on a.pno=c.pnoinner join J as d on a.sno=d.jno

---8.查询供应数量大于2的供应商名 零件名 项目名
select b.sname,c.pname,d.jname,a.n from SPJ as a
inner join S as b on a.sno=b.snoinner join P as c on a.pno=c.pnoinner join J as d on a.sno=d.jnowhere a.n>2----9.查询供应商名 零件名 零件颜色 项目名 供应商数量 按供应数量排序select b.sname,c.pname,c.pcolor,d.jno,a.n from SPJ as a
inner join S as b on a.sno=b.snoinner join P as c on a.pno=c.pnoinner join J as d on a.sno=d.jnoorder by n asc,jno desc













