-- D:class/server/JSPTEST/script.sql

create table tblJava (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    age number not null,
    regdate date default sysdate not null
);

insert into tblJava (id, name, age, regdate) values ('lh0156', '엄윤섭', 26, default);
insert into tblJava (id, name, age, regdate) values ('test', '테스트', 26, default);
select * from tblJava;

delete from tblJava where id = 'test'


commit;

