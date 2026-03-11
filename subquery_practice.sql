--a.Viết vấn tin hiển thị tên và ngày vào làm của các nhân viên trong phòng ban
--của nhân viên tên Zlotkey, không bao gồm Zlotkey.SELECT LAST_NAME, HIRE_DATEFROM EMPLOYEESWHERE DEPARTMENT_ID = (                SELECT DEPARTMENT_ID                FROM EMPLOYEES                WHERE LAST_NAME = 'Zlotkey')--b. Tạo vấn tin hiển thị mã số nhân viên và tên nhân viên của các nhân viên
--có thu nhập cao hơn tiền lương trung bình. Sắp xếp kết quả theo thứ tự
--tiền lương giảm dần.SELECT EMPLOYEE_ID, LAST_NAMEFROM EMPLOYEESWHERE SALARY > (                SELECT avg(SALARY)				FROM EMPLOYEES)ORDER BY SALARY desc;--c.Viết vấn tin hiển thị mã số nhân viên và tên nhân viên của các nhân viên làm
--việc cùng phòng với những nhân viên có chữ u trong tên.
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (
                        SELECT DEPARTMENT_ID
						FROM EMPLOYEES
						WHERE FIRST_NAME like '%u%')
--d. Hiển thị tên, mã số phòng ban và mã số công việc của tất cả các nhân viên
--có vị trí phòng ban là 1700.
SELECT FIRST_NAME, DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (
                        SELECT DEPARTMENT_ID
						FROM DEPARTMENTS
						WHERE LOCATION_ID = 1700)
--e. Hiển thị tên và tiền lương của những nhân viên do King quản lý
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IN (
                    SELECT EMPLOYEE_ID
					FROM EMPLOYEES
					WHERE LAST_NAME = 'King')
--f. Hiển thị mã số phòng ban, tên nhân viên và mã số công việc của mọi nhân
--viên trong phòng ban tên Executive
SELECT DEPARTMENT_ID, FIRST_NAME, JOB_ID
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID = (
                        SELECT DEPARTMENT_ID
						FROM DEPARTMENTS
						WHERE DEPARTMENT_NAME = 'Executive')
--g. Thay đổi lab6_3.sql hiển thị mã số nhân viên, tên nhân viên và tiền lương
--của các nhân viên có thu nhập lớn hơn tiền lương trung bình và làm chung
--phòng với bất kỳ nhân viên nào có chữ u trong tên.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (                SELECT avg(SALARY)				FROM EMPLOYEES)