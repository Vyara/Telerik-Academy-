USE [master]
GO
/****** Object:  Database [WorldDB]    Script Date: 10/9/2015 12:08:49 AM ******/
CREATE DATABASE [WorldDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorldDB', FILENAME = N'E:\Users\Vyara\Documents\SQL Server Management Studio\WorldDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WorldDB_log', FILENAME = N'E:\Users\Vyara\Documents\SQL Server Management Studio\WorldDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WorldDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorldDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorldDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorldDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorldDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorldDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorldDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorldDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorldDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorldDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorldDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorldDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorldDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorldDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorldDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorldDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorldDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorldDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorldDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorldDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorldDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorldDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorldDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorldDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorldDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WorldDB] SET  MULTI_USER 
GO
ALTER DATABASE [WorldDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorldDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorldDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorldDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WorldDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WorldDB]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 10/9/2015 12:08:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address_text] [nvarchar](200) NOT NULL,
	[town_id] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 10/9/2015 12:08:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contries]    Script Date: 10/9/2015 12:08:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[continent_id] [int] NOT NULL,
 CONSTRAINT [PK_Contries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 10/9/2015 12:08:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](100) NOT NULL,
	[last_name] [nvarchar](100) NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 10/9/2015 12:08:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([id], [address_text], [town_id]) VALUES (1, N'Mladost 1', 1)
INSERT [dbo].[Addresses] ([id], [address_text], [town_id]) VALUES (2, N'Harajuku Str 12', 3)
INSERT [dbo].[Addresses] ([id], [address_text], [town_id]) VALUES (5, N'Albrechtstrasse 1', 5)
INSERT [dbo].[Addresses] ([id], [address_text], [town_id]) VALUES (7, N'Nadezhda 3', 1)
INSERT [dbo].[Addresses] ([id], [address_text], [town_id]) VALUES (13, N'Piccadilly Circus 5', 8)
INSERT [dbo].[Addresses] ([id], [address_text], [town_id]) VALUES (15, N'Strattfort 16', 8)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([Id], [name]) VALUES (1, N'Asia')
INSERT [dbo].[Continents] ([Id], [name]) VALUES (2, N'Africa')
INSERT [dbo].[Continents] ([Id], [name]) VALUES (3, N'Antarctica')
INSERT [dbo].[Continents] ([Id], [name]) VALUES (4, N'Australia')
INSERT [dbo].[Continents] ([Id], [name]) VALUES (5, N'Europe')
INSERT [dbo].[Continents] ([Id], [name]) VALUES (6, N'North America')
INSERT [dbo].[Continents] ([Id], [name]) VALUES (7, N'South America')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Contries] ON 

INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (1, N'Japan', 1)
INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (2, N'Germany', 5)
INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (3, N'Egypt', 2)
INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (4, N'Bulgaria', 5)
INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (5, N'USA', 6)
INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (6, N'Brazil', 7)
INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (7, N'Canada', 6)
INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (8, N'China', 1)
INSERT [dbo].[Contries] ([id], [name], [continent_id]) VALUES (9, N'UK', 5)
SET IDENTITY_INSERT [dbo].[Contries] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([id], [first_name], [last_name], [address_id]) VALUES (1, N'Ivan', N'Ivanov', 1)
INSERT [dbo].[People] ([id], [first_name], [last_name], [address_id]) VALUES (2, N'Karl', N'Hofer', 5)
INSERT [dbo].[People] ([id], [first_name], [last_name], [address_id]) VALUES (3, N'Keiko', N'Kitagawa', 2)
INSERT [dbo].[People] ([id], [first_name], [last_name], [address_id]) VALUES (4, N'Jane', N'Doe', 15)
INSERT [dbo].[People] ([id], [first_name], [last_name], [address_id]) VALUES (5, N'Victoria', N'Stoyanova', 7)
INSERT [dbo].[People] ([id], [first_name], [last_name], [address_id]) VALUES (6, N'Jonathan', N'Smith', 13)
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([id], [name], [country_id]) VALUES (1, N'Sofia', 4)
INSERT [dbo].[Towns] ([id], [name], [country_id]) VALUES (2, N'Rio de Janeiro', 6)
INSERT [dbo].[Towns] ([id], [name], [country_id]) VALUES (3, N'Tokyo', 1)
INSERT [dbo].[Towns] ([id], [name], [country_id]) VALUES (4, N'New York', 5)
INSERT [dbo].[Towns] ([id], [name], [country_id]) VALUES (5, N'Berlin', 2)
INSERT [dbo].[Towns] ([id], [name], [country_id]) VALUES (6, N'Cambridge', 9)
INSERT [dbo].[Towns] ([id], [name], [country_id]) VALUES (7, N'Osaka', 1)
INSERT [dbo].[Towns] ([id], [name], [country_id]) VALUES (8, N'London', 9)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([town_id])
REFERENCES [dbo].[Towns] ([id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Contries]  WITH CHECK ADD  CONSTRAINT [FK_Contries_Continents] FOREIGN KEY([continent_id])
REFERENCES [dbo].[Continents] ([Id])
GO
ALTER TABLE [dbo].[Contries] CHECK CONSTRAINT [FK_Contries_Continents]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Addresses] FOREIGN KEY([address_id])
REFERENCES [dbo].[Addresses] ([id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Contries] FOREIGN KEY([country_id])
REFERENCES [dbo].[Contries] ([id])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Contries]
GO
USE [master]
GO
ALTER DATABASE [WorldDB] SET  READ_WRITE 
GO
