USE [MVC_DB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 15-09-2023 11:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 15-09-2023 11:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[CName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Countries] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 15-09-2023 11:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](20) NOT NULL,
	[EmployeeAge] [int] NOT NULL,
	[EmployeeEmail] [nvarchar](max) NOT NULL,
	[EmpPassword] [nvarchar](max) NOT NULL,
	[EmpConfirmPassword] [nvarchar](max) NOT NULL,
	[Decimal] [decimal](18, 2) NOT NULL,
	[EmpOrganisationName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[JoningDate] [nvarchar](max) NULL,
	[JoiningTime] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees_ADO]    Script Date: 15-09-2023 11:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees_ADO](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NULL,
	[EmployeeAge] [int] NULL,
	[EmployeeEmail] [varchar](50) NULL,
	[EmpPassword] [varchar](50) NULL,
	[EmpConfirmPassword] [varchar](50) NULL,
	[Decimal] [decimal](18, 0) NULL,
	[EmpOrganisationName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[JoningDate] [varchar](50) NULL,
	[JoiningTime] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 15-09-2023 11:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[Cid] [int] NOT NULL,
	[SName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.States] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 15-09-2023 11:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [int] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Cid], [CName]) VALUES (1, N'India')
INSERT [dbo].[Countries] ([Cid], [CName]) VALUES (2, N'Shrilanka')
INSERT [dbo].[Countries] ([Cid], [CName]) VALUES (3, N'Usa')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmployeeAge], [EmployeeEmail], [EmpPassword], [EmpConfirmPassword], [Decimal], [EmpOrganisationName], [Address], [JoningDate], [JoiningTime]) VALUES (1, N'Sunil', 22, N'gulshankumar.mailid01@gmail.com', N'Gulshan@123', N'Gulshan@123', CAST(44.99 AS Decimal(18, 2)), N'ABC Organisation', N'H', N'2023-07-15', N'21:59')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmployeeAge], [EmployeeEmail], [EmpPassword], [EmpConfirmPassword], [Decimal], [EmpOrganisationName], [Address], [JoningDate], [JoiningTime]) VALUES (7, N'Gulshan Kumar', 22, N'gulshankumar.mailid01@gmail.com', N'Gulshan@123', N'Gulshan@123', CAST(999.99 AS Decimal(18, 2)), N'ABC Organisation', N'Tani Bagh', N'2023-07-15', N'11:45')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmployeeAge], [EmployeeEmail], [EmpPassword], [EmpConfirmPassword], [Decimal], [EmpOrganisationName], [Address], [JoningDate], [JoiningTime]) VALUES (8, N'Gulshan Kumar', 22, N'gulshankumar.mailid01@gmail.com', N'Gulshan@123', N'Gulshan@123', CAST(999.99 AS Decimal(18, 2)), N'ABC Organisation', N'Haj', N'2023-07-15', N'11:46')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmployeeAge], [EmployeeEmail], [EmpPassword], [EmpConfirmPassword], [Decimal], [EmpOrganisationName], [Address], [JoningDate], [JoiningTime]) VALUES (10, N'Rohit Kumar', 28, N'rohit@gmail.com', N'Rohit@123', N'Rohit@123', CAST(111.11 AS Decimal(18, 2)), N'ABC Organisation', N'GH', N'2023-07-15', N'22:06')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees_ADO] ON 

INSERT [dbo].[Employees_ADO] ([EmployeeId], [EmployeeName], [EmployeeAge], [EmployeeEmail], [EmpPassword], [EmpConfirmPassword], [Decimal], [EmpOrganisationName], [Address], [JoningDate], [JoiningTime]) VALUES (1, N'Gulshan', 28, N'gulshankumar.mailid01@gmail.com', N'Gulshan@123', N'Gulshan@123', CAST(25 AS Decimal(18, 0)), N'ABC Organization', N'Mahindra Park', N'4/5/1996', N'4:47')
SET IDENTITY_INSERT [dbo].[Employees_ADO] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (1, 1, N'Delhi')
INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (2, 1, N'Uttar Pradesh')
INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (3, 1, N'Bihar')
INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (4, 2, N'Colombo')
INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (5, 2, N'Anuradhapura')
INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (6, 2, N'Kandy')
INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (7, 3, N'California')
INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (8, 3, N'Taxas')
INSERT [dbo].[States] ([Sid], [Cid], [SName]) VALUES (9, 3, N'Florida')
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Country], [State]) VALUES (1, 3, 0)
INSERT [dbo].[Students] ([Id], [Country], [State]) VALUES (2, 2, 5)
INSERT [dbo].[Students] ([Id], [Country], [State]) VALUES (3, 1, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
USE [master]
GO
ALTER DATABASE [MVC_DB] SET  READ_WRITE 
GO