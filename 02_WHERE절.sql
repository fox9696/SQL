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


SELECT * FROM employees
WHERE commision_pct = null; --null은 =이걸로 비교안함 이건틀린방식
SELECT * FROM employees
WHERE commission_pct IS NULL;  --이방식이맞음
SELECT * FROM employees
WHERE commission_pct IS NOT NULL; --이건 NULL포함안된거


--AND , OR 
--AND가 OR 보다 연산순서가빠름
SELECT * FROM employees 
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;  --salary는 6000이넘어야하는걸출력하려햇는데 6000이하도 출력됨 and가 먼저연산되서

SELECT * FROM employees 
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR') 
AND salary >= 6000;  --() 들어가면 () 먼저 연산 

--데이터의 정렬(SELECT 구문의 가장 마지막에 배치됩니다.) 
-- ASC : ascending 오름차순 -> 생략이 가능합니다
--DESC : descending 내림차순 
SELECT * FROM employees 
ORDER BY hire_date ASC;   --ASC사용햇기에 hire_date가 빠른순서부터 늦은순서로 

SELECT * FROM employees 
ORDER BY hire_date DESC;  --이건 위랑반대로 입사날짜 늦은순부터 (내림차순) 

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY fist_name ASC;  --ASC안써도되긴함 안쓰면 기본asc임

SELECT * FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;

SELECT
  first_name,
  salary*12 AS Pay
FROM employees 
ORDER BY pay ASC; 
































