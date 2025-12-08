-- database creation 

create database gomo_dev16_devops;

-- drop the DB 
drop database gomo_dev16_dev_DB; 

-- table creation

create table test ( sno int , name varchar(100));

-- select created table

select * from test;

-- insert data intot tto the created table

insert into test (sno,name ) values ( 1,'monesh');

-- update the exiting values

update test set name='Moneshd' where sno=1; 
-- another type using comma ( assume )
update test set name='Moneshd',age=21 where sno=1;


-- delete record ( use case retention some data are need to be deleted after 7 days )
delete from test where sno=1;

-- delete all data from table 
truncate table test;

-- delete table
drop table test;


-- ALTER table ( define or modify the table structure )

alter table test add age int;
alter table test drop column age;
alter table test add column Email varchar(100);

-- rename table
alter table test rename to emp_details;

