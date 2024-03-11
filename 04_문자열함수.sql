
--lower (소문자일괄변환), initcap(앞글자만대문자) , upper(대문자) 

SELECT * FROM dual;  --dual : sql에서 기본제공하는 더미

/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서,
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블 입니다.
일시적인 산술 연산이나 날짜 연산 등에 주로 사용합니다.
모든 사용자가 접근할 수 있습니다.
*/
SELECT
 'abcDEF' , lower('abcDEF') , initcap('abcDEF') , upper('abcDEF') 
FROM dual;


SELECT
 last_name , 
 LOWER(last_name),
 INITCAP(last_name),
 UPPER(last_name)
FROM employees;


SELECT
 salary
FROM employees
WHERE LOWER(last_name) = 'austin';

--length(길이) , instr(문자 찾기 , 없으면 0을반환 , 있으면 인덱스 값)
SELECT 
    'abcdef' ,LENGTH('abcdef') , INSTR('abcdef','b')
FROM dual;


SELECT 
first_name , 
LENGTH(first_name) ,
INSTR(first_name, 'a')
FROM employees;


--substr(자를 문자열 , 시작인덱스 , 길이)
--substr(자를 문자열 , 시작인덱스) -> 문자열 끝까지
--인덱스 1부터시작 
--concat(문자 연결) *2개만붙일수잇음
SELECT 
'abcdef' AS ex,
SUBSTR('abcdef' , 2,5) ,
CONCAT('abc', '123') 
FROM dual;


SELECT 
first_name,
SUBSTR(first_name,1,3),
CONCAT(first_name,last_name)
FROM employees;

--LPAD , RPAD ( 좌 우측을 지정한 문자열로채우기) 
SELECT
LPAD('abc',10,'*'), --10이라고쓴건 *이10개가아니고 총길이가10 = abc3개 + *7개임
RPAD('abc',10,'*'),
LPAD('abcdefgh',10,'*') -- **abcdefgh
FROM dual;





























