---char (11):�̶����� ������������
---nchar(3):�̶����ȿ���������---
---varchar(11)�ɱ߳�����������
----nvarchar(11) �ɱ߳�����������--�ʼ�  ��ַ

-----drop ---�޸�ʱ ����                                                                                                                                                                                                                                                                                                                                                   
---bit 0.1
---------------------------------����
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
------------------------------------����
-----�����༶����ţ�������
use dbstudy
create table classinfo
(cid int not null primary key identity(1,1),
came nvarchar(10)
)
------����ѧ����Ϣ��ѧ�ţ��������Ա����䣬ϵ�ã���ţ�--ѧ��Ϊ����-���Ϊ����
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
------���γ̱��κţ�������ѡ�޿κţ�ѧ�֣�---ѡ�޿�Ϊ����
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

select *from studentinfo
-------��γ̱����������
insert into subjectinfo
values
('c����',1,3),
('���ݽṹ',3,3),
('���Դ���',2,4)

select *from subjectinfo

