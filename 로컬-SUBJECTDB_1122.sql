--학과
create table subject( 
    no number, --PK SEQ
    num varchar2(2) not null, --학과번호 01,02,03,04
    name varchar2(24) not null --학과이름
   
);
ALTER TABLE SUBJECT ADD CONSTRAINT SUBJECT_NO_PK PRIMARY KEY(NO);
ALTER TABLE SUBJECT ADD CONSTRAINT SUBJECT_NUM_UK UNIQUE(NUM);
insert into subject(no, s_num, s_name) values (subject_seq.nextval, ?, ?);
CREATE SEQUENCE SUBJECT_SEQ
START WITH 1
INCREMENT BY 1;
DROP TABLE student;
--학생
create table student( 
no number, --PK SEQ
num varchar2(8) not null, --학번
name varchar2(12) not null, --이름
id varchar2(12) not null,   --아이디
passwd varchar2(12) not null, --비번
s_num varchar2(2) not null, --학과번호 FK
birthday varchar2(8) not null, 
phone varchar2(15) not null, 
address varchar2(80) not null, 
email varchar2(40) not null, 
sdate date default sysdate

);
ALTER TABLE student ADD CONSTRAINT student_NO_PK PRIMARY KEY(NO);
ALTER TABLE student ADD CONSTRAINT student_ID_UK UNIQUE(ID);
ALTER TABLE student ADD CONSTRAINT student_NUM_UK UNIQUE(NUM);
ALTER TABLE student ADD CONSTRAINT student_SUBJECT_NUM_FK 
FOREIGN KEY(S_NUM) REFERENCES SUBJECT(NUM) ON DELETE SET NULL ;

CREATE SEQUENCE STUDENT_SEQ
START WITH 1
INCREMENT BY 1;
--과목

create table lesson( 
    no number ,--PK SEQ
    abbre varchar2(2) not null, --과목 요약
    name varchar2(40) not null--과목이름
   
);
ALTER TABLE lesson ADD CONSTRAINT lesson_NO_PK PRIMARY KEY(NO);
ALTER TABLE lesson ADD CONSTRAINT lesson_ABBE_UK UNIQUE(abbre);
 
create sequence lesson_seq 
start with 1
increment by 1;
--trainee 테이블
drop table LESSON;
create table trainee( 
    no number ,                     --pk seq
    s_num varchar2(8),              --student fk 번호
    abbre varchar2(2) ,             --lesson fk 과목요약
    section varchar2(20) not null,  --전공,부전공
    registdate date default sysdate      --수강신청일
   
);
ALTER TABLE trainee ADD CONSTRAINT trainee_NO_PK PRIMARY KEY(NO);
ALTER TABLE trainee ADD CONSTRAINT trainee_student_NUM_FK 
    FOREIGN KEY(S_NUM) REFERENCES student(NUM) ON DELETE SET NULL ;
ALTER TABLE trainee ADD CONSTRAINT trainee_lesson_abbre_FK 
    FOREIGN KEY(abbre) REFERENCES lesson(abbre) ON DELETE SET NULL ;

create sequence trainee_seq 
start with 1
increment by 1;


insert into student values(student_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate);

--SUBJECT STUDENT INNER JOIN
SELECT STU.NO,STU.NUM,STU.NAME,STU.ID,PASSWD,S_NUM,SUB.NAME AS SUBJECT_NAME,BIRTHDAY,PHONE,ADDRESS,EMAIL,SDATE 
FROM STUDENT STU INNER JOIN  SUBJECT SUB ON STU.S_NUM = SUB.NUM;

UPDATE TRINEE SET S_NUM = ?, ABBRE = ?, SECTION = ? WHERE NO =?;
--TRAINEE3개 조인
select T.NO, T.SECTION,t.registdate,S.num,S.NAME ,L.ABBRE,L.NAME AS lname from TRAINEE T INNER JOIN STUDENT S ON T.S_NUM = S.NUM
INNER JOIN LESSON L ON T.ABBRE = L.ABBRE 
ORDER BY T.NO;


--공공 데이터 (전통시장정보)
drop table LANDPRICE;
create table LANDPRICE( 
    NODENO NUMBER,      	
	GPSLATI NUMBER, 		
	GPSLONG NUMBER,
    NODEID VARCHAR2(20) NOT NULL,
	NODENM VARCHAR2(50)
);
ALTER TABLE LANDPRICE ADD CONSTRAINT LANDPRICE_NODENO_PK PRIMARY KEY(NODENO);
ALTER TABLE LANDPRICE ADD CONSTRAINT LANDPRICE_NODEID_UK UNIQUE(NODEID);


select * from LANDPRICE;



CREATE TABLE AIRLINE(
NO NUMBER(10),
NAME VARCHAR2(30) NOT NULL,
ENGLISH_NAME  VARCHAR2(30) NOT NULL,
COUNTRY VARCHAR2(30) NOT NULL,
GRADE VARCHAR2(10)
);
ALTER TABLE AIRLINE ADD CONSTRAINT AIRLINE_NO_PK PRIMARY KEY(NO);
ALTER TABLE AIRLINE ADD CONSTRAINT AIRLINE_NAME_UK UNIQUE(NAME);
ALTER TABLE AIRLINE ADD CONSTRAINT AIRLINE_ENGLISH_NAME_UK UNIQUE(ENGLISH_NAME);