--�� ��ȯ �Լ� TO_CHAR , TO_NUMBER , TO_DATE
--��¥�� ���ڷ� TO_CHAR(��,����)
--��¥�� ���ڷ� �� ��ȯ�ҋ� ���ϴ� �������� ��¥�� ǥ���Ҽ��־��ϴ�
SELECT TO_CHAR(sysdate,'YYYY-MM-DD DY PM HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate,'YYYY-MM-DD HH:MI:SS') FROM dual;

--���Ĺ��ڿ� �Բ� ����ϰ� ���� ���ڸ� ""���ڷ� ���μ� �����մϴ�
SELECT 
    TO_CHAR (sysdate, 'YYYY"��" MM"��"DD"��"')
FROM dual;

--���ڸ� ���ڷ� TO_CHAR(��,����) 
--���Ŀ��� ����ϴ� '9' ��� ���ڴ� ��������9���ƴ϶� �ڸ����� ǥ���ϱ����� ��ȣ�Դϴ�.
SELECT TO_CHAR(20000) FROM dual; --20000
SELECT TO_CHAR(20000,'99,999') FROM dual; --20,000   9�±׳������ϻ�
SELECT TO_CHAR(20000,'L99,999') FROM dual; -- ��20,000  ȭ�������
SELECT TO_CHAR(20000.29,'99999.9') FROM dual; -- 20000.3 �ݿø�������
SELECT 
first_name,
TO_CHAR(salary,'$99,999')AS salary   --$���� 
FROM employees;


--���ڸ� ���ڷ� TO_NUMBER(��,����) 
SELECT '2000' + 2000 FROM dual;  --4000 �Ϲ��� �� ��ȯ(���� -> ����) 
SELECT TO_NUMBER('2000') + 2000 FROM dual;  --4000 ����� �� ��ȯ
SELECT '$3,300' + 2000 FROM dual; --�̰�������  
SELECT TO_NUMBER('$3,300','$9,999')+ 2000 FROM dual; --5300



--���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��,����) 
SELECT TO_DATE('2023-04-13') FROM dual;  --2023-04-13
SELECT TO_DATE('2021-03-31 12:23:50','YY-MM-DD') FROM dual; --���� *�ð����ȳ���
SELECT TO_DATE('2021-03-31 12:23:50','YY-MM-DD HH:MI:SS') FROM dual;
SELECT TO_DATE('2024�� 02�� 12��', 'YYYY"��" MM"��" DD"��"') FROM dual;

-- xxxx�� xx�� xx�� -> ���ڿ� �������� ��ȯ�� ������
--��ȸ�� �÷����� dateInfo ��� �ϰڽ��ϴ� dual���� ��ȸ�غ�����
SELECT '20050102' FROM dual;
SELECT 
TO_CHAR(
      TO_DATE('20050102','YYYYMMDD'),
      'YYYY"��"MM"��"DD"��"'
     )AS dateInfo
FROM dual;



--NULL ���¸� ��ȯ�ϴ� �Լ� NVL(�÷�,��ȯ�� Ÿ�ٰ�) ,
SELECT
      first_name ,
      NVL(commission_pct, 0) AS comm_pct
      FROM employees;   --null�� ��� 0����ǥ��

--NULL ���¸� ��ȯ�ϴ� �Լ� , NVL2(�÷�,null�� �ƴҰ���ǰ�,null�ϰ���ǰ�)
--null�� ������ �����ʽ��ϴ�
SELECT  
      first_name,
      salary,
      NVL2(
          commission_pct, 
          salary + (salary * commission_pct),
          salary
      )AS real_salary
FROM employees;   --null�ξֵ��� �������״�� �ƴѾֵ������Ǽ����




-- DECODE(�÷� Ȥ�� ǥ���� , �׸� , ���1 ,�׸�2 , ���2 .......default) 
-- ����Ŭ ���� �Լ� , ��� �񱳸� ����.
SELECT
   first_name,
   job_id,
   salary,
   DECODE(
   job_id , 
   'IT_PROG' , salary*1.1, --IT PROG�� �������մ°� 1.1���ϱ�
   'FI_MGR' , salary*1.2, --FI_MGR  '' ''  1.2���ϱ�
   'AD_VP' , salary*1.3,  --    ' ' ' ' '   1.3���ϱ�
   salary 
   )AS result
 FROM employees;
 
 
 --CASE WHEN THEN END
 --ANSIǥ�ر��� *������α׷��̵� �ٻ���ؼ� DECODE���� ��ȣ��
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
���� 1.
�������ڸ� �������� employees���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
*/
SELECT
employee_id AS �����ȣ,
first_name AS �̸� ,
hire_date AS �Ի�����,
TRUNC((sysdate - hire_date)/ 356 ) AS �ټӿ���  --�ټӿ�������
FROM employees
WHERE(sysdate - hire_date) / 365 >= 17 
ORDER BY �ټӿ��� DESC; 


/*
���� 2.
EMPLOYEES ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� �������, 
120�̶�� �����ӡ�
121�̶�� ���븮��
122��� �����塯
�������� ���ӿ��� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/
SELECT
first_name ,
manager_id ,
DECODE(manager_id, 100,'���' ,120,'����',121,'�븮',122,'����' ,'�ӿ�'  )AS ���� 
FROM employees
WHERE department_id =50;





























