CREATE SEQUENCE visit_seq  -- 시퀀스이름
   START WITH 1             -- 시작을 1로 설정
   INCREMENT BY 1          -- 증가 값을 1씩 증가
   NOMAXVALUE             -- 최대 값이 무한대
   NOCACHE
   NOCYCLE;

CREATE table VISIT (
    NO         NUMBER(5,0) NOT NULL,
    WRITER     VARCHAR2(20) NOT NULL,
    MEMO     VARCHAR2(4000) NOT NULL,
    REGDATE   DATE NOT NULL
    
);
alter table visit add CONSTRAINT visit_no_pk primary key(no);
select * from visit;
drop table member;
CREATE TABLE MEMBER(
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    PWD VARCHAR2(20),
    NAME VARCHAR2(20),
    BIRTHDAY DATE,
    MAIL VARCHAR2(50)
    
);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_ID_PK PRIMARY KEY(ID);

select * from member;