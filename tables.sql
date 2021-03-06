USE [master]
GO
/****** Object:  Database [hsi]    Script Date: 3/3/2022 15:05:34 ******/
CREATE DATABASE [hsi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hsi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\hsi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hsi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\hsi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [hsi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hsi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hsi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hsi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hsi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hsi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hsi] SET ARITHABORT OFF 
GO
ALTER DATABASE [hsi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hsi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hsi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hsi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hsi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hsi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hsi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hsi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hsi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hsi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hsi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hsi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hsi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hsi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hsi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hsi] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [hsi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hsi] SET RECOVERY FULL 
GO
ALTER DATABASE [hsi] SET  MULTI_USER 
GO
ALTER DATABASE [hsi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hsi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hsi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hsi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hsi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hsi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'hsi', N'ON'
GO
ALTER DATABASE [hsi] SET QUERY_STORE = OFF
GO
USE [hsi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/3/2022 15:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemdata]    Script Date: 3/3/2022 15:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemdata](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[itemname] [nvarchar](max) NULL,
	[cedula] [nvarchar](max) NULL,
	[itemnum] [int] NOT NULL,
	[itemtypegroupnum] [int] NOT NULL,
	[itemtypenum] [int] NOT NULL,
 CONSTRAINT [PK_itemdata] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemdatapage]    Script Date: 3/3/2022 15:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemdatapage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[itemnum] [int] NOT NULL,
	[logicalplatternum] [int] NOT NULL,
	[diskgroupnum] [int] NOT NULL,
	[FILEPATH] [nvarchar](max) NULL,
 CONSTRAINT [PK_itemdatapage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[physicalplatter]    Script Date: 3/3/2022 15:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[physicalplatter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[logicalplatternum] [int] NOT NULL,
	[physicalplatternum] [int] NOT NULL,
	[diskgroupnum] [int] NOT NULL,
	[LASTUSEDDRIVE] [nvarchar](max) NULL,
 CONSTRAINT [PK_physicalplatter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerInfo]    Script Date: 3/3/2022 15:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerInfo](
	[itemname] [nvarchar](max) NULL,
	[PATH] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220228180006_FirstMigration', N'3.1.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220228210002_SecondMigration', N'5.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220301025549_FirstMigration', N'5.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220301183300_SecondMigration', N'5.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220301183636_ThirdMigration', N'5.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220301184801_FourthMigration', N'5.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220301184951_FirstMigration', N'5.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220301185659_FirstMigration', N'5.0.2')
GO
SET IDENTITY_INSERT [dbo].[itemdata] ON 

INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (1, N'hulk', N'402-3052091-5', 2, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (2, N'spiderman', N'402-3052091-4', 3, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (3, N'thor', N'402-3052091-6', 4, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (4, N'paisaje', N'402-3052091-7', 5, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (5, N'francia', N'402-3052091-8', 6, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (6, N'acap', N'402-3052091-9', 7, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (7, N'montana', N'402-3052092-1', 8, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (8, N'newyork', N'402-3052092-2', 9, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (9, N'amazonas', N'402-3052092-3', 10, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (10, N'bigpapi', N'402-3052092-4', 11, 2, 3)
INSERT [dbo].[itemdata] ([Id], [itemname], [cedula], [itemnum], [itemtypegroupnum], [itemtypenum]) VALUES (11, N'rd', N'402-3052092-5', 12, 2, 3)
SET IDENTITY_INSERT [dbo].[itemdata] OFF
GO
SET IDENTITY_INSERT [dbo].[itemdatapage] ON 

INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (1, 2, 2, 2, N'static3.cbrimages.com/wordpress/wp-content/uploads/2020/06/Hulk-Cropped.jpg')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (2, 3, 3, 3, N'financerewind.com/wp-content/uploads/2020/12/maxresdefault-12.jpg')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (3, 4, 4, 4, N'www.denofgeek.com/wp-content/uploads/2021/05/thor.jpg?fit=1600,1100')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (4, 5, 5, 5, N'4.bp.blogspot.com/-YXo5Lvhv-Lk/WPKWHvy64ZI/AAAAAAAAABQ/2oTYMy1j_RQusMus70DW_KZbvIYETOn6ACLcB/w1200-h630-p-k-no-nu/9DB.webp')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (5, 6, 6, 6, N'www.culturaviajera.org/wp-content/uploads/2018/03/Mejores-6-lugares-tur%C3%ADsticos-en-Francia.jpg')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (6, 7, 7, 7, N'invertix.com.do/wp-content/uploads/2018/03/02AsociacionCibao-1.jpg')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (7, 8, 8, 8, N'i.pinimg.com/736x/ec/9e/e8/ec9ee851e86454c1dc67d3b4a2d8b90d.jpg')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (8, 9, 9, 9, N'meetingsource.com/wp-content/uploads/job-manager-uploads/featured_image/2016/12/New-York_421599910.jpg')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (9, 10, 10, 10, N'wallpaperaccess.com/full/4736716.jpg')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (10, 11, 11, 11, N'cdn.sportsbreak.com/eyJidWNrZXQiOiJwdWItc3RvcmFnZSIsImtleSI6InNwb3J0c2JyZWFrL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE5LzAxLzEzMDU2ODE5LmpwZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MjU0OCwiaGVpZ2h0IjoxNTQ1LCJmaXQiOiJjb3ZlciIsImJhY2tncm91bmQiOnsiciI6MCwiZyI6MCwiYiI6MCwiYWxwaGEiOjF9LCJwb3NpdGlvbiI6InRvcCJ9fX0=')
INSERT [dbo].[itemdatapage] ([Id], [itemnum], [logicalplatternum], [diskgroupnum], [FILEPATH]) VALUES (11, 12, 12, 12, N'www.pixelstalk.net/wp-content/uploads/2016/10/Dominican-Flag-Wallpapers-HD.jpg')
SET IDENTITY_INSERT [dbo].[itemdatapage] OFF
GO
SET IDENTITY_INSERT [dbo].[physicalplatter] ON 

INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (1, 2, 1, 2, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (2, 3, 1, 3, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (3, 4, 1, 4, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (4, 5, 1, 5, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (5, 6, 1, 6, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (6, 7, 1, 7, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (7, 8, 1, 8, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (8, 9, 1, 9, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (9, 10, 1, 10, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (10, 11, 1, 11, N'https://')
INSERT [dbo].[physicalplatter] ([Id], [logicalplatternum], [physicalplatternum], [diskgroupnum], [LASTUSEDDRIVE]) VALUES (11, 12, 1, 12, N'https://')
SET IDENTITY_INSERT [dbo].[physicalplatter] OFF
GO
/****** Object:  StoredProcedure [dbo].[GetPowerInfo]    Script Date: 3/3/2022 15:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPowerInfo] @itemtypegroupnum int, @itemtypenum int
AS
Select distinct DATA.itemname, RTRIM(phy.LASTUSEDDRIVE) + RTRIM(idp.FILEPATH) PATH 
from itemdata DATA
INNER JOIN itemdatapage idp with(nolock) ON DATA.itemnum = idp.itemnum
INNER JOIN physicalplatter phy with(nolock) ON idp.diskgroupnum = phy.diskgroupnum AND idp.logicalplatternum = phy.logicalplatternum and
phy.physicalplatternum = 1
where data.itemtypegroupnum = @itemtypegroupnum and data.itemtypenum=@itemtypenum;
GO
/****** Object:  StoredProcedure [dbo].[GetPowerInfoCedula]    Script Date: 3/3/2022 15:05:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPowerInfoCedula] @itemtypegroupnum int, @itemtypenum int, @cedula varchar(50)
AS
Select distinct DATA.cedula, DATA.itemname, RTRIM(phy.LASTUSEDDRIVE) + RTRIM(idp.FILEPATH) PATH 
from itemdata DATA
INNER JOIN itemdatapage idp with(nolock) ON DATA.itemnum = idp.itemnum
INNER JOIN physicalplatter phy with(nolock) ON idp.diskgroupnum = phy.diskgroupnum AND idp.logicalplatternum = phy.logicalplatternum and
phy.physicalplatternum = 1
where data.itemtypegroupnum = @itemtypegroupnum and data.itemtypenum=@itemtypenum and data.cedula = @cedula;
GO
USE [master]
GO
ALTER DATABASE [hsi] SET  READ_WRITE 
GO
