CREATE DATABASE DatLichCatToc;
GO

USE DatLichCatToc;
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
    salon_id INT FOREIGN KEY REFERENCES salon(id) ON DELETE CASCADE,
    ky_thuat_vien_id INT FOREIGN KEY REFERENCES ky_thuat_vien(id) ON DELETE SET NULL,
    dich_vu_id INT FOREIGN KEY REFERENCES dich_vu(id) ON DELETE CASCADE,
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
