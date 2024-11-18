--TRIGGER 테스트
--EMP01 생성 하고 트리거를 생성한다.(입력이 될때마다 입력값을 출력해주는 트리거를 만든다.)
DROP TABLE EMP01;
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(20),
    JOB_ID VARCHAR2(50)
);
DESC EMP01;

CREATE OR REPLACE TRIGGER EMP01_TRIGGER
    AFTER INSERT ON EMP01
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(:NEW.EMPNO||','||:NEW.ENAME||'신입사원이 입사했습니다.');
END;
/
INSERT INTO EMP01 VALUES( (SELECT NVL(MAX(EMPNO),0)+1 FROM EMP01), DBMS_RANDOM.STRING('U',4),'IT_DEV');
SELECT * FROM EMP01;

DROP TABLE SAL01;
CREATE TABLE SAL01(
 SALNO NUMBER(4),
 SALARY NUMBER,
 EMPNO NUMBER(4)

);
ALTER TABLE SAL01 ADD CONSTRAINT SAL01_SALNO_PK PRIMARY KEY(SALNO);
ALTER TABLE SAL01 ADD CONSTRAINT SAL01_EMPNO_FK FOREIGN KEY(EMPNO) REFERENCES EMP01(EMPNO);

SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME ='SAL01';

CREATE SEQUENCE SAL01_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;

CREATE OR REPLACE TRIGGER EMP01_TRIGGER2
AFTER INSERT ON EMP01
FOR EACH ROW
BEGIN
    INSERT INTO SAL01 VALUES(SAL01_SEQ.NEXTVAL,1000,:NEW.EMPNO);
    DBMS_OUTPUT.PUT_LINE(:NEW.EMPNO || '번호 사원이 SAL01에 잘 들어왔습니다.');
END;
/

INSERT INTO EMP01 VALUES( (SELECT NVL(MAX(EMPNO),0)+1 FROM EMP01), DBMS_RANDOM.STRING('U',4),'IT_DEV');
SELECT * FROM EMP01;
SELECT * FROM SAL01;
--EMP01에서 사원의 정보를 제거했을떄 SAL01 해당되는 사원의 정보가 삭제되도록 프로그램하시오.
CREATE OR REPLACE TRIGGER EMP01_TRIGGER3
    AFTER DELETE ON EMP01
    FOR EACH ROW
    
BEGIN
    DELETE FROM SAL01 WHERE EMPNO = :OLD.EMPNO;
    DBMS_OUTPUT.PUT_LINE(:OLD.EMPNO ||'번호가  SAL01에서 삭제되었습니다.');

END;
/

DELETE FROM EMP01 WHERE EMPNO = 4;
SELECT * FROM EMP01;
SELECT * FROM SAL01;

--실습예제
--제품 테이블 생성
CREATE TABLE PRODUCT(
    PRO_CODE CHAR(6),
    PRO_NAME VARCHAR2(12) NOT NULL,
    PRO_COMPANY VARCHAR2(12),
    PRO_PRICE NUMBER(8),
    STOCK NUMBER DEFAULT 0
);

DESC PRODUCT;
ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_PRO_CODE_PK PRIMARY KEY(PRO_CODE);
--제고 테이블 생성
CREATE TABLE RECEIVING(
    REC_NO NUMBER(6),
    PRO_CODE CHAR(6),
    REC_DATE  DATE DEFAULT SYSDATE,
    REC_QTY NUMBER(6),
    REC_PRICE NUMBER(8),
    REC_AMOUNT NUMBER(8)
);
ALTER TABLE RECEIVING ADD CONSTRAINT RECEIVING_REC_NO_PK PRIMARY KEY(REC_NO);
ALTER TABLE RECEIVING ADD CONSTRAINT RECEIVING_PRO_CODE_FK FOREIGN KEY(PRO_CODE)REFERENCES PRODUCT(PRO_CODE);
DESC RECEIVING;
--제품 값 INSERT
INSERT INTO PRODUCT(PRO_CODE,PRO_NAME,PRO_COMPANY,PRO_PRICE) VALUES('A00001','세탁기','LG',1500000);
INSERT INTO PRODUCT(PRO_CODE,PRO_NAME,PRO_COMPANY,PRO_PRICE) VALUES('A00002','컴퓨터','LG',1000000);
INSERT INTO PRODUCT(PRO_CODE,PRO_NAME,PRO_COMPANY,PRO_PRICE) VALUES('A00003','냉장고','삼성',4500000);
SELECT * FROM PRODUCT; 
--트리거 만들기
CREATE OR REPLACE TRIGGER TRIGGER_REC
    AFTER INSERT ON RECEIVING
    FOR EACH ROW
