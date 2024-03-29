--형 변환 함수 TO_CHAR , TO_NUMBER , TO_DATE
--날짜를 문자로 TO_CHAR(값,형식)
--날짜를 문자로 형 변환할떄 원하는 형식으로 날짜를 표현할수있씁니다
SELECT TO_CHAR(sysdate,'YYYY-MM-DD DY PM HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate,'YYYY-MM-DD HH:MI:SS') FROM dual;

--서식문자와 함께 사용하고 싶은 문자를 ""문자로 감싸서 전달합니다
SELECT 
    TO_CHAR (sysdate, 'YYYY"년" MM"월"DD"일"')
FROM dual;

--숫자를 문자로 TO_CHAR(값,형식) 
--형식에서 사용하는 '9' 라는 숫자는 실제숫자9가아니라 자리수를 표현하기위한 기호입니다.
SELECT TO_CHAR(20000) FROM dual; --20000
SELECT TO_CHAR(20000,'99,999') FROM dual; --20,000   9는그냥형식일뿐
SELECT TO_CHAR(20000,'L99,999') FROM dual; -- ￦20,000  화폐모양생김
SELECT TO_CHAR(20000.29,'99999.9') FROM dual; -- 20000.3 반올림을지원
SELECT 
first_name,
TO_CHAR(salary,'$99,999')AS salary   --$붙음 
FROM employees;


--문자를 숫자로 TO_NUMBER(값,형식) 
SELECT '2000' + 2000 FROM dual;  --4000 암묵적 형 변환(문자 -> 숫자) 
SELECT TO_NUMBER('2000') + 2000 FROM dual;  --4000 명시적 형 변환
SELECT '$3,300' + 2000 FROM dual; --이것은에러  
SELECT TO_NUMBER('$3,300','$9,999')+ 2000 FROM dual; --5300



--문자를 날짜로 변환하는 함수 TO_DATE(값,형식) 
SELECT TO_DATE('2023-04-13') FROM dual;  --2023-04-13
SELECT TO_DATE('2021-03-31 12:23:50','YY-MM-DD') FROM dual; --에러 *시간을안넣음
SELECT TO_DATE('2021-03-31 12:23:50','YY-MM-DD HH:MI:SS') FROM dual;
SELECT TO_DATE('2024년 02월 12일', 'YYYY"년" MM"월" DD"일"') FROM dual;

-- xxxx년 xx월 xx일 -> 문자열 형식으로 변환해 보세요
--조회할 컬럼명은 dateInfo 라고 하겠습니다 dual에서 조회해보세요
SELECT '20050102' FROM dual;
SELECT 
TO_CHAR(
      TO_DATE('20050102','YYYYMMDD'),
      'YYYY"년"MM"월"DD"일"'
     )AS dateInfo
FROM dual;



--NULL 형태를 변환하는 함수 NVL(컬럼,변환할 타겟값) ,
SELECT
      first_name ,
      NVL(commission_pct, 0) AS comm_pct
      FROM employees;   --null은 모두 0으로표기

--NULL 형태를 변환하는 함수 , NVL2(컬럼,null이 아닐경우의값,null일경우의값)
--null은 연산이 되지않습니다
SELECT  
      first_name,
      salary,
      NVL2(
          commission_pct, 
          salary + (salary * commission_pct),
          salary
      )AS real_salary
FROM employees;   --null인애들은 원래값그대로 아닌애들은계산되서출력




-- DECODE(컬럼 혹은 표현식 , 항목 , 결과1 ,항목2 , 결과2 .......default) 
-- 오라클 전용 함수 , 등등 비교만 가능.
SELECT
   first_name,
   job_id,
   salary,
   DECODE(
   job_id , 
   'IT_PROG' , salary*1.1, --IT PROG를 가지고잇는건 1.1곱하기
   'FI_MGR' , salary*1.2, --FI_MGR  '' ''  1.2곱하기
   'AD_VP' , salary*1.3,  --    ' ' ' ' '   1.3곱하기
   salary 
   )AS result
 FROM employees;
 
 
 --CASE WHEN THEN END
 --ANSI표준구문 *어느프로그램이든 다사용해서 DECODE보다 선호함
 SELECT
     first_name,
     job_id ,
     salary,
     (CASE job_id
      WHEN 'IT_PROG' THEN salary*1.1 
     WHEN 'FI_MGR' THEN salary*1.2 
     WHEN 'AD_VP' THEN salary*1.3
     WHEN 'FI_ACCOUNT' THEN salary*1.4
     ELSE salary
     END) AS result
 FROM employees;
 
 /*
문제 1.
현재일자를 기준으로 employees테이블의 입사일자(hire_date)를 참조해서 근속년수가 17년 이상인
사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요. 
조건 1) 근속년수가 높은 사원 순서대로 결과가 나오도록 합니다
*/
SELECT
employee_id AS 사원번호,
first_name AS 이름 ,
hire_date AS 입사일자,
TRUNC((sysdate - hire_date)/ 356 ) AS 근속연수  --근속연수계산법
FROM employees
WHERE(sysdate - hire_date) / 365 >= 17 
ORDER BY 근속연수 DESC; 


/*
문제 2.
EMPLOYEES 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다.
100이라면 ‘사원’, 
120이라면 ‘주임’
121이라면 ‘대리’
122라면 ‘과장’
나머지는 ‘임원’ 으로 출력합니다.
조건 1) department_id가 50인 사람들을 대상으로만 조회합니다
*/
SELECT
first_name ,
manager_id ,
DECODE(manager_id, 100,'사원' ,120,'주임',121,'대리',122,'과장' ,'임원'  )AS 직급 
FROM employees
WHERE department_id =50; --





























