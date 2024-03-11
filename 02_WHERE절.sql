SELECT*FROM employees;


--WHERE 절 비교 ( 데이터값은 대/소문자를 구분합니다 ) 
SELECT 
first_name,last_name,job_id
FROM employees
WHERE job_id='IT_PROG'; --it_prog 는 검색안됨

SELECT *
FROM employees
WHERE last_name ='King';


SELECT *
FROM employees
WHERE department_id = 50; --'50' 이어도 암묵적형변환일어나서 검색됨 하지만이런방식은 비추천


SELECT *
FROM employees
WHERE salary >= 15000 AND salary < 20000;  --정확한 범위지정 salary15000~20000사이


SELECT * 
FROM employees
WHERE hire_date = '04/01/30';


-- 데이터의 행 제한 (BETWEEN , IN , LIKE)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;  --15000이상 20000미만 위에쓴거랑동일한기능


SELECT*FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN 연산자의 사용 (특정 값들과 비교할 때 사용) 
SELECT * FROM employees
WHERE manager_id IN (100,101,102); 


SELECT * FROM employees
WHERE job_id IN ('IT_PROG','AD_VP');


--LIKE 연산자 (지정 문자열 포함 여부) 
SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date LIKE '03%';  --%(퍼센트)는 03으로 시작하는 모든 정보

SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date LIKE '%15';  --%위치가 앞쪽으로감 이건 15로끝나는 정보


SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date LIKE '%05%';  --앞이든뒤든 05포함되잇는거전부 


SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date LIKE '___05%'; -- 언더바3개넣은건데 5월생만찾으려고사용함 앞에슬래시포함 
-- 3개의 단어가잇기에 언더바3개를넣음 15/02/01 이면 15/ <<글자수3개라서 3번언더바 + 


SELECT * FROM employees;
WHERE commision_pct = null;









































