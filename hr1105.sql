--테이블 설계하기(사원번호, 사원명, 급여)
--JAVA 클래스 
--class EMP01{
--    public int no;
--    public string name;
--    public double salary;
--}
--DB 클래스(테이블)만들기
CREATE TABLE EMP02(
    no NUMBER(4),
    name VARCHAR2(20) not null, 
    salary NUMBER(10,2) default 1000.0,
    CONSTRAINT EMP01_no_PK primary key(no),
    constraint EMP01_name_uk UNIQUE(name)
); 
