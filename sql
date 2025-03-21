CREATE DATABASE WebsiteDatLichCatToc;
GO

USE WebsiteDatLichCatToc;
GO

-- Bảng người dùng
CREATE TABLE nguoi_dung (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ho_ten NVARCHAR(255) NOT NULL,
    so_dien_thoai VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NULL,
    mat_khau VARCHAR(255) NOT NULL,
    vai_tro NVARCHAR(50) CHECK (vai_tro IN ('khach_hang', 'quan_tri')) NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Bảng salon
CREATE TABLE salon (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_salon NVARCHAR(255) NOT NULL,
    dia_chi NVARCHAR(255) NOT NULL,
    thanh_pho NVARCHAR(100) NOT NULL,
    quan_huyen NVARCHAR(100) NOT NULL,
    so_dien_thoai VARCHAR(15) NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Bảng dịch vụ
CREATE TABLE dich_vu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dich_vu NVARCHAR(255) NOT NULL,
    gia DECIMAL(10,2) NOT NULL,
    mo_ta NVARCHAR(1000) NOT NULL,
    salon_id INT FOREIGN KEY REFERENCES salon(id) ON DELETE CASCADE
);

-- Bảng kỹ thuật viên
CREATE TABLE ky_thuat_vien (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ho_ten NVARCHAR(255) NOT NULL,
    so_dien_thoai VARCHAR(15) UNIQUE NOT NULL,
    salon_id INT FOREIGN KEY REFERENCES salon(id) ON DELETE CASCADE
);

-- Bảng đặt lịch
CREATE TABLE dat_lich (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT FOREIGN KEY REFERENCES nguoi_dung(id) ON DELETE CASCADE,
    salon_id INT FOREIGN KEY REFERENCES salon(id) ON DELETE NO ACTION,
    ky_thuat_vien_id INT FOREIGN KEY REFERENCES ky_thuat_vien(id) ON DELETE SET NULL,
    dich_vu_id INT FOREIGN KEY REFERENCES dich_vu(id) ON DELETE NO ACTION,
    thoi_gian_hen DATETIME NOT NULL,
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('cho_xac_nhan', 'da_xac_nhan', 'hoan_thanh', 'huy')) DEFAULT 'cho_xac_nhan',
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Bảng sản phẩm
CREATE TABLE san_pham (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_san_pham NVARCHAR(255) NOT NULL,
    salon_id INT FOREIGN KEY REFERENCES salon(id) ON DELETE CASCADE
);

-- Bảng sản phẩm chi tiết
CREATE TABLE san_pham_chi_tiet (
    id INT IDENTITY(1,1) PRIMARY KEY,
    san_pham_id INT FOREIGN KEY REFERENCES san_pham(id) ON DELETE CASCADE,
    kich_thuoc NVARCHAR(50) NULL, 
    mo_ta NVARCHAR(1000) NULL,
    gia DECIMAL(10,2) NOT NULL,
    so_luong INT NOT NULL CHECK (so_luong >= 0),
    ngay_san_xuat DATE NULL,
    han_su_dung DATE NULL
);

-- Bảng đơn hàng
CREATE TABLE don_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT FOREIGN KEY REFERENCES nguoi_dung(id) ON DELETE CASCADE,
    tong_tien DECIMAL(10,2) NOT NULL,
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('cho_thanh_toan', 'da_thanh_toan', 'da_giao_hang', 'huy')) DEFAULT 'cho_thanh_toan',
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Bảng chi tiết đơn hàng
CREATE TABLE chi_tiet_don_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    don_hang_id INT FOREIGN KEY REFERENCES don_hang(id) ON DELETE CASCADE,
    san_pham_id INT FOREIGN KEY REFERENCES san_pham(id) ON DELETE CASCADE,
    so_luong INT NOT NULL CHECK (so_luong > 0),
    gia DECIMAL(10,2) NOT NULL
);

-- Bảng đánh giá
CREATE TABLE danh_gia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT FOREIGN KEY REFERENCES nguoi_dung(id) ON DELETE CASCADE,
    salon_id INT FOREIGN KEY REFERENCES salon(id) ON DELETE CASCADE,
    diem_danh_gia INT CHECK (diem_danh_gia BETWEEN 1 AND 5) NOT NULL,
    binh_luan NVARCHAR(1000) NULL,
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Thêm dữ liệu mẫu

-- Thêm người dùng
INSERT INTO nguoi_dung (ho_ten, so_dien_thoai, email, mat_khau, vai_tro) VALUES
('Nguyen Van A', '0987654321', 'a@gmail.com', '123456', 'khach_hang'),
('Tran Thi B', '0978654321', 'b@gmail.com', '123456', 'quan_tri');

-- Thêm salon
INSERT INTO salon (ten_salon, dia_chi, thanh_pho, quan_huyen, so_dien_thoai) VALUES
('Salon A', '123 Duong ABC', 'Ha Noi', 'Dong Da', '0123456789'),
('Salon B', '456 Duong XYZ', 'HCM', 'Quan 1', '0987654321');

-- Thêm dịch vụ
INSERT INTO dich_vu (ten_dich_vu, gia, mo_ta, salon_id) VALUES
('Cat toc nam', 100000, 'Dich vu cat toc danh cho nam', 1),
('Cat toc nu', 150000, 'Dich vu cat toc danh cho nu', 2);

-- Thêm kỹ thuật viên
INSERT INTO ky_thuat_vien (ho_ten, so_dien_thoai, salon_id) VALUES
('Le Van C', '0912345678', 1),
('Pham Thi D', '0923456789', 2);

-- Thêm đặt lịch
INSERT INTO dat_lich (nguoi_dung_id, salon_id, ky_thuat_vien_id, dich_vu_id, thoi_gian_hen, trang_thai) VALUES
(1, 1, 1, 1, '2025-03-25 10:00:00', 'cho_xac_nhan'),
(2, 2, 2, 2, '2025-03-26 15:00:00', 'da_xac_nhan');

-- Thêm sản phẩm
INSERT INTO san_pham (ten_san_pham, salon_id) VALUES
('Dau goi cao cap', 1),
('Gom vuot toc', 2);

-- Thêm sản phẩm chi tiết
INSERT INTO san_pham_chi_tiet (san_pham_id, kich_thuoc, mo_ta, gia, so_luong, ngay_san_xuat, han_su_dung) VALUES
(1, '500ml', 'Dau goi chong rung toc', 200000, 50, '2025-01-01', '2026-01-01'),
(2, '100g', 'Gom vuot toc giu nep', 150000, 30, '2025-02-01', '2026-02-01');

-- Thêm đơn hàng
INSERT INTO don_hang (nguoi_dung_id, tong_tien, trang_thai) VALUES
(1, 200000, 'cho_thanh_toan'),
(2, 150000, 'da_thanh_toan');

-- Thêm chi tiết đơn hàng
INSERT INTO chi_tiet_don_hang (don_hang_id, san_pham_id, so_luong, gia) VALUES
(1, 1, 1, 200000),
(2, 2, 1, 150000);

-- Thêm đánh giá
INSERT INTO danh_gia (nguoi_dung_id, salon_id, diem_danh_gia, binh_luan) VALUES
(1, 1, 5, 'Dich vu rat tot!'),
(2, 2, 4, 'Nhiet tinh, phuc vu chu dao!');
