create database dbstudy
on primary
(name='kt428',
filename='E:\SQL\kt428.mdf',
size=10mb,
filegrowth=10mb
)
log on
(
name='dbstudy.log',
filename='E:\SQL\kt428.ldf',
size=5mb,
filegrowth=10%
)
------------------------------
--�����༶��
create table classinfo
(
cno int not null primary key,
cname nvarchar(20),
cnumber int
)
--Լ������
alter table classinfo add constraint c1 check(cnumber>=0)
-----------
--�������
insert into classinfo
values
(1,'����1',0),
(2,'����2',0),
(3,'����2',0)

select * from classinfo
---------------------
--2.��ѧ����
create table studentinfo
(
sno int not null primary key,
sname nvarchar(20),
cno int not null,
foreign key(cno) references classinfo(cno)
)
select * from studentinfo

----------------
--3.��ѧ���������һ������ ���޸İ༶���е�����
-------begin try��ɵ�����
begin try 
begin tran

insert into studentinfo
values
(1,'����',1)

update classinfo
set cnumber+=1
where cno=1
commit tran
end try 

begin catch
rollback tran
end catch

select * from classinfo
select *from studentinfo
------if�����ɵ�����
declare @c1 int ,@c2 int
begin tran
	insert into studentinfo
	values
	(2,'����',1)
	set @c1=@@ERROR

	update classinfo
	set cnumber+=1
	where cno=1
	set @c2=@@ERROR

	if(@c1=0 and @c2=0)------����ܹ��ɹ����ύ
	commit tran
	else
	begin
	print 'ִ��ʧ��'
	rollback tran--------���ܵĻ��ͻع�
	end
select * from classinfo
select *from studentinfo


