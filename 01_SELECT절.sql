-- 오라클의 한 줄 주석입니다
/*
여러줄 주석입니다
hahahahaha
*/

-- SELECT 컬럼명(여러개가능) FROM 테이블이름 
SELECT * FROM employees;

SELECT employee_id,first_name,last_name FROM employees;

SELECT email , phone_number, hire_date FROM employees;

-- 컬럼을 조회하는 위치에서 +*/- 연산이가능합니다.

SELECT 
employee_id,
first_name,
last_name,
salary,
salary + salary*0.1 AS 성과금
FROM employees;

--null 값의 확인 (숫자 0이나 공백과는 다른존재입니다)
SELECT department_id , commission_pct
FROM employees;

-- alias (컬럼명 , 테이블명의 이름을 변경해서 조회합니다.)
SELECT 
     first_name AS 이름,
     last_name AS 성,
     salary AS 급여
     
FROM employees;

/*
오라클은 홑따옴표'' 로 문자를 표현하고 , 문자열 안에 홑따옴표 특수기호를
표현하고싶다면 '' 를 두번 연속으로 쓰시면 됩니다.
 문자열의 연결기호는 || 입니다 . 문자열의 덧셈 연산을 허용하지 않습니다.
*/
SELECT
first_name ||' '|| last_name || '''s salary is $' || salary AS 급여내역
FROM employees;


--DISTINCT (중복행의 제거)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;



--ROWNUM , ROWID  (행 번호 , 행 아이디)
--로우넘 : 쿼리에의해 반환되는 행 번호를 반환 *번호가중간에없거나지워져도 얘는 순서대로번호를등록함
--로우아이디 : 데이터 베이스 내의 행의 주소를 반환 *얘는 거의쓸일없음
SELECT ROWNUM , ROWID , employee_id
FROM employees;