BEGIN
    UPDATE PRODUCT SET STOCK = STOCK + :NEW.REC_QTY WHERE PRO_CODE = :NEW.PRO_CODE;
    DBMS_OUTPUT.PUT_LINE(:NEW.REC_QTY||'개 제고가 추가 되었습니다');
END;
/
--트리거 테스트
INSERT INTO RECEIVING VALUES(1,'A00001',SYSDATE,5,850000,4500000);
INSERT INTO RECEIVING VALUES(2,'A00001',SYSDATE,30,450000,7500000);

SELECT * FROM RECEIVING;

SELECT * FROM PRODUCT;
-- 갱신트리거 만들기 입고수량을 30=>10 진행을 했는데 마지막 10개를 5개수정하면 , 제품 재고수량을 수정하는 트리거 만들기
CREATE OR REPLACE TRIGGER RECEIVING_TRIGGER2
 AFTER UPDATE ON RECEIVING
 FOR EACH ROW
 BEGIN
  UPDATE PRODUCT SET STOCK = STOCK+(-:OLD.REC_QTY + :NEW.REC_QTY) WHERE PRO_CODE = :NEW.PRO_CODE;
END;
/

UPDATE RECEIVING SET REC_QTY=8,REC_PRICE=100000, REC_AMOUNT=100000 WHERE REC_NO = 1;
ROLLBACK;
SELECT * FROM PRODUCT;
DELETE FROM RECEIVING WHERE REC_NO = 2;

--삭제 트리거(입고부분에서 삭제가 되면 재고부분에서 삭제된 수량을 빼준다)
CREATE OR REPLACE TRIGGER RECEIVING_DEL_TRIGGER
AFTER DELETE ON RECEIVING
FOR EACH ROW

BEGIN
    UPDATE PRODUCT SET STOCK = STOCK - (:OLD.REC_QTY) WHERE PRO_CODE = :OLD.PRO_CODE;
END;
/

SELECT * FROM RECEIVING;
SELECT * FROM PRODUCT;

DELETE FROM RECEIVING WHERE REC_NO = 2;


--FUNCTION
--부서번호를 입력하면 부서명을 리턴해주는 함수를 만드시오
--부서번호가 없는 번호라면 '해당부서없음' 값으로 리턴

CREATE OR REPLACE FUNCTION GET_DEPARTMENT_NAME_FUNC(VDEPARTMENT_ID EMPLOYEES.DEPARTMENT_ID%TYPE)
RETURN VARCHAR2
IS
    VDEPARTMENT_NAME VARCHAR2(100);
    VCOUNT NUMBER:=0;
BEGIN
    --해당부서의 카운트를 체크
    SELECT COUNT(*) INTO VCOUNT FROM EMPLOYEES WHERE DEPARTMENT_ID = VDEPARTMENT_ID;
    
    IF (VCOUNT = 0) THEN
    VDEPARTMENT_NAME := '해당부서없음';
    ELSE
       SELECT DEPARTMENT_NAME INTO VDEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID = VDEPARTMENT_ID; 
    END IF;
    RETURN VDEPARTMENT_NAME;
END;
/
--함수를 이용해서 부서번호를 매개변수 등록하고 부서명 구하는 기능 사용
SELECT DEPARTMENT_NAME INTO VDEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID = VDEPARTMENT_ID;
SELECT FIRST_NAME,EMPLOYEE_ID, SALARY,DEPARTMENT_ID,GET_DEPARTMENT_NAME_FUNC(DEPARTMENT_ID)AS "DEPARTMENT_NAME"
FROM EMPLOYEES WHERE FIRST_NAME = 'Steven';

VARIABLE VNAME VARCHAR2;
EXECUTE :VNAME := GET_DEPARTMENT_NAME_FUNC(90);
PRINT VNAM











