USE [master]
GO
/****** Object:  Database [TOH]    Script Date: 12/11/2019 8:04:47 AM ******/
CREATE DATABASE [TOH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TOH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TOH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TOH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TOH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TOH] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TOH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TOH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TOH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TOH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TOH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TOH] SET ARITHABORT OFF 
GO
ALTER DATABASE [TOH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TOH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TOH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TOH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TOH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TOH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TOH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TOH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TOH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TOH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TOH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TOH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TOH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TOH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TOH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TOH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TOH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TOH] SET RECOVERY FULL 
GO
ALTER DATABASE [TOH] SET  MULTI_USER 
GO
ALTER DATABASE [TOH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TOH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TOH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TOH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TOH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TOH', N'ON'
GO
ALTER DATABASE [TOH] SET QUERY_STORE = OFF
GO
USE [TOH]
GO
/****** Object:  User [adminAli]    Script Date: 12/11/2019 8:04:47 AM ******/
CREATE USER [adminAli] FOR LOGIN [adminAli] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [adminAli]
GO
/****** Object:  Table [dbo].[tower_att]    Script Date: 12/11/2019 8:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tower_att](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[gold] [int] NULL,
	[t_height] [int] NULL,
	[b_height] [int] NULL,
	[u1] [int] NULL,
	[u2] [int] NULL,
	[u3] [int] NULL,
	[u4] [int] NULL,
	[u5] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_tower]    Script Date: 12/11/2019 8:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_tower](
	[u_id] [int] NULL,
	[t_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/11/2019 8:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[gold] [int] NULL,
	[th] [int] NULL,
	[bh] [int] NULL,
	[u1] [int] NULL,
	[u2] [int] NULL,
	[u3] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CheckPassword]    Script Date: 12/11/2019 8:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CheckPassword]
    @username varchar(50),
    @password varbinary(256)
	
AS
BEGIN

SET NOCOUNT ON
SELECT username, password from users
where username=@username and password=@password
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertTower_att]    Script Date: 12/11/2019 8:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertTower_att] 
	-- Add the parameters for the stored procedure here
	@th as int,
	@bh as int,
	@gold as int,
	@u1 as int, 
	@u2 as int,
	@u3 as int,
	@u4 as int,
	@u5 as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert INTO table_att (gold, t_height, b_height, u1, u2, u3, u4, u5)
	Values(@gold, @th, @bh, @u1,@u2,@u3,@u4,@u5)
END
GO
/****** Object:  StoredProcedure [dbo].[spSignUp]    Script Date: 12/11/2019 8:04:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSignUp]
	@Username as varchar(50),
	@password as varchar(50),
	@email as varchar(50)
	
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO users (username,password,email,gold, th, bh, u1, u2, u3)
	VALUES (@Username,@password,@email,0, 0, 0, 0,0,0) 

END
GO
USE [master]
GO
ALTER DATABASE [TOH] SET  READ_WRITE 
GO
