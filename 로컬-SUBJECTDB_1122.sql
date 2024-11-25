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
    name varchar2(20) not null--과목이름
   
);
ALTER TABLE lesson ADD CONSTRAINT lesson_NO_PK PRIMARY KEY(NO);
ALTER TABLE lesson ADD CONSTRAINT lesson_ABBE_UK UNIQUE(abbre);
 
create sequence lesson_seq 
start with 1
increment by 1;

create table trainee( 
    no number ,                     --pk seq
    s_num varchar2(8) not null,       --student fk 번호
    abbre varchar2(2) not null,     --lesson fk 과목요약
    section varchar2(20) not null,  --전공,부전공
    tdate date default sysdate     --수강신청일
   
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
SELECT NO,NUM,NAME,ID,PASSWD,S_NUM,SUB.NAME,BIRTHDAY,PHONE,ADDRESS,EMAIL,SDATE FROM STUDENT STU INNER JOIN  SUBJECT SUB ON STU.S_NUM = SUB.NUM;


