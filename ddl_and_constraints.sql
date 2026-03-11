---DDL - Data Define Language
---a. Viết câu lệnh tạo table DEPT dựa trên bảng sau.
---script, sau đó thi hành câu lệnh để tạo table. Xem lại table đã được tạo chưa.

USE HR
go
CREATE TABLE DEPT
( 
      ID numeric(7,0)
	  NAME Varchar(25)
)

---b. Lấy dữ liệu từ table DEPARTMENTS thêm vào table DEPT

INSERT INTO DEPT (ID,NAME)
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS

---c. Viết câu lệnh tạo table EMP dựa trên bảng sau. Ghi lại thành tập tin script, sau đó thi hành câu lệnh để tạo table. Xem lại table
---được tạo chưa.
DROP TABLE EMP
go
CREATE TABLE EMP
(            
      ID numeric(7,0),
	  LAST_NAME varchar(25),
	  FIRST_NAME varchar(25),
	  DEPT_ID varchar(7)
)

---d. Thay đổi table EMP cho phép họ nhân viên dài hơn. Xem lại thay đổi.
ALTER TABLE EMP
ALTER COLUMN LAST_NAME varchar(30)

--e.
SELECT *
FROM INFORMATION_SCHEMA table

--f. Tạo table EMPLOYEES2 dựa vào cấu trúc của table EMPLOYEES (bao gồm các cột
---EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY và DEPARTMENT_ID).
---Tên của các cột trong table mới lần lượt là ID, FIRST_NAME, LAST_NAME,
---SALARY và DEPT_ID

SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME, SALARY, DEPARTMENT_ID
INTO EMPLOYEES2
FROM EMPLOYEES

--g. Xóa Table EMP
DROP TABLE EMP

--i. Xóa cột đầu tiên của table EMP, xem lại cấu trúc của EMP.
ALTER TABLE EMP
DROP COLUMN LAST_NAME

--Thực hành CONSTRAINT

--a. Thêm ràng buộc khóa chính 
DROP TABLE EMP
go
CREATE TABLE DEPT
( 
      ID numeric(7,0), PRIMARY KEY,
	  LAST_NAME varchar(25),
	  FIRST_NAME Varchar(25),
	  DEPT_ID varchar(7)
)
--Cách 2
DROP TABLE EMP
go
CREATE TABLE EMP
(
      ID numeric (7,0),
	  LAST_NAME varchar(25),
	  FIRST_NAME varchar(25),
	  DEPT_ID varchar(7),
	  PRIMARY KEY (ID)--
)
--Cách 3
DROP TABLE EMP
go
CREATE TABLE EMP
(
      ID numeric(7,0),
	  LAST_NAME varchar(25),
	  FIRST_NAME varchar(25),
	  DEPT_ID varchar(7)
)
ALTER TABLE EMP
ADD CONSTRAINT emp_id PRIMARY KEY(ID)

--b. Thêm ràng buộc khóa chính mức table cho table DEPT trên cột ID. 
--ràng buộc là my_deptid_pk.
DROP TABLE DEPT
go
CREATE TABLE DEPT
(
     ID numeric (7,0) NOT NULL,
	 NAME varchar(25)
)
ALTER TABLE DEPT
ADD CONSTRAINT dept_id PRIMARY KEY(ID)

--c. Thêm cột DEPT_ID vào table EMP. Thêm ràng buộc khóa ngoài cho table
--EMP để bảo đảm là không thể gán cho nhân viên một phòng ban chưa có.
--Đặt tên ràng buộc là my_emp_dept_id_pk.
ALTER TABLE EMP
ALTER COLUMN dept_id numeric (7,0)
go
ALTER TABLE EMP
ADD CONSTRAINT EMP_DEPT_id_dept_id FOREIGN KEY (dept_id)
    REFERENCES DEPT(ID)