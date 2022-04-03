----------------------------------------------����-----------------------------------------------

--1.�½����ݿ�dbstudy
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
--------------------------------------------����----------------------------------------------

--2.���༶����ţ�������-------��Ҫ��ѧ����Ϣ����֮ǰ��������Ϊѧ����Ϣ���еİ�ű�����༶��İ�Ŷ�Ӧ
use dbstudy
create table classinfo
(cid int not null primary key identity(1,1),
cname  nvarchar(10)

)
--3.��ѧ����Ϣ��ѧ�ţ��������Ա����䣬ϵ������ţ�-----ѧ��Ϊ����---���Ϊ���
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

--4.���γ̱��κţ�����,���޿κţ�ѧ�֣�---------���޿κ�Ϊ���
use dbstudy
create table subjectinfo
(subid int not null primary key identity(1,1),
subname  nvarchar(10),
pnoid  int,
subcredit int ,
foreign key(pnoid ) references  subjectinfo(subid)
)


--5.��ѡ�α�ѧ�ţ��γ̺ţ�������---------ѧ��+�γ̺�Ϊ������ѧ��Ϊ������γ̺�Ϊ���
use dbstudy
create table sc
(stid int ,
subid int,
grade decimal(4,1),
primary key(stid,subid),------ѧ��+�γ̺�Ϊ����

foreign key( stid) references  studentinfo(stid),-----ѧ��Ϊ���
foreign key(subid ) references  subjectinfo(subid)-----�γ̺�Ϊ���

)
------------------------------------------�������--------------------------------------------
--6.��༶�����������
use  dbstudy
insert into classinfo 
values ('jike'),('wangluo'),('shumei')

insert into classinfo 
values ('jike1'),('wangluo1'),('shumei1')

insert into classinfo 
values ('jike2'),('wangluo2'),('shumei2')
select * from classinfo

--7.��ѧ����Ϣ�����������
use dbstudy
insert into studentinfo 
values 
('����',1,23,'cs',2),
('Ҧ��',0,24,'cs',1 ),
('�����',1,23,'cs',2),
('��ʫʫ',0,24,'cs',1 ),
('¹��',1,23,'cs',2),
('Фս',0,24,'cs',1 ),
('�ܱʳ�',1,23,'cs',2),
('������',0,24,'cs',1 ),
('����ӱ',1,23,'cs',2),
('����',0,24,'cs',1 )
insert into studentinfo 
values (null,1,23,'cs',2)


--8.��γ̱����������
insert into subjectinfo
values 
('c����',1,3),
('���ݽṹ',3,3 ),
('���Դ���',2,4),
('��ѧ����',1,1),
('c++�������',4,2),
('Ӣ��1',2,4 ),
('Ӣ��2',1,5),
('���ݿ�ϵͳ',3,3 ),
('�ߵ���ѧ',1,5),
('����',3,24 )
select * from subjectinfo
--9.��ѡ�α����������

insert into sc
values 
(2,3,90),(2,4,98),(3,4,80),(2,5,90),(2,9,98),(8,9,80),(8,2,70),(9,6,98),(6,4,80),(7,5,90),(6,5,98),(3,9,80),(4,6,70)
select * from sc
-----------------------------------�޸ı�ṹ------------------------------

--10.Ϊѧ����������Ե绰����-------�޸ı�ṹ,����ֶ�
alter table studentinfo
add telphone  varchar(11)
--11.Ϊѧ���������������-------�޸ı�ṹ,����ֶ�
alter table studentinfo
add semail varchar(50)

--12.���绰���븳ֵ-------��������,���绰���븳ֵ
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
--13. �����丳ֵ-------��������
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


----1. ��ѯ������qq���� �绰����15-19��ͷ��ѧ��
select * from studentinfo 
where telphone like '1[5_7_9]%'and semail like '%@qq.com%'---------5 ��7��9

----2.��ѯ����Ϊ�����ֵ�ѧ��
select *from studentinfo
where len(sname)=3;

---3.��ѯѧ�� ���� ���� ���� ��������������
select b.stid ,b.sname,c.subname,a.grade from sc as a
inner join studentinfo  as  b on a.stid=b.stid
inner join  subjectinfo as  c on c.subid=a.subid
order by a.grade desc

----4.��ѯѧ������ ���� ����  �༶���ְ�������������
select b.sname,d.cname ,c.subname,a.grade from sc as a
inner join studentinfo  as  b on a.stid=b.stid
inner join  subjectinfo as c on c.subid=a.subid
inner join  classinfo as d on d.cid=b.cid
order by a.grade desc
