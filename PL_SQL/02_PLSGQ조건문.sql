DECLARE
     v_salary NUMBER := 0;
     v_department_id NUMBER := 0;
BEGIN
     
     v_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
      dbms_output.put_line('������ ���� : '|| v_department_id);
     SELECT
       salary
       INTO
         v_salary
       FROM employees
       WHERE department_id = v_department_id
       AND ROWNUM = 1; --ù°���� ���ؼ� ������ ����

          IF
            v_salary <= 5000
          THEN
            dbms_output.put_line('�޿��� �� ����');
         ELSIF
            v_salary <= 9000
        THEN 
            dbms_output.put_line('�޿��� �߰���');  
        ELSE
            dbms_output.put_line('�޿��� ����');
        END IF;
        
END;