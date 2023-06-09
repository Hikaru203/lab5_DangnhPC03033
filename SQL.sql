USE [master]
GO
/****** Object:  Database [QLDV]    Script Date: 5/30/2023 10:02:06 PM ******/
CREATE DATABASE [QLDV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLDV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLDV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLDV] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLDV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDV] SET RECOVERY FULL 
GO
ALTER DATABASE [QLDV] SET  MULTI_USER 
GO
ALTER DATABASE [QLDV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLDV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLDV', N'ON'
GO
ALTER DATABASE [QLDV] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLDV] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLDV]
GO
/****** Object:  Table [dbo].[chi_tiet_don_hang]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_don_hang](
	[chi_tiet_don_hang_id] [int] IDENTITY(1,1) NOT NULL,
	[don_hang_id] [int] NOT NULL,
	[san_pham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia_ban] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[chi_tiet_don_hang_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dich_vu]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dich_vu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_dich_vu] [nvarchar](255) NOT NULL,
	[mo_ta] [text] NULL,
	[gia] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[don_hang]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[don_hang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nguoi_dung_id] [int] NOT NULL,
	[ngay_dat_hang] [date] NOT NULL,
	[tong_gia_tri] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donhang_dichvu]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donhang_dichvu](
	[donhang_dichvu_id] [int] IDENTITY(1,1) NOT NULL,
	[donhang_id] [int] NOT NULL,
	[dichvu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[donhang_dichvu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giohang]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giohang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nguoidung_id] [int] NOT NULL,
	[ngay_tao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giohang_sanpham]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giohang_sanpham](
	[giohang_sanpham_id] [int] IDENTITY(1,1) NOT NULL,
	[giohang_id] [int] NOT NULL,
	[sanpham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[giohang_sanpham_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kho]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[san_pham_id] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia_nhap] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[magiamgia]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[magiamgia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](50) NOT NULL,
	[gia_tri] [money] NOT NULL,
	[ngay_bat_dau] [date] NOT NULL,
	[ngay_ket_thuc] [date] NOT NULL,
	[so_luong_san_pham] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_dang_nhap] [nvarchar](255) NOT NULL,
	[mat_khau] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[ho_ten] [nvarchar](255) NULL,
	[dia_chi] [nvarchar](255) NULL,
	[so_dien_thoai] [nvarchar](20) NULL,
	[chuc_vu] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung_dichvu]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung_dichvu](
	[nguoidung_dichvu_id] [int] IDENTITY(1,1) NOT NULL,
	[nguoidung_id] [int] NOT NULL,
	[dichvu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nguoidung_dichvu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhacungcap]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhacungcap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_nhacungcap] [nvarchar](255) NOT NULL,
	[dia_chi] [nvarchar](255) NULL,
	[so_dien_thoai] [nvarchar](20) NULL,
	[email] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phuong_thuc_thanh_toan]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phuong_thuc_thanh_toan](
	[phuong_thuc_id] [int] IDENTITY(1,1) NOT NULL,
	[don_hang_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[phuong_thuc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_san_pham] [nvarchar](255) NOT NULL,
	[gia] [decimal](10, 2) NOT NULL,
	[mo_ta] [text] NULL,
	[hinh_anh] [nvarchar](255) NULL,
	[nha_cung_cap_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham_magiamgia]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham_magiamgia](
	[sanpham_magiamgia_id] [int] IDENTITY(1,1) NOT NULL,
	[sanpham_id] [int] NOT NULL,
	[magiamgia_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sanpham_magiamgia_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan_khi_nhan_hang]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_toan_khi_nhan_hang](
	[thanh_toan_id] [int] IDENTITY(1,1) NOT NULL,
	[phuong_thuc_id] [int] NULL,
	[dia_chi_giao_hang] [nvarchar](255) NULL,
	[ngay_giao_hang] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[thanh_toan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan_qua_the]    Script Date: 5/30/2023 10:02:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_toan_qua_the](
	[thanh_toan_id] [int] IDENTITY(1,1) NOT NULL,
	[phuong_thuc_id] [int] NULL,
	[so_the] [nvarchar](16) NULL,
	[ngay_het_han] [date] NULL,
	[ma_bao_mat] [nvarchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[thanh_toan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chi_tiet_don_hang] ON 

INSERT [dbo].[chi_tiet_don_hang] ([chi_tiet_don_hang_id], [don_hang_id], [san_pham_id], [so_luong], [gia_ban]) VALUES (1, 1, 1, 2, 100.0000)
INSERT [dbo].[chi_tiet_don_hang] ([chi_tiet_don_hang_id], [don_hang_id], [san_pham_id], [so_luong], [gia_ban]) VALUES (2, 2, 2, 3, 150.0000)
SET IDENTITY_INSERT [dbo].[chi_tiet_don_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[dich_vu] ON 

INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia]) VALUES (1, N'D?ch v? 1', N'Mô t? d?ch v? 1', 100.0000)
INSERT [dbo].[dich_vu] ([id], [ten_dich_vu], [mo_ta], [gia]) VALUES (2, N'D?ch v? 2', N'Mô t? d?ch v? 2', 200.0000)
SET IDENTITY_INSERT [dbo].[dich_vu] OFF
GO
SET IDENTITY_INSERT [dbo].[don_hang] ON 

INSERT [dbo].[don_hang] ([id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (1, 1, CAST(N'2023-05-30' AS Date), 100.0000)
INSERT [dbo].[don_hang] ([id], [nguoi_dung_id], [ngay_dat_hang], [tong_gia_tri]) VALUES (2, 2, CAST(N'2023-05-30' AS Date), 150.0000)
SET IDENTITY_INSERT [dbo].[don_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[donhang_dichvu] ON 

INSERT [dbo].[donhang_dichvu] ([donhang_dichvu_id], [donhang_id], [dichvu_id]) VALUES (1, 1, 1)
INSERT [dbo].[donhang_dichvu] ([donhang_dichvu_id], [donhang_id], [dichvu_id]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[donhang_dichvu] OFF
GO
SET IDENTITY_INSERT [dbo].[giohang] ON 

INSERT [dbo].[giohang] ([id], [nguoidung_id], [ngay_tao]) VALUES (1, 1, CAST(N'2023-05-30T10:00:00.000' AS DateTime))
INSERT [dbo].[giohang] ([id], [nguoidung_id], [ngay_tao]) VALUES (2, 2, CAST(N'2023-05-30T11:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[giohang] OFF
GO
SET IDENTITY_INSERT [dbo].[giohang_sanpham] ON 

INSERT [dbo].[giohang_sanpham] ([giohang_sanpham_id], [giohang_id], [sanpham_id], [so_luong]) VALUES (1, 1, 1, 2)
INSERT [dbo].[giohang_sanpham] ([giohang_sanpham_id], [giohang_id], [sanpham_id], [so_luong]) VALUES (2, 2, 2, 3)
SET IDENTITY_INSERT [dbo].[giohang_sanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[kho] ON 

INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (1, 1, 10, 40.5000)
INSERT [dbo].[kho] ([id], [san_pham_id], [so_luong], [gia_nhap]) VALUES (2, 2, 20, 90.2500)
SET IDENTITY_INSERT [dbo].[kho] OFF
GO
SET IDENTITY_INSERT [dbo].[magiamgia] ON 

INSERT [dbo].[magiamgia] ([id], [ma], [gia_tri], [ngay_bat_dau], [ngay_ket_thuc], [so_luong_san_pham]) VALUES (1, N'MGG1', 50.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 100)
INSERT [dbo].[magiamgia] ([id], [ma], [gia_tri], [ngay_bat_dau], [ngay_ket_thuc], [so_luong_san_pham]) VALUES (2, N'MGG2', 100.0000, CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 200)
SET IDENTITY_INSERT [dbo].[magiamgia] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoidung] ON 

INSERT [dbo].[nguoidung] ([id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu]) VALUES (1, N'user1', N'pass1', N'user1@example.com', N'Ngư?i dùng 1', N'Đ?a ch? 1', N'123456789', N'Ch?c v? 1')
INSERT [dbo].[nguoidung] ([id], [ten_dang_nhap], [mat_khau], [email], [ho_ten], [dia_chi], [so_dien_thoai], [chuc_vu]) VALUES (2, N'user2', N'pass2', N'user2@example.com', N'Ngư?i dùng 2', N'Đ?a ch? 2', N'987654321', N'Ch?c v? 2')
SET IDENTITY_INSERT [dbo].[nguoidung] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoidung_dichvu] ON 

INSERT [dbo].[nguoidung_dichvu] ([nguoidung_dichvu_id], [nguoidung_id], [dichvu_id]) VALUES (1, 1, 1)
INSERT [dbo].[nguoidung_dichvu] ([nguoidung_dichvu_id], [nguoidung_id], [dichvu_id]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[nguoidung_dichvu] OFF
GO
SET IDENTITY_INSERT [dbo].[nhacungcap] ON 

INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (1, N'Nhà cung c?p 1', N'Đ?a ch? 1', N'111111111', N'nhacungcap1@example.com')
INSERT [dbo].[nhacungcap] ([id], [ten_nhacungcap], [dia_chi], [so_dien_thoai], [email]) VALUES (2, N'Nhà cung c?p 2', N'Đ?a ch? 2', N'222222222', N'nhacungcap2@example.com')
SET IDENTITY_INSERT [dbo].[nhacungcap] OFF
GO
SET IDENTITY_INSERT [dbo].[phuong_thuc_thanh_toan] ON 

INSERT [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id], [don_hang_id]) VALUES (1, 1)
INSERT [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id], [don_hang_id]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[phuong_thuc_thanh_toan] OFF
GO
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id]) VALUES (1, N'S?n ph?m 1', CAST(50.50 AS Decimal(10, 2)), N'Mô t? s?n ph?m 1', N'hinh1.jpg', 1)
INSERT [dbo].[sanpham] ([id], [ten_san_pham], [gia], [mo_ta], [hinh_anh], [nha_cung_cap_id]) VALUES (2, N'S?n ph?m 2', CAST(100.75 AS Decimal(10, 2)), N'Mô t? s?n ph?m 2', N'hinh2.jpg', 2)
SET IDENTITY_INSERT [dbo].[sanpham] OFF
GO
SET IDENTITY_INSERT [dbo].[sanpham_magiamgia] ON 

INSERT [dbo].[sanpham_magiamgia] ([sanpham_magiamgia_id], [sanpham_id], [magiamgia_id]) VALUES (1, 1, 1)
INSERT [dbo].[sanpham_magiamgia] ([sanpham_magiamgia_id], [sanpham_id], [magiamgia_id]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[sanpham_magiamgia] OFF
GO
SET IDENTITY_INSERT [dbo].[thanh_toan_khi_nhan_hang] ON 

INSERT [dbo].[thanh_toan_khi_nhan_hang] ([thanh_toan_id], [phuong_thuc_id], [dia_chi_giao_hang], [ngay_giao_hang]) VALUES (1, 1, N'Đ?a ch? giao hàng 1', CAST(N'2023-06-01' AS Date))
INSERT [dbo].[thanh_toan_khi_nhan_hang] ([thanh_toan_id], [phuong_thuc_id], [dia_chi_giao_hang], [ngay_giao_hang]) VALUES (2, 2, N'Đ?a ch? giao hàng 2', CAST(N'2023-06-02' AS Date))
SET IDENTITY_INSERT [dbo].[thanh_toan_khi_nhan_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[thanh_toan_qua_the] ON 

INSERT [dbo].[thanh_toan_qua_the] ([thanh_toan_id], [phuong_thuc_id], [so_the], [ngay_het_han], [ma_bao_mat]) VALUES (1, 1, N'1234567812345678', CAST(N'2024-12-31' AS Date), N'123')
INSERT [dbo].[thanh_toan_qua_the] ([thanh_toan_id], [phuong_thuc_id], [so_the], [ngay_het_han], [ma_bao_mat]) VALUES (2, 2, N'8765432187654321', CAST(N'2024-12-31' AS Date), N'321')
SET IDENTITY_INSERT [dbo].[thanh_toan_qua_the] OFF
GO
ALTER TABLE [dbo].[chi_tiet_don_hang]  WITH CHECK ADD FOREIGN KEY([don_hang_id])
REFERENCES [dbo].[don_hang] ([id])
GO
ALTER TABLE [dbo].[chi_tiet_don_hang]  WITH CHECK ADD FOREIGN KEY([san_pham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[don_hang]  WITH CHECK ADD FOREIGN KEY([nguoi_dung_id])
REFERENCES [dbo].[nguoidung] ([id])
GO
ALTER TABLE [dbo].[donhang_dichvu]  WITH CHECK ADD FOREIGN KEY([dichvu_id])
REFERENCES [dbo].[dich_vu] ([id])
GO
ALTER TABLE [dbo].[donhang_dichvu]  WITH CHECK ADD FOREIGN KEY([donhang_id])
REFERENCES [dbo].[don_hang] ([id])
GO
ALTER TABLE [dbo].[giohang]  WITH CHECK ADD FOREIGN KEY([nguoidung_id])
REFERENCES [dbo].[nguoidung] ([id])
GO
ALTER TABLE [dbo].[giohang_sanpham]  WITH CHECK ADD FOREIGN KEY([giohang_id])
REFERENCES [dbo].[giohang] ([id])
GO
ALTER TABLE [dbo].[giohang_sanpham]  WITH CHECK ADD FOREIGN KEY([sanpham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[kho]  WITH CHECK ADD FOREIGN KEY([san_pham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[nguoidung_dichvu]  WITH CHECK ADD FOREIGN KEY([dichvu_id])
REFERENCES [dbo].[dich_vu] ([id])
GO
ALTER TABLE [dbo].[nguoidung_dichvu]  WITH CHECK ADD FOREIGN KEY([nguoidung_id])
REFERENCES [dbo].[nguoidung] ([id])
GO
ALTER TABLE [dbo].[phuong_thuc_thanh_toan]  WITH CHECK ADD FOREIGN KEY([don_hang_id])
REFERENCES [dbo].[don_hang] ([id])
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD FOREIGN KEY([nha_cung_cap_id])
REFERENCES [dbo].[nhacungcap] ([id])
GO
ALTER TABLE [dbo].[sanpham_magiamgia]  WITH CHECK ADD FOREIGN KEY([magiamgia_id])
REFERENCES [dbo].[magiamgia] ([id])
GO
ALTER TABLE [dbo].[sanpham_magiamgia]  WITH CHECK ADD FOREIGN KEY([sanpham_id])
REFERENCES [dbo].[sanpham] ([id])
GO
ALTER TABLE [dbo].[thanh_toan_khi_nhan_hang]  WITH CHECK ADD FOREIGN KEY([phuong_thuc_id])
REFERENCES [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id])
GO
ALTER TABLE [dbo].[thanh_toan_qua_the]  WITH CHECK ADD FOREIGN KEY([phuong_thuc_id])
REFERENCES [dbo].[phuong_thuc_thanh_toan] ([phuong_thuc_id])
GO
USE [master]
GO
ALTER DATABASE [QLDV] SET  READ_WRITE 
GO
