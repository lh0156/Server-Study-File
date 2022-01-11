

--주소록 테이블
drop table tbladdress;
drop table seqaddress;

create table tblAddress (
    seq number primary key,         -- 번호(PK)
    name varchar2(30) not null,     -- 이름
    age number(3) not null,         -- 나이
    tel varchar2(15) not null,      -- 연락처
    address varchar2(300) not null -- 주소
);

create sequence seqAddress;

insert into tblAddress (seq, name, age, tel, address) 
                        values (seqAddress.nextVal, '홍길동', 20, '010-9651-6524', '서울시 강남구 역삼동');
insert into tblAddress (seq, name, age, tel, address) 
                        values (seqAddress.nextVal, '아무개', 25, '010-9654-5461', '서울시 강서구 화곡동');
insert into tblAddress (seq, name, age, tel, address)
                        values (seqAddress.nextVal, '하하하', 22, '010-4657-3126', '서울시 강동구 천호동');
                        
update tblAddress set name = '호호호', age = 27, tel = '010-5478-8965', address = '서울시 서대문구 불광동' where seq = 3;

delete from tblAddress where seq = 2;

select * from tblAddress;

commit;