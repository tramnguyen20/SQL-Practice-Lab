--a. Viết vấn tin hiển thị tên nhân viên, mã số phòng ban và tên phòng ban cho 
--tất cả các nhân viên.
SELECT e.FIRST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e
JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
--b. Tạo danh sách các công việc duy nhất trong phòng ban có mã số 20, bao 
--gồm cột mã số vị trí của phòng ban trong kết quả.

SELECT DISTINCT JOB_ID, d.LOCATION_ID
FROM EMPLOYEES e
JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_ID = 30

--c. Viết vấn tin hiển thị tên nhân viên, mã số phòng ban, mã số vị trí
--ban và tên thành phố của tất cả các nhân viên có thu nhập từ hoa hồng

SELECT e.FIRST_NAME, d.DEPARTMENT_ID, d.LOCATION_ID, l.CITY
FROM EMPLOYEES e
JOIN DEPARTMENTS d
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
JOIN LOCATIONS l
ON l.LOCATION_ID = d.LOCATION_ID
WHERE E.COMMISSION_PCT IS NOT NULL

--d. Hiển thị tên nhân viên và tên phòng ban cho tất cả các nhân viên có chữ a
--trong tên. 

SELECT e.FIRST_NAME, d. DEPARTMENT_NAME
FROM EMPLOYEES e
JOIN DEPARTMENTS d
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE e.FIRST_NAME like '%a%'

--e. Viết vấn tin hiển thị tên nhân viên, mã số công việc, mã số phòng ban
-- và tên phòng ban cho tất cả các nhân viên làm việc ở Toronto.

SELECT e.FIRST_NAME, e.JOB_ID, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e
JOIN DEPARTMENTS d
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
JOIN LOCATIONS l
ON d.LOCATION_ID = l.LOCATION_ID
WHERE l.CITY = 'Toronto'

--f. Hiển thị tên nhân viên và mã số nhân viên, cùng với tên người quản lý và
--mã số người quản lý. Nhãn của các cột là Employee, Emp#, Manager, Mgr#

SELECT e.FIRST_NAME as EMPLOYEE, e.EMPLOYEE_ID as 'Emp#',
m.FIRST_NAME as MANAGER, m.MANAGER_ID as 'Mgr#'
FROM EMPLOYEES e
JOIN EMPLOYEES m
ON m.MANAGER_ID = e.EMPLOYEE_ID

--g.Thay đổi f để hiển thị tất cả các nhân viên bao gồm nhân viên
--King (không có người quản lý).

SELECT e.FIRST_NAME as King,
m.FIRST_NAME as MANAGER
FROM EMPLOYEES e
JOIN EMPLOYEES m
ON m.MANAGER_ID = e.MANAGER_ID 

--h.Tạo vấn tin hiển thị tên nhân viên, mã số phòng ban và tất cả các nhân viên
--làm chung phòng ban với nhân viên đó.

SELECT e1.EMPLOYEE_ID, e1.FIRST_NAME, e1.DEPARTMENT_ID, e2.EMPLOYEE_ID, e2.FIRST_NAME
FROM EMPLOYEES e1
JOIN EMPLOYEES e2
ON e1.DEPARTMENT_ID = e2.DEPARTMENT_ID and e1.EMPLOYEE_ID <> e2.EMPLOYEE_ID


--i.Tạo vấn tin hiển thị tên nhân viên, ngày vào làm của những nhân viên được
--nhận vào làm sau ngày vào làm của Davies.

SELECT e.FIRST_NAME, e.HIRE_DATE
FROM EMPLOYEES e
JOIN EMPLOYEES d
ON e.HIRE_DATE > d.HIRE_DATE 
WHERE d.LAST_NAME = 'Davies'
ORDER BY HIRE_DATE;

--j. Hiển thị tên và ngày vào làm của những nhân viên được nhận vào làm trước
--quản lý của họ, cùng với tên của người quản lý và ngày vào làm. Nhãn của
--các cột là Employee, Emp Hired, Manager, Mgr Hired.

SELECT e.FIRST_NAME as Employee, e.HIRE_DATE as 'Emp Hired',
m.FIRST_NAME as Manager, m.HIRE_DATE as 'Mgr Hired'
FROM EMPLOYEES e
JOIN EMPLOYEES m
ON e.MANAGER_ID = m.EMPLOYEE_ID and e.HIRE_DATE < m.HIRE_DATE
