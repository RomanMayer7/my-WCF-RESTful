USE [master]
GO
/****** Object:  Database [Games]    Script Date: 3/7/2020 2:50:06 PM ******/
CREATE DATABASE [Games]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Games', FILENAME = N'C:\Users\Roman Mayerson\Games.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Games_log', FILENAME = N'C:\Users\Roman Mayerson\Games_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Games] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Games].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Games] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Games] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Games] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Games] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Games] SET ARITHABORT OFF 
GO
ALTER DATABASE [Games] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Games] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Games] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Games] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Games] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Games] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Games] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Games] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Games] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Games] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Games] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Games] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Games] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Games] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Games] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Games] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Games] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Games] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Games] SET  MULTI_USER 
GO
ALTER DATABASE [Games] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Games] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Games] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Games] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Games] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Games] SET QUERY_STORE = OFF
GO
USE [Games]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Games]
GO
/****** Object:  Table [dbo].[tblGames]    Script Date: 3/7/2020 2:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGames](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Genre] [varchar](50) NULL,
	[Developer] [varchar](50) NULL,
	[Publisher] [varchar](50) NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_tblGames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAddNewGame]    Script Date: 3/7/2020 2:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Roman Meyerson>
-- Create date: <Create Date,28/02/2020>
-- Description:	<Description,ADD NEW>
-- =============================================
CREATE PROCEDURE [dbo].[spAddNewGame](@Title NVARCHAR(MAX),@Genre NVARCHAR(MAX),@Developer NVARCHAR(MAX),@Publisher NVARCHAR(MAX),@Year INT) 

AS
BEGIN
INSERT INTO dbo.tblGames  ( Title,Genre,Developer,Publisher,Year)  
            VALUES        (@Title,@Genre,@Developer,@Publisher,@Year)

END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteGame]    Script Date: 3/7/2020 2:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Roman Meyerson>
-- Create date: <Create Date,28/02/2020>
-- Description:	<Description,UPDATE>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteGame](@Id INT) 

AS
BEGIN
DELETE FROM dbo.tblGames   
            WHERE Id=@Id        

END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllGames]    Script Date: 3/7/2020 2:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Roman Meyerson>
-- Create date: <Create Date,28/02/2020>
-- Description:	<SELECT ALL>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllGames]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.tblGames
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateGame]    Script Date: 3/7/2020 2:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Roman Meyerson>
-- Create date: <Create Date,28/02/2020>
-- Description:	<Description,UPDATE>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateGame](@Id INT,@Title NVARCHAR(MAX),@Genre NVARCHAR(MAX),@Developer NVARCHAR(MAX),@Publisher NVARCHAR(MAX),@Year INT) 

AS
BEGIN
UPDATE dbo.tblGames  SET Title=@Title,Genre=@Genre,Developer=@Developer,Publisher=@Publisher,Year=@Year  
            WHERE Id=@Id        

END
GO
USE [master]
GO
ALTER DATABASE [Games] SET  READ_WRITE 
GO
