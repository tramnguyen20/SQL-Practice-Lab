--Tạo vấn tin hiển thị tên nhân viên và lương của những nhân viên có tiền
--lương nhiều hơn 12,000 Dolar.

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 12

--b. Tạo vấn tin hiển thị tên nhân viên và mã số phòng ban của nhân viên có
--mã số 176

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176

--c. 
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY not between 5000 and 12000

--d. Hiển thị tên nhân viên, mã số công việc và ngày vào làm của những nhân
--viên được nhận từ 20/02/1998 đến 01/05/1998SELECT FIRST_NAME, JOB_ID, HIRE_DATEFROM EMPLOYEESWHERE HIRE_DATE between '1998/02/20' and '1998/05/01'SELECT FIRST_NAME, JOB_ID, HIRE_DATEFROM EMPLOYEESWHERE HIRE_DATE between CONVERT(date, '20/02/1998',103)and CONVERT (date, '05/01/1998',103)--e. Hiển thị tên nhân viên và mã số phòng ban của những nhân viên ở các
--phòng ban có mã số là 20 , 50. Kết quả được sắp xếp theo thứ tự tênSELECT FIRST_NAME, DEPARTMENT_IDFROM EMPLOYEESWHERE DEPARTMENT_ID in (20,50)ORDER BY FIRST_NAME; --f. Thay đổi c để hiển thị tên nhân viên và lương của những nhân viên có tiền lương trong khoảng 5000 và 12000--và ở các phòng ban có mã số 20 hoặc 50.SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY between 5000 and 12000 and (DEPARTMENT_ID = 20 or DEPARTMENT_ID = 50)--g. Hiển thị tên nhân viên và ngày vào làm của những nhân viên được nhận
--vào làm năm 1994SELECT FIRST_NAME, HIRE_DATEFROM EMPLOYEESWHERE HIRE_DATE BETWEEN '1994/01/01' and '1994/12/31'