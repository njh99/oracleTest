--STORED PROCEDURE
--EMPLOYEES에서 사용자 이름을 패턴으로 검색한뒤 해당되는 사용자정보(사원번호,이름,급여)를 보여주세요
SELECT * FROM EMPLOYEES WHERE UPPER(FIRST_NAME) LIKE UPPER('%p%');
SELECT * FROM DUAL WHERE DBMS_RANDOM.STRING('U',1);

CREATE OR REPLACE PROCEDURE EMP_PROC
IS

    -- 1문자 변수 선언
    VWORD VARCHAR2(1);
    VEMP_ROWTYPE EMPLOYEES%ROWTYPE;
    CURSOR CURSOR_NAME(VNAME VARCHAR2)
    IS
    SELECT * FROM EMPLOYEES WHERE UPPER(FIRST_NAME) LIKE UPPER('%'||VNAME||'%');
BEGIN
    --임의의 문자를 생성시킨다.
    VWORD := DBMS_RANDOM.STRING('U',1);
    
    FOR VEMP_ROWTYPE IN  CURSOR_NAME(VWORD) LOOP
        DBMS_OUTPUT.PUT_LINE(VEMP_ROWTYPE.FIRST_NAME|| ' / ' ||VEMP_ROWTYPE.SALARY);
    
    END LOOP;
END;
/
SHOW ERROR;
EXECUTE EMP_PROC;
--딕셔너리
SELECT * FROM USER_TABLES;
SELECT * FROM user_constraints;
SELECT * FROM USER_CONS_COLUMNS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;
SELECT * FROM USER_VIEWS;
SELECT * FROM USER_SOURCE;
SELECT * FROM USER_SEQUENCES;