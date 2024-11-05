-- hr resource에 있는 테이블 정보(프로젝트 클래스 종류)
select * from tab;
-- emloyees 테이블 구조 확인
desc employees;
--emloyees 속에 들어있는 레코드(객체)를 보여주세요.
select * from employees;
--department 테이블 객체를 확인
select * from departments;
--desc 디스크라이브department 구조
desc departments;
--department_ id, department_name 만 보임
SELECT department_id, department_name from departments;
--필드명에 별칭 사용하기
SELECT department_id as "부서번호", department_name as"부서명"from departments;
SELECT department_id as "DEPT_NO", department_name as"DEPT_NAME"from departments;
SELECT department_id as "DEPT NO", department_name as"DEPT NAME"from departments;
select '5' + 5 from dual;
select * from dual;
select '5' || 5 from dual;
--문자열을 기능을 이용해서 필드명 보여주기
SELECT first_name, job_id from employees;
SELECT first_name || '의 직급은' || job_id||'입니다' from employees;
SELECT first_name || '의 직급은' || job_id||'입니다' as data from employees;
--중복되지 않게 보여주기 distinct
SELECT job_id from employees;
SELECT distinct job_id from employees;
SELECT hire_date || '입사일'|| salary||'급여' from employees;
select distinct department_id from employees;
--연봉을 3000 이상 받는 사람정보
select * from employees where salary >= 3000;
desc employees;
select * from employees WHERE HIRE_DATE >='2008/01/01';
--2008년 이후에 입사한 직원 조사
select * from employees where TO_CHAR (hire_date,'YYYY/MM/DD') >='2008-01-01';
select * from employees WHERE HIRE_DATE >=TO_DATE('2008/01/01','YYYY/MM/DD HH24:MI:SS');
--AND BETWEEN A AND B
SELECT *FROM employees WHERE salary >= 2000 AND salary <= 3000;
SELECT *FROM employees WHERE salary BETWEEN 2000 AND 3000;
--or, in직원 번호가 67이거나 101이거나 184인 직원
select * from employees where employee_id = 67 or employee_id = 101 or employee_id = 184;
select * from employees where employee_id in (67,101,184);
--NULL 연산, 비교, 할당 안된다.
SELECT 100-NULL FROM DUAL;
SELECT * FROM EMPLOYEES WHERE commission_pct IS NOT NULL;
SELECT * FROM EMPLOYEES WHERE commission_pct IS NULL;
--OREDER BY ASC, DESC 사번을 기준으로 오름차순 정렬,내림차순 정렬
SELECT employee_id, FIRST_NAME FROM employees ORDER BY employee_id ASC;
SELECT employee_id, FIRST_NAME FROM employees ORDER BY employee_id DESC;
--SELECT 안에는 내가 보여주고 싶은걸 선택하고 FROM 클래스 WHERE 조건
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE department_id >= 90;
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE department_id >= 70;
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE department_id >= 70 GROUP BY department_id;
--ROUND(,N)소수점 N 번째 밑에 숫자는 반올림.
SELECT DEPARTMENT_ID, MAX(SALARY),MIN(SALARY),SUM(SALARY),
    ROUND(AVG(SALARY),1),COUNT(SALARY) FROM EMPLOYEES WHERE department_id >= 70 GROUP BY department_id HAVING SUM(SALARY) >=30000;
SELECT SUM(SALARY) FROM EMPLOYEES;
--SUBSTR
SELECT SUBSTR('DATABASE',4,2) FROM DUAL;
--20번 부서에서 사원들의 입사년도 가져오기
SELECT EMPLOYEE_ID, FIRST_NAME, SUBSTR(HIRE_DATE,1,2)||'년도' FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
--TRIM 
SELECT TRIM(LEADING FROM ' ABCD ') LT, LENGTH(TRIM(LEADING FROM '        ABCD ')) LT_LEN, 
    TRIM(TRAILING FROM ' ABCD ') RT, LENGTH(TRIM(TRAILING FROM '        ABCD ')) RT_LEN, 
    TRIM(BOTH FROM '    ABCD ') BOTH1, LENGTH(TRIM(BOTH FROM '    ABCD ')) BOTH1, TRIM('    ABCD    ') BOTHT2, LENGTH(TRIM(' ABCD ')) BOTHLEN2
    FROM DUAL;
--부성 30번 소속된 직원들 근무달 수를 구하기
SELECT first_name, hire_date AS 입사일, SYSDATE AS 현재날짜, 
ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))AS "근무달수" FROM employees WHERE department_id = 30;
--NEXTDAT() 함수기능
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'),NEXT_DAY(SYSDATE, '수요일') FROM DUAL;
