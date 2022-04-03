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
insert into S
values(1,'�Ϻ�����','�Ϻ�'),
(2,'��������','����'),
(3,'���ڼ���','����')

----������������
insert into P
values (110,'��˿','black',1),
(119,'��̥','black',10),
(120,'������','blue',5)

select *from S
select *from P

---����Ŀ���������
insert into J
values (0,'š��˿','����'),
(1,'��װ','���'),
(2,'����','�ൺ'),
(3,'��ľ����','����')

select *from J

insert into SPJ
values (1,110,1,4),
(2,119,2,3),
(3,120,2,1),
(1,110,3,2)

select *from SPJ

----2.ģ����ѯ
----2.��ѯ��Ӧ���������� ���ֵ���Ϣ

select *from S
where sname like '%��%'
----3.��ѯ��Ŀ���е�һ����Ϊ������Ϣ

select *from J
where jname like '��%'
---4.��ѯ��1����3��ͷ�Ĺ�Ӧ��

select *from SPJ
where sno like '[1_3]%'
--5.��ѯ�����ɫ�к��ֵ������Ϣ

select *from P
where pcolor like '%black%'
-----���Ӳ�ѯ

---6.��ѯ��Ӧ�̺� �� ���� ����Ӧ����
select a.*,d.n from S as a
inner join SPJ as d on a.sno=d.sno

---7.��ѯ��Ӧ���� ����� ��Ŀ�� ��Ӧ������
select b.sname,c.pname,d.jname,a.n from SPJ as a
inner join S as b on a.sno=b.snoinner join P as c on a.pno=c.pnoinner join J as d on a.sno=d.jno

---8.��ѯ��Ӧ��������2�Ĺ�Ӧ���� ����� ��Ŀ��
select b.sname,c.pname,d.jname,a.n from SPJ as a
inner join S as b on a.sno=b.snoinner join P as c on a.pno=c.pnoinner join J as d on a.sno=d.jnowhere a.n>2----9.��ѯ��Ӧ���� ����� �����ɫ ��Ŀ�� ��Ӧ������ ����Ӧ��������select b.sname,c.pname,c.pcolor,d.jno,a.n from SPJ as a
inner join S as b on a.sno=b.snoinner join P as c on a.pno=c.pnoinner join J as d on a.sno=d.jnoorder by n asc,jno desc













