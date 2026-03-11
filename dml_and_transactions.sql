--a. Thực hiện câu lệnh sau để tạo table tên
--MY_EMPLOYEE :

CREATE TABLE my_employee
(
ID int PRIMARY KEY,
last_name VARCHAR(25),
first_name VARCHAR(25),
user_id VARCHAR(8),
salary NUMERIC(9,2)
)

--b. Hiển thị cấu trúc table tên MY_EMPLOYEESELECT *FROM INFORMATION_SCHEMA.COLUMNSWHERE INFORMATION_SCHEMA.COLUMNS.TABLE_NAME = 'my_employee'--c. Thực hiện chuyển chế độ transaction từ AUTO_COMMIT sang IMPLICITSET IMPLICIT_TRANSACTIONS ONINSERT INTO my_employeeVALUES (1,'Patel','Ralph rpatel',USER_ID(),895)--d. Thêm dòng thứ hai trong bảng dữ liệuINSERT INTO my_employee (ID, last_name, first_name, user_id, salary)VALUES (2,'Dancs','Betty bdancs',USER_ID(),860)--e. Thêm 2 dòng dữ liệu kế trong bảng dữ liệu mẫu vào tableINSERT INTO my_employee (ID, last_name, first_name, user_id, salary)VALUES (3,'Biri','Ben bbiri',USER_ID(),1100)INSERT INTO my_employee (ID, last_name, first_name, user_id, salary)VALUES (4,'Newman','Chad cnewman',USER_ID(),750)SELECT * FROM my_employee--g. Buộc dữ liệu đã thêm vào là thường trựcCOMMIT--h. Thay đổi họ của 3 nhân viên thành DrexlerUPDATE my_employeeSET last_name = 'Drexler'WHERE ID = 3--i. Thay đổi lương cho các nhân viên có tiền lương nhỏ hơn 900 thành 1000UPDATE my_employeeSET salary = 1000WHERE salary < 100--j. Xóa tên nhân viên DancsDELETEFROM my_employeeWHERE last_name like 'Dancs'DELETE FROM my_employeeWHERE id = 2--k. Chấp nhận tất cả những thay đỏi ở trênCOMMIT--l. Thêm dòng dữ liệu cuối cùng trong bảng dữ liệu vào mẫu table my_employeeINSERT INTO my_employee (ID,last_name,first_name,user_id,salary)VALUES (5,'Ropeburn','Audrey aropebur',USER_ID(),1550)--m. Đánh dấu điểm bảo lưu trong xử lý Transaction (SAVE TRANSACTION)SAVE TRAN DencuaL--n. Xóa dữ liệu toàn bộ tableDELETE FROM my_employeeSELECT * FROM my_employee--o. Hủy bỏ tác vụ DELETE gần đây nhất (câu n) mà không hủy bỏ tác vụ INSERT từ trước (câu l).ROLLBACK TRAN DencauLSELECT * FROM my_employee--p. Buộc dữ liệu đã thêm vào là thường trực (COMMITCOMMIT--q. Xem lại nội dung bảng dữ liệu