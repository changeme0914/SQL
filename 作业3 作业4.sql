--1.�ýű��������ݿ�dbsupply�����浽ĳ��Ŀ¼��-----�����ݿ�
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

----2.������Ӧ�̱�S����Ӧ�̱�ţ���Ӧ�����ƣ���Ӧ�̳��У���
use dbsupply
create table S
( sno int not null primary key,
  sname nvarchar(20),
  scity nvarchar(20),
)

select * from  S

----3.���������P�������ţ�������ƣ������ɫ�������������
use dbsupply
create table P
( pno int not null primary key,
  pname nvarchar(20),
  pcolor nvarchar(20),
  pweight nvarchar(20),
)
select * from  P
----4.������Ŀ��J����Ŀ��ţ���Ŀ���ƣ���Ŀ���У���
use dbsupply
create table J
( jno int not null primary key,
  jname nvarchar(20),
  jcity nvarchar(20),
)
select * from  J

----5.������Ӧ��SPJ����Ӧ�̱�ţ������ţ���Ŀ��ţ���������
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

----��Ӧ���������
----1.�������ɼ�¼
insert into S
values(1,'�Ϻ�����','�Ϻ�'),
(2,'��������','����'),
(3,'���ڼ���','����')

----������������
insert into P
values (110,'��˿','black',1),
(119,'��̥','black',10),
(120,'������','blue',5)

---����Ŀ���������
insert into J
values (0,'š��˿','����'),
(1,'��װ','���'),
(2,'����','�ൺ'),
(3,'��ľ����','����')

insert into SPJ
values (1,110,1,4),
(2,119,2,3),
(3,120,2,1),
(1,110,3,2)

select *from S
select *from P
select *from J
select *from SPJ


----1.��ѯ��Ӧ���ܺ�
use dbsupply
select sum(sno) S_sum from S

---2.��ѯsnoΪ1�Ĺ�Ӧ����
select count(*) as S_num from S
where sno=1

---3.��ѯjname�ĸ���
select count(*) as J_num from J

--4.��ѯ��߹�Ӧ��
select max(n) as n_max from SPJ

---5. ��ѯsno Ϊ1����߹�Ӧ��
select max(n) as one_n_max from SPJ
where sno=1;

---6.���snameΪ��_�Ĺ�Ӧ�̵�ƽ����Ӧ��

select avg(n) as p_cname from SPJ
inner join S on s.sno=SPJ.sno
where S.sname like '��_'

---��ҵ4
---1. �г�ÿ����Ӧ�̹�Ӧ���������г�sno������

select sno,sum(n) as ���� from SPJ
group by sno

-----2.�г�ÿ����Ӧ�̹�Ӧÿ����Ŀ���������г�sno��jno ����

select sno,jno,sum(n) as ���� from SPJ
group by sno,jno

----3�г�ÿ����Ӧ�̹�Ӧÿ��������������г�sname pname�� ����

select sname,pname,sum(n) as ���� from SPJ
inner join s on s.sno=SPJ.sno
inner join p on p.pno=SPJ.pno
group by sname,pname

----4.��sno��pno �ϲ� ȥ���ظ�ֵ

select sno from S
union
select pno from P

-----5.��sno��jon�Ľ���

select sno from S
intersect
select pno from P

----6.��SPJ��������Ϣ�浽һ����SPJ2��
drop table SPJ2
select * into SPJ2 from SPJ


----7.����J�ı�ṹ�����J2�� ���ݲ�����
select * into J2 from J
where 1>2

select * from SPJ2
select * from J2
