-- D:\class\

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















-- 게시판 테이블
create table tblBoard(
    seq number primary key,                           -- 글번호
    id varchar2(30) not null references tblUser(id),  -- 작성자(FK)
    subject varchar2(300) not null,                   -- 제목
    content varchar2(2000) not null,                  -- 내용
    regdate date default sysdate not null,            -- 작성시간
    readcount number default 0 not null,              -- 조회수
    userip varchar2(15) not null                      -- 접속IP
);

create sequence seqBoard;

insert into tblBoard(seq, id, subject, content, regdate, readcount, userip)
    values (seqBoard.nextVal, 'hong', '게시판입니다', '내용입니다', default, default, '127.0.0.1');
    
select * from tblBoard;

update tblBoard set subject = '제목', content = '내용' where seq = 1;

delete from tblBoard where seq = 1;

commit;



















