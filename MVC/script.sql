USE [master]
GO
/****** Object:  Database [MVC_DB]    Script Date: 15-07-2023 23:41:45 ******/
CREATE DATABASE [MVC_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MVC_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVC_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MVC_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVC_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVC_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVC_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVC_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVC_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVC_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MVC_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVC_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVC_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVC_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MVC_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC_DB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MVC_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MVC_DB] SET  MULTI_USER 
GO
ALTER DATABASE [MVC_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVC_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVC_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MVC_DB] SET QUERY_STORE = OFF
GO
USE [MVC_DB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 15-07-2023 23:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 15-07-2023 23:41:46 ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 15-07-2023 23:41:46 ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 15-07-2023 23:41:46 ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 15-07-2023 23:41:46 ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202307141837592_InitialCreate', N'MVC.Data.DataContext', 0x1F8B0800000000000400CD58DB72DB36107DEF4CFF81C3A776C6117D79493D5432AA64779C46962674FC0E912B1953106001D095BE2D0FFDA4FE4217BC0BD48592EC38A3171197B36717E09E5DFEF7ED5FFFE33266CE33484505EFBB17BD73D7011E8A88F245DF4DF5FCDD7BF7E3879F7FF26FA278E93C96EBAECC3ADCC955DF7DD23AB9F63C153E414C542FA6A1144ACC752F14B14722E15D9E9FFFE65D5C7880102E62398EFF25E59AC6903DE0E350F010129D1236161130558CE34C90A13AF72406959010FAEEF871D81B114D5C67C02841FB01B0B9EB10CE85261AD95D7F55106829F822487080B0875502B86E4E988282F575BDBCAB03E797C601AFDE584285A9D2223E10F0E2AA8888676F3F2AAE6E15318CD90DC656AF8CD759DCFAEE4D9C30B10274DE36763D64D22CCCC39A07BF572E3F7370F0AC3A74BC1BE677E60C53A653097D0EA996849D39D374C668F827AC1EC45FC0FB3C65AC490829E1DCDA000E4DA54840EAD517985B34EF22D7F1D6F77B3640B57DC3DEDCA13BAEAF2E5DE71EC9901983EAFC1BCE075A48F8033848A2219A12AD41E2F1DD459045B0C5628B4DF3545AC58B876F8EEB8CC9F233F0857EEABB97F8AADCD22544E54041E42BA7F89EE11E2D53D840B49BF1C102F679DC0DE8262694ED7003FFBE921F53A2D43F42466F621C53CF9CCAF8ED388C20A431A9225F3D4E25FE2BB2F27BD7094262208F3ADF895C104E5576E9F75CD6AE4EEEB6398822094ABDBA9D4F822330AAC1EBBBF4495063EB81BE78F87CAF4ED8ED348EF753138A29AABC2E287D660C967A433A47E92B32BA2A4CAD3B956306A0AD971F8FAA26914B6AAF568D4D6C2B5EB5567BB95897A2EE6D51757F4C920403D750F962C40972891FBE0B0E57C138C7F042B5410C2BB695254CFD6401D62C9A46A6B7542A6DE23C23E6E88651DC5AD63C852D112E2DD981B675B08E7BB9C3FCCF7795B54E7D16D6EE3A76B7E84E8CBA957906158B86F8B7B666E5156144EED0D2A16069CCF7E97317B43CF16CC2CB670E47CCA46F13603671385EA1809B108BA983306B49B110EB8983F05A4A65C1B6E6BBA357A2D384AC060F62D9D61A8B667B4177FC4A579A98D560779CA66E34A19AE387A035A4611DAE31D1C6F33DEBDDB55383D7CA0D56556C279B5D79DA5E5259AFF2B59597FD2247EE6FC95A49335F626A18F14C2393308395D210E7C92CF89B0D19457FEB0563BC1273503A6F20B064BEB8B4FABB1FA7D7F2948A58C786EBCDBB206AA2BCB7CF39B26568D692FC99C8F089C856EB737A5F93F9F0125D4DC9F197982C7F7D894EE564C02DDDC769B85647117DC78E622BF123BA8693B0DA9DC18970ADEAFF00BCC32AFC7609DAAD86DF59C2E719192FC34CA00339D146F17F6485DF5608DF6B7EDAF347A0E8A286301FFA3884E6D6D4A0E59A3B3E1765D8D1BB26A37289752A63D024C2200DA4A673126A9C0EF102654DD9236169E6E30CA23B3E497592EA815210CFD8DA871DDFDB6D3F6B63D639FB93C43CA99770016952740126FCF794B2A8E27DDB7E11B74198FB52247764854D29C22D5615D2BDE01D818AF08D20016EA4E101F08220989AF0803CC331DCB01FFD0C0B12AE4AA1DF0EB2FF20D6C3EE8F28594812AB02A3DE6F3E577BE67BF587FF01602D0869E1160000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202307151733461_Init', N'MVC.Data.DataContext', 0x1F8B0800000000000400CD5ACD6EE33610BE17E83B083AB540D672BC976D20EF22759222DB7512AC92DC6969EC10954897A452FBD9F6D047EA2B74A8FF5F5BB2633BC82111C9F9663833E4FC30FFFDF8D7FEB20A7CE31584A49C8DCDF3C1D03480B9DCA36C31364335FFF0C9FCF2F9E79FEC6B2F5819CFE9BA8F7A1D523239365F945A5E5896745F20207210505770C9E76AE0F2C0221EB746C3E16FD6F9B9050861229661D8DF43A66800D1077E4E387361A942E24FB907BE4CC671C689508D3B12805C1217C6E6F47932B8228A98C6A54F09F277C09F9B06618C2BA250BA8B27098E129C2D9C250E10FF71BD045C3727BE8444EA8B7C79D70D0C477A03564E9842B9A1543CE80978FE31D1885525DF49AF66A631D4D935EA56ADF5AE23BD8DCD0947758BB56954795D4C7CA1D7C55A8D753F48569F19387696991C3D43FF9C1993D057A18031835009E29F190FE1CCA7EE9FB07EE47F011BB3D0F78BE2A04038571AC0A107C19720D4FA3BCC5321A9671A5699D0AA52667445A27807B74C7D1C99C61DB227331F327B1776EB282EE00F60208802EF81280502CD75EB41A4B11AFB2A33FD2B65871E8647C434A664F50DD842BDA00EC9CA346EE80ABC742411E189513C5148A44408652EB6955B6BA30DAF83A5CFD7001D8D982E3FB61553BEB73B18B3487B2C9BA63CB7987634EC64D99AA0DD985F2E60DB8EBB015D0784FA6FE0A1FDD93F1029FFE1C23B09730C1F732A82D3C970052E0D48A6F9ECF341E05F4964FD641A8E4B34E44EF6BD170BC2A88C9CFE00F7509DE7A5E70990F2E07CBE7286C018D10FBFA5AF9C6A5E8FF474D7B8A3A28D76BAC3A3B5C7BEC09D5DC2B073D430BC9DD96600E79471DC51A1DE67671788561FDB097689DEC78CDA5942BB971BA8C29DD30562B38D310829427147694CC01A458FC1AAC9D858A324F696893B95658D311D50D51DE722C495CF209BB13623A439826CC0C893CB2D2089CE6A00C9F856EAC4F71BE89399267D679ACDCB422BAE0BD3FAD16A2920ED29592EF178170ACA64C470E26A72F2C1E95F70053186E5CA86BA2B9336E384BE4E165099D526F5E0860AA9B4A7CC88F6B68917D49615FDA845BD29A7B2AB548F79AEF474BDFE3BA6498BEA410B71AEB81BDC4B80A68AB6059908AD6C235A9DF810D1748F4FB81F06ACB502DC481F5FE3258478A88E615B15F1ABCAB16ADAA95C7F55657732457EE6763246762CFB5BA39DB44D9DC5EAABA8D3F68AAE0B5ADD46E599FE8851B1D404184DF4C74B6AA626C464AA17665E845410F3895E78B5DAA6025B9BEF8E9E952945C86CB09794F5EAA422667D4177FCAC1229626683DD718A954611AA38DE07AD504C94E10A13EFE62A8A23F44ED7502369873BA885AE4DA14E351E3494229BE8F78D274EDD719D77164FD23469473336127732640B659B2AAB31A45FECC832DA92319BD3DC8D0655B5A3DE98A71EDCA0B544B6BA24E39E25B495C4D54E92C8EDCF23B5AC325EA27B51FC957A3AA374D652419038C5DFFEC4A751EA9D2E98E2453D07A9E212D21C0DCF4795B796F7F3EE6149E9F9DD1E3F4EF02441B55AB796BA3DCBD6D22B047B25C27D21E29780AC7E2D42BDC54BC3C9DBFF07D15F53C73F5563ADE7BF7F433FDAC35BB4F35B4DBD6B8B7E6FC096B6FB7EB89556BA77C4567A8FC3B4B55DBE1756BD25BE275CADED7D887BA321DD3B4ECBF930D76C057F9F1EF361B4DD90931DA3BB7B186D971BBA3B69BCD8CEDD0ED0AF995BEFD5EDDDAE8DF332BCE1661CA58EE58C2729D4CADAD66EEEC6666E138B421B78BF5E6F137834D505796B1FB8193D9A94CD86ECD025AE27D1B655FC4F24FB0A245DE410FAFF9218B83A4EE4A0E99A5B36E7A90BE2D68A12A54B2A1E3A05453CF49F4BA1E89CB80AA75D0C19D1F3D333F1C3C83A33F06ED97DA896A1BA941282995FAA796C6B33FFA8155E96D9BE5FEA2FF9165B4031296E01EED9EF21F5BD4CEE9B8603D602A18F527273A0548ED237C8629D21DD71D6112851DF152C8169BF7804746DED7FF7CC21AFB08B6C4F12BEC182B8EBB4166A07D96E88B2DAED2B4A16820432C1C8E9F1137DD80B569FFF07B400CF5290270000, N'6.4.4')
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

INSERT [dbo].[Students] ([Id], [Country], [State]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
USE [master]
GO
ALTER DATABASE [MVC_DB] SET  READ_WRITE 
GO
