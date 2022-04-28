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
--建立班级表
create table classinfo
(
cno int not null primary key,
cname nvarchar(20),
cnumber int
)
--约束条件
alter table classinfo add constraint c1 check(cnumber>=0)
-----------
--添加数据
insert into classinfo
values
(1,'计数1',0),
(2,'计数2',0),
(3,'计数2',0)

select * from classinfo
---------------------
--2.建学生表
create table studentinfo
(
sno int not null primary key,
sname nvarchar(20),
cno int not null,
foreign key(cno) references classinfo(cno)
)
select * from studentinfo

----------------
--3.向学生表中添加一条数据 并修改班级表中的人数
-------begin try完成第三题
begin try 
begin tran

insert into studentinfo
values
(1,'张三',1)

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
------if语句完成第三题
declare @c1 int ,@c2 int
begin tran
	insert into studentinfo
	values
	(2,'李四',1)
	set @c1=@@ERROR

	update classinfo
	set cnumber+=1
	where cno=1
	set @c2=@@ERROR

	if(@c1=0 and @c2=0)------如果能够成功就提交
	commit tran
	else
	begin
	print '执行失败'
	rollback tran--------不能的话就回滚
	end
select * from classinfo
select *from studentinfo


