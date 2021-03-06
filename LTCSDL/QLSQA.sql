create database QLShopTheThao

USE [QLShopTheThao]
GO
/****** Object:  Table [dbo].[db_ChiTietDonHang]    Script Date: 12/26/2018 1:48:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_ChiTietDonHang](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_DonDatHang]    Script Date: 12/26/2018 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_DonDatHang](
	[MaDonDatHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[ThanhTienDH] [float] NULL,
	[TinhTrangDonHang] [nvarchar](300) NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_db_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_HoaDon]    Script Date: 12/26/2018 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_HoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaKH] [int] NULL,
	[NgayBan] [date] NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_KhachHang]    Script Date: 12/26/2018 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[db_KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChiKH] [nvarchar](100) NULL,
	[sdtKH] [varchar](15) NULL,
	[GioiTInh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[EmailKH] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[db_SanPham]    Script Date: 12/26/2018 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[SoLuongSP] [int] NULL,
	[GiaSP] [float] NULL,
	[AnhSP] [nvarchar](max) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[db_User]    Script Date: 12/26/2018 1:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[db_User](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
	[EmailDK] [varchar](50) NULL,
	[NgaySinh] [date] NULL,
	[Vaitro] [nchar](10) NULL,
	[GioiTinhDK] [bit] NULL,
 CONSTRAINT [PK_db_User] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[db_ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonHang_db_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[db_HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[db_ChiTietDonHang] CHECK CONSTRAINT [FK_db_ChiTietDonHang_db_HoaDon]
GO
ALTER TABLE [dbo].[db_ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonHang_db_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[db_SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[db_ChiTietDonHang] CHECK CONSTRAINT [FK_db_ChiTietDonHang_db_SanPham]
GO
ALTER TABLE [dbo].[db_DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_db_DonDatHang_db_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[db_KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[db_DonDatHang] CHECK CONSTRAINT [FK_db_DonDatHang_db_KhachHang]
GO
ALTER TABLE [dbo].[db_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_db_HoaDon_db_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[db_KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[db_HoaDon] CHECK CONSTRAINT [FK_db_HoaDon_db_KhachHang]
GO
ALTER TABLE [dbo].[db_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_db_HoaDon_db_User] FOREIGN KEY([MaNV])
REFERENCES [dbo].[db_User] ([MaNV])
GO
ALTER TABLE [dbo].[db_HoaDon] CHECK CONSTRAINT [FK_db_HoaDon_db_User]
GO
