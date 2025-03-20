CREATE DATABASE CuaHangHoa;
GO
USE CuaHangHoa;
GO

-- Bảng người dùng
CREATE TABLE nguoi_dung (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ho_ten NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    mat_khau NVARCHAR(255) NOT NULL,
    so_dien_thoai NVARCHAR(20),
    dia_chi NVARCHAR(255),
    vai_tro NVARCHAR(50) CHECK (vai_tro IN ('KHACH_HANG', 'QUAN_TRI')) NOT NULL DEFAULT 'KHACH_HANG',
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Bảng danh mục sản phẩm
CREATE TABLE danh_muc (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_danh_muc NVARCHAR(255) UNIQUE NOT NULL,
    mo_ta NVARCHAR(500)
);

-- Bảng sản phẩm
CREATE TABLE san_pham (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_san_pham NVARCHAR(255) NOT NULL,
    mo_ta NVARCHAR(1000),
    gia DECIMAL(10,2) NOT NULL,
    so_luong INT NOT NULL,
    hinh_anh NVARCHAR(500),
    danh_muc_id INT FOREIGN KEY REFERENCES danh_muc(id) ON DELETE SET NULL,
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Bảng đơn hàng
CREATE TABLE don_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT FOREIGN KEY REFERENCES nguoi_dung(id) ON DELETE CASCADE,
    tong_tien DECIMAL(10,2) NOT NULL,
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('CHO_XU_LY', 'DANG_XU_LY', 'DA_GIAO', 'DA_HUY')) NOT NULL DEFAULT 'CHO_XU_LY',
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Bảng chi tiết đơn hàng
CREATE TABLE chi_tiet_don_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    don_hang_id INT FOREIGN KEY REFERENCES don_hang(id) ON DELETE CASCADE,
    san_pham_id INT FOREIGN KEY REFERENCES san_pham(id) ON DELETE CASCADE,
    so_luong INT NOT NULL,
    gia DECIMAL(10,2) NOT NULL
);

-- Bảng đánh giá sản phẩm
CREATE TABLE danh_gia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT FOREIGN KEY REFERENCES nguoi_dung(id) ON DELETE CASCADE,
    san_pham_id INT FOREIGN KEY REFERENCES san_pham(id) ON DELETE CASCADE,
    so_sao INT CHECK (so_sao BETWEEN 1 AND 5) NOT NULL,
    binh_luan NVARCHAR(1000),
    ngay_tao DATETIME DEFAULT GETDATE()
);

-- Thêm dữ liệu mẫu
INSERT INTO nguoi_dung (ho_ten, email, mat_khau, so_dien_thoai, dia_chi, vai_tro) VALUES
('Nguyễn Văn A', 'nguyenvana@example.com', '123456', '0987654321', 'Hà Nội', 'KHACH_HANG'),
('Trần Thị B', 'tranthib@example.com', '123456', '0912345678', 'TP Hồ Chí Minh', 'KHACH_HANG'),
('Admin', 'admin@example.com', 'admin123', '0909090909', 'Hà Nội', 'QUAN_TRI');

INSERT INTO danh_muc (ten_danh_muc, mo_ta) VALUES
('Hoa Sinh Nhật', 'Các loại hoa dành cho sinh nhật'),
('Hoa Cưới', 'Hoa cưới cầm tay và trang trí lễ cưới');

INSERT INTO san_pham (ten_san_pham, mo_ta, gia, so_luong, hinh_anh, danh_muc_id) VALUES
('Hoa Hồng Đỏ', 'Bó hoa hồng đỏ sang trọng', 250000, 10, 'hoa_hong_do.jpg', 1),
('Hoa Cưới Trắng', 'Hoa cưới cầm tay màu trắng', 500000, 5, 'hoa_cuoi_trang.jpg', 2);

INSERT INTO don_hang (nguoi_dung_id, tong_tien, trang_thai) VALUES
(1, 250000, 'CHO_XU_LY'),
(2, 500000, 'DANG_XU_LY');

INSERT INTO chi_tiet_don_hang (don_hang_id, san_pham_id, so_luong, gia) VALUES
(1, 1, 1, 250000),
(2, 2, 1, 500000);

INSERT INTO danh_gia (nguoi_dung_id, san_pham_id, so_sao, binh_luan) VALUES
(1, 1, 5, 'Hoa rất đẹp, giao nhanh'),
(2, 2, 4, 'Chất lượng ổn, giá hơi cao');
