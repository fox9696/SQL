SELECT*FROM employees;


--WHERE �� �� ( �����Ͱ��� ��/�ҹ��ڸ� �����մϴ� ) 
SELECT 
first_name,last_name,job_id
FROM employees
WHERE job_id='IT_PROG'; --it_prog �� �˻��ȵ�

SELECT *
FROM employees
WHERE last_name ='King';


SELECT *
FROM employees
WHERE department_id = 50; --'50' �̾ �Ϲ�������ȯ�Ͼ�� �˻��� �������̷������ ����õ


SELECT *
FROM employees
WHERE salary >= 15000 AND salary < 20000;  --��Ȯ�� �������� salary15000~20000����


SELECT * 
FROM employees
WHERE hire_date = '04/01/30';


-- �������� �� ���� (BETWEEN , IN , LIKE)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;  --15000�̻� 20000�̸� �������Ŷ������ѱ��


SELECT*FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN �������� ��� (Ư�� ����� ���� �� ���) 
SELECT * FROM employees
WHERE manager_id IN (100,101,102); 


SELECT * FROM employees
WHERE job_id IN ('IT_PROG','AD_VP');


--LIKE ������ (���� ���ڿ� ���� ����) 
SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date LIKE '03%';  --%(�ۼ�Ʈ)�� 03���� �����ϴ� ��� ����

SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date LIKE '%15';  --%��ġ�� �������ΰ� �̰� 15�γ����� ����


SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date LIKE '%05%';  --���̵�ڵ� 05���Ե��մ°����� 


SELECT first_name , last_name , hire_date 
FROM employees 
WHERE hire_date LIKE '___05%'; -- �����3�������ǵ� 5������ã���������� �տ����������� 
-- 3���� �ܾ�ձ⿡ �����3�������� 15/02/01 �̸� 15/ <<���ڼ�3���� 3������� + 


SELECT * FROM employees;
WHERE commision_pct = null;









































