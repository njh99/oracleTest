--EMPLOYEES 복사
CREATE TABLE EMP03
AS 
SELECT * FROM EMPLOYEES;
--모든 사원의 부서번호를 30번으로 수정하자
--DELETE  와 UPDATE SET 할때 WHERE 쓰자
SELECT * FROM EMP03;
UPDATE EMP03 SET DEPARTMENT_ID = 30;
ROLLBACK;
--모든사원의 급여를 10% 인상한다.
UPDATE EMP03 SET SALARY = SALARY *1.1;
ROLLBACK;
--입사일을 오늘로 수정한다.
UPDATE EMP03 SET HIRE_DATE = SYSDATE;
--부서번호가 10번인 사원의 부서번호를 30번으로 수정
UPDATE EMP03 SET department_id =30 WHERE department_id = 10;
--급여가 3000만원 이상인 사원만 급여를 10%를 인상
UPDATE EMP03 SET salary = salary * 1.1 WHERE salary >= 3000;