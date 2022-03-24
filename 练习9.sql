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
------------��ѡ�α�ѧ�ţ��γ̱�������----ѧ�źͿγ̺�������
use dbstudy
create table sc
(stid int,
subid int,
grade decimal(4,1),
primary key(stid,subid),-----ѧ�źͿγ̺�Ϊ����
foreign key(stid) references studentinfo(stid),---ѧ��Ϊ����
foreign key(subid) references subjectinfo(subid)---�γ̺�Ϊ����
)
----------�������
--6.��γ̱����������
insert into classinfo
values ('����'),('��ý'),('����')
select * from classinfo
--7.��ѧ����Ϣ�����������
use dbstudy
insert into studentinfo
values
('����',1,23,'cs',2),
('Ҧ��',0,24,'cs',1),
('�����',1,23,'cs',2),
('��ٶ��',0,24,'cs',1),
('����',1,23,'cs',2),
('���',0,24,'cs',1)
insert into studentinfo
values (null,1,23,'cs',2)




insert into subjectinfo
values
('c����',1,3),
('���ݽṹ',3,3),
('���Դ���',2,4)
select *from subjectinfo

------3.��ѧ�����а༶�Ŵ��ڵ���2��ѧ���Ա��Ϊ1---��������
update studentinfo
set sgender=1
where cid>=2

select *from studentinfo
------4.������ѧ���������Ϊ��---��������
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

-------6.ɾ���༶Ϊ1��ѧ��-----ɾ������
delete from studentinfo
where cid=1
select *from studentinfo

--------7. ��ѧ��������������
insert into studentinfo
values
(9,'���',1,20,'cs',3,'33@qq.com'),
(23,'�賤��',0,23,'cs',4,'44@.com'),
(51,'ͺ��',1,24,'cs',2,'55@.com')

select *from studentinfo
-------11.��ѯǰ10%�����ݵ��������Ա�
select top 50 percent sname,sgender from studentinfo
------12����ѧ�Ž�������
select top 3*from studentinfo
order by cid asc
------13. ���հ༶��������,���༶����ͬʱ����ѧ�Ž�������------����
select * from studentinfo
order by cid asc ,stid desc
------14 ��ʾ`���а༶�İ༶��-------�����ظ���
select distinct cid from studentinfo
---select cid from studentinfo
-----
--use dbstudy 
--alter table studentinfo 
--drop column semail