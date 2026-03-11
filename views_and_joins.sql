CREATE VIEW PHIEUNHAP
AS
SELECT p1.Thoigian, p1.Sophieu, p1.Ngay, p1.Makhonhap, p1.Manhacungcap,
       p2.Mathuoc, p2.Soluong, p2.Dongia,p2.Thanhtien
FROM NHAP p1
JOIN NHAP_CHITIET p2
ON p1.Thoigian = p2.Thoigian and p1.Sophieu = p2.Sophieu

CREATE VIEW PHIEUXUATCHUYEN
AS
SELECT c1.Thoigian, c1.Sophieu, c1.Ngay, c1.Makhoxuat, c1.Makhonhap,
c2.Mathuoc, c2.Soluong, c2.Dongia, c2.Thanhtien
FROM XUATCHUYEN c1
JOIN XUATCHUYEN_CHITIET c2
ON c1.Thoigian = c2.Thoigian and c1.Sophieu = c2.Sophieu

CREATE VIEW PHIEUNHAPTRA
AS
SELECT t1.Thoigian, t1.Sophieu, t1.Ngay, t1.Makhoxuat, t1.Makhonhap,
t2.Mathuoc, t2.Soluong, t2.Dongia, t2.Thanhtien
FROM NHAPTRA t1
JOIN NHAPTRA_CHITIET t2
ON t1.Thoigian = t2.Thoigian and t1.Sophieu = t2.Sophieu

CREATE VIEW PHIEUXUATTONGHOPLANHTHUOCKHOADIEUTRI
AS
SELECT k1.Thoigian, k1.Sophieu, k1.Ngay, k1.Makhoxuat, k1.Makhoanhap,
k2.Mathuoc, k2.Soluong, k2.Dongia, k2.Thanhtien
FROM XUATKHOA k1
JOIN XUATKHOA_CHITIET k2
ON k1.Thoigian = k2.Thoigian and k1.Sophieu = k2.Sophieu

CREATE VIEW PHIEUXUATHU
AS
SELECT a1.Thoigian, a1.Sophieu, a1.Ngay, a1.Makhoxuat,
a2.Mathuoc, a2.Soluong, a2.Dongia, a2.Thanhtien
FROM XUATHU a1
JOIN XUATHU_CHITIET a2
ON a1.Thoigian = a2.Thoigian and a1.Sophieu = a2.Sophieu

