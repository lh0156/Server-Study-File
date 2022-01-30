-- D:class/server/JSPTEST/script.sql

--좌표 테이블
create table tblPoint(
    seq number primary key,         -- PK
    name varchar2(100) not null,    -- 장소명
    lat number not null,            -- 위도
    lng number not null             -- 경도
);

create sequence seqPoint;

select * from tblpoint;






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

select * from tbluser;

select * from tblboard;
select seq, subject, id, (select name from tblUser where id = tblBoard.id) as name, regdate, readcount from tblBoard order by seq desc

-- 게시판 뷰
create or replace view vwBoard
 as
    select content, seq, subject, id, (select name from tblUser where id = tblBoard.id) as name, regdate, readcount,
    (sysdate - regdate)as isnew
        from tblBoard;




insert into tblBoard (seq, id, subject, content, regdate, readcount, userip)
    values (seqBoard.nextVal, 'hong', '게시판입니다.', '내용입니다.', to_date('2022-01-10 12:30:00', 'yyyy-mm-dd hh24:mi:ss'), default, '127.0.0.1');
insert into tblBoard (seq, id, subject, content, regdate, readcount, userip)
    values (seqBoard.nextVal, 'hong', '안녕하세요. 홍길동입니다..', '내용입니다.', to_date('2022-01-10 18:45:00', 'yyyy-mm-dd hh24:mi:ss'), default, '127.0.0.1');    
insert into tblBoard (seq, id, subject, content, regdate, readcount, userip)
    values (seqBoard.nextVal, 'hong', '반갑습니다~~', '내용입니다.', to_date('2022-01-11 06:30:00', 'yyyy-mm-dd hh24:mi:ss'), default, '127.0.0.1');
insert into tblBoard (seq, id, subject, content, regdate, readcount, userip)
    values (seqBoard.nextVal, 'hong', '날씨가 참 좋습니다.', '내용입니다.', to_date('2022-01-12 11:10:00', 'yyyy-mm-dd hh24:mi:ss'), default, '127.0.0.1');
insert into tblBoard (seq, id, subject, content, regdate, readcount, userip)
    values (seqBoard.nextVal, 'hong', '점심 시간입니다. 밥먹자~.', '내용입니다.', to_date('2022-01-12 12:50:00', 'yyyy-mm-dd hh24:mi:ss'), default, '127.0.0.1');
insert into tblBoard (seq, id, subject, content, regdate, readcount, userip)
    values (seqBoard.nextVal, 'hong', '게시만 만드는 중입니다..', '내용입니다.', to_date('2022-01-13 09:30:00', 'yyyy-mm-dd hh24:mi:ss'), default, '127.0.0.1');
insert into tblBoard (seq, id, subject, content, regdate, readcount, userip)
    values (seqBoard.nextVal, 'hong', '게시만 계속 만드는 중입니다..', '내용입니다.', to_date('2022-01-13 11:20:00', 'yyyy-mm-dd hh24:mi:ss'), default, '127.0.0.1');

commit;

select * from vwBoard order by seq desc;









-- ex05

create table tblIcon(
    seq number primary key,
    icon_id varchar2(30) not null,
    x number default 0 not null,
    y number default 0 not null
);

select * from tblIcon;

insert into tblIcon values (1, 'icon01', default, default);
insert into tblIcon values (2, 'icon02', default, default);
insert into tblIcon values (3, 'icon03', default, default);
insert into tblIcon values (4, 'icon04', default, default);
insert into tblIcon values (5, 'icon05', default, default);

commit;


