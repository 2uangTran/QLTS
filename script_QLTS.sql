USE [master]
GO
/****** Object:  Database [QuanLyTaiSanCtyDATN]    Script Date: 8/9/2021 6:00:06 PM ******/
CREATE DATABASE [QuanLyTaiSanCtyDATN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyTaiSanCtyDATN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyTaiSanCtyDATN.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyTaiSanCtyDATN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuanLyTaiSanCtyDATN_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyTaiSanCtyDATN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyTaiSanCtyDATN]
GO
/****** Object:  UserDefinedFunction [dbo].[splitstring]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[splitstring] ( @stringToSplit VARCHAR(MAX) )
RETURNS
 @returnList TABLE ([Name] [nvarchar] (500))
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT

 WHILE CHARINDEX(',', @stringToSplit) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(',', @stringToSplit)  
  SELECT @name = SUBSTRING(@stringToSplit, 1, @pos-1)

  INSERT INTO @returnList 
  SELECT @name

  SELECT @stringToSplit = SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)
 END

 INSERT INTO @returnList
 SELECT @stringToSplit

 RETURN
END


GO
/****** Object:  Table [dbo].[Credential]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DestructivelDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestructivelDevice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceId] [int] NULL,
	[DateOfDestructive] [date] NULL,
	[TypeOfDestructive] [int] NULL,
	[AddressOfDestructive] [nvarchar](500) NULL,
	[UserId] [int] NULL,
	[Notes] [nvarchar](1000) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_CancelDevice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DestructiveType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestructiveType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NULL,
	[Notes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CancelType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Device]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Device](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceCode] [char](50) NULL,
	[DeviceName] [nvarchar](200) NULL,
	[TypeOfDevice] [int] NULL,
	[ParentId] [int] NULL,
	[Configuration] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PurchaseContract] [nvarchar](500) NULL,
	[DateOfPurchase] [date] NULL,
	[SupplierId] [int] NULL,
	[Guarantee] [date] NULL,
	[UserId] [int] NULL,
	[Notes] [nvarchar](2000) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
	[StatusRepair] [int] NULL,
	[NewCode] [char](50) NULL,
 CONSTRAINT [PK_Device] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeviceDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceDevice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceCodeParents] [int] NULL,
	[DeviceCodeChildren] [int] NULL,
	[TypeSymbolParents] [int] NULL,
	[TypeSymbolChildren] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[UserCreated] [int] NULL,
	[UserModified] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Notes] [nvarchar](500) NULL,
	[TypeComponant] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceOfProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceOfProject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[DeviceId] [int] NULL,
	[DateOfDelivery] [date] NULL,
	[DateOfReturn] [date] NULL,
	[Status] [int] NULL,
	[Notes] [nvarchar](2000) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_DeviceOfProject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NULL,
	[TypeSymbol] [nchar](50) NULL,
	[Notes] [nvarchar](1000) NULL,
	[OrderCode] [int] NULL CONSTRAINT [DF_DeviceType_OrderCode]  DEFAULT ((1)),
 CONSTRAINT [PK_DeviceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceTypeComponantType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceTypeComponantType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TypeSymbolParents] [int] NULL,
	[TypeSymbolChildren] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[UserCreated] [int] NULL,
	[UserModified] [int] NULL,
	[IsDeleted] [bit] NULL,
	[TypeComponant] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectDKC]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectDKC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](200) NULL,
	[ProjectSymbol] [nchar](50) NULL,
	[ManagerProject] [int] NULL,
	[Address] [nvarchar](1000) NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
	[TypeProject] [int] NULL,
 CONSTRAINT [PK_ProjectDKC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairDetails]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceId] [int] NULL,
	[DateOfRepair] [date] NULL,
	[NextDateOfRepair] [date] NULL,
	[TimeOrder] [int] NULL,
	[TypeOfRepair] [int] NULL,
	[AddressOfRepair] [nvarchar](500) NULL,
	[UserId] [int] NULL,
	[Notes] [nvarchar](1000) NULL,
	[CreateDate] [date] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_RepairDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NULL,
	[Notes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_RepairType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestDevice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserRequest] [int] NULL,
	[DateOfRequest] [date] NULL,
	[DateOfUse] [date] NULL,
	[DeviceName] [nvarchar](200) NULL,
	[TypeOfDevice] [int] NULL,
	[Configuration] [nvarchar](2000) NULL,
	[Notes] [nvarchar](2000) NULL,
	[Approved] [bit] NULL,
	[UserApproved] [int] NULL,
	[CreatedDate] [date] NULL,
	[Status] [int] NULL,
	[NumDevice] [int] NULL,
	[NoteProcess] [nvarchar](2000) NULL,
	[NoteReasonRefuse] [nvarchar](2000) NULL,
	[NameUserApproved] [nvarchar](100) NULL,
 CONSTRAINT [PK_RequestDevice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheduleTest]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceId] [int] NULL,
	[DateOfTest] [date] NULL,
	[NextDateOfTest] [date] NULL,
	[CategoryTest] [nvarchar](2000) NULL,
	[UserTest] [int] NULL,
	[Notes] [nvarchar](2000) NULL,
	[Status] [int] NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_ScheduleTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Email] [char](50) NULL,
	[Phone] [char](15) NULL,
	[Address] [nvarchar](500) NULL,
	[Support] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsageDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsageDevice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateUse] [date] NULL,
	[UserId] [int] NULL,
	[ProjectId] [int] NULL,
	[Notes] [nvarchar](500) NULL,
	[DeviceId] [int] NULL,
 CONSTRAINT [PK_UsageDevice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [char](50) NULL,
	[PassWord] [char](200) NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [char](50) NULL,
	[PhoneNumber] [char](15) NULL,
	[Address] [nvarchar](500) NULL,
	[Department] [nvarchar](100) NULL,
	[Position] [nvarchar](100) NULL,
	[RoleId] [int] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
	[GroupID] [varchar](20) NULL CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER'),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [char](50) NULL,
	[PassWord] [char](50) NULL,
	[GroupID] [varchar](20) NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [char](50) NULL,
	[IsDeleted] [bit] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Credential] ON 

INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_DEPARTMENT', 483)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_DEVICE', 484)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_DEVICE_COMPONAN', 485)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_DEVICE_DEVICE', 486)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_DEVICE_TYPE', 487)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_DEVICEINPROJECT', 488)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_EMPLOYEE', 489)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_GROUP_ROLE', 490)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_REPAIR_DEVICE', 491)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_REQUEST_DEVICE', 492)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_ROLE_FOR_GROUP', 493)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_SUPPLIER', 494)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_TYPE_COMPONAN', 495)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'ADD_USER', 496)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'CHANGE_INFO_USER', 497)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'CHANGE_USER_GROUP', 498)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'DELETE_DEPARTMENT', 499)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'DELETE_DEVICE', 500)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'DELETE_DEVICE_DEVICE', 501)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'DELETE_GROUP_ROLE', 502)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'DELETE_REQUEST_DEVICE', 503)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'DELETE_TYPE_PR_DV', 504)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'DELETE_USER', 505)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'EDIT_DEPARTMENT', 506)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'EDIT_DEVICE', 507)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'EDIT_EMPLOYEE', 508)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'EDIT_REQUEST_DEVICE', 509)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'EXEL_LIST_DDEVICE', 510)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'EXPORT_DV_IN_DEPARTMENT', 511)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'EXPORT_STATISTICAL_DEVICE', 512)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'LIQUIDATION_DEVICE', 513)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'MANAGER_TYPE_PR_DV', 514)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'PRINTBARCODE_DEVICE', 515)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'RETURN_DEVICETODEPOT', 516)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'SCAN_ADD_DVDEPARTMENT', 517)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'SCAN_DEVICE', 518)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'SCAN_RETURN_DV', 519)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'SEACH_DEVICE', 520)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'SEARCH_DEVICE_COMPONAN', 521)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'VIEW_DEPARTMENT', 522)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'VIEW_DEVICE', 523)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'VIEW_EMPLOYEE', 524)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'VIEW_GROUP_ROLE', 525)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'VIEW_REQUEST_DEVICE', 526)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'VIEW_STATISTICAL_DEPARTMENT', 527)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'VIEW_STATISTICAL_DEVICE', 528)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN', N'VIEW_USER', 529)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_DEPARTMENT', 547)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_DEVICE', 548)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_DEVICE_COMPONAN', 549)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_DEVICE_DEVICE', 550)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_DEVICE_TYPE', 551)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_DEVICEINPROJECT', 552)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_EMPLOYEE', 553)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_REPAIR_DEVICE', 554)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_REQUEST_DEVICE', 555)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_SUPPLIER', 556)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_TYPE_COMPONAN', 557)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'ADD_USER', 558)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'CHANGE_INFO_USER', 559)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'DELETE_DEPARTMENT', 560)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'DELETE_DEVICE', 561)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'DELETE_DEVICE_DEVICE', 562)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'DELETE_REQUEST_DEVICE', 563)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'DELETE_TYPE_PR_DV', 564)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'DELETE_USER', 565)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'EDIT_DEPARTMENT', 566)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'EDIT_DEVICE', 567)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'EDIT_EMPLOYEE', 568)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'EDIT_REQUEST_DEVICE', 569)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'EXEL_LIST_DDEVICE', 570)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'EXPORT_DV_IN_DEPARTMENT', 571)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'EXPORT_STATISTICAL_DEVICE', 572)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'LIQUIDATION_DEVICE', 573)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'MANAGER_TYPE_PR_DV', 574)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'PRINTBARCODE_DEVICE', 575)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'RETURN_DEVICETODEPOT', 576)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'SCAN_ADD_DVDEPARTMENT', 577)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'SCAN_DEVICE', 578)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'SCAN_RETURN_DV', 579)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'SEACH_DEVICE', 580)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'SEARCH_DEVICE_COMPONAN', 581)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'VIEW_DEPARTMENT', 582)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'VIEW_DEVICE', 583)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'VIEW_EMPLOYEE', 584)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'VIEW_REQUEST_DEVICE', 585)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'VIEW_STATISTICAL_DEPARTMENT', 586)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'VIEW_STATISTICAL_DEVICE', 587)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'ADMIN2', N'VIEW_USER', 588)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'DIRECTOR', N'DELETE_REQUEST_DEVICE', 530)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'DIRECTOR', N'EDIT_REQUEST_DEVICE', 531)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'DIRECTOR', N'VIEW_DEVICE', 532)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'DIRECTOR', N'VIEW_REQUEST_DEVICE', 533)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'MANAGER', N'ADD_REQUEST_DEVICE', 534)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'MANAGER', N'DELETE_REQUEST_DEVICE', 535)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'MANAGER', N'EDIT_REQUEST_DEVICE', 536)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'MANAGER', N'VIEW_REQUEST_DEVICE', 537)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'ADD_GROUP_ROLE', 538)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'ADD_ROLE_FOR_GROUP', 539)
GO
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'ADD_USER', 540)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'CHANGE_INFO_USER', 541)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'CHANGE_USER_GROUP', 542)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'DELETE_GROUP_ROLE', 543)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'DELETE_USER', 544)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'VIEW_GROUP_ROLE', 545)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID], [ID]) VALUES (N'OFFICER', N'VIEW_USER', 546)
SET IDENTITY_INSERT [dbo].[Credential] OFF
SET IDENTITY_INSERT [dbo].[Device] ON 

INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1, N'MMT00001                                          ', N'Màn máy asus', 2, NULL, N'<p>-M&agrave;n 27 inch&nbsp;</p><p>-Full HD</p>', 6000000, N'', CAST(N'2019-09-10' AS Date), 1, CAST(N'2019-11-30' AS Date), 4, N'', CAST(N'2019-09-13' AS Date), CAST(N'2019-10-29' AS Date), 1, 0, 0, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2, N'MMT00002                                          ', N'Màn máy tính ASUS', 2, 3069, N'<p>- 27 inch&nbsp;</p><p>- Full HD</p>', 6000000, N'<p>- Mua tại cửa h&agrave;ng</p>', CAST(N'2019-09-01' AS Date), 1, CAST(N'2020-04-19' AS Date), 2, N'', CAST(N'2019-09-13' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3, N'MMT00003                                          ', N'Màn máy tính Asus', 2, NULL, N'<p>-M&agrave;n 27 inch</p><p>-Full HD</p>', 6000000, N'', CAST(N'2019-09-01' AS Date), NULL, CAST(N'2019-09-28' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (4, N'LTP00001                                          ', N'Laptop Dell 7447', 1, NULL, N'<p>-Ram 16GB</p><p>-SSD 256 GB</p><p>-Card đồ họa GTX 8500</p>', 12800000, N'<p>-Mua online&nbsp;</p>', CAST(N'2019-09-01' AS Date), 3, CAST(N'2019-09-28' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (5, N'LTP00002                                          ', N'Laptop Dell 7559', 1, NULL, N'<p>-Ram 16 GB</p><p>-HDD 1T</p><p>-M&agrave;n&nbsp; chuẩn 4k</p>', 15000000, N'', CAST(N'2019-09-01' AS Date), 2, CAST(N'2019-09-28' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (6, N'CMT00001                                          ', N'Case máy tính ', 3, NULL, N'<p>-Ram 8GB</p><p>-HDD 500 GB</p><p>-CPU l&otilde;i tứ&nbsp;</p>', 5000000, N'', CAST(N'2019-09-18' AS Date), 3, CAST(N'2019-10-26' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (7, N'CMT00003                                          ', N'Case máy tính HP', 3, NULL, N'<p>-Ram 8GB</p><p>-HDD 500 GB</p><p>-CPU l&otilde;i tứ&nbsp;</p>', 5000000, N'', CAST(N'2019-09-01' AS Date), 4, CAST(N'2019-09-23' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (8, N'CHT00005                                          ', N'Chuột fuhlen', 4, 1020, N'<p>-Chuột c&oacute; d&acirc;y&nbsp;</p>', 20000, N'<p>vvvvv</p>', CAST(N'2019-09-01' AS Date), 4, CAST(N'2019-09-20' AS Date), NULL, N'', CAST(N'2019-09-24' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (9, N'CHT00006                                          ', N'Chuột Fuhlen mới', 4, 3099, N'<p>-Chuột c&oacute; d&acirc;y</p>', 20000, N'', NULL, 2, CAST(N'2019-12-16' AS Date), 3, N'', CAST(N'2019-09-13' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (10, N'BLV00001                                          ', N'Bàn làm việc ', 5, NULL, N'<p>-B&agrave;n gỗ&nbsp;</p><p>-K&iacute;ch thước 3m x 2m</p>', 700000, N'', CAST(N'2019-09-01' AS Date), 4, CAST(N'2019-09-30' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), CAST(N'2019-10-21' AS Date), 0, 0, 1, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (11, N'BLV00002                                          ', N'Bàn làm việc', 5, NULL, N'<p>-B&agrave;n gỗ</p><p>-K&iacute;ch thước 3m x 2m</p>', 700000, N'', CAST(N'2019-08-05' AS Date), 4, CAST(N'2019-09-18' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (12, N'GHT00001                                          ', N'Ghê nhựa Tiền Phong', 6, NULL, N'<p>-Gh&ecirc; nhựa&nbsp;</p><p>-Cao 50 cm</p><p>-Mặt 30x30</p>', 50000, N'', NULL, 4, NULL, NULL, N'', CAST(N'2019-09-13' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (13, N'GHT00002                                          ', N'Ghế nhựa ', 6, NULL, N'<p>-Ghế&nbsp;nhựa&nbsp;</p><p>-Cao 50 cm</p><p>-Mặt 30x30</p>', 0, N'', CAST(N'2019-09-09' AS Date), 4, CAST(N'2019-09-13' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (14, N'GXL00001                                          ', N'Ghế xoay lưới', 8, NULL, N'<p>-Ghế xoay&nbsp;</p>', 300000, N'', CAST(N'2019-09-01' AS Date), 4, CAST(N'2019-09-25' AS Date), NULL, N'', CAST(N'2019-09-13' AS Date), CAST(N'2019-10-21' AS Date), 0, 0, 0, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (15, N'GHT00003                                          ', N'Gghế nhựa tựa', 6, NULL, N'', 200000, N'', CAST(N'2019-10-01' AS Date), 4, CAST(N'2019-10-31' AS Date), 2, N'', CAST(N'2019-10-22' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (16, N'LTP00006                                          ', N'LapTop Samsung', 1, NULL, N'', 100000, N'', CAST(N'2019-10-08' AS Date), 2, CAST(N'2019-10-31' AS Date), 5, N'', CAST(N'2019-10-23' AS Date), CAST(N'2019-10-30' AS Date), 2, 1, 1, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (17, N'CHT00008                                          ', N'Chuột fuhlen 1200 ', 4, 3069, N'', 100000, N'', CAST(N'2019-10-14' AS Date), NULL, NULL, 5, N'', CAST(N'2019-10-23' AS Date), CAST(N'2019-10-23' AS Date), 0, 0, 0, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (18, N'GXL00003                                          ', N'Ghế xoay lưới ', 8, NULL, N'', 120000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-10-23' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1015, N'CMT00008                                          ', N'Case PHP', 3, NULL, N'<p>- Ram 8 GB</p>', 10000000, N'', CAST(N'2019-11-05' AS Date), 1, CAST(N'2019-11-29' AS Date), NULL, N'', CAST(N'2019-11-21' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1016, N'LTP00026                                          ', N'Laptop Asus A1200', 1, NULL, N'', 123456, N'', NULL, NULL, NULL, 4, N'', CAST(N'2019-11-21' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1017, N'LTP00027                                          ', N'Laptop Workstation MSI WE75 9TK', 1, NULL, N'<p>- CPU: Intel&reg; Core&trade; i7-9750H (2.60 GHz upto 4.50 GHz, 12MB)</p><p>- RAM: DDRIV 16GB*2 (2666MHz)</p><p>- Ổ cứng: 512GB NVMe PCIe Gen3x4 SSD + 1TB (SATA) 7200rpm VGA: Quadro RTX3000 6GB GDDR6</p>', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-11-21' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1018, N'LTP00028                                          ', N'Laptop Dell 7557', 1, NULL, N'', 55555000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-11-22' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1019, N'LTP00029                                          ', N'Laptop MAC', 1, NULL, N'', 21000000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-11-22' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1020, N'LTP00030                                          ', N'Laptop PHP', 1, NULL, N'', 555555555, N'', NULL, NULL, NULL, 2, N'', CAST(N'2019-11-22' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1021, N'LTP00031                                          ', N'Laptop Workstation MSI WS75 9TL', 1, NULL, N'<p>- CPU: Intel&reg; Core&trade; i7-9750H (2.60 GHz upto 4.50 GHz, 12MB)</p><p>- RAM: DDR IV 16GB*2 (2666MHz)</p><p>- Ổ cứng: 1TB NVMe PCIe Gen3x4 SSD VGA: Quadro RTX4000 8GB GDDR6</p>', 14500000, N'', NULL, NULL, NULL, 2, N'', CAST(N'2019-11-22' AS Date), CAST(N'2019-12-05' AS Date), 1, 0, 0, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (1022, N'CHT00013                                          ', N'CHuột Fuhend', 4, NULL, N'', 200000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-11-24' AS Date), CAST(N'2019-11-29' AS Date), 0, 0, 0, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2015, N'MMT00023                                          ', N'Màn máy tính SamSung', 2, NULL, N'<p>-M&agrave;n 24 inch</p><p>-Độ ph&acirc;n giải 4k</p>', 3300000, N'', CAST(N'2019-11-04' AS Date), 4, CAST(N'2019-11-21' AS Date), NULL, N'', CAST(N'2019-11-30' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2016, N'CHT00014                                          ', N'Chuột Fuhlen', 4, 2018, N'<p>- Chuột kh&ocirc;ng d&acirc;y</p>', 100000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-11-30' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2017, N'CHT00217                                          ', N'Chuột Fuhlen', 4, NULL, N'<p>- Chuột c&oacute; d&acirc;y</p>', 250000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-02' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2018, N'LTP00047                                          ', N'Lap test CHECK', 1, NULL, N'', 1234568, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-03' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2019, N'CHT00081                                          ', N'Chuột Fuhlen', 4, 2018, N'<p>- Chuột c&oacute; d&acirc;y</p>', 250000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-03' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2020, N'LTP00050                                          ', N'Laptop Lenovo Thinkpad X1 Carbon 6 20KHS01900', 1, NULL, N'<p>Core i7-8550U (1.8GHz Upto 4.0GHz, 8MB Cache, 4 Cores 8 Threads), 8GB LPDDR3 2133MHz, 256GB SSD M.2 NVMe,</p>', 12334567890, N'<p>Th&ocirc;ng tin mua</p>', NULL, 2, NULL, NULL, N'<p>Ghi ch&uacute;&nbsp;</p>', CAST(N'2019-12-03' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2021, N'LTP00051                                          ', N'Lap Dell 7557', 1, NULL, N'<p>- Ram 32 GB</p><p>- Bộ nhớ: SSD 256 GB</p>', 16000000, N'', CAST(N'2019-11-26' AS Date), NULL, NULL, 2, N'', CAST(N'2019-12-03' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2022, N'CHT00131                                          ', N'Chuột Fuhlen', 4, 1017, N'', 250000, N'', NULL, NULL, NULL, 4, N'', CAST(N'2019-12-05' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2023, N'CHT00132                                          ', N'CHuột Fuhlen', 4, 1017, N'<p>- Chuột c&oacute; d&acirc;y</p>', 250000, N'<p>info</p>', CAST(N'2019-12-01' AS Date), 3, CAST(N'2019-12-02' AS Date), 4, N'<p>Notes</p>', CAST(N'2019-12-05' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2030, N'GHT00015                                          ', N'Ghế nhựa Tiền Phong ', 6, NULL, N'', 150000, N'', NULL, NULL, NULL, 4, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2031, N'CHT00135                                          ', N'bbbbbb', 4, NULL, N'', 0, N'', NULL, NULL, NULL, 2, N'', CAST(N'2019-12-06' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2032, N'CHT00154                                          ', N'Chuột mới nhất ', 4, NULL, N'Cấu hình 
Câsu hình ', 123456789, NULL, CAST(N'2019-12-01' AS Date), 2, CAST(N'2019-12-10' AS Date), 2, NULL, CAST(N'2019-12-06' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2033, N'MMT00029                                          ', N'Màn máy tính mới nhất ', 2, NULL, N'<p>Cấu h&igrave;nh m&agrave;n</p>', 1000000, N'<p>Th&ocirc;ng tin mua</p>', CAST(N'2019-12-03' AS Date), 1, CAST(N'2019-12-11' AS Date), 2, N'<p>Ghi ch&uacute;</p>', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2079, N'CHT00163                                          ', N'Chuột Fuhlen', 4, 3102, N'<p>- Chuột c&oacute; d&acirc;y</p>', 250000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2108, N'BLV00022                                          ', N'Bàn Làm Việc Lắp Ghép Tiện Lợi', 5, NULL, N'', 689000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2109, N'GHT00069                                          ', N'Ghế nhựa Hòa Phát', 6, NULL, N'', 130000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2110, N'GHT00036                                          ', N'Ghế nhưa Hòa Phát', 6, NULL, N'<p>- Chất liệu:&nbsp;nhựa cứng</p>', 130000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2112, N'GHT00038                                          ', N'Ghế nhựa Hòa Phát', 6, NULL, N'', 130000, N'<p>vvvv</p>', CAST(N'2019-12-17' AS Date), 3, CAST(N'2019-12-12' AS Date), NULL, N'<p>vvvvv</p>', CAST(N'2019-12-06' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2134, N'GHT00042                                          ', N'cccccc', 6, NULL, N'', 0, NULL, CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, NULL, CAST(N'2019-12-06' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2135, N'CHT00165                                          ', N'Chuột Fuhlen', 4, NULL, N'', 250000, N'', CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2155, N'USB00004                                          ', N'USB 3.0', 10, NULL, N'', 150000, N'', CAST(N'0001-01-01' AS Date), NULL, NULL, NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2156, N'CHT00166                                          ', N'Chuột Fuhlen', 4, NULL, N'', 250000, N'', CAST(N'0001-01-01' AS Date), NULL, CAST(N'0001-01-01' AS Date), NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2157, N'GHT00044                                          ', N'Ghế nhưa Tiền Phong', 6, NULL, N'', 120000, N'', CAST(N'0001-01-01' AS Date), NULL, CAST(N'0001-01-01' AS Date), NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2158, N'MMT00031                                          ', N'Màn LG', 2, NULL, N'<p>- M&agrave;n 27 Inch</p>', 5000000, N'<p>vvvvvvvvvvvv</p>', CAST(N'2019-12-03' AS Date), NULL, CAST(N'2019-12-06' AS Date), 4, N'<p>bbbbbbbbbbb</p>', CAST(N'2019-12-06' AS Date), NULL, 3, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2159, N'USB00005                                          ', N'USB 2.0', 10, 3102, N'<p>- Bộ nhớ 8GB</p>', 100000, N'<p>Th&ocirc;ng</p>', CAST(N'2019-12-17' AS Date), NULL, CAST(N'2019-12-03' AS Date), 4, N'<p>ghi</p>', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2160, N'BLV00018                                          ', N'Bàn gỗ ', 5, NULL, N'<p>- Cao 1m2</p><p>- D&agrave;i 2m</p><p>- Rộng 1m</p>', 520000, N'', CAST(N'0001-01-01' AS Date), 1, CAST(N'0001-01-01' AS Date), 2, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2171, N'GHT00046                                          ', N'Ghế nhựa Tiền Phong', 6, NULL, N'', 120000, N'', CAST(N'0001-01-01' AS Date), 2, CAST(N'0001-01-01' AS Date), 4, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (2192, N'GHT00052                                          ', N'Ghế nhựa Tiền Phong', 6, NULL, N'', 120000, N'', CAST(N'0001-01-01' AS Date), 2, CAST(N'0001-01-01' AS Date), 4, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3019, N'GHT00059                                          ', N'Ghế nhựaTiền Phong', 6, NULL, N'', 120000, N'', CAST(N'2019-12-06' AS Date), 1, CAST(N'2019-12-06' AS Date), 4, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3020, N'GHT00060                                          ', N'Ghế nhựa Tiền Phong', 6, NULL, N'', 120000, N'', CAST(N'2019-12-03' AS Date), 4, CAST(N'2020-01-31' AS Date), 4, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3027, N'CHT00176                                          ', N'Chuột Fuhlen', 4, 2021, N'', 250000, N'', CAST(N'2019-12-04' AS Date), 3, CAST(N'2019-12-27' AS Date), NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3028, N'MMT00032                                          ', N'Màn máy tính SamSung', 2, NULL, N'<p>-M&agrave;n 24 inch</p><p>-Full HD</p>', 3000000, N'', CAST(N'2019-12-05' AS Date), 3, CAST(N'2019-12-12' AS Date), NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3029, N'CHT00178                                          ', N'Chuột Fuhlen', 4, 2021, N'<p>Chuột c&oacute; d&acirc;y&nbsp;</p>', 250000, N'', NULL, NULL, CAST(N'0001-01-01' AS Date), NULL, N'', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3035, N'CHT00182                                          ', N'Chuột Fuhlen', 4, 4, N'<p>Chuột c&oacute; d&acirc;y</p>', 250000, N'<p>Thoong</p>', CAST(N'2019-12-02' AS Date), NULL, CAST(N'2019-12-19' AS Date), NULL, N'<p>bbbbb</p>', CAST(N'2019-12-06' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3036, N'MIN00001                                          ', N'Máy in Laser HP', 11, NULL, N'', 500000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-09' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3037, N'MIN00002                                          ', N'Máy in phun màu Canon', 11, NULL, N'<p>- Tốc độ in (A4): 7 ipm (Black), 4.8 ipm (Color) -ISO/IEC24734</p>', 12570000, N'', NULL, 5, NULL, NULL, N'', CAST(N'2019-12-12' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3038, N'GHT00062                                          ', NULL, 6, NULL, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-12' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3039, N'CHT00183                                          ', N'Chuột Fuhlen', 4, 2021, N'-Chuột không dây', 450000, NULL, NULL, NULL, NULL, 2, NULL, CAST(N'2019-12-12' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3040, N'LMP00001                                          ', N'Loa MicroLab 2.0', 14, NULL, N'', 250000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3041, N'KDL00001                                          ', N'Kệ để loa SUN HOUSE', 15, 3040, N'', 450000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3042, N'CHT00197                                          ', NULL, 4, 2020, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3043, N'CHT00199                                          ', N'Chuột Fuhlen', 4, 2020, N'<p>- Chuột c&oacute; d&acirc;y</p>', 250000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3044, N'CHT00200                                          ', N'Chuột FUhlen', 4, 2020, N'-Chuột có dây', 120000, N'- Mới mua', CAST(N'2019-12-01' AS Date), 4, CAST(N'2019-12-01' AS Date), 5, N'-Ghi chú ', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3047, N'OCL00003                                          ', N'Ổ cứng HDD', 16, 2021, N'- Dung lượng 500 Gb', 550000, N'- Mua mới', CAST(N'2019-12-01' AS Date), 2, CAST(N'2019-12-02' AS Date), 2, N'- Ghi chú ', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3048, N'OCL00004                                          ', N'Ổ Cứng Laptop', 16, 2021, N'- Dung lượng 500 Gb', 550000, NULL, NULL, NULL, NULL, 2, NULL, CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3049, N'OCL00005                                          ', N'Ổ cứng SSD', 16, 2020, N'<p>- Dung lượng 128 Gb</p>', 950000, N'', NULL, 3, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3050, N'OCL00006                                          ', N'Ổ cứng HDD', 16, 2020, N'- Dung lượng 500 Gb', 500000, N'- Mua mới ', CAST(N'2019-12-01' AS Date), 2, CAST(N'2019-12-28' AS Date), NULL, N'- ghi chú ', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3051, N'OCL00007                                          ', N'Ổ Cứng HDD Kingtom', 16, 2020, N'', 650000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3052, N'OCL00011                                          ', N'Ổ cứng HDD SamSung', 16, 2020, N'', 700000, NULL, NULL, NULL, NULL, 4, NULL, CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3053, N'OCL00012                                          ', N'Ổ cứng Toshiba', 16, 2020, N'- Dung lượng 128 Gb', 300000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-17' AS Date), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3054, N'CDH00005                                          ', N'VGA ASUS ROG-STRIX-GTX1650-O4G-GAMING', 13, 1021, N'<p>- Dung lượng bộ nhớ: 4GB GDDR5</p><p>- OC mode : 1860 MHz (Boost Clock)/1485 MHz (Base Clock)</p><p>- Gaming mode : 1830 MHz (Boost Clock)/1485 MHz (Base Clock)</p>', 1200000, N'', NULL, NULL, NULL, 2, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3055, N'LTP00054                                          ', N'Lap test 1 ', 1, NULL, N'', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3056, N'CDH00006                                          ', N'Card test 1', 13, 3055, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-17' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3057, N'CDH00007                                          ', N'Card test 2', 13, 3055, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-17' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3058, N'LTP00055                                          ', N'Lap test 2', 1, NULL, N'', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3059, N'CDH00010                                          ', N'Card lap test 2 ', 13, 3058, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-17' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3060, N'LTP00056                                          ', N'lap test 3 ', 1, NULL, N'', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3061, N'CDH00011                                          ', N'Card lap test 3 ', 13, 3060, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-17' AS Date), NULL, 2, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3062, N'LTP00057                                          ', N'lap test 3 ', 1, NULL, N'', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 2, 1, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3063, N'CDH00012                                          ', N'Card test 3', 13, 3062, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-17' AS Date), NULL, 2, 1, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3064, N'LTP00058                                          ', N'Lap Asus', 1, NULL, N'', 11300000, N'', NULL, 3, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3065, N'CDH00013                                          ', N'VGA ASUS ROG-STRIX-RX570-O4G-GAMING', 13, 3064, N'<p>- Dung lượng bộ nhớ: 4GB</p><p>- GDDR5 L&ecirc;n tới 1310 Mhz</p><p>-(Chế độ &eacute;p xung) L&ecirc;n tới 1300 Mhz (Chế độ chơi game)</p>', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3066, N'CDH00014                                          ', N'Card Đồ Họa iGame GeForce RTX 2080 ', 13, 3064, N'', 3500000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3067, N'LTP00059                                          ', N'Laptop Acer Predator Helios 700 PH717', 1, NULL, N'<p>- Tốc độ:&nbsp;2.40 GHz upto 5.00 GHz, 8 cores 16 threads</p><p>&nbsp;</p>', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3068, N'CDH00015                                          ', N'VGA ASUS TUF Gaming X3 GeForce GTX 1660 ', 13, 3067, N'<p>- Dung lượng bộ nhớ: 6GB GDDR6 OC Mode - 1860 MHz (Boost Clock) Gaming Mode (Default) - GPU Boost Clock : 1830 MHz , GPU Base Clock : 1530 MHz Băng th&ocirc;ng: 192-bit</p>', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-17' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3069, N'LTP00060                                          ', N'Lap test 7', 1, NULL, N'', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3070, N'CDH00016                                          ', N'Card Đồ Họa iGame GeForce RTX 2080 ', 13, 3069, N'', 97000000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3071, N'LTP00061                                          ', N'Laptop Dell', 1, NULL, N'', 15000000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3073, N'LTP00062                                          ', N'Lap 001', 1, NULL, N'', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 2, 1, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3074, N'CHT00206                                          ', N'Chuột Dell', 4, NULL, N'<p>- Chuột c&oacute; d&acirc;y</p>', 130000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3075, N'CHT00207                                          ', N'Chuột Logitech', 4, NULL, N'<p>- Chuột c&oacute; d&acirc;y&nbsp;</p>', 350000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3083, N'CHT00208                                          ', N'Chuột Fuhlen', 4, NULL, N'<p>- Chuột c&oacute; d&acirc;y</p>', 250000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3085, N'LTP00064                                          ', N'Lap 2', 1, NULL, N'', 0, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3087, N'OCL00015                                          ', N'Ổ cứng 2', 16, 3085, N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-18' AS Date), NULL, 2, 1, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3088, N'CHT00210                                          ', N'Chuột Fuhlen', 4, NULL, N'<p>- Chuột c&oacute; d&acirc;y&nbsp;</p>', 250000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-18' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3089, N'OCL00016                                          ', N'Ổ cứng HDD Dell', 16, 5, N'', 605000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-19' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3090, N'OCL00017                                          ', N'Ổ cứng Dell', 16, 3069, N'  - Dung lượng  500 Gb', 750000, NULL, NULL, 3, NULL, NULL, NULL, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-28' AS Date), 0, 0, 0, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3091, N'LTP00068                                          ', N'Laptop Toshiba ', 1, NULL, N'', 13450000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-19' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3092, N'OCL00018                                          ', N'Ổ cứng SSD ', 16, 3091, N'  - Dung lượng 500 Gb', 1250000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-19' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3095, N'VUB00002                                          ', N'Vỏ usb 2.0', 18, NULL, N'', 50000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-19' AS Date), 0, 0, 0, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3096, N'LTP00069                                          ', N'Laptop SamSung', 1, 3095, N'', 17000000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-21' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3097, N'LTP00070                                          ', N'Laptop Dell 7447', 1, NULL, N'<p>- Ram 16 Gb</p><p>- Ổ cứng SSD 256 Gb</p><p>- M&agrave;n 14 inch, HD</p>', 12500000, N'<p>- Mua mới</p>', CAST(N'2019-12-01' AS Date), 1, CAST(N'2020-06-30' AS Date), NULL, N'', CAST(N'2019-12-24' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3098, N'CHT00216                                          ', N'Chuột Fuhlen', 4, NULL, N'  - Chuột có dây', 250000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-24' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3099, N'LTP00071                                          ', N'Laptop Dell 7559', 1, NULL, N'<p>- Ram 16 Gb</p><p>- Ổ cứng SSD 128 Gb</p><p>- Ổ c&uacute;ng HDD 500 Gb</p>', 17500000, N'', NULL, 3, NULL, 4, N'', CAST(N'2019-12-24' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3100, N'RLT00001                                          ', N'Ram DDR3', 19, 3099, N'  - Ram 4 Gb', 560000, NULL, NULL, NULL, NULL, 4, NULL, CAST(N'2019-12-30' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3101, N'LTP00073                                          ', N'Laptop Dell Pro', 1, NULL, N'<p>- M&agrave;n Full HD</p><p>- Ram 16 Gb</p>', 22000000, N'', NULL, NULL, NULL, NULL, N'', CAST(N'2019-12-30' AS Date), NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3102, N'LTP00074                                          ', N'Laptop test', 1, NULL, N'<p>- Ram 4GB</p>', 12000000, N'', NULL, 2, NULL, NULL, N'', CAST(N'2020-01-02' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (3103, N'USB00010                                          ', N'Usb test', 10, 3102, N'', 100000, NULL, NULL, 3, NULL, NULL, NULL, CAST(N'2020-01-02' AS Date), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[Device] ([Id], [DeviceCode], [DeviceName], [TypeOfDevice], [ParentId], [Configuration], [Price], [PurchaseContract], [DateOfPurchase], [SupplierId], [Guarantee], [UserId], [Notes], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [StatusRepair], [NewCode]) VALUES (4100, N'CHT00218                                          ', N'chuot Fuhlen', 4, 3102, N'', 250000, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-01-06' AS Date), NULL, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Device] OFF
SET IDENTITY_INSERT [dbo].[DeviceDevice] ON 

INSERT [dbo].[DeviceDevice] ([id], [DeviceCodeParents], [DeviceCodeChildren], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [Notes], [TypeComponant]) VALUES (1082, 3099, 9, 1, 4, CAST(N'2019-12-29' AS Date), NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[DeviceDevice] ([id], [DeviceCodeParents], [DeviceCodeChildren], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [Notes], [TypeComponant]) VALUES (1083, 3099, 3100, 1, 19, CAST(N'2019-12-30' AS Date), NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[DeviceDevice] ([id], [DeviceCodeParents], [DeviceCodeChildren], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [Notes], [TypeComponant]) VALUES (2083, 3102, 2079, 1, 4, CAST(N'2020-01-06' AS Date), NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[DeviceDevice] ([id], [DeviceCodeParents], [DeviceCodeChildren], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [Notes], [TypeComponant]) VALUES (2084, 3102, 3075, 1, 4, CAST(N'2020-01-06' AS Date), NULL, NULL, NULL, 1, N'', 0)
INSERT [dbo].[DeviceDevice] ([id], [DeviceCodeParents], [DeviceCodeChildren], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [Notes], [TypeComponant]) VALUES (2085, 3102, 4100, 1, 4, CAST(N'2020-01-06' AS Date), NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[DeviceDevice] ([id], [DeviceCodeParents], [DeviceCodeChildren], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [Notes], [TypeComponant]) VALUES (1084, 3102, 2159, 1, 10, CAST(N'2020-01-02' AS Date), NULL, NULL, NULL, 0, NULL, 0)
INSERT [dbo].[DeviceDevice] ([id], [DeviceCodeParents], [DeviceCodeChildren], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [Notes], [TypeComponant]) VALUES (1085, 3102, 3103, 1, 10, CAST(N'2020-01-02' AS Date), NULL, NULL, NULL, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[DeviceDevice] OFF
SET IDENTITY_INSERT [dbo].[DeviceOfProject] ON 

INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3095, 5, 3088, CAST(N'2019-12-18' AS Date), CAST(N'2019-12-18' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3096, 5, 3083, CAST(N'2019-12-18' AS Date), CAST(N'2019-12-18' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3097, 5, 3075, CAST(N'2019-12-18' AS Date), CAST(N'2019-12-18' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3098, 5, 1015, CAST(N'2019-12-18' AS Date), CAST(N'2019-12-21' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3099, 1008, 1016, CAST(N'2019-12-19' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3100, 1008, 1017, CAST(N'2019-12-19' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3101, 6, 3089, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-19' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3102, 6, 5, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-19' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3103, 6, 3070, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-19' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3104, 6, 3069, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-19' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3105, 6, 17, CAST(N'2019-12-19' AS Date), CAST(N'2020-01-02' AS Date), 0, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3106, 6, 3090, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-19' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3107, 6, 3052, CAST(N'2019-12-19' AS Date), CAST(N'2020-01-02' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3108, 6, 3095, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-19' AS Date), 0, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3109, 6, 3095, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-19' AS Date), 0, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3110, 6, 3095, CAST(N'2019-12-19' AS Date), CAST(N'2020-01-02' AS Date), 0, N' ', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3111, 6, 1018, CAST(N'2019-12-21' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3112, 6, 1019, CAST(N'2019-12-21' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3113, 6, 3090, CAST(N'2019-12-28' AS Date), CAST(N'2019-12-28' AS Date), 0, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3114, 1011, 3101, CAST(N'2019-12-30' AS Date), NULL, 1, NULL, 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3115, 6, 1, CAST(N'2020-01-02' AS Date), NULL, 1, N'thêm', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (3116, 6, 1015, CAST(N'2020-01-02' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (4114, 1008, 2, CAST(N'2020-01-04' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (4115, 1008, 1021, CAST(N'2020-01-06' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (4116, 1008, 11, CAST(N'2020-01-06' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (4117, 1008, 12, CAST(N'2020-01-06' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (4118, 1008, 18, CAST(N'2020-01-06' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (4119, 1008, 2015, CAST(N'2020-01-06' AS Date), NULL, 1, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (4120, 1008, 3102, CAST(N'2020-01-06' AS Date), CAST(N'2020-01-06' AS Date), 0, N'', 0)
INSERT [dbo].[DeviceOfProject] ([Id], [ProjectId], [DeviceId], [DateOfDelivery], [DateOfReturn], [Status], [Notes], [IsDeleted]) VALUES (4121, 1011, 3102, CAST(N'2020-01-06' AS Date), CAST(N'2020-01-06' AS Date), 0, N'', 0)
SET IDENTITY_INSERT [dbo].[DeviceOfProject] OFF
SET IDENTITY_INSERT [dbo].[DeviceType] ON 

INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (1, N'Laptop', N'LTP                                               ', N'Máy tính xách tay ', 85)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (2, N'Màn máy tính', N'MMT                                               ', N'Màn máy tính để bàn ', 41)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (3, N'Case máy tính', N'CMT                                               ', N'Cây máy tính để bàn ', 22)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (4, N'Chuột máy tính ', N'CHT                                               ', N'Chuột máy tính', 219)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (5, N'Bàn làm việc ', N'BLV                                               ', N'Bàn làm việc cho nhân viên tại văn phòng ', 23)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (6, N'Ghế nhựa ', N'GHT                                               ', N'Ghế nhựa', 70)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (8, N'Ghế xoay lưới', N'GXL                                               ', N'', 6)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (9, N'Điều hòa nhiệt độ', N'DHT                                               ', N'', 4)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (10, N'USB', N'USB                                               ', N'USB 2.0', 11)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (11, N'Máy in', N'MIN                                               ', N'', 3)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (12, N'Hộp mực máy in', N'HMI                                               ', N'', 2)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (13, N'Card đồ họa', N'CDH                                               ', N'', 18)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (14, N'Loa Microlab 2.0', N'LMP                                               ', N'', 2)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (15, N'Kệ để loa ', N'KDL                                               ', N'', 26)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (16, N'Ổ cứng Laptop', N'OCL                                               ', N'', 20)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (17, N'Chân bàn  ', N'CBG                                               ', N'', 3)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (18, N'Vỏ Usb ', N'VUB                                               ', N'', 3)
INSERT [dbo].[DeviceType] ([Id], [TypeName], [TypeSymbol], [Notes], [OrderCode]) VALUES (19, N'Ram Laptop', N'RLT                                               ', N'', 2)
SET IDENTITY_INSERT [dbo].[DeviceType] OFF
SET IDENTITY_INSERT [dbo].[DeviceTypeComponantType] ON 

INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2, 1, 4, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (3, 1, 2, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (4, 6, 6, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (5, 3, 2, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (7, 1, 10, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (8, 1, 3, CAST(N'2019-11-23' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (1005, 1, 5, CAST(N'2019-11-27' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (1006, 4, 6, CAST(N'2019-12-03' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (1007, 2, 9, CAST(N'2019-12-06' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2006, 11, 12, CAST(N'2019-12-12' AS Date), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2007, 1, 8, CAST(N'2019-12-16' AS Date), NULL, NULL, NULL, 1, 0)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2008, 1, 13, CAST(N'2019-12-17' AS Date), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2009, 14, 15, CAST(N'2019-12-17' AS Date), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2018, 1, 17, CAST(N'2019-12-21' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2019, 1, 18, CAST(N'2019-12-21' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2020, 1, 18, CAST(N'2019-12-21' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2021, 1, 18, CAST(N'2019-12-21' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2025, 1, 19, CAST(N'2019-12-28' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2027, 1, 16, CAST(N'2019-12-30' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (3027, 1, 18, CAST(N'2020-01-06' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (6, 3, 4, CAST(N'2019-11-21' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2010, 1, 16, CAST(N'2019-12-17' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2011, 13, 1, CAST(N'2019-12-18' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2017, 10, 18, CAST(N'2019-12-19' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2022, 18, 5, CAST(N'2019-12-21' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2028, 1, 10, CAST(N'2020-01-02' AS Date), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2012, 5, 6, CAST(N'2019-12-18' AS Date), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2013, 5, 17, CAST(N'2019-12-18' AS Date), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2023, 18, 1, CAST(N'2019-12-21' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2024, 1, 19, CAST(N'2019-12-24' AS Date), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DeviceTypeComponantType] ([id], [TypeSymbolParents], [TypeSymbolChildren], [CreatedDate], [ModifiedDate], [UserCreated], [UserModified], [IsDeleted], [TypeComponant]) VALUES (2026, 1, 19, CAST(N'2019-12-29' AS Date), NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[DeviceTypeComponantType] OFF
SET IDENTITY_INSERT [dbo].[ProjectDKC] ON 

INSERT [dbo].[ProjectDKC] ([Id], [ProjectName], [ProjectSymbol], [ManagerProject], [Address], [FromDate], [ToDate], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [TypeProject]) VALUES (5, N'Phòng kĩ thuật 1', N'P001                                              ', 1, N'Tầng 1, tòa Center Poin, 219 Trung Kính,hn', NULL, NULL, CAST(N'2019-10-22' AS Date), CAST(N'0001-01-01' AS Date), 2, 0, 1)
INSERT [dbo].[ProjectDKC] ([Id], [ProjectName], [ProjectSymbol], [ManagerProject], [Address], [FromDate], [ToDate], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [TypeProject]) VALUES (6, N'Phòng kĩ thuật 2', N'P002                                              ', 2, N'Tầng 1, 219 Trung Kính, Hà Nội', NULL, NULL, CAST(N'2019-10-22' AS Date), CAST(N'0001-01-01' AS Date), 1, 0, 1)
INSERT [dbo].[ProjectDKC] ([Id], [ProjectName], [ProjectSymbol], [ManagerProject], [Address], [FromDate], [ToDate], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [TypeProject]) VALUES (1008, N'Phòng kĩ thuật 4', N'PKT4                                              ', NULL, N'', NULL, NULL, CAST(N'2019-12-18' AS Date), CAST(N'0001-01-01' AS Date), 1, 0, 1)
INSERT [dbo].[ProjectDKC] ([Id], [ProjectName], [ProjectSymbol], [ManagerProject], [Address], [FromDate], [ToDate], [CreatedDate], [ModifiedDate], [Status], [IsDeleted], [TypeProject]) VALUES (1011, N'Phòng số hóa', N'PSH                                               ', 4, N'', NULL, NULL, CAST(N'2019-12-28' AS Date), NULL, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[ProjectDKC] OFF
SET IDENTITY_INSERT [dbo].[RepairDetails] ON 

INSERT [dbo].[RepairDetails] ([Id], [DeviceId], [DateOfRepair], [NextDateOfRepair], [TimeOrder], [TypeOfRepair], [AddressOfRepair], [UserId], [Notes], [CreateDate], [Price], [Status]) VALUES (2, 10, CAST(N'2019-10-16' AS Date), NULL, NULL, NULL, N'', 3, N'', CAST(N'2019-10-21' AS Date), NULL, 0)
INSERT [dbo].[RepairDetails] ([Id], [DeviceId], [DateOfRepair], [NextDateOfRepair], [TimeOrder], [TypeOfRepair], [AddressOfRepair], [UserId], [Notes], [CreateDate], [Price], [Status]) VALUES (3, 17, CAST(N'2019-10-23' AS Date), NULL, 10, 1, N'', 4, N'<p>Hỏng mạch điện&nbsp;</p>', CAST(N'2019-10-23' AS Date), 234000, 1)
INSERT [dbo].[RepairDetails] ([Id], [DeviceId], [DateOfRepair], [NextDateOfRepair], [TimeOrder], [TypeOfRepair], [AddressOfRepair], [UserId], [Notes], [CreateDate], [Price], [Status]) VALUES (1002, 1, CAST(N'2019-10-29' AS Date), NULL, NULL, 1, N'Hà Nội', 2, N'<p>Hỏng m&agrave;n&nbsp;</p>', CAST(N'2019-10-29' AS Date), 12000000, 1)
INSERT [dbo].[RepairDetails] ([Id], [DeviceId], [DateOfRepair], [NextDateOfRepair], [TimeOrder], [TypeOfRepair], [AddressOfRepair], [UserId], [Notes], [CreateDate], [Price], [Status]) VALUES (1003, 16, CAST(N'2019-10-30' AS Date), NULL, NULL, NULL, NULL, 4, N'hỏng tản nhiệt ', CAST(N'2019-10-30' AS Date), NULL, 0)
INSERT [dbo].[RepairDetails] ([Id], [DeviceId], [DateOfRepair], [NextDateOfRepair], [TimeOrder], [TypeOfRepair], [AddressOfRepair], [UserId], [Notes], [CreateDate], [Price], [Status]) VALUES (3003, 3095, CAST(N'2019-12-19' AS Date), NULL, NULL, 1, N'', NULL, N'', CAST(N'2019-12-19' AS Date), 5000000, 1)
INSERT [dbo].[RepairDetails] ([Id], [DeviceId], [DateOfRepair], [NextDateOfRepair], [TimeOrder], [TypeOfRepair], [AddressOfRepair], [UserId], [Notes], [CreateDate], [Price], [Status]) VALUES (3004, 3095, CAST(N'2019-12-31' AS Date), NULL, NULL, 1, N'', 1, N'', CAST(N'2019-12-19' AS Date), 10000, 1)
INSERT [dbo].[RepairDetails] ([Id], [DeviceId], [DateOfRepair], [NextDateOfRepair], [TimeOrder], [TypeOfRepair], [AddressOfRepair], [UserId], [Notes], [CreateDate], [Price], [Status]) VALUES (3005, 3090, CAST(N'2019-12-28' AS Date), NULL, 10, 1, N'', 7, N'', CAST(N'2019-12-28' AS Date), 120000, 1)
SET IDENTITY_INSERT [dbo].[RepairDetails] OFF
SET IDENTITY_INSERT [dbo].[RepairType] ON 

INSERT [dbo].[RepairType] ([Id], [TypeName], [Notes]) VALUES (1, N'Sửa Phần cứng ', N'')
SET IDENTITY_INSERT [dbo].[RepairType] OFF
SET IDENTITY_INSERT [dbo].[RequestDevice] ON 

INSERT [dbo].[RequestDevice] ([Id], [UserRequest], [DateOfRequest], [DateOfUse], [DeviceName], [TypeOfDevice], [Configuration], [Notes], [Approved], [UserApproved], [CreatedDate], [Status], [NumDevice], [NoteProcess], [NoteReasonRefuse], [NameUserApproved]) VALUES (1, 1, CAST(N'2019-09-03' AS Date), CAST(N'2019-09-05' AS Date), N'Màn máy tính ', 2, N'', N'', 1, NULL, CAST(N'2019-09-20' AS Date), 1, 2, N'đã chuyển 100 thiết bị rồi ', N'', N'')
INSERT [dbo].[RequestDevice] ([Id], [UserRequest], [DateOfRequest], [DateOfUse], [DeviceName], [TypeOfDevice], [Configuration], [Notes], [Approved], [UserApproved], [CreatedDate], [Status], [NumDevice], [NoteProcess], [NoteReasonRefuse], [NameUserApproved]) VALUES (2, 4, CAST(N'2019-12-02' AS Date), CAST(N'2019-12-11' AS Date), N'Máy tính ', 1, N'', N'', 0, NULL, CAST(N'2019-12-28' AS Date), 2, 10, N'', N'Không phù hợp', N'')
INSERT [dbo].[RequestDevice] ([Id], [UserRequest], [DateOfRequest], [DateOfUse], [DeviceName], [TypeOfDevice], [Configuration], [Notes], [Approved], [UserApproved], [CreatedDate], [Status], [NumDevice], [NoteProcess], [NoteReasonRefuse], [NameUserApproved]) VALUES (3, 4, CAST(N'2019-12-28' AS Date), CAST(N'2019-12-25' AS Date), N'Máy in', 11, N'<p>- Cấu h&igrave;nh m&aacute;y in&nbsp;</p>', N'', 0, NULL, CAST(N'2019-12-28' AS Date), 1, 1, N'Đã giao 1 thiết bị', N'', NULL)
INSERT [dbo].[RequestDevice] ([Id], [UserRequest], [DateOfRequest], [DateOfUse], [DeviceName], [TypeOfDevice], [Configuration], [Notes], [Approved], [UserApproved], [CreatedDate], [Status], [NumDevice], [NoteProcess], [NoteReasonRefuse], [NameUserApproved]) VALUES (6, 4, CAST(N'2019-12-28' AS Date), CAST(N'2019-12-25' AS Date), N'Ghế hòa phát', 6, N'', N'Cần gấp để họp ', 0, NULL, CAST(N'2019-12-28' AS Date), 2, 5, N'', N'Không hợp lý', NULL)
SET IDENTITY_INSERT [dbo].[RequestDevice] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_DEPARTMENT', N'Thêm phòng ban')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_DEVICE', N'Thêm thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_DEVICE_COMPONAN', N'Thêm mới thiết bị con ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_DEVICE_DEVICE', N'Thêm thiết bị con cho thiết bị cha')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_DEVICE_TYPE', N'Thêm loại thiết bị ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_DEVICEINPROJECT', N'Thêm thiết bị vào phòng ban')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_EMPLOYEE', N'Thêm nhân viên')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_GROUP_ROLE', N'Thêm nhóm quyền')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_REPAIR_DEVICE', N'Thêm sửa chữa thiết bị ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_REQUEST_DEVICE', N'Thêm yêu cầu thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_ROLE_FOR_GROUP', N'Thêm quyền cho nhóm quyền')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_SUPPLIER', N'Thêm nhà cung cấp')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_TYPE_COMPONAN', N'Thêm loại thiết bị con cho thiết bị cha')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm người dùng')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CHANGE_INFO_USER', N'Thay đổi thông tin người dùng')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CHANGE_USER_GROUP', N'Thay đổi nhóm quyền cho người dùng')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_DEPARTMENT', N'Xóa phòng ban')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_DEVICE', N'Xóa thiết bị ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_DEVICE_DEVICE', N'Xóa thiết bị con khỏi thiết bị cha')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_GROUP_ROLE', N'Xóa nhóm quyền')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_REQUEST_DEVICE', N'Xóa yêu cầu thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_TYPE_PR_DV', N'Xóa loại thiết bị con khỏi loại thiết bị cha')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xóa người dùng')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_DEPARTMENT', N'Sửa thông tin phòng ban')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_DEVICE', N'Sửa thông tin thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_EMPLOYEE', N'Sửa thông tin nhân viên ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_REQUEST_DEVICE', N'Sửa yêu cầu thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EXEL_LIST_DDEVICE', N'Xuất danh sách thiết bị ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EXPORT_DV_IN_DEPARTMENT', N'Xuất exel danh sách thiết bị tại phòng ban')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EXPORT_STATISTICAL_DEVICE', N'Xuất exel thống kê thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'LIQUIDATION_DEVICE', N'Thanh lý thiết bị ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'MANAGER_TYPE_PR_DV', N'Quản lý loại thiết bị cha con')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRINTBARCODE_DEVICE', N'Tạo mã vạch thiết bị ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'RETURN_DEVICETODEPOT', N'Trả thiết bị về kho')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'SCAN_ADD_DVDEPARTMENT', N'Quét thêm thiết bị vào phòng ban')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'SCAN_DEVICE', N'Quét thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'SCAN_RETURN_DV', N'Quét trả thiết bị về kho')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'SEACH_DEVICE', N'Tìm kiếm thiết bị ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'SEARCH_DEVICE_COMPONAN', N'Tìm kiếm thiết bị con từ danh sách ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_DEPARTMENT', N'Xem danh sách phòng ban')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_DEVICE', N'Xem danh sách thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_EMPLOYEE', N'Xem danh sách nhân viên ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_GROUP_ROLE', N'Xem danh sách nhóm quyền')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_REQUEST_DEVICE', N'Xem danh sách yêu cầu thiết bị')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_STATISTICAL_DEPARTMENT', N'Xem thống kê thiết bị tại phòng ban')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_STATISTICAL_DEVICE', N'Xem thống kê thiết bị ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách người dùng')
SET IDENTITY_INSERT [dbo].[ScheduleTest] ON 

INSERT [dbo].[ScheduleTest] ([Id], [DeviceId], [DateOfTest], [NextDateOfTest], [CategoryTest], [UserTest], [Notes], [Status], [CreateDate]) VALUES (1, 2, CAST(N'2019-09-03' AS Date), NULL, N'Vệ sinh máy ', NULL, N'', 1, CAST(N'2019-09-20' AS Date))
INSERT [dbo].[ScheduleTest] ([Id], [DeviceId], [DateOfTest], [NextDateOfTest], [CategoryTest], [UserTest], [Notes], [Status], [CreateDate]) VALUES (2, 2, CAST(N'2020-01-05' AS Date), CAST(N'2020-01-16' AS Date), N'Kiểm tra phần cứng ', 5, N'', 1, CAST(N'2020-01-04' AS Date))
SET IDENTITY_INSERT [dbo].[ScheduleTest] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [Email], [Phone], [Address], [Support], [Status]) VALUES (1, N'Máy tính Hà Nội', N'mt@gmail.com                                      ', N'09823252342    ', N'Thanh Xuân, Hà Nội', NULL, 0)
INSERT [dbo].[Supplier] ([Id], [Name], [Email], [Phone], [Address], [Support], [Status]) VALUES (2, N'Thiết bị số Hà Tây', N'tbs@gmail.com                                     ', N'0968435253     ', N'Hà Tây, Hà Nội, VN', NULL, 0)
INSERT [dbo].[Supplier] ([Id], [Name], [Email], [Phone], [Address], [Support], [Status]) VALUES (3, N'Điện máy xanh', N'dmx@gmail.com                                     ', N'01239650655    ', N'Nam Định, Việt Nam', NULL, 0)
INSERT [dbo].[Supplier] ([Id], [Name], [Email], [Phone], [Address], [Support], [Status]) VALUES (4, N'Nội thất BMT', N'nt@gmail.com                                      ', N'0166434884     ', N'Hà Nội', N'Bùi Minh Trí 
SDT: 0399602128', 0)
INSERT [dbo].[Supplier] ([Id], [Name], [Email], [Phone], [Address], [Support], [Status]) VALUES (5, N'Công ty Lê Bảo Minh', N'Lebaominh@gmail.com                               ', N'0986743321     ', N'Hà Nội', N'', 0)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[UsageDevice] ON 

INSERT [dbo].[UsageDevice] ([Id], [DateUse], [UserId], [ProjectId], [Notes], [DeviceId]) VALUES (3144, CAST(N'2019-12-28' AS Date), NULL, 6, N'Thêm vào dự án', 3090)
INSERT [dbo].[UsageDevice] ([Id], [DateUse], [UserId], [ProjectId], [Notes], [DeviceId]) VALUES (3145, CAST(N'2019-12-28' AS Date), NULL, 6, N'Trả về kho', 3090)
SET IDENTITY_INSERT [dbo].[UsageDevice] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [PassWord], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [RoleId], [Status], [IsDeleted], [GroupID]) VALUES (1, N'BMT                                               ', N'123                                                                                                                                                                                                     ', N'BMT', N'aaa                                               ', N'123            ', N'aaa', NULL, NULL, NULL, NULL, NULL, N'ADMIN')
INSERT [dbo].[User] ([Id], [UserName], [PassWord], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [RoleId], [Status], [IsDeleted], [GroupID]) VALUES (2, N'DMV                                               ', N'123                                                                                                                                                                                                     ', N'Đỗ Minh Vượng', N'V@gmail.com                                       ', N'01266456578    ', N'Nam Định', N'Phòng 1 ', N'Developer', NULL, 0, 0, N'MEMBER')
INSERT [dbo].[User] ([Id], [UserName], [PassWord], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [RoleId], [Status], [IsDeleted], [GroupID]) VALUES (3, N'PML                                               ', N'123                                                                                                                                                                                                     ', N'Phí Mạnh Lợi ', N'L@gmail.com                                       ', N'01658395385    ', N'Thạch Thất, Hà Nội', N'Phòng 1 ', N'Developer', NULL, 0, 0, N'MANANGER')
INSERT [dbo].[User] ([Id], [UserName], [PassWord], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [RoleId], [Status], [IsDeleted], [GroupID]) VALUES (4, N'BMT1                                              ', NULL, N'Bùi Minh Trí', N'T@gmail.com                                       ', N'03996021237    ', N'Xuân Trường,Nam Định', N'Phòng 3 ', N'Tester', NULL, 0, 0, N'MEMBER')
INSERT [dbo].[User] ([Id], [UserName], [PassWord], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [RoleId], [Status], [IsDeleted], [GroupID]) VALUES (5, N'LKQ                                               ', NULL, N'Lưu Kiến Quyết', N'Q@gmail.com                                       ', N'0987354632     ', N'Nam Định ', N'Phòng 2', N'Developer', NULL, 0, 0, N'MEMBER')
INSERT [dbo].[User] ([Id], [UserName], [PassWord], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [RoleId], [Status], [IsDeleted], [GroupID]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [UserName], [PassWord], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [RoleId], [Status], [IsDeleted], [GroupID]) VALUES (7, N'BTH                                               ', NULL, N'Bùi Thị Hương', N'huongbt@gmail.com                                 ', N'               ', N'', N'', N'', NULL, 0, 0, N'MEMBER')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN2', N'ADMIN')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'DIRECTOR', N'Giám đốc')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MANAGER', N'Trưởng phòng')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'OFFICER', N'Quản lý viên')
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([Id], [UserName], [PassWord], [GroupID], [FullName], [Email], [IsDeleted], [Status]) VALUES (16, N'BMT                                               ', N'827ccb0eea8a706c4c34a16891f84e7b                  ', N'ADMIN', N'Bùi Minh Trí', NULL, 0, NULL)
INSERT [dbo].[UserLogin] ([Id], [UserName], [PassWord], [GroupID], [FullName], [Email], [IsDeleted], [Status]) VALUES (17, N'DMV                                               ', N'827ccb0eea8a706c4c34a16891f84e7b                  ', N'DIRECTOR', N'Đỗ Minh Vượng', NULL, 0, NULL)
INSERT [dbo].[UserLogin] ([Id], [UserName], [PassWord], [GroupID], [FullName], [Email], [IsDeleted], [Status]) VALUES (18, N'PML                                               ', N'827ccb0eea8a706c4c34a16891f84e7b                  ', N'MANAGER', N'Phí Mạnh Lợi', NULL, 0, NULL)
INSERT [dbo].[UserLogin] ([Id], [UserName], [PassWord], [GroupID], [FullName], [Email], [IsDeleted], [Status]) VALUES (19, N'TMT                                               ', N'827ccb0eea8a706c4c34a16891f84e7b                  ', N'MEMBER', N'Trần Minh Thành', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [FK_Credential_UserGroup] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [FK_Credential_UserGroup]
GO
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [FK_Credential_UserGroup1] FOREIGN KEY([UserGroupID])
REFERENCES [dbo].[UserGroup] ([ID])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [FK_Credential_UserGroup1]
GO
ALTER TABLE [dbo].[DestructivelDevice]  WITH CHECK ADD  CONSTRAINT [FK_CancelDevice_CancelType] FOREIGN KEY([TypeOfDestructive])
REFERENCES [dbo].[DestructiveType] ([Id])
GO
ALTER TABLE [dbo].[DestructivelDevice] CHECK CONSTRAINT [FK_CancelDevice_CancelType]
GO
ALTER TABLE [dbo].[DestructivelDevice]  WITH CHECK ADD  CONSTRAINT [FK_CancelDevice_Device] FOREIGN KEY([DeviceId])
REFERENCES [dbo].[Device] ([Id])
GO
ALTER TABLE [dbo].[DestructivelDevice] CHECK CONSTRAINT [FK_CancelDevice_Device]
GO
ALTER TABLE [dbo].[DestructivelDevice]  WITH CHECK ADD  CONSTRAINT [FK_CancelDevice_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DestructivelDevice] CHECK CONSTRAINT [FK_CancelDevice_User]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_DeviceType] FOREIGN KEY([TypeOfDevice])
REFERENCES [dbo].[DeviceType] ([Id])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_DeviceType]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_Supplier]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_User]
GO
ALTER TABLE [dbo].[DeviceDevice]  WITH CHECK ADD  CONSTRAINT [FK_DeviceDevice_Device] FOREIGN KEY([DeviceCodeChildren])
REFERENCES [dbo].[Device] ([Id])
GO
ALTER TABLE [dbo].[DeviceDevice] CHECK CONSTRAINT [FK_DeviceDevice_Device]
GO
ALTER TABLE [dbo].[DeviceDevice]  WITH CHECK ADD  CONSTRAINT [FK_DeviceDevice_Device1] FOREIGN KEY([DeviceCodeParents])
REFERENCES [dbo].[Device] ([Id])
GO
ALTER TABLE [dbo].[DeviceDevice] CHECK CONSTRAINT [FK_DeviceDevice_Device1]
GO
ALTER TABLE [dbo].[DeviceOfProject]  WITH CHECK ADD  CONSTRAINT [FK_DeviceOfProject_Device] FOREIGN KEY([DeviceId])
REFERENCES [dbo].[Device] ([Id])
GO
ALTER TABLE [dbo].[DeviceOfProject] CHECK CONSTRAINT [FK_DeviceOfProject_Device]
GO
ALTER TABLE [dbo].[DeviceOfProject]  WITH CHECK ADD  CONSTRAINT [FK_DeviceOfProject_ProjectDKC] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[ProjectDKC] ([Id])
GO
ALTER TABLE [dbo].[DeviceOfProject] CHECK CONSTRAINT [FK_DeviceOfProject_ProjectDKC]
GO
ALTER TABLE [dbo].[DeviceTypeComponantType]  WITH CHECK ADD  CONSTRAINT [FK_DeviceTypeComponantType_DeviceType] FOREIGN KEY([TypeSymbolChildren])
REFERENCES [dbo].[DeviceType] ([Id])
GO
ALTER TABLE [dbo].[DeviceTypeComponantType] CHECK CONSTRAINT [FK_DeviceTypeComponantType_DeviceType]
GO
ALTER TABLE [dbo].[DeviceTypeComponantType]  WITH CHECK ADD  CONSTRAINT [FK_DeviceTypeComponantType_DeviceType1] FOREIGN KEY([TypeSymbolParents])
REFERENCES [dbo].[DeviceType] ([Id])
GO
ALTER TABLE [dbo].[DeviceTypeComponantType] CHECK CONSTRAINT [FK_DeviceTypeComponantType_DeviceType1]
GO
ALTER TABLE [dbo].[ProjectDKC]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDKC_User] FOREIGN KEY([ManagerProject])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ProjectDKC] CHECK CONSTRAINT [FK_ProjectDKC_User]
GO
ALTER TABLE [dbo].[RepairDetails]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetails_Device] FOREIGN KEY([DeviceId])
REFERENCES [dbo].[Device] ([Id])
GO
ALTER TABLE [dbo].[RepairDetails] CHECK CONSTRAINT [FK_RepairDetails_Device]
GO
ALTER TABLE [dbo].[RepairDetails]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetails_RepairType] FOREIGN KEY([TypeOfRepair])
REFERENCES [dbo].[RepairType] ([Id])
GO
ALTER TABLE [dbo].[RepairDetails] CHECK CONSTRAINT [FK_RepairDetails_RepairType]
GO
ALTER TABLE [dbo].[RepairDetails]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetails_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RepairDetails] CHECK CONSTRAINT [FK_RepairDetails_User]
GO
ALTER TABLE [dbo].[RequestDevice]  WITH CHECK ADD  CONSTRAINT [FK_RequestDevice_DeviceType] FOREIGN KEY([TypeOfDevice])
REFERENCES [dbo].[DeviceType] ([Id])
GO
ALTER TABLE [dbo].[RequestDevice] CHECK CONSTRAINT [FK_RequestDevice_DeviceType]
GO
ALTER TABLE [dbo].[RequestDevice]  WITH CHECK ADD  CONSTRAINT [FK_RequestDevice_User] FOREIGN KEY([UserRequest])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RequestDevice] CHECK CONSTRAINT [FK_RequestDevice_User]
GO
ALTER TABLE [dbo].[ScheduleTest]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleTest_Device] FOREIGN KEY([DeviceId])
REFERENCES [dbo].[Device] ([Id])
GO
ALTER TABLE [dbo].[ScheduleTest] CHECK CONSTRAINT [FK_ScheduleTest_Device]
GO
ALTER TABLE [dbo].[ScheduleTest]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleTest_User] FOREIGN KEY([UserTest])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ScheduleTest] CHECK CONSTRAINT [FK_ScheduleTest_User]
GO
ALTER TABLE [dbo].[UsageDevice]  WITH CHECK ADD  CONSTRAINT [FK_UsageDevice_Device] FOREIGN KEY([DeviceId])
REFERENCES [dbo].[Device] ([Id])
GO
ALTER TABLE [dbo].[UsageDevice] CHECK CONSTRAINT [FK_UsageDevice_Device]
GO
ALTER TABLE [dbo].[UsageDevice]  WITH CHECK ADD  CONSTRAINT [FK_UsageDevice_ProjectDKC] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[ProjectDKC] ([Id])
GO
ALTER TABLE [dbo].[UsageDevice] CHECK CONSTRAINT [FK_UsageDevice_ProjectDKC]
GO
ALTER TABLE [dbo].[UsageDevice]  WITH CHECK ADD  CONSTRAINT [FK_UsageDevice_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UsageDevice] CHECK CONSTRAINT [FK_UsageDevice_User]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_UserGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroup] ([ID])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_UserGroup]
GO
/****** Object:  StoredProcedure [dbo].[AddDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDevice]  
      @DeviceCode char(50),
	  @NewCode char(50),
      @DeviceName nvarchar(200),
      @TypeOfDevice int,
      @ParentId int,
      @Configuration nvarchar(500),
      @Price float,
      @PurchaseContract nvarchar(500),
      @DateOfPurchase date,
      @SupplierId int,
	  @ProjectId int,
      @Guarantee date,
	  @Notes nvarchar(2000),
      @UserId int,
      @Status int
AS
BEGIN
   INSERT INTO Device(DeviceCode,NewCode,DeviceName,TypeOfDevice,ParentId,Configuration,Price,PurchaseContract,DateOfPurchase,SupplierId,Guarantee,Notes, UserId,CreatedDate,Status,IsDeleted)
   values(@DeviceCode,@NewCode,@DeviceName,@TypeOfDevice,@ParentId,@Configuration,@Price,@PurchaseContract,@DateOfPurchase,@SupplierId,@Guarantee,@Notes,@UserId,GETDATE(),@Status,0)
   declare @deviceid int
   set @deviceid=SCOPE_IDENTITY()
   if(@ProjectId !=0)
      begin
            INSERT INTO DeviceOfProject (ProjectId, DeviceId, DateOfDelivery, DateOfReturn, Status, IsDeleted)
  VALUES ( @ProjectId, @deviceid, GETDATE(), null, 1, 0 )
		   Update Device set Status=1 where Id=@deviceid
	  end
END



GO
/****** Object:  StoredProcedure [dbo].[AddDeviceOfDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [dbo].[AddDeviceOfDevice]
  @IdParent int,
  @IdChild int ,
  @TypeChild int,
  @TypeParent int ,
  @TypeComponant int
AS
BEGIN
  INSERT INTO DeviceDevice (DeviceCodeParents, DeviceCodeChildren, TypeSymbolParents,TypeSymbolChildren ,CreatedDate, IsDeleted,TypeComponant)
  VALUES ( @IdParent, @IdChild,@TypeParent, @TypeChild,GETDATE(), 0,@TypeComponant ) 
  Update Device  set ParentId = @IdParent where Id= @IdChild
END   


GO
/****** Object:  StoredProcedure [dbo].[AddDeviceOfProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddDeviceOfProject]
  @ProjectId  int,
  @DeviceId int , 
  @Notes nvarchar(2000)
 
AS
BEGIN
  INSERT INTO DeviceOfProject (ProjectId, DeviceId, DateOfDelivery, DateOfReturn, Status, Notes, IsDeleted)
  VALUES ( @ProjectId, @DeviceId, GETDATE(), null, 1, @Notes, 0 )
  Update Device set Status=1 where Id=@DeviceId
  --Insert into UsageDevice(DeviceId,ProjectId,DateUse,Notes)
  --values(@DeviceId,@ProjectId,GETDATE(),N'Thêm vào dự án')
END


GO
/****** Object:  StoredProcedure [dbo].[AddDeviceType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDeviceType]  
      @TypeName nvarchar(100),
	  @TypeSymbol nchar(50),
      @Notes nvarchar(1000)
AS
BEGIN
   Insert into DeviceType(TypeName,TypeSymbol,Notes)
   values (@TypeName, @TypeSymbol,@Notes)
END


GO
/****** Object:  StoredProcedure [dbo].[AddProject ]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProject ]
    @ProjectSymbol nchar(50),
    @ProjectName nvarchar(200),
    @ManagerProject int,
    @Address nvarchar(1000),
    @FromDate Date ,
	@ToDate Date,
	@Status int
AS
BEGIN
     INSERT INTO ProjectDKC (ProjectSymbol, ProjectName, ManagerProject, Address, FromDate,ToDate,CreatedDate,Status,IsDeleted,TypeProject)
     VALUES( @ProjectSymbol,@ProjectName, @ManagerProject, @Address, @FromDate, @ToDate,GETDATE(), @Status, 0,1)
END


GO
/****** Object:  StoredProcedure [dbo].[AddRepairDetails]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[AddRepairDetails]
           @DeviceId int,
           @DateOfRepair date,
           @NextDateOfRepair date,
           @TimeOrder int,
           @TypeOfRepair int,
           @AddressOfRepair nvarchar(500),
           @UserId int,
           @Notes nvarchar(1000)
		

          
	AS
	BEGIN
	 INSERT INTO [dbo].[RepairDetails]
           ([DeviceId]
           ,[DateOfRepair]
           ,[NextDateOfRepair]
           ,[TimeOrder]
           ,[TypeOfRepair]
           ,[AddressOfRepair]
           ,[UserId]
           ,[Notes]
           ,[CreateDate]
		   ,[Status]
		   ,[Price])
     VALUES
           (@DeviceId ,
           @DateOfRepair ,
           @NextDateOfRepair ,
           @TimeOrder ,
           @TypeOfRepair ,
           @AddressOfRepair ,
           @UserId ,
           @Notes ,
           GETDATE(),
		   0,
		   null)

     Update Device set StatusRepair=1,ModifiedDate=GETDATE() where Id=@DeviceId

	END



GO
/****** Object:  StoredProcedure [dbo].[AddRepairType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[AddRepairType]
          
          @TypeName nvarchar(100), 
		  @Notes nvarchar(1000)
AS
BEGIN
      INSERT INTO RepairType(TypeName,Notes)
	  VALUES (@TypeName,@Notes)
END



GO
/****** Object:  StoredProcedure [dbo].[AddRequestDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddRequestDevice]
           @UserRequest int,
           @DateOfRequest date,
           @DateOfUse date,
           @DeviceName nvarchar(200),
           @TypeOfDevice int,
           @Configuration nvarchar(2000),
           @Notes nvarchar(2000),     
           @Status int,
		   @NumDevice int ,
		   @UserApproved int
  
AS
BEGIN
    INSERT INTO RequestDevice (UserRequest, DateOfRequest, DateOfUse, DeviceName, TypeOfDevice, Configuration, Notes, Approved, UserApproved, CreatedDate, Status,NumDevice)
	VALUES ( @UserRequest ,
           GETDATE() ,
           @DateOfUse ,
           @DeviceName ,
           @TypeOfDevice,
           @Configuration,
           @Notes ,
           0,
           @UserApproved,
           GETDATE() ,
           @Status ,
		   @NumDevice)
END



GO
/****** Object:  StoredProcedure [dbo].[AddScheduleTest]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddScheduleTest]
           @DeviceId int,
           @DateOfTest date,
           @NextDateOfTest date,
           @CategoryTest nvarchar(2000),
           @UserTest int,
           @Notes nvarchar(2000)
         
  
AS
BEGIN
    INSERT INTO  ScheduleTest ( DeviceId, DateOfTest, NextDateOfTest, CategoryTest, UserTest, Notes, Status, CreateDate )
	VALUES ( @DeviceId,  @DateOfTest, @NextDateOfTest,@CategoryTest,@UserTest,@Notes, 0, GETDATE() )
END





GO
/****** Object:  StoredProcedure [dbo].[AddSupplier]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSupplier]  
      @Name nvarchar(200),
      @Email char(50),
      @Phone char(15),
      @Address nvarchar(50),
      @Support nvarchar(500)
AS
BEGIN
    Insert into Supplier(Name,Email,Phone,Address,Support,Status)
    values (@Name,@Email,@Phone,@Address,@Support,0)
END


GO
/****** Object:  StoredProcedure [dbo].[AddTypeChidren]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddTypeChidren]
@TypeChidren int,
@TypeParent int,
@Type_TypeCom int
AS
BEGIN
  INSERT INTO DeviceTypeComponantType (TypeSymbolParents,TypeSymbolChildren,CreatedDate,ModifiedDate,UserCreated,UserModified,IsDeleted,TypeComponant)
  VALUES ( @TypeParent, @TypeChidren, GETDATE(), null,null, null, 0 ,@Type_TypeCom)
END   


GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser]  
      @UserName char(50),
      @PassWord char(200),
      @FullName nvarchar(100),
      @Email char(50),
      @PhoneNumber char(15),
      @Address nvarchar(500),
      @Department nvarchar(100),
      @Position nvarchar(100),
      @RoleId int,
      @Status int
AS
BEGIN
   Insert into [dbo].[User](UserName,PassWord,FullName,Email,PhoneNumber,Address,Department,Position,RoleId,Status,IsDeleted)
   values (@UserName,@PassWord,@FullName,@Email,@PhoneNumber,@Address,@Department,@Position,@RoleId,@Status,0)
END


GO
/****** Object:  StoredProcedure [dbo].[ChildrenOfDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ChildrenOfDevice]
@DeviceCodeParents int,
@TypeSymbolChildren int
as
begin
select v.DeviceCode,v.DeviceName,v.TypeOfDevice,p.TypeName,v.Configuration, (FORMAT(v.Price,'#,#')) Price,v.StatusRepair,v.Status as StatusDevice,v.PurchaseContract,v.DateOfPurchase

, d.DeviceCodeParents, d.DeviceCodeChildren,d.TypeSymbolParents,d.TypeSymbolChildren,d.IsDeleted, d.id,d.TypeComponant

 from DeviceDevice d, Device v ,DeviceType p 
  where d.DeviceCodeChildren = v.Id  and v.TypeOfDevice = p.Id
   and  d.DeviceCodeParents = @DeviceCodeParents   and d.TypeSymbolChildren = @TypeSymbolChildren  and d.IsDeleted = 0                                           
end 



GO
/****** Object:  StoredProcedure [dbo].[DeleteAllRole]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROC [dbo].[DeleteAllRole]
  @GroupId varchar(20)
  
AS
BEGIN
  Delete from Credential  
  where  UserGroupID =  @GroupId
END   


GO
/****** Object:  StoredProcedure [dbo].[DeleteDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteDevice]
@Id int
As
    Delete from Device
    where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[DeleteDevice1]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDevice1]
@Id char(5000)
AS
BEGIN
    Update Device
    set IsDeleted=1
    WHERE CHARINDEX(','+LTRIM(RTRIM(CAST(Id AS char(5000))))+',',+@Id) > 0 
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteDeviceOfDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[DeleteDeviceOfDevice]
  @IdParent int,
  @IdChild int ,
  @Resons nvarchar(500)
AS
BEGIN
  update DeviceDevice 
  set IsDeleted = 1 , Notes = @Resons
  where DeviceCodeParents =  @IdParent and   DeviceCodeChildren = @IdChild and IsDeleted = 0 
  Update Device  set ParentId = null where Id= @IdChild
END   

GO
/****** Object:  StoredProcedure [dbo].[DeleteDeviceOfProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[DeleteDeviceOfProject]
	  @Id int

	AS
	BEGIN
	  DELETE DeviceOfProject 
	  WHERE Id = @Id  
	END


GO
/****** Object:  StoredProcedure [dbo].[DeleteDeviceType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteDeviceType]
@Id int
As
Begin
    Update Device set TypeOfDevice = null where TypeOfDevice =@Id and IsDeleted =1
	Delete RequestDevice where TypeOfDevice =@Id
    Delete from DeviceType
    where Id=@Id
End





GO
/****** Object:  StoredProcedure [dbo].[DeleteProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteProject]
    @Id int
As
Begin
  Update ProjectDKC
    set IsDeleted=1, Status =3
Where Id = @Id
end



GO
/****** Object:  StoredProcedure [dbo].[DeleteProject1]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProject1]
@Id char(5000)
AS
BEGIN
    Update ProjectDKC
    set IsDeleted=1, Status =3
    WHERE CHARINDEX(','+LTRIM(RTRIM(CAST(Id AS CHAR(5000))))+',',+@Id) > 0 
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteRepairDetails]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteRepairDetails]
@Id char(5000)
AS
BEGIN
    Delete  from RepairDetails 
    WHERE CHARINDEX(','+LTRIM(RTRIM(CAST(Id AS CHAR(5000))))+',',+@Id) > 0 
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteRepairDetailsOne]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[DeleteRepairDetailsOne]
    @Id int
As
Begin
  Delete RepairDetails   
  Where Id = @Id
end



GO
/****** Object:  StoredProcedure [dbo].[DeleteRepairType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteRepairType]
@Id char(11)
AS
BEGIN
    Delete RepairType
    WHERE CHARINDEX(','+LTRIM(RTRIM(CAST(Id AS CHAR(11))))+',',+@Id) > 0 
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteRequestDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteRequestDevice]
@Id char(5000)
AS
BEGIN
    Delete  from RequestDevice
    WHERE CHARINDEX(','+LTRIM(RTRIM(CAST(Id AS CHAR(5000))))+',',+@Id) > 0 
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteRole]
@Id int
As
    Delete from Role
    where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[DeleteScheduleTest]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteScheduleTest]
@Id char(5000)
AS
BEGIN
    Delete ScheduleTest

    WHERE CHARINDEX(','+LTRIM(RTRIM(CAST(Id AS CHAR(5000))))+',',+@Id) > 0 
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteSupplier]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[DeleteSupplier]
@Id int
As
Begin
    Update Device set SupplierId = null where SupplierId =@Id and IsDeleted =1
    Delete from Supplier
    where Id=@Id
End



GO
/****** Object:  StoredProcedure [dbo].[DeleteTypeParentTypeChild]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[DeleteTypeParentTypeChild]
@TypeChidren int,
@TypeParent int

AS
BEGIN
  Update DeviceTypeComponantType set IsDeleted = 1  where TypeSymbolChildren = @TypeChidren and TypeSymbolParents = @TypeParent and IsDeleted = 0
END   


GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]  
      @Id int
AS
BEGIN
    Update [dbo].[User] set IsDeleted=1
    where Id=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[DeviceById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeviceById]
@Id int
As
    Select dv.*, (  FORMAT(dv.Price, '#,#'))  PriceOne ,(SELECT pj.ProjectName FROM DeviceOfProject dp INNER JOIN ProjectDKC pj ON dp.ProjectId = pj.Id WHERE dp.Status = 1 AND dp.DeviceId = dv.Id) ProjectName,
	            (SELECT dp.ProjectId FROM DeviceOfProject dp INNER JOIN ProjectDKC pj ON dp.ProjectId = pj.Id WHERE dp.Status = 1 AND dp.DeviceId = dv.Id) IdProject 
				 from Device dv
    where dv.Id=@Id



GO
/****** Object:  StoredProcedure [dbo].[DeviceHistory]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[DeviceHistory]
as
begin
Select p.ProjectName,d.DeviceId ,v.DeviceName,v.Configuration,v.TypeOfDevice ,d.DateOfDelivery,d.DateOfReturn ,d.Notes ,v.Id,t.TypeName,v.DeviceCode,v.Status,v.StatusRepair
from DeviceOfProject as d join ProjectDKC as p on d.ProjectId = p.Id  join Device as v on d.DeviceId = v.Id   join DeviceType as t on v.TypeOfDevice = t.Id  order by d.DateOfDelivery Desc 
end 


GO
/****** Object:  StoredProcedure [dbo].[DeviceOfProjectAll]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[DeviceOfProjectAll]
@ProjectId int
as
begin
Select p.ProjectName,d.DeviceId ,v.DeviceName,v.Configuration,v.TypeOfDevice ,d.DateOfDelivery,d.DateOfReturn ,d.Notes ,v.Id,t.TypeName,v.DeviceCode,v.Status,v.StatusRepair
from DeviceOfProject as d join ProjectDKC as p on d.ProjectId = p.Id  join Device as v on d.DeviceId = v.Id   join DeviceType as t on v.TypeOfDevice = t.Id 
where @ProjectId = d.ProjectId and d.Status = 1

end 



GO
/****** Object:  StoredProcedure [dbo].[DeviceTypeById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[DeviceTypeById]
@Id int
As
    Select * from DeviceType
    where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[EditRepairDetails]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditRepairDetails]
           @Id int,
           @DeviceId int,
           @DateOfRepair date,
           @NextDateOfRepair date,
           @TimeOrder int,
           @TypeOfRepair int,
           @AddressOfRepair nvarchar(500),
           @UserId int,
           @Notes nvarchar(1000),
		   @Status int ,
		   @Price float
        
AS
BEGIN
  UPDATE RepairDetails 
  SET DeviceId = @DeviceId , DateOfRepair= @DateOfRepair,  NextDateOfRepair=@NextDateOfRepair, TimeOrder=@TimeOrder, TypeOfRepair= @TypeOfRepair, AddressOfRepair=@AddressOfRepair, UserId= @UserId,Notes=@Notes,Status =  @Status,Price=@Price
  WHERE Id= @Id
  Update Device set StatusRepair = 0 where Id=@DeviceId
END



GO
/****** Object:  StoredProcedure [dbo].[EditRepairType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[EditRepairType]
          @Id int,
          @TypeName nvarchar(100), 
		  @Notes nvarchar(1000)
AS
BEGIN
      UPDATE RepairType
	  SET TypeName= @TypeName,Notes=@Notes
	  WHERE Id =@Id
END



GO
/****** Object:  StoredProcedure [dbo].[HistoryRepairDetails]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HistoryRepairDetails]
@Id int 
as
Begin 
Select  r.*,u.FullName, d.DeviceName,d.DeviceCode,t.TypeName, format(r.Price, '#,#') PriceOne
FROM  RepairDetails as r 
			  left outer  join Device as d on r.DeviceId = d.Id 
              left outer join [dbo].[User] as u  on r.UserId = u.Id  
	          left outer join RepairType as t  on r.TypeOfRepair = t.Id  
			  Where r.DeviceId = @Id

end




GO
/****** Object:  StoredProcedure [dbo].[HistoryScheduleTestById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[HistoryScheduleTestById]
@Id int 
as
Begin 
Select  s.*,u.FullName, d.DeviceName,d.DeviceCode
FROM  ScheduleTest as s 
			  left outer  join Device as d on s.DeviceId = d.Id 
              left outer join [dbo].[User] as u  on s.UserTest = u.Id  
	        
			  Where s.DeviceId = @Id

end



GO
/****** Object:  StoredProcedure [dbo].[LiquidationDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LiquidationDevice]
@Id char(5000)
AS
BEGIN
    Update Device
    set Status=2 , IsDeleted = 1 
    WHERE CHARINDEX(','+LTRIM(RTRIM(CAST(Id AS CHAR(5000))))+',',+@Id) > 0 
END


GO
/****** Object:  StoredProcedure [dbo].[OderCode]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[OderCode]
          @Id int
as
begin
    declare @odercode int
    set @odercode = (select OrderCode from DeviceType where Id= @Id)
	update DeviceType set OrderCode = @odercode + 1 where Id=@Id
	select @odercode as Code
end


GO
/****** Object:  StoredProcedure [dbo].[ProjectById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProjectById]
           @Id int
AS
BEGIN

   SELECT *
    FROM ProjectDKC as P
    JOIN [dbo].[User] as U  ON   P.ManagerProject  = U.Id 
	Where P.Id = @Id
  
END



GO
/****** Object:  StoredProcedure [dbo].[RepairDetailsAll]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RepairDetailsAll]

as
begin
Select r.Id ,r.DeviceId,r.AddressOfRepair,r.DateOfRepair,r.NextDateOfRepair,r.TimeOrder,r.Notes, u.FullName, d.DeviceName,t.TypeName
from RepairDetails as r 
    left outer  join Device as d on r.DeviceId = d.Id 
      left outer join [dbo].[User] as u  on r.UserId = u.Id  
	 left outer join RepairType as t on r.TypeOfRepair = t.Id


end 


GO
/****** Object:  StoredProcedure [dbo].[RepairDetailsById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RepairDetailsById]
@Id int 
as
Begin 
Select  r.*,u.FullName, d.DeviceName,t.TypeName,d.DeviceCode,d.Price,format(d.Price, '#,#') PriceOne ,format(r.Price, '#,#') PriceRepair, V.TypeName AS DeviceTypeName,S.Name, d.Status as StatusDevice
FROM  RepairDetails as r 
			  left outer  join Device as d on r.DeviceId = d.Id 
              left outer join [dbo].[User] as u  on r.UserId = u.Id  
	          left outer join RepairType as t on r.TypeOfRepair = t.Id 
			   left outer join DeviceType as v on d.TypeOfDevice = v.Id 
			     left outer join Supplier as S on d.SupplierId = S.Id 
			  Where r.Id = @Id

end

GO
/****** Object:  StoredProcedure [dbo].[ReturnDeviceOfProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ReturnDeviceOfProject]
  @ProjectId  int,
  @DeviceId int ,
  @Notes nvarchar(2000)
 
AS
BEGIN
  update DeviceOfProject set Status = 0,DateOfReturn = GETDATE(), Notes = @Notes where @ProjectId = ProjectId and @DeviceId = DeviceId and Status =1
  Update Device set Status=0 where Id=@DeviceId
  --Insert into UsageDevice(DeviceId,ProjectId,DateUse,Notes)
  --values(@DeviceId,@ProjectId,GETDATE(),N'Trả về kho')
END


GO
/****** Object:  StoredProcedure [dbo].[ReturnDeviceProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ReturnDeviceProject]
  @DeviceId int   
AS
BEGIN
  declare @ProjectId int 
  set @ProjectId = (select ProjectId from DeviceOfProject where DeviceId=@DeviceId and Status=1)
  if (@ProjectId is not Null)
     begin
	    Update DeviceOfProject  set Status = 0,DateOfReturn = GETDATE() where @DeviceId=DeviceId and Status =1
        Update Device set Status=0 where Id=@DeviceId
        Insert into UsageDevice(DeviceId,ProjectId,DateUse,Notes)
          values(@DeviceId,@ProjectId,GETDATE(),N'Trả về kho')
     end
END


GO
/****** Object:  StoredProcedure [dbo].[RoleById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[RoleById]
@Id int
As
    Select * from Role
    where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[ScheduleTestById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ScheduleTestById]
@Id int 
as
Begin 
Select  s.*,u.FullName, d.DeviceName,d.DeviceCode
FROM  ScheduleTest as s 
			  left outer  join Device as d on s.DeviceId = d.Id 
              left outer join [dbo].[User] as u  on s.UserTest = u.Id  
	        
			  Where s.Id = @Id

end



GO
/****** Object:  StoredProcedure [dbo].[SeachDeviceOfProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SeachDeviceOfProject]
@devicetypes int, 
@status int
as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = 'Where 1 = 1 '
if (@devicetypes <> null )
    set @condition = @condition + 'AND ManagerProject =' + CAST(@devicetypes as char)
if(@status <> -1)
	set @condition = @condition + ' AND D.Status = ' + CAST(@status as char)
SET @query = 'SELECT  * FROM DeviceOfProject as D JOIN Device as E  ON   D.DeviceId  = E.Id  ' + @condition 
EXECUTE sp_executesql @query
end




GO
/****** Object:  StoredProcedure [dbo].[SearchDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery21.sql|7|0|C:\Users\tribm\AppData\Local\Temp\~vs8CDF.sql
CREATE PROC [dbo].[SearchDevice] 
@status int,
@devicetype int,
@guarantee int,
@projectid int,
@devicecode nvarchar(500)
as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = ' Where nv.IsDeleted=0 '
if(@status <> -1)
	set @condition = @condition + ' AND nv.Status = ' + CAST(@status as char)
if(@devicetype <> 0)
	set @condition = @condition + ' AND TypeOfDevice = ' + CAST(@devicetype as char)
if(@guarantee =1 )
	set @condition = @condition + ' AND Guarantee >=  GETDATE()' 
if(@guarantee =2)
	set @condition = @condition + ' AND Guarantee < GETDATE()' 
if(@projectid <> 0)
	set @condition = @condition + ' AND (SELECT dv.ProjectId FROM DeviceOfProject dv INNER JOIN ProjectDKC pj ON dv.ProjectId = pj.Id WHERE dv.Status = 1 AND dv.DeviceId = nv.Id) = ' + CAST(@projectid as char)
if(@devicecode<> '' )
	set @condition = @condition + ' AND (nv.DeviceCode LIKE N'+char(39)+'%'+@devicecode+'%'+ char(39)+ ' OR kv.FullName Like N'+ nchar(39) +'%'+@devicecode+'%' + nchar(39)+ N' OR  nv.DeviceName Like N'+ nchar(39) +'%'+@devicecode+'%' + nchar(39)+')'
SET @query = 'SELECT nv.*,( FORMAT(nv.Price,'+char(39)+'  '+char(35)+','+char(35)+''+char(39)+')) PriceOne,ph.TypeName,kv.FullName,sp.Name,(SELECT pj.ProjectSymbol FROM DeviceOfProject dv INNER JOIN ProjectDKC pj ON dv.ProjectId = pj.Id WHERE dv.Status = 1 AND dv.DeviceId = nv.Id) ProjectSymbol,(SELECT pj.ProjectName FROM DeviceOfProject dv INNER JOIN ProjectDKC pj ON dv.ProjectId = pj.Id WHERE dv.Status = 1 AND dv.DeviceId = nv.Id) ProjectName,
(select  Concat((Case TypeComponant when 0 then '+char(39)+'Tb ngoài'+char(39)+' when 1 then N'+char(39)+'Tb trong'+char(39)+' else '+char(39)+' '+char(39)+' end ) ,'+char(39)+' - '+char(39)+' , (Select v.DeviceCode from Device  v where v.Id = d.DeviceCodeParents )) from DeviceDevice d where d.DeviceCodeParents = nv.ParentId and d.DeviceCodeChildren = nv.Id and d.IsDeleted = 0 ) NameTypeComponant

 FROM Device nv
    left outer JOIN DeviceType ph
          ON ph.Id = nv.TypeOfDevice
    left outer JOIN [User] kv
          ON kv.Id = nv.UserId 
    left outer JOIN Supplier sp
          ON sp.Id = nv.SupplierId ' + @condition +' ORDER BY nv.Id Desc '
EXECUTE sp_executesql @query
end




GO
/****** Object:  StoredProcedure [dbo].[SearchDevice2]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[SearchDevice2] 
@status int,
@devicetype int,
@guarantee int,
@projectid int,
@devicecode nvarchar(500)
as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = ' Where nv.IsDeleted=0 '
if(@status <> -1)
	set @condition = @condition + ' AND nv.Status = ' + CAST(@status as char)
if(@devicetype <> 0)
	set @condition = @condition + ' AND TypeOfDevice = ' + CAST(@devicetype as char)
if(@guarantee =1 )
	set @condition = @condition + ' AND Guarantee >=  GETDATE()' 
if(@guarantee =2)
	set @condition = @condition + ' AND Guarantee < GETDATE()' 
if(@projectid <> 0)
	set @condition = @condition + ' AND (SELECT dv.ProjectId FROM DeviceOfProject dv INNER JOIN ProjectDKC pj ON dv.ProjectId = pj.Id WHERE dv.Status = 1 AND dv.DeviceId = nv.Id) = ' + CAST(@projectid as char)
if(@devicecode<> '' )
	set @condition = @condition + ' AND (nv.DeviceCode LIKE N'+char(39)+'%'+@devicecode+'%'+ char(39)+ ' OR kv.FullName Like N'+ nchar(39) +'%'+@devicecode+'%' + nchar(39)+ N' OR  nv.DeviceName Like N'+ nchar(39) +'%'+@devicecode+'%' + nchar(39)+')'
SET @query = 'SELECT nv.*,ph.TypeName,kv.FullName,sp.Name,(SELECT pj.ProjectSymbol FROM DeviceOfProject dv INNER JOIN ProjectDKC pj ON dv.ProjectId = pj.Id WHERE dv.Status = 1 AND dv.DeviceId = nv.Id) ProjectSymbol,(SELECT pj.ProjectName FROM DeviceOfProject dv INNER JOIN ProjectDKC pj ON dv.ProjectId = pj.Id WHERE dv.Status = 1 AND dv.DeviceId = nv.Id) ProjectName FROM Device nv
    left outer JOIN DeviceType ph
          ON ph.Id = nv.TypeOfDevice
    left outer JOIN [User] kv
          ON kv.Id = nv.UserId 
    left outer JOIN Supplier sp
          ON sp.Id = nv.SupplierId ' + @condition +' ORDER BY nv.Id Desc '
EXECUTE sp_executesql @query
end




GO
/****** Object:  StoredProcedure [dbo].[SearchDeviceType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[SearchDeviceType] 
as
begin
Select * from DeviceType
end


GO
/****** Object:  StoredProcedure [dbo].[SearchProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchProject] 
@managerProject int, 
@status int,
@TypeProject int , 
@ProjectSymbol nchar(50)
as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = ' where P.IsDeleted = 0'
if (@managerProject <> -1 )
    set @condition = @condition + ' AND ManagerProject =' + CAST(@managerProject as char)
if(@status <> -1)
	set @condition = @condition + ' AND P.Status = ' + CAST(@status as char)

if(@ProjectSymbol<> '' )
	set @condition = @condition + N' AND P.ProjectSymbol LIKE N' + char(39) + @ProjectSymbol + char(39)

if(@TypeProject <> -1)
	set @condition = @condition + ' AND P.TypeProject = ' + CAST(@TypeProject as char)

SET @query = 'SELECT  P.* , U.[FullName], (SELECT count(dp.DeviceId)
FROM DeviceOfProject dp where dp.ProjectId = P.Id and dp.Status =1) NumDevice FROM ProjectDKC as P  left outer JOIN  [dbo].[User] as U  ON   P.ManagerProject  = U.Id  ' + @condition 
EXECUTE sp_executesql @query
end



GO
/****** Object:  StoredProcedure [dbo].[SearchRepairDetails]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchRepairDetails] 
@repairtypes int, 
@user int,
@iddevice int,
@status int
as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = ' where 1=1'
if (@repairtypes <> -1 )
    set @condition = @condition + 'AND r.TypeOfRepair =' + CAST(@repairtypes as char)
if(@user <> -1)
	set @condition = @condition + ' AND r.UserId = ' + CAST(@user as char)
if (@iddevice <> -1 )
    set @condition = @condition + 'AND r.DeviceId =' + CAST(@iddevice as char)
if (@status <> -1 )
set @condition = @condition + 'AND r.Status =' + CAST(@status as char)
SET @query = 'SELECT r.*,( FORMAT(r.Price,'+char(39)+'  '+char(35)+','+char(35)+''+char(39)+')) PriceOne, u.FullName, d.DeviceName,t.TypeName,d.DeviceCode
              FROM  RepairDetails as r 
			  left outer  join Device as d on r.DeviceId = d.Id 
              left outer join [dbo].[User] as u  on r.UserId = u.Id  
	          left outer join RepairType as t on r.TypeOfRepair = t.Id '
			   + @condition 
EXECUTE sp_executesql @query
end



GO
/****** Object:  StoredProcedure [dbo].[SearchRepairDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchRepairDevice] 
@id int

as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = 'Where nv.IsDeleted=0 '
if(@id <> -1)
	set @condition = @condition + ' AND nv.Id = ' + CAST(@id as char)

SET @query = 'SELECT nv.*,ph.TypeName,kv.FullName,sp.Name,pj.ProjectName FROM Device nv
    left outer JOIN DeviceType ph
          ON ph.Id = nv.TypeOfDevice
    left outer JOIN [User] kv
          ON kv.Id = nv.UserId 
    left outer JOIN Supplier sp
          ON sp.Id = nv.SupplierId 
    left outer JOIN DeviceOfProject dp
          ON dp.DeviceId = nv.Id
    left outer JOIN ProjectDKC pj
          ON pj.Id = dp.ProjectId ' + @condition 
EXECUTE sp_executesql @query
end


GO
/****** Object:  StoredProcedure [dbo].[SearchRequestDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchRequestDevice]
@status int, 
@approved bit

as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = ' where 1=1'
if (@status <> -1 )
    set @condition = @condition + 'AND r.Status =' + CAST(@status as char)
if(@approved <> -1)
	set @condition = @condition + ' AND r.Approved = ' + CAST(@approved as char)

SET @query = 'SELECT r.*,u.FullName,d.TypeName
				 FROM  RequestDevice as r
				 left outer  join [dbo].[User] as u on r.UserRequest = u.Id
				 left outer  join DeviceType as d on r.TypeOfDevice = d.Id
                                                                      '
			   + @condition 
EXECUTE sp_executesql @query
end



GO
/****** Object:  StoredProcedure [dbo].[SearchRequestDeviceNew]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchRequestDeviceNew]
@status int, 
@approved bit

as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = ' where 1=1'
if (@status <> -1 )
    set @condition = @condition + 'AND r.Status =' + CAST(@status as char)
if(@approved <> -1)
	set @condition = @condition + ' AND r.Approved = ' + CAST(@approved as char)

SET @query = 'SELECT r.*,u.FullName,d.TypeName
				 FROM  RequestDevice as r
				 left outer  join [dbo].[User] as u on r.UserRequest = u.Id
				 left outer  join DeviceType as d on r.TypeOfDevice = d.Id
                                                                      '
			   + @condition 
EXECUTE sp_executesql @query
end





GO
/****** Object:  StoredProcedure [dbo].[SearchRole]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SearchRole]
as
begin
Select * from Role
end


GO
/****** Object:  StoredProcedure [dbo].[SearchScheduleTest]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchScheduleTest]
@user int, 
@status int

as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = ' where 1=1'
if (@user <> -1 )
    set @condition = @condition + 'AND s.UserTest =' + CAST(@user as char)
if(@status <> -1)
	set @condition = @condition + ' AND s.Status = ' + CAST(@status as char)

SET @query = 'SELECT s.*,u.FullName, d.DeviceName,d.DeviceCode
				 FROM  ScheduleTest as s
				 left outer  join [dbo].[User] as u on s.UserTest = u.Id
				 left outer  join Device as d on s.DeviceId = d.Id
                                                                      '
			   + @condition 
EXECUTE sp_executesql @query
end



GO
/****** Object:  StoredProcedure [dbo].[SearchSupplier]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SearchSupplier]
@Status int
as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = 'Where 1 = 1 '
if(@status <> -1)
	set @condition = @condition + ' AND Status = ' + CAST(@status as char)
SET @query = 'SELECT * FROM Supplier' + @condition 
EXECUTE sp_executesql @query
end


GO
/****** Object:  StoredProcedure [dbo].[SearchUseDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SearchUseDevice] 
           @DeviceId int 
as
Begin
   Select ud.*,pj.ProjectName from UsageDevice ud
         left outer JOIN ProjectDKC pj
          ON pj.Id = ud.ProjectId
       Where ud.DeviceId =@DeviceId
	   ORDER BY ud.Id Desc
End


GO
/****** Object:  StoredProcedure [dbo].[SearchUser]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchUser] 
@status int
as
begin
declare @query Nvarchar(2000)
declare @condition Nvarchar(2000) 
SET @condition = 'Where us.IsDeleted=0 '
if(@status <> -1)
	set @condition = @condition + ' AND Status = ' + CAST(@status as char)

SET @query = 'SELECT us.* FROM [dbo].[User] us ' + @condition 
EXECUTE sp_executesql @query
end


GO
/****** Object:  StoredProcedure [dbo].[SelectList]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectList]
@Id char(11)
AS
BEGIN
    select* from Device 
    WHERE CHARINDEX(','+LTRIM(RTRIM(CAST(Id AS CHAR(11))))+',',@Id) > 0 
END


GO
/****** Object:  StoredProcedure [dbo].[StatisticalDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[StatisticalDevice]
as
begin
select dv.*,   (  FORMAT(dv.Price, '#,#'))  PriceOne , (SELECT COUNT(DeviceId) FROM DeviceOfProject where dv.Id=DeviceOfProject.DeviceId ) as TimeUse,
                                          (Select Count(Id) from RepairDetails where dv.Id=RepairDetails.DeviceId ) TimeRepair,
                                          FORMAT( (Select SUM(Price) from RepairDetails where dv.Id=RepairDetails.DeviceId ), '#,#') SumPrice										
from Device dv where dv.IsDeleted = 0 and dv.Status != 2 
end



GO
/****** Object:  StoredProcedure [dbo].[StatisticProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[StatisticProject]
as
begin
SELECT  Id, ProjectName,ProjectSymbol,Status,NumDevice, NumDeviceActive, NumDevice - NumDeviceActive as NumDeviceReturn  FROM
(
	SELECT
		P.Id , P.ProjectName , P.ProjectSymbol , P.Status,
		(SELECT count(DISTINCT dp.DeviceId)FROM DeviceOfProject dp where dp.ProjectId = P.Id) as NumDevice ,
		(SELECT count(dp.DeviceId)FROM DeviceOfProject dp where dp.ProjectId = P.Id  and dp.Status=1) as NumDeviceActive
	FROM
		ProjectDKC as P where P.IsDeleted = 0 and P.TypeProject = 1
)
ReturnTable

end 



GO
/****** Object:  StoredProcedure [dbo].[SupplierById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SupplierById]
@Id int
As
    Select * from Supplier
    where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[TypeComponantOfDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[TypeComponantOfDevice]
@TypeParent int
as
begin
select 
(Select t.TypeName from DeviceType t where t.Id = d.TypeSymbolParents )  NameTypeParents,
(Select t.TypeName from DeviceType t where t.Id = d.TypeSymbolChildren )  NameTypeChildren,
d.TypeSymbolParents , d.TypeSymbolChildren,d.id,d.IsDeleted, d.TypeComponant
from DeviceTypeComponantType as d 
where d.TypeSymbolParents = @TypeParent 
end 

GO
/****** Object:  StoredProcedure [dbo].[UpdateDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDevice]  
      @Id int,
      @DeviceCode char(50),
	  @NewCode char(50),
      @DeviceName nvarchar(200),
      @TypeOfDevice int,
      @ParentId int,
      @Configuration nvarchar(500),
      @Price float,
      @PurchaseContract nvarchar(500),
      @DateOfPurchase date,
      @SupplierId int,
      @Guarantee date,
      @UserId int,
      @Notes nvarchar(2000),
      @CreatedDate date,
      @Status int
AS
BEGIN
   Update Device
   set DeviceCode=@DeviceCode,NewCode=@NewCode,DeviceName=@DeviceName,TypeOfDevice=@TypeOfDevice,ParentId=@ParentId,Configuration=@Configuration,Price=@Price,PurchaseContract=@PurchaseContract,DateOfPurchase=@DateOfPurchase,SupplierId=@SupplierId,Guarantee=@Guarantee,UserId=@UserId,Notes=@Notes,CreatedDate=@CreatedDate,Status=@Status
   where Id=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceOfProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateDeviceOfProject]
  @Id int,
  @ProjectId  int,
  @DeviceId int , 
  @DateOfDelivery date,
  @DateOfReturn date, 
  @Status int,
  @Notes nvarchar(2000),
  @IsDeleted bit
AS
BEGIN
  UPDATE DeviceOfProject 
  SET ProjectId =@ProjectId ,  DeviceId=@DeviceId,  DateOfDelivery=@DateOfDelivery,DateOfReturn= @DateOfReturn,Status= @Status,Notes= @Notes,IsDeleted= @IsDeleted 
 WHERE Id = @Id  
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateDeviceType]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDeviceType] 
      @Id int, 
      @TypeName nvarchar(100),
	  @TypeSymbol nchar(50),
      @Notes nvarchar(1000)
AS
BEGIN
   Update DeviceType
   set TypeName=@TypeName,TypeSymbol= @TypeSymbol ,Notes=@Notes where Id=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProject]
    @Id int,
	@ProjectSymbol nchar(50),
    @ProjectName nvarchar(200),
    @ManagerProject int,
    @Address nvarchar(1000),
    @FromDate Date ,
	@ToDate Date,
	@CreatedDate Date,
	@ModifiedDate Date,
	@Status int ,
	@IsDeleted bit
AS
BEGIN
     UPDATE ProjectDKC
	SET  ProjectSymbol=@ProjectSymbol,ProjectName=@ProjectName, ManagerProject=@ManagerProject, Address=@Address, FromDate=@FromDate, ToDate=@ToDate, CreatedDate=@CreatedDate, ModifiedDate=@ModifiedDate, Status=@Status, IsDeleted=@IsDeleted 
	 WHERE  Id = @Id
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateRequestDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateRequestDevice]
           @Id int ,
           @UserRequest int,
           @DateOfRequest date,
           @DateOfUse date,
           @DeviceName nvarchar(200),
           @TypeOfDevice int,
           @Configuration nvarchar(2000),
           @Notes nvarchar(2000),
           @Approved bit,
           @UserApproved int,           
           @Status int,
		   @NumDevice int,
		   @NoteProcess nvarchar(2000),
           @NoteReasonRefuse nvarchar(2000),
		   @NameUserApproved nvarchar(100)
  
AS
BEGIN
    UPDATE RequestDevice
	SET  UserRequest= @UserRequest ,
           DateOfRequest=@DateOfRequest ,
           DateOfUse=@DateOfUse ,
          DeviceName= @DeviceName ,
         TypeOfDevice=  @TypeOfDevice,
          Configuration= @Configuration,
           Notes=@Notes ,
          Approved= @Approved,
          UserApproved= @UserApproved ,     
           Status= @Status ,
		   NumDevice = @NumDevice,
		  NoteProcess = @NoteProcess,
		   NoteReasonRefuse = @NoteReasonRefuse,
		   NameUserApproved = @NameUserApproved
	WHERE Id = @Id
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateScheduleTest]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateScheduleTest]
           @Id int,
           @DeviceId int,
           @DateOfTest date,
           @NextDateOfTest date,
           @CategoryTest nvarchar(2000),
           @UserTest int,
           @Notes nvarchar(2000),
           @Status int
           
  
AS
BEGIN
    UPDATE  ScheduleTest 
	SET DeviceId= @DeviceId, DateOfTest = @DateOfTest, NextDateOfTest= @NextDateOfTest, CategoryTest=@CategoryTest, UserTest=@UserTest, Notes=@Notes, Status=@Status
     WHERE Id = @Id
END






GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplier]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSupplier]
      @Id int,
      @Name nvarchar(200),
      @Email char(50),
      @Phone char(15),
      @Address nvarchar(50),
      @Support nvarchar(500),
      @Status int
AS
BEGIN
      Update Supplier
      set Name=@Name,Email=@Email,Phone=@Phone,Address=@Address,Support=@Support,Status=@Status where Id=@Id
      
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]  
      @Id int,
      @UserName char(50),
      @PassWord char(200),
      @FullName nvarchar(100),
      @Email char(50),
      @PhoneNumber char(15),
      @Address nvarchar(500),
      @Department nvarchar(100),
      @Position nvarchar(100),
      @RoleId int,
      @Status int
AS
BEGIN
   Update [dbo].[User]
   set UserName=@UserName,PassWord=@PassWord,FullName=@FullName,Email=@Email,PhoneNumber=@PhoneNumber,Address=@Address,Department=@Department,Position=@Position,RoleId=@RoleId,Status=@Status where Id=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDevice]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UpdateUserDevice]  
      @IdDv int,
      @IdUser int
	  
AS
BEGIN
   Update Device
   set  UserId= @IdUser
   where Id= @IdDv
END


GO
/****** Object:  StoredProcedure [dbo].[UserById]    Script Date: 8/9/2021 6:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UserById]
@Id int
As
    Select * from [dbo].[User]
    where Id=@Id


GO
USE [master]
GO
ALTER DATABASE [QuanLyTaiSanCtyDATN] SET  READ_WRITE 
GO
