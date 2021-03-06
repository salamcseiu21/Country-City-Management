USE [master]
GO
/****** Object:  Database [CountryInformationDB]    Script Date: 12-Jan-16 1:24:46 AM ******/
CREATE DATABASE [CountryInformationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryInformationDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryInformationDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryInformationDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryInformationDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryInformationDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryInformationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryInformationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryInformationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryInformationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryInformationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryInformationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryInformationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryInformationDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CountryInformationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryInformationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryInformationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryInformationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryInformationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryInformationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryInformationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryInformationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryInformationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryInformationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryInformationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryInformationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryInformationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryInformationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryInformationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryInformationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryInformationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryInformationDB] SET  MULTI_USER 
GO
ALTER DATABASE [CountryInformationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryInformationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryInformationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryInformationDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryInformationDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetCityInformaiton]    Script Date: 12-Jan-16 1:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCityInformaiton]
	
@PageIndex int,
@PageSize int,
@TotalRecord int output
	
AS
BEGIN
	
	Declare @satrtIndex int
	Declare @endIndex int

	SET @satrtIndex=(@PageIndex* @PageSize)+1;
	SET @endIndex=(@PageIndex+1)*@PageSize;
	
	SELECT @TotalRecord=COUNT(*) FROM t_Country
	SELECT * FROM
	(
     SELECT ROW_NUMBER() OVER (Order By Id ASC ) AS RowNumber,Id,Name,About From t_Country 
	) AS Info
	 WHERE Info.RowNumber>=@satrtIndex and Info.RowNumber<=@endIndex
END
GO
/****** Object:  Table [dbo].[t_City]    Script Date: 12-Jan-16 1:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[About] [nvarchar](max) NOT NULL,
	[No_Of_Dwellers] [int] NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[Weather] [nvarchar](max) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_t_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Country]    Script Date: 12-Jan-16 1:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[About] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_t_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[CityInformation]    Script Date: 12-Jan-16 1:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CityInformation]
  AS
  SELECT CountryId,Count(Id) AS Total_City,Sum(No_Of_Dwellers) AS Total_Dwellers From t_City Group by CountryId
GO
/****** Object:  View [dbo].[CountryInformation]    Script Date: 12-Jan-16 1:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[CountryInformation]
  AS
  SELECT c.Name,c.About,CI.Total_City,CI.Total_Dwellers FROM t_Country c LEFT OUTER JOIN CityInformation CI ON c.Id=CI.CountryId
GO
/****** Object:  View [dbo].[CountryInformationWithCity]    Script Date: 12-Jan-16 1:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountryInformationWithCity]
  AS
 SELECT c.Name,c.About,COAlESCE(ct.Total_City,'0') AS Total_City,COALESCE(ct.Total_Dwellers,'0') AS Total_Dwellers 
  FROM CountryInformation c
  LEFT JOIN CountryInformation ct
  ON c.Name=ct.Name
GO
/****** Object:  View [dbo].[GetCountryInformation]    Script Date: 12-Jan-16 1:24:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetCountryInformation]
  AS
  SELECT c.Id,c.Name AS 'City_Name',c.About AS 'About_City',c.No_Of_Dwellers AS No_of_Dwellers ,c.Location,c.Weather,cn.Name AS 'Country_Name',cn.About 'About_Country' FROM t_City c INNER JOIN t_Country cn ON c.CountryId=cn.Id

GO
SET IDENTITY_INSERT [dbo].[t_Country] ON 

INSERT [dbo].[t_Country] ([Id], [Name], [About]) VALUES (1, N'Bangladesh', N'<p><img class="fr-fil fr-dib" src="http://i.froala.com/download/14993adf8c40b6d4a260356ac3b7aa0745ff1548.png?1452539661" style="width: 120px; height: 100px;">Bangladesh is our homeland&nbsp;</p>')
INSERT [dbo].[t_Country] ([Id], [Name], [About]) VALUES (2, N'India', N'<p><img class="fr-fil fr-dib" src="http://i.froala.com/download/6cacca3c3dea5240e837712bd253f26f8bda54bb.png?1452539808" style="width: 120px; height: 100px;">India is our nearest country.</p>')
SET IDENTITY_INSERT [dbo].[t_Country] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_City]    Script Date: 12-Jan-16 1:24:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_City] ON [dbo].[t_City]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_t_Country]    Script Date: 12-Jan-16 1:24:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_t_Country] ON [dbo].[t_Country]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_City]  WITH CHECK ADD  CONSTRAINT [FK_t_City_t_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[t_Country] ([Id])
GO
ALTER TABLE [dbo].[t_City] CHECK CONSTRAINT [FK_t_City_t_Country]
GO
USE [master]
GO
ALTER DATABASE [CountryInformationDB] SET  READ_WRITE 
GO
