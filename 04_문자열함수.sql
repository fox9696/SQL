
--lower (�ҹ����ϰ���ȯ), initcap(�ձ��ڸ��빮��) , upper(�빮��) 

SELECT * FROM dual;  --dual : sql���� �⺻�����ϴ� ����

/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
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

--length(����) , instr(���� ã�� , ������ 0����ȯ , ������ �ε��� ��)
SELECT 
    'abcdef' ,LENGTH('abcdef') , INSTR('abcdef','b')
FROM dual;


SELECT 
first_name , 
LENGTH(first_name) ,
INSTR(first_name, 'a')
FROM employees;


--substr(�ڸ� ���ڿ� , �����ε��� , ����)
--substr(�ڸ� ���ڿ� , �����ε���) -> ���ڿ� ������
--�ε��� 1���ͽ��� 
--concat(���� ����) *2�������ϼ�����
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

--LPAD , RPAD ( �� ������ ������ ���ڿ���ä���) 
SELECT
LPAD('abc',10,'*'), --10�̶���� *��10�����ƴϰ� �ѱ��̰�10 = abc3�� + *7����
RPAD('abc',10,'*'),
LPAD('abcdefgh',10,'*') -- **abcdefgh
FROM dual;





























