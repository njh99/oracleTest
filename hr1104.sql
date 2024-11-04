-- hr resource에 있는 테이블 정보(프로젝트 클래스 종류)
select * from tab;
-- emloyees 테이블 구조 확인
desc employees;
--emloyees 속에 들어있는 레코드(객체)를 보여주세요.
select * from employees;
--department 테이블 객체를 확인
select * from departments;
--department 구조
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