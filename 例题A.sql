--1.�ýű��������ݿ�dbstu1�����浽ĳ��Ŀ¼��-----�����ݿ�
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


----2.�ýű�����dbstu1�еı� classinfo����ţ����ƣ���--Ҫ���Ŵ�0��ʼ�Զ���1-----����

use dbstu1
create table classinfo
( cid int not null primary key identity(0,1),
  ctitle nvarchar(10)
)
select * from  classinfo 



---3.��classinfo������������5������------�������
---��ʽ1����ָ������
insert into classinfo
values ('�ƿ�181'),('�ƿ�182'),('����181'),('����182'),('�ƿ�183')
select * from classinfo
----��ʽ2��ָ������
insert into classinfo(ctitle)
values ('�ƿ�181'),('�ƿ�182'),('����181'),('����182'),('�ƿ�183')
select * from classinfo


-----4.�ýű�����dbstu1�еı�  studentinfo����ţ��������Ա𣬳������ڣ��绰�����䣬�༶��

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


---5.��studentinfo���в���3������

insert into studentinfo
values (14,'����',1, '2020/2/3','12345678900','22@126.com', 2),
(100,'����',0,'2020/2/3','12345678900','22@126.com', 2),
(109,'����',1,'2020/2/3','12345678900','',1)
select * from studentinfo

---6.����ѧ����3��ɾ����studentinfo3
use dbstu1
create table studentinfo3---����
(sid int  not null primary key ,
sname nvarchar(10),
sgender bit ,
sbirth date,
sphone char (11),
semail varchar (20),
cid  int not null foreign key (cid) references classinfo(cid)
)
select * from studentinfo3
drop table studentinfo3 ----ɾ��


----7. ��ѧ�����������ֶ�address---�޸ı�Ľṹ
use dbstu1  
alter table studentinfo 
add address  nvarchar(100)

select * from studentinfo

----8. ɾ��ѧ�����е��ֶ�address----�޸ı�Ľṹ
use dbstu1 
alter table studentinfo 
drop column address

select * from studentinfo
----9.��ѧ������������ѧʱ��һ��----�޸ı�Ľṹ
alter table studentinfo 
add st_entrance date
select * from studentinfo

---10.��ѧ��������ѧʱ���ַ��θ�Ϊdatetime ----�޸ı�Ľṹ
alter table studentinfo 
alter column st_entrance  datetime
select * from studentinfo

----11.����ѧ��������������ȡֵΨһ��Լ������
drop table studentinfo---ɾ��ԭѧ����
use dbstu1
create table studentinfo---�½�ѧ����
(sid int  not null primary key ,
sname nvarchar(10),
sgender bit ,
sbirth date,
sphone char (11),
semail varchar (20),
cid  int not null foreign key (cid) references classinfo(cid)
)
select * from studentinfo---�鿴��

insert into studentinfo----�������ݣ���֤ѧ������û���ظ��ģ������޷������������ȡΨһ��Լ��
values (1080,'��',1, '2020/2/3','12345678900','22@126.com', 2),
(1040,'��yi',0,'2020/2/3','12345678900','22@126.com', 2),
(1100,'����',1,'2020/2/3','12345678900','dd',1)

select * from studentinfo---�鿴������������

alter table studentinfo -----�޸ı�ṹ
add unique(sname)     -------�������ȡΨһֵ��Լ��

select * from studentinfo




