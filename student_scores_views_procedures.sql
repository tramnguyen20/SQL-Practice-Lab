--Câu 1 :  Tạo View tên DIEMMONHOC, hiển thị  điểm thi của sinh viên bao gồm các nội dung sau : (2đ)
--Năm học, Mã lớp, học kỳ, Mã môn học, Tên môn học, Mã sinh viên, Họ và Tên sinh viên, Điểm môn học, Mã tỉnh thành.
CREATE VIEW DIEMMONHOC as
SELECT d.NAM, d.MALOP, d.HK, d.MSMH, mh.TENMH, sv.MASV, sv.HO, sv.TEN, d.DIEM3, sv.TINH
FROM DIEMTHI d
JOIN DMLOP l
ON d.MALOP = l.MALOP
JOIN MONHOC mh
ON d.MSMH = mh.MSMH
JOIN HOSOSINHVIEN sv
ON d.MASV = sv.MASV

--Câu 2 :  Vấn tin xem bảng điểm  lớp “K02401” trong năm học 2003, chỉ xem các sinh viên có chữ  “guy”
--trong tên, kết quả sắp xếp theo điểm giảm dần.  (1đ)
SELECT TEN, DIEM3
FROM DIEMMONHOC
WHERE MALOP = 'K02401' and TEN like '%guy%'
ORDER BY DIEM3 desc

--Câu 3 : Vấn tin  điểm thi trung bình của từng tỉnh thành và từng môn học trong mỗi năm học,
--làm tròn điểm trung bình có 1 số lẽ. Hiển thị các cột Tên tỉnh thành, Tên môn học,
--Năm học, Điểm trung bình. Chỉ hiển thị điểm thi trung bình trên 6 điểm, sắp xếp kết quả theo thứ tự điểm giảm dần. (2đ)
SELECT TENTINH, TENMH, NAM, ROUND(avg(DIEM3), 1) as 'DIEM TRUNG BINH'
FROM DIEMMONHOC 
GROUP BY TENTINH, TENMH, NAM
HAVING ROUND(avg(DIEM3), 1) > 6
ORDER BY [DIEM TRUNG BINH] desc

--Câu 4 : Hiển thị danh sách các sinh viên vừa có điểm môn học vừa có điểm rèn luyện. (2đ)
SELECT dm.MASV, dm.HO, dm.TEN, dm.DIEM3, rl.DIEM 
FROM DIEMMONHOC dm
JOIN DIEMRENLUYEN rl
ON dm.NAM = rl.NAM
WHERE dm.DIEM3 > 0 and rl.DIEM > 0

--Câu 5 : Viết thủ tục hiển thị bảng điểm của 1 sinh viên, trong 1 học kỳ của 1 năm học.
--Thủ tục nhận 3 tham số : Mã sinh viên, Học kỳ, Năm học. (2đ)
CREATE TABLE BANGDIEM (
	MASV VARCHAR(10),
    HK VARCHAR(10),
    NAM VARCHAR(10),
    MSMH VARCHAR(50),
    DIEM3 FLOAT,
    PRIMARY KEY (MASV, HK, NAM, MSMH)
)

--Câu 6 : Viết vấn tin lấy tất cả các dòng dữ liệu của 3 bảng dữ liệu DIEMMONHOC, DIEMRENLUYEN, DIEMTHEDUC.
--Kết quả có nội dung sau : (1đ)
--Năm học, Mã lớp, Học kỳ, Mã sinh viên, Điểm môn học, Điểm rèn luyện, Điểm thể dục.
SELECT dmh.NAM, dmh.MALOP, dmh.HK, dmh.MASV, dmh.DIEM3 as 'DIEM MON HOC', rl.DIEM as 'DIEM REN LUYEN', td.DIEM as 'DIEM THE DUC'
FROM DIEMMONHOC dmh
JOIN DIEMRENLUYEN rl
ON dmh.NAM = rl.NAM
JOIN DIEMTHEDUC td
ON dmh.NAM = td.NAM