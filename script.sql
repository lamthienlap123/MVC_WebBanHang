USE [master]
GO
/****** Object:  Database [Shopper]    Script Date: 26/11/2019 1:41:05 PM ******/
CREATE DATABASE [Shopper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shopper.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Shopper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shopper_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Shopper] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopper] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopper] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shopper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopper] SET RECOVERY FULL 
GO
ALTER DATABASE [Shopper] SET  MULTI_USER 
GO
ALTER DATABASE [Shopper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopper] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Shopper] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shopper', N'ON'
GO
USE [Shopper]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrator](
	[adAcc] [varchar](500) NOT NULL,
	[adPass] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[adAcc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](100) NULL,
	[catePhoto] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [varchar](50) NULL,
	[commentMessage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[cusPhone] [varchar](20) NOT NULL,
	[cusFullName] [nvarchar](200) NULL,
	[cusEmail] [varchar](100) NULL,
	[cusAddress] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[cusPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [varchar](20) NOT NULL,
	[proID] [varchar](50) NOT NULL,
	[ordtsQuantity] [int] NULL,
	[ordtsThanhTien] [varchar](50) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [varchar](20) NOT NULL,
	[cusPhone] [varchar](20) NULL,
	[orderMessage] [nvarchar](max) NULL,
	[orderDateTime] [varchar](50) NULL,
	[orderStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producers](
	[pdcID] [int] IDENTITY(1,1) NOT NULL,
	[pdcName] [nvarchar](100) NULL,
	[pdcPhone] [varchar](20) NULL,
	[pdcEmail] [varchar](50) NULL,
	[pdcAddress] [nvarchar](max) NULL,
	[pdcPhoto] [nvarchar](max) NULL,
	[pdcInfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[pdcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[proID] [varchar](50) NOT NULL,
	[pdcID] [int] NULL,
	[typeID] [int] NULL,
	[proName] [nvarchar](200) NULL,
	[proSize] [varchar](10) NULL,
	[proPrice] [varchar](10) NULL,
	[proDiscount] [int] NULL,
	[proPhoto] [nvarchar](max) NULL,
	[proUpdateDate] [varchar](50) NULL,
	[proDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[cateID] [int] NULL,
	[typeName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rates]    Script Date: 26/11/2019 1:41:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rates](
	[proID] [varchar](50) NOT NULL,
	[rateStar] [int] NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Administrator] ([adAcc], [adPass]) VALUES (N'lap', N'123456')
INSERT [dbo].[Administrator] ([adAcc], [adPass]) VALUES (N'vutung', N'Z8iwc6Uz2M+EpI1l6kLxPQ==')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (5, N'Laptop', N'/Image/img.jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (6, N'Linh Kiện PC', N'/Image/img(31).jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (7, N'Phụ Kiện PC', N'/Image/img(32).jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (8, N'Màn Hình', N'/Image/img(33).jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567891', N'Vũ Văn A', N'a@gmail.com', N'Nhà A')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567892', N'Vũ Văn B', N'b@gmail.com', N'Nhà B')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567893', N'Vũ Văn C', N'c@gmail.com', N'Nhà C')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567894', N'Vũ Văn D', N'd@gmail.com', N'Nhà D')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567895', N'Vũ Văn E', N'e@gmail.com', N'Nhà E')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'0825674486', N'Huỳnh Hoài Bảo', N'thienlap98@gmail.com', N'55F6 Lâm Thành Mâu')
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (9, N'Dell', N'0364125953', N'dell@gmail.com', N'TP.HCM', N'/Image/dell.png', NULL)
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (10, N'Acer', N'0642987569', N'acer@gmail.com', N'TP.HCM', N'/Image/acer.png', N'?????')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (11, N'Asus', N'0642996569', N'asus@gmail.com', N'TP.HCM', N'/Image/Asus.png', N'?????')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (12, N'MSI', N'0642996983', N'msi@gmail.com', N'TP.HCM', N'/Image/MSI.png', N'?????')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (13, N'HP', N'0986145896', N'hp@gmail.com', N'TP.HCM', N'/Image/HP.png', N'?????')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (14, N'Lenovo', N'059862354', N'lenovo@gmail.com', N'TP.HCM', N'/Image/Lenovo.png', N'?????')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (15, N'Intel', N'03658965415', N'intel@gmail.com', N'TP.HCM', N'/Image/intel.png', NULL)
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (16, N'AMD', N'0986587459', N'amd@gmail.com', N'TP.HCM', N'/Image/amd.png', NULL)
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (17, N'Kingston', N'0642987569', N'kingston@gmail.com', N'HCM', N'/Image/Kingston.png', N'hàng chính hãng')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (18, N'GIGABYTE', N'0364125953', N'GIGABYTE@mail.com', N'HCM', N'/Image/GIGABYTE.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Producers] OFF
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'C001', 18, 27, N'Case máy tính Gigabyte AORUS AC300 GLASS', NULL, N'2600000', 0, N'/Image/case-gigabyte-aorus-c300-glass-1.jpg', N'22/11/2019 5:33:34 PM', N'- Loại case: Mid Tower
- Hỗ trợ mainboard: ATX; Micro-ATX; Mini-ITX
- Khay mở rộng tối đa: 2 x 3.5" , 3 x 2.5"
- Cổng USB: 1 x USB 3.1 Gen 2 Type C , 2 x USB 3.0
- Số quạt tặng kèm: 2 x 120 mm')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'C002', 12, 27, N'MSI MPG SEKIRA 500X RGB Mid Tower (Đen)', NULL, N'6400000', 0, N'/Image/MSI MPG SEKIRA 500X RGB.jpg', N'22/11/2019 5:34:33 PM', N'- Hỗ trợ mainboard: Mini-ITX, Micro-ATX, ATX, Extended-ATX
- Khay mở rộng tối đa: 4 x 3.5"3 x 2.5"
- USB: 1 x USB Type C,4 x USB 3.2
- Quạt tặng kèm: 1 x 200 mm, 1 x 120 mm RGB, 3 x 200 mm RGB')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'C003', 11, 27, N'ASUS ROG Strix Helios RGB Mid Tower (Đen)', NULL, N'6990000', 0, N'/Image/ASUS_ROG_Strix_Helios_GX601_1.jpg', N'22/11/2019 5:37:56 PM', N'- Hỗ trợ mainboard: Mini-ITX, Micro-ATX, ATX, Extended-ATX
- Khay mở rộng tối đa: 2 x 3.5"4 x 2.5"
- USB: 1 x USB Type C,4 x USB 3.1
- Quạt tặng kèm: 4 x 140 mm')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU001', 15, 20, N'CPU Intel Core I3-7100 (3.9GHz)', NULL, N'3350000', 0, N'/Image/CPU Intel Core I3_7100(3.9GHz).jpg', N'22/11/2019 4:08:54 PM', N'Tên sản phẩm: Bộ vi xử lý/ CPU Intel Core i3-7100 (3M Cache, 3.9GHz)')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU0010', 16, 20, N'CPU AMD Ryzen 7 3700X', NULL, N'8490000', 5, N'/Image/Ryzen 7-3700x.png', N'22/11/2019 4:42:59 PM', N'- Socket: AM4 , AMD Ryzen thế hệ thứ 3
- Tốc độ xử lý: 3.6GHz - 4.4GHz ( 8 nhân, 16 luồng)
- Bộ nhớ đệm: 32MB')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU0011', 16, 20, N'CPU AMD Ryzen 9 3900X', NULL, N'13090000', 3, N'/Image/amd ryzen 9 3900x_1.jpg', N'22/11/2019 4:45:06 PM', N'- Socket: AM4 , AMD Ryzen thế hệ thứ 3
- Tốc độ xử lý: 3.8GHz - 4.6GHz ( 12 nhân, 24 luồng)
- Bộ nhớ đệm: 64MB')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU0012', 15, 20, N'CPU Intel Core i9-9900k', NULL, N'12990000', 3, N'/Image/cpu_core_i9-9900k.jpg', N'22/11/2019 4:46:16 PM', N'- Socket: LGA 1151-v2 , Intel Core thế hệ thứ 9
- Tốc độ xử lý: 3.6 GHz - 5.0 GHz ( 8 nhân, 16 luồng)
- Bộ nhớ đệm: 16MB
- Đồ họa tích hợp: Intel UHD Graphics 630')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU002', 15, 20, N'CPU Intel Core i3-9100F ', NULL, N'2150000', 5, N'/Image/i3-9100F-logo.jpg', N'22/11/2019 4:29:30 PM', N'Tên sản phẩm: Bộ vi xử lý/ CPU Intel Core i3-9100F (6M Cache, up to 4.20GHz)')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU003', 15, 20, N'CPU Intel Core i5-9400F ', NULL, N'3690000', 5, N'/Image/CPU-Intel-i5-9400F.jpg', N'22/11/2019 4:29:14 PM', N'- Socket: LGA 1151-v2 , Intel Core thế hệ thứ 9
- Tốc độ xử lý: 2.9 - 4.1 GHz ( 6 nhân, 6 luồng)
- Bộ nhớ đệm: 9MB')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU004', 15, 20, N'CPU Intel Core I5-7500 (3.4GHz - 3.8GHz)', NULL, N'5970000', 5, N'/Image/CPU_Intel_i5_7500.jpg', N'22/11/2019 4:33:19 PM', N'Socket: LGA 1151 , Intel Core thế hệ thứ 7
- Tốc độ xử lý: 3.4 GHz - 3.8 GHz ( 4 nhân, 4 luồng)
- Bộ nhớ đệm: 6MB
- Đồ họa tích hợp: Intel HD Graphics 630')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU005', 15, 20, N'CPU INTEL Core i3-9100', NULL, N'3390000', 5, N'/Image/Intel-Core-i3-9100.jpg', N'22/11/2019 4:34:22 PM', N'Socket: 1151, Intel Core thế hệ thứ 9
Tốc độ: 3.60 GHz - 4.20 GHz (4nhân, 4 luồng)
Bộ nhớ đệm: 6MB
Chip đồ họa tích hợp: Intel UHD Graphics 630')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU006', 16, 20, N'CPU AMD Ryzen Athlon 200GE', NULL, N'1350000', 5, N'/Image/CPU-AMD-Athlon-200GE.jpg', N'22/11/2019 4:36:01 PM', N'- Socket: AM4 , AMD Athlon
- Tốc độ xử lý: 3.2 GHz ( 2 nhân, 4 luồng)
- Bộ nhớ đệm: 4MB
- Đồ họa tích hợp: AMD Vega 3 Graphics')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU007', 16, 20, N'CPU AMD Ryzen 5 2400G', NULL, N'4390000', 0, N'/Image/CPU-AMD-Ryzen-5-2400G-3.6-3.9GHz.png', N'22/11/2019 4:38:26 PM', N'- Socket: AM4 , AMD Ryzen thế hệ thứ 2
- Tốc độ xử lý: 3.6 GHz - 3.9 GHz ( 4 nhân, 8 luồng)
- Bộ nhớ đệm: 4MB
- Đồ họa tích hợp: AMD Vega 11 Graphics')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU008', 16, 20, N'CPU AMD Ryzen 3 3200G', NULL, N'2590000', 0, N'/Image/Ryzen 3-3200G.png', N'22/11/2019 4:40:08 PM', N'- Socket: AM4 , AMD Ryzen thế hệ thứ 3
- Tốc độ xử lý: 3.6 GHz up to 4GHz ( 4 nhân, 4 luồng)
- Bộ nhớ đệm: 4MB
- Đồ họa tích hợp: AMD Vega 8 Graphics')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'CPU009', 16, 20, N'CPU AMD Ryzen 5 3600', NULL, N'5190000', 5, N'/Image/AMD-Ryzen-5-3600.jpg', N'22/11/2019 4:41:09 PM', N'- Socket: AM4 , AMD Ryzen thế hệ thứ 3
- Tốc độ xử lý: 3.6GHz - 4.2 GHz ( 6 nhân, 12 luồng)
- Bộ nhớ đệm: 32MB')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'HP001', 11, 41, N'Tai nghe không dây On-ear ASUS Strix Wireless', NULL, N'3190000', 5, N'/Image/1_26_85.jpg', N'22/11/2019 10:27:41 PM', N'- Kết nối không dây 2,4GHz độ trễ thấp
- Chế độ có dây mang lại độ tương thích rộng với nhiều thiết bị
- Thiết kế ăng-ten kép cho phép truyền âm thanh tốt hơn và ổn định hơn
- Âm thanh vòm ảo 7.1
- Thời lượng pin >10 giờ giúp chơi game kéo dài mà không bị gián đoạn
- Điều khiển âm thanh toàn diện với Sonic Studio')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'HP002', 18, 41, N'Tai nghe Over-ear GIGABYTE AORUS H5 RGB', NULL, N'2065000', 5, N'/Image/2017083116490332_src.png', N'22/11/2019 10:30:52 PM', N'- Thiết kế vừa vặn nhỏ gọn - Tích hợp Led RGB 16.7 triệu màu\ - Chất liệu gia công cao cấp cho thời gian sử dụng lâu dài - Cách âm hiệu quả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'HP003', 11, 41, N'Tai nghe Over-ear ASUS ROG Delta', NULL, N'4990000', 5, N'/Image/1568260612.4603674_Asus-ROG-Delta-1.jpg', N'22/11/2019 10:31:28 PM', N'- Tai nghe Asus ROG Delta
- 4 DAC hi-res ESS tích hợp cho âm thanh chi tiết và trung thực
- Đèn RGB viền tùy biến
- Hỗ trợ đa nền tảng với USB-C và USB 2.0')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'LTDN001', 11, 18, N'Laptop Asus Vivobook S14 S430FN EB010T Gun Metal', NULL, N'20390000', 10, N'/Image/Laptop Asus Vivobook S14 S430FN EB010T Gun Metal.png', N'22/11/2019 3:58:57 PM', N'không mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'LTG001', 10, 16, N'Laptop Gaming Acer Nitro 5 2019 AN515-43 R84R', NULL, N'18990000', 10, N'/Image/Laptop Gaming Acer Nitro 5 2019 AN515-43 R84R.jpg', N'22/11/2019 3:50:27 PM', N'Không có mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'LTG002', 10, 16, N'Laptop Gaming Acer Nitro 5 2019 AN515-52 53PC', NULL, N'18990000', 10, N'/Image/Laptop Gaming Acer Nitro 5 2019 AN515-52 53PC.png', N'22/11/2019 3:53:36 PM', N'không mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'LTVP001', 11, 17, N'Laptop Asus Vivobook X507MA BR072T Silver', NULL, N'6490000', 10, N'/Image/Laptop Asus Vivobook X507MA BR072T Silver.jpg', N'22/11/2019 3:55:54 PM', N'không mô tả')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MB001', 11, 21, N'Mainboard ASUS ROG Strix Z390-F Gaming', NULL, N'5590000', 2, N'/Image/Asus_ROG_Strix_Z390-F_Gaming_1.jpg', N'22/11/2019 5:19:45 PM', N'- Chuẩn mainboard: ATX
- Socket: LGA 1151-v2 , Chipset: Z390
- Hỗ trợ RAM: DDR4 , tối đa 64GB
- Cổng cắm lưu trữ: 1 x M.2 NVMe; 1 x M.2 SATA/NVMe; 6 x SATA 3 6Gb/s; Hỗ trợ Intel Optane
- Cổng xuất hình: 1 x DisplayPort; 1 x HDMI')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MB002', 12, 21, N'Mainboard MSI MPG Z390 Gaming Plus', NULL, N'4090000', 0, N'/Image/z390_gaming_plus_1.jpg', N'22/11/2019 5:20:50 PM', N'- Chuẩn mainboard: ATX
- Socket: LGA 1151-v2 , Chipset: Z390
- Hỗ trợ RAM: DDR4 , tối đa 64GB
- Cổng cắm lưu trữ: 2 x M.2 SATA/NVMe; 6 x SATA 3 6Gb/s; Hỗ trợ Intel Optane
- Cổng xuất hình: 1 x DVI-D; 1 x HDMI')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MB003', 15, 21, N'Mainboard Intel Server Board S1200SPSR', NULL, N'3990000', 0, N'/Image/intel-s1200-spsr-1.jpg', N'22/11/2019 5:21:36 PM', N'- Chuẩn mainboard: Micro-ATX
- Socket: LGA 1151 , Chipset: C232
- Hỗ trợ RAM: DDR4 , tối đa 64GB
- Cổng cắm lưu trữ: 6 x SATA 3 6Gb/s
- Cổng xuất hình: 1 x VGA/D-sub')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHC001', 10, 40, N'Màn hình cong ACER 32 inch ED322QR', NULL, N'9920000', 2, N'/Image/Acer_32_ED322QR_1.jpg', N'22/11/2019 5:15:04 PM', N'- Kích thước: 32"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: VA
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 144Hz
- Thời gian phản hồi: 4 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHC002', 11, 40, N'Màn Hình cong ASUS 34" MX34VQ', NULL, N'22990000', 0, N'/Image/lcd asus 34 mx34vq_1.jpg', N'22/11/2019 5:16:02 PM', N'- Kích thước: 34"
- Độ phân giải: 3440 x 1440 ( 21:9 )
- Công nghệ tấm nền: VA
- Góc nhìn: 178 (H) / 178 (V)
- Thời gian phản hồi: 4 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHDH001', 11, 37, N'Màn Hình ASUS 21.5" VZ229H', NULL, N'3190000', 0, N'/Image/Asus_21.5_VZ229H_1.jpg', N'22/11/2019 5:07:30 PM', N'- Kích thước: 21.5"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: IPS
- Góc nhìn: 178 (H) / 178 (V)
- Thời gian phản hồi: 5 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHDH002', 9, 37, N'Màn Hình Dell 23" S2319H ', NULL, N'3600000', 0, N'/Image/dell 23 s2319h_1.jpg', N'22/11/2019 5:08:16 PM', N'- Kích thước: 23"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: IPS
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 60Hz
- Thời gian phản hồi: 5 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHG001', 12, 36, N'Màn Hình MSI Optix 32" AG32C', NULL, N'8160000', 0, N'/Image/msi 32 optix ag32c_1.jpg', N'22/11/2019 4:52:52 PM', N'- Kích thước: 32"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: VA
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 165Hz
- Thời gian phản hồi: 1 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHG002', 12, 36, N'Màn Hình cong MSI Optix 27" MAG271C ', NULL, N'7960000', 0, N'/Image/msi 27 optix mag271c_1.jpg', N'22/11/2019 4:53:45 PM', N'- Kích thước: 27"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: VA
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 144Hz
- Thời gian phản hồi: 1 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHG003', 12, 36, N'Màn Hình cong MSI Optix 27" Optix G27C2 ', NULL, N'6990000', 0, N'/Image/msi 27 optix g27c2_1.jpg', N'22/11/2019 4:54:38 PM', N'- Kích thước: 27"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: VA
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 144Hz
- Thời gian phản hồi: 1 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHG004', 12, 36, N'Màn hình LCD MSI Optix 31.5 inch MAG321CQR ', NULL, N'10990000', 0, N'/Image/MSI_31.5_Optix_MAG321CQR_1.jpg', N'22/11/2019 4:55:33 PM', N'- Kích thước: 31.5"
- Độ phân giải: 2560 x 1440 ( 16:9 )
- Công nghệ tấm nền: VA
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 144Hz
- Thời gian phản hồi: 1 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHG005', 11, 36, N'Màn hình LCD Asus 27 inch VG279Q', NULL, N'9990000', 3, N'/Image/Asus_27_VG279Q_1.jpg', N'22/11/2019 5:03:09 PM', N'- Kích thước: 27"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: IPS
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 144Hz
- Thời gian phản hồi: 1 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHG006', 11, 36, N'Màn hình ASUS 23.6" VP247H', NULL, N'3490000', 0, N'/Image/asus 23.6 vp247h_1.jpg', N'22/11/2019 5:05:48 PM', N'- Kích thước: 23.6"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Góc nhìn: 170 (H) / 160 (V)
- Thời gian phản hồi: 1 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHPT001', 13, 39, N'Màn Hình HP 20.7" V214b 3FU54AA', NULL, N'2070000', 0, N'/Image/HP_V214b_3FU54AA_1.jpg', N'22/11/2019 5:12:59 PM', N'- Kích thước: 20.7"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: TN
- Góc nhìn: 90 (H) / 65 (V)
- Tần số quét: 60Hz
- Thời gian phản hồi: 5 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHPT002', 13, 39, N'Màn Hình HP 21.5" 22fw 3KS61AA', NULL, N'3490000', 0, N'/Image/HP_21.5_22fw_3KS61AA_1.jpg', N'22/11/2019 5:13:42 PM', N'- Kích thước: 21.5"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: IPS
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 60Hz
- Thời gian phản hồi: 5 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHVP001', 10, 38, N'Màn hình Acer 21.5" HA220QA', NULL, N'2890000', 0, N'/Image/màn-hình-lcd-acer-21.5-ha220qa-1.jpg', N'22/11/2019 5:09:42 PM', N'- Kích thước: 21.5"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: IPS
- Góc nhìn: 178 (H) / 178 (V)
- Tần số quét: 75Hz (V) / 86Hz (H)
- Thời gian phản hồi: 4 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'MHVP002', 11, 38, N'Màn Hình ASUS 23.8" VZ249HE ', NULL, N'3590000', 0, N'/Image/asus 23.8 vz249he_1.jpg', N'22/11/2019 5:11:34 PM', N'- Kích thước: 23.8"
- Độ phân giải: 1920 x 1080 ( 16:9 )
- Công nghệ tấm nền: IPS
- Góc nhìn: 178 (H) / 178 (V)
- Thời gian phản hồi: 5 ms')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'OC001', 15, 29, N'Ổ cứng SSD Intel 540s 360GB 2.5" SATA 3', NULL, N'2720000', 3, N'/Image/SSD Intel 540s.jpg', N'22/11/2019 5:43:00 PM', N'- Dung lượng: 360GB
- Kích thước: 2.5"
- Kết nối: SATA 3
- Tốc độ đọc / ghi (tối đa): 560MB/s / 480MB/s')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'OC002', 14, 29, N'Ổ cứng HDD Lenovo 1TB 2.5" SAS 3', NULL, N'7560000', 0, N'/Image/lenovo.jpg', N'22/11/2019 5:44:16 PM', N'- Dung lượng: 1TB
- Kích thước: 2.5"
- Kết nối: SAS 3
- Tốc độ vòng quay: 7200RPM')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'PSU001', 18, 24, N'Nguồn máy tính GIGABYTE PB500', NULL, N'1250000', 0, N'/Image/gigabyte-500w-gp-pb500-1.jpg', N'22/11/2019 5:31:16 PM', N'- Công suất: 500W
- Chuẩn hiệu suất: 80 Plus Bronze
- Quạt: 1 x 120 mm')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'PSU002', 18, 24, N'Nguồn máy tính GIGABYTE PW400', NULL, N'790000', 0, N'/Image/power-gigabyte-400w-(gp-pw400)-1.jpg', N'22/11/2019 5:32:03 PM', N'- Công suất: 400W
- Chuẩn hiệu suất: 80 Plus
- Quạt: 1 x 120 mm')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'R001', 17, 22, N'RAM Kingston Hyper X Predator 2x8GB DDR4 3200MHz', NULL, N'2890000', 0, N'/Image/ram_kingston_16gb_2x8gb.jpg', N'22/11/2019 5:25:43 PM', N'- Dung lượng: 2 x 8GB
- Thế hệ: DDR4
- Bus: 3200MHz
- Cas: 17')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'TN001', 11, 28, N'Tản nước AIO ASUS ROG RYUJIN 360', NULL, N'7490000', 0, N'/Image/asus rog ryujin 360_1.jpg', N'22/11/2019 5:39:32 PM', N'- OLED màu 1,77” để hiển thị dữ liệu thống kê hệ thống theo thời gian thực và hình ảnh hoặc hoạt ảnh cá nhân hóa - Quạt mini tích hợp giúp làm mát khu vưc VRM và M.2 lên tới 20°C - 3 quạt tản nhiệt Noctua iPPC 2000 PWM 120mm - Trung tâm điều khiển một chạm LiveDash đối với đèn và màn hình OLED - LED RGB và vỏ bơm mạ NCVM làm nổi bật vẻ đẹp, hiện đại - Được thiết kế tinh tế để bổ sung cho bo mạch chủ ROG tại tầng trung tâm giàn máy của bạn - Ống dẫn được bọc ngoài, gia cường để tăng thêm độ bền.')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'TN002', 12, 28, N'Tản khí MSI Core Frozr S', NULL, N'1120000', 0, N'/Image/Quat-CPU-MSI-Core-Frozr-S-1.jpg', N'22/11/2019 5:40:44 PM', N'- Tên sản phẩm: Core Frozr S
- Dạng tản nhiệt: Tản khí')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'VGA001', 11, 23, N'Card màn hình ASUS GeForce RTX 2080Ti', NULL, N'40510000', 1, N'/Image/1566974022.2271876_Asus_Rog_Strix_GeForce_RTX_2080_Ti_OC_edition_11GB_GDDR6_ROG-STRIX-RTX2080TI-O11G-GAMING_1.jpg', N'22/11/2019 5:27:45 PM', N'- Chip đồ họa: NVIDIA GeForce RTX 2080Ti
- Bộ nhớ: 11GB GDDR6 ( 352-bit )
- GPU clock OC Mode - GPU Boost Clock : 1665 MHz , GPU Base Clock : 1350 MHz Gaming Mode (Default) - GPU Boost Clock : 1650 MHz , GPU Base Clock : 1350 MHz
- Nguồn phụ: 2 x 8-pin')
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proSize], [proPrice], [proDiscount], [proPhoto], [proUpdateDate], [proDescription]) VALUES (N'VGA002', 12, 23, N'Card màn hình MSI GeForce GTX 1650 4GB GDDR5 Gaming X', NULL, N'4350000', 0, N'/Image/msi-gtx-1650-gaming-x-4gb-gddr5-1.jpg', N'22/11/2019 5:28:42 PM', N'- Chip đồ họa: NVIDIA GeForce GTX 1650
- Bộ nhớ: 4GB GDDR5 ( 128-bit )
- GPU clock Boost: 1860 MHz
- Nguồn phụ: 1 x 6-pin')
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (16, 5, N'Laptop Gaming')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (17, 5, N'Laptop Văn Phòng')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (18, 5, N'Laptop Doanh Nhân')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (20, 6, N'CPU - Bộ vi xử lý')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (21, 6, N'Mainboard - Bo mạch chủ')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (22, 6, N'Ram')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (23, 6, N'VGA - Card màn hình')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (24, 6, N'PSU - Nguồn')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (27, 6, N'Case máy tính')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (28, 6, N'Tản nhiệt')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (29, 6, N'Ổ cứng')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (30, 7, N'Chuột Gaming')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (31, 7, N'Chuột văn phòng')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (32, 7, N'Bàn phím Gaming')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (33, 7, N'Bàn phím văn phòng')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (34, 7, N'Ghế Gaming')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (35, 7, N'Lót chuột')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (36, 8, N'Màn hình Gaming')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (37, 8, N'Màn hình Thiết kế/đồ họa')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (38, 8, N'Màn hình Văn phòng')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (39, 8, N'Màn hình Phổ thông')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (40, 8, N'Màn hình Cong')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (41, 7, N'Tai nghe')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'LTG001', 4)
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cusPhone])
REFERENCES [dbo].[Customers] ([cusPhone])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([pdcID])
REFERENCES [dbo].[Producers] ([pdcID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([typeID])
REFERENCES [dbo].[ProductTypes] ([typeID])
GO
ALTER TABLE [dbo].[ProductTypes]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Categories] ([cateID])
GO
ALTER TABLE [dbo].[Rates]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
USE [master]
GO
ALTER DATABASE [Shopper] SET  READ_WRITE 
GO
