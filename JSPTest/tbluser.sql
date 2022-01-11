drop table tblUser;

create table tblUser (
    id varchar2(30) primary key,
    pw varchar2(30) not null,
    name varchar2(30) not null,
    lv number(1) default 3 not null
);

insert into tblUser (id, pw, name, lv) values ('hong', '1111', '홍길동', default);
insert into tblUser (id, pw, name, lv) values ('test', '1111', '테스트', default);
insert into tblUser (id, pw, name, lv) values ('som', '1111', '김다솜', default);
insert into tblUser (id, pw, name, lv) values ('admin', '1111', '관리자', 1);


select * from tblUser;

commit;

select * from tblAddress order by seq desc;