--테이블 설계하기(사원번호, 사원명, 급여)
--JAVA 클래스 
--class EMP01{
--    public int no;
--    public string name;
--    public double salary;
--}
--DB 클래스(테이블)만들기
CREATE TABLE EMP01(
    no NUMBER(4),
    name VARCHAR2(20) not null, 
    salary NUMBER(10,2) default 1000.0,
    CONSTRAINT EMP01_no_PK primary key(no),
    constraint EMP01_name_uk UNIQUE(name)
); 
select * FROM TAB;
--휴지통 보기
select * from recyclebin;
--휴지통 비우기
PURGE RECYCLEBIN
FLASHBACK table epm01 to before drop;
--테이블 삭제 DDL
DROP TABLE customer;
--테이블 복사
SELECT COUNT(*) FROM EMPLOYEES;
CREATE TABLE EMPLE02
as;
select * from employees;
desc emple02;
--제약조건 걸기 pk
alter table emple02 add CONSTRAINT emple02_id_pk primary key(employee_id);
alter table emple02 add CONSTRAINT emple02_email_uk UNIQUE(email);
--제약 조건 삭제하기
alter table emple02 drop CONSTRAINT emple02_email_uk;
--제약 조건 확인하기 정보 검색
select * from user_constraints;
select table_name,constraint_name,constraint_type from user_constraints where upper(table_name) = upper('emple02');
--칼럼추가 emp01 
alter table emp01 add job varchar2(10) not null;
desc emp01;
--칼럼 제거 emp01
alter table emp01 drop COLUMN job;
--칼럼 변경(주의: 기존값이 존재할때 생각을 할 것 -> 타입변경불가, 사이즈 큰것으로는 변경가능)
alter table emp01 modify job number(10) default 0;
--칼럼 이름변경
alter table emp01 rename column job to job2; 
alter table emp01 rename column job2 to job; 
--테이블명을 변경 emp01=>emp02 ddl(creat, alter, drop, rename, turncate)
rename emp01 to emp02;
select * from tab;
--테이블 만들기
create table customer(
customer_code number(7),
customer_name varchar(10) not null,
customer_gender varchar(1),
customer_birth date not null,
customer_phone varchar(16) not null,
customer_email varchar(30),
customer_mileage number(10) default 1000.0
);
alter table customer add CONSTRAINT customer_code_pk primary key(customer_code);
alter table customer add constraint customer_email_uk UNIQUE(customer_email);
alter table customer add constraint customer_gender_check check(customer_gender in('M','W'));

desc emp02;
--제약조건 not null 
alter table emp02 modify salary number(10,2) not null;
select stuscore from tab;
create table stuscore(
    stu_code number(10),
    stu_name varchar(20) not null,
    stu_math number(3,1) default 0,
    stu_kor number(3,1) default 0,
    stu_eng number(3,1) default 0,
    stu_sum number(3,1) default 0,
    stu_avg number(3,1) default 0
);
alter table stuscore add CONSTRAINT stu_code_pk primary key(stu_code);
create table Student(
    stu_number number(10),
    stu_name varchar(20) not null,
    stu_math number(3,1) default 0,
    stu_kor number(3,1) default 0,
    stu_eng number(3,1) default 0,
    stu_sum number(3,1) default 0,
    stu_avg number(3,1) default 0,
    stu_code number(10)
);
alter table stuscore add CONSTRAINT stu_code_pk primary key(stu_code);
alter table Student add CONSTRAINT stu_number_pk primary key(stu_number);
alter table Student add CONSTRAINT stu_stu_code_uk UNIQUE(stu_code);
-- INNER JOIN예시
ROLLBACK;
SELECT employee_id, FIRST_NAME, JOB_ID, SALARY, employees.department_id, DEPARTMENT_NAME,
    CASE
    WHEN UPPER(D.DEPARTMENT_NAME) =  UPPER('MaRKETING') THEN SALARY* 1.05
    WHEN UPPER(D.DEPARTMENT_NAME) =  UPPER('PURCHASING') THEN SALARY* 1.1
    WHEN UPPER(D.DEPARTMENT_NAME) =  UPPER('HUMAN RESOURCES') THEN SALARY* 1.15
    WHEN UPPER(D.DEPARTMENT_NAME) =  UPPER('IT') THEN SALARY* 1.20
    END NEWSALARY
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE UPPER(D.DEPARTMENT_NAME)IN  UPPER('MaRKETING', UPPER('PURCHASING'),UPPER('HUMAN RESOURCES'),UPPER('IT'))
ORDER BY NEWSALARY DESC;



