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
    (sysdate - regdate)as isnew,
    (select count(*) from tblcomment where bseq = tblboard.seq) as commentcount
    from tblBoard;

--페이징 작업
select * from (select rownum as rnum, a.* from (select * from vwBoard order by seq desc) a)
    where rnum between 1 and 5;


select* from tblboard;


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


select * from tblUser;

create table tblComment (
    seq number primary key,                             -- 댓글번호(PK)
    id varchar2(30) not null references tblUser(id),    -- 작성자(id)
    content varchar2(1000) not null,                    -- 댓글내용
    regdate date default sysdate not null,
    bseq number not null references tblBoard(seq)
);

create sequence seqComment;

insert into tblComment(seq, id, content, regdate, bseq) values (seqComment.nextVal, 'hong', '댓글입니다', default, 23);

update tblComment set content = '내용 수정' where seq = 3;

delete from tblComment where seq = 2;

select * from tblcomment;

create table tbldoubleTest{
    double number;
}

commit;

select count(*) as cnt from vwBoard;
