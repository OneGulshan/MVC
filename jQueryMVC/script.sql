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
