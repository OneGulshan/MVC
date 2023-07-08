USE [master]
GO
/****** Object:  Database [MVCDB]    Script Date: 08-07-2023 19:22:26 ******/
CREATE DATABASE [MVCDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVCDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVCDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVCDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MVCDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVCDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MVCDB] SET  MULTI_USER 
GO
ALTER DATABASE [MVCDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVCDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVCDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVCDB', N'ON'
GO
ALTER DATABASE [MVCDB] SET QUERY_STORE = OFF
GO
USE [MVCDB]
GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 08-07-2023 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Country](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 08-07-2023 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[empid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[age] [int] NULL,
	[country] [int] NULL,
	[state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_State]    Script Date: 08-07-2023 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_State](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[sname] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Country] ON 
GO
INSERT [dbo].[tbl_Country] ([cid], [cname]) VALUES (1, N'India')
GO
INSERT [dbo].[tbl_Country] ([cid], [cname]) VALUES (2, N'Pakistan')
GO
INSERT [dbo].[tbl_Country] ([cid], [cname]) VALUES (3, N'USA')
GO
SET IDENTITY_INSERT [dbo].[tbl_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employee] ON 
GO
INSERT [dbo].[tbl_Employee] ([empid], [name], [address], [age], [country], [state]) VALUES (2, N'Gulshan Kumar', N'Rani Bagh', 25, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_State] ON 
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (1, 1, N'Delhi')
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (2, 1, N'Uttar Pradesh')
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (3, 1, N'Gujrat')
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (4, 2, N'Balochistan')
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (5, 2, N'Khyber Pakhtunkhwa')
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (6, 2, N'Punjab')
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (7, 3, N'California')
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (8, 3, N'Texas')
GO
INSERT [dbo].[tbl_State] ([sid], [cid], [sname]) VALUES (9, 3, N'Washington')
GO
SET IDENTITY_INSERT [dbo].[tbl_State] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Employee]    Script Date: 08-07-2023 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Employee]
@mode int=0,
@cid int=0,
@empid int=0,
@cntid int=0,
@name varchar(50)=null,
@address varchar(50)=null,
@age int=0,
@country int=0,
@state int=0
as
begin
if(@mode=1)
begin
insert into tbl_Employee(name,address,age,country,state)values(@name,@address,@age,@country,@state)
end
if(@mode=2)
begin
select * from tbl_Employee join tbl_Country on tbl_Employee.country=tbl_Country.cid join tbl_State on tbl_Employee.state=tbl_State.sid
end
if(@mode=3)
begin
delete from tbl_Employee where empid=@empid
end
if(@mode=4)
begin
select * from tbl_Employee where empid=@empid
end
if(@mode=5)
begin
update tbl_Employee set name=@name,address=@address,age=@age,country=@country,state=@state where empid=@empid
end
if(@mode=6)
begin
select * from tbl_Country
end
if(@mode=7)
begin
select * from tbl_State where cid=@cid
end
end
GO
USE [master]
GO
ALTER DATABASE [MVCDB] SET  READ_WRITE 
GO
