CREATE VIEW PHIEUXUATHU AS
SELECT h.Thoigian, h.Sophieu, h.Ngay, h.Makhoxuat, k.Tenkho, t.Mathuoc, d.Tenthuoc, t.Soluong, t.Dongia, t.Thanhtien
FROM XUATHU h
JOIN XUATHU_CHITIET t
ON h.Thoigian = t.Thoigian
JOIN DANHMUCKHO k
ON h.Makhoxuat = k.Makho
JOIN DANHMUCTHUOC d
ON t.Mathuoc = d.Mathuoc

SELECT *
FROM PHIEUXUATHU
WHERE Ngay between '2016-01-01' and '2016-12-31' and Tenthuoc like '%ol%' 
ORDER BY Thanhtien DESC;

SELECT YEAR(Ngay) as Nam, Tenkho, COUNT(Sophieu) as 'Tong so phieu'
FROM PHIEUXUATHU
GROUP BY YEAR(Ngay), Tenkho
HAVING COUNT(Sophieu) > 3
ORDER BY YEAR(Ngay);

SELECT Mathuoc, Tenthuoc
FROM PHIEUXUATHU 
WHERE YEAR(Ngay) in (2016,2017)
GROUP BY Mathuoc, Tenthuoc

CREATE PROCEDURE TIMKIEM 
(
	@thoigian DATETIME,
	@ INT
)
AS
BEGIN
    SELECT SUM(xct.Soluong * xct.Dongia) INTO 'total_amount'
    FROM XUATHU xh
    JOIN XUATHU_CHITIET xct 
	ON xh.Sophieu = xct.Sophieu
    WHERE xh.Thoigian <= xct.Thoigian
    AND xh.Sophieu <> xct.Sophieu;

    SELECT total_amount;
END



SELECT n.Sophieu as 'Số phiếu nhập', x.Sophieu as 'Số phiếu xuất',
	SUM(n.Soluong) as 'Số lượng nhập', SUM(x.Soluong) as 'Số lượng xuất'
FROM NHAP_CHITIET n
JOIN XUATKHOA_CHITIET x
ON n.Thoigian = x.Thoigian
WHERE n.Thoigian = '012016'
GROUP BY n.Sophieu, x.Sophieu 



