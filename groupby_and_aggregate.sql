--a. Hiển thị tiền lương cao nhất, thấp nhất, tổng lương và lương trung bình
--của các nhân viên. Đặt tên cột lần lượt là Maximum, Minimum, Sum và
--Average. Làm tròn kết quả không có số lẽ.
SELECT JOB_ID, max(SALARY) as Maximum, max(SALARY) as Minium, sum(SALARY) as Summary, avg(SALARY) as Average
FROM EMPLOYEES
GROUP BY JOB_ID

--c. Viết vấn tin để hiển thị tổng số nhân viên của mỗi nhóm công việc.
SELECT JOB_ID, count(*)
FROM EMPLOYEES
GROUP BY JOB_ID

--d. Hiển thị tổng số nhân viên quản lý.
SELECT count(DISTINCT MANAGER_ID)
FROM EMPLOYEES

SELECT DISTINCT MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL

--e. Viết vấn tin hiển thị chênh lệch giữa lương cao nhất và thấp nhất. Đặt tên cột
--là DIFFERENCE. 
SELECT max(SALARY) - min(SALARY) as Difference
FROM EMPLOYEES

--f. Hiển thị mã số nhà quản lý và tiền lương thấp nhất của nhân viên trong nhóm
--nhà quản lý đó. Chỉ hiển thị tiền lương thấp nhất trên 6000 dolar, sắp xếp thứ
--tự giảm dần theo tiền lương thấp nhất.
SELECT m.MANAGER_ID, min(m.SALARY)
FROM EMPLOYEES m
JOIN EMPLOYEES e
ON e.MANAGER_ID = m.MANAGER_ID
WHERE m.MANAGER_ID is not null
GROUP BY m.MANAGER_ID
HAVING min(e.SALARY) > 6000
ORDER BY min(e.SALARY) desc

--g. Viết vấn tin hiển thị tên phòng ban, địa điểm, số nhân viên trong phòng ban
--và lương trung bình của phòng ban. Đặt tên nhãn lần lượt là Name, Location,
--Number of People và Salary. Làm tròn lương trung bình đến 2 số lẽ.
SELECT d.DEPARTMENT_NAME as Name, l.CITY as Location, count(e.EMPLOYEE_ID) as 'Number of People', avg(e.SALARY) as Salary
FROM DEPARTMENTS d
JOIN EMPLOYEES e
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN LOCATIONS l
ON l.LOCATION_ID = d.LOCATION_ID
GROUP BY d.DEPARTMENT_NAME, l.CITY