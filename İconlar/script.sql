USE [master]
GO
/****** Object:  Database [SINEMA]    Script Date: 30.04.2017 16:31:50 ******/
CREATE DATABASE [SINEMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SINEMA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SINEMA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SINEMA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SINEMA_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SINEMA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SINEMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SINEMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SINEMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SINEMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SINEMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SINEMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [SINEMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SINEMA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SINEMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SINEMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SINEMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SINEMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SINEMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SINEMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SINEMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SINEMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SINEMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SINEMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SINEMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SINEMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SINEMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SINEMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SINEMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SINEMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SINEMA] SET RECOVERY FULL 
GO
ALTER DATABASE [SINEMA] SET  MULTI_USER 
GO
ALTER DATABASE [SINEMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SINEMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SINEMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SINEMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SINEMA', N'ON'
GO
USE [SINEMA]
GO
/****** Object:  StoredProcedure [dbo].[Bilet_Delete]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Bilet_Delete]
@BiletID INT
AS
DELETE FROM Bilet WHERE BiletID = @BiletID

GO
/****** Object:  StoredProcedure [dbo].[Bilet_Insert]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Bilet_Insert]
@FilmID INT,
@SalonID INT,
@SeansID INT,
@MusteriAd NVARCHAR(50),
@MusteriSoyad NVARCHAR(50),
@Koltuk NVARCHAR(100),
@BiletAdet INT,
@Ucret DECIMAL
AS
INSERT INTO Bilet(FilmID,SalonID,SeansID,MusteriAd,MusteriSoyad,Koltuk,BiletAdet,Ucret) VALUES(@FilmID,@SalonID,@SeansID,@MusteriAd,@MusteriSoyad,@Koltuk,@BiletAdet,@Ucret)

GO
/****** Object:  StoredProcedure [dbo].[Bilet_Select]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Bilet_Select]
@BiletID INT
AS
SELECT *FROM Bilet T1 WITH(NOLOCK) WHERE T1.BiletID = @BiletID

GO
/****** Object:  StoredProcedure [dbo].[Bilet_SelectList]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Bilet_SelectList]
AS
SELECT *FROM Bilet WITH(NOLOCK)

GO
/****** Object:  StoredProcedure [dbo].[Bilet_Update]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Bilet_Update]
@BiletID INT,
@FilmID INT,
@SalonID INT,
@SeansID INT,
@MusteriAd NVARCHAR(50),
@MusteriSoyad NVARCHAR(50),
@Koltuk NVARCHAR(100),
@BiletAdet INT,
@Ucret DECIMAL
AS
UPDATE Bilet SET FilmID = @FilmID,
				 SalonID = @SalonID,
				 SeansID = @SeansID,
				 MusteriAd = @MusteriAd,
				 MusteriSoyad = @MusteriSoyad,
				 Koltuk = @Koltuk,
				 BiletAdet = @BiletAdet,Ucret = @Ucret WHERE FilmID = @FilmID

GO
/****** Object:  StoredProcedure [dbo].[Calisan_Delete]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[Calisan_Delete]
@CalisanID INT
AS
DELETE FROM Calisan WHERE CalisanID = @CalisanID

GO
/****** Object:  StoredProcedure [dbo].[Calisan_Insert]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Calisan_Insert]
@Ad NVARCHAR(50),
@Soyad NVARCHAR(50),
@KullaniciAd NVARCHAR(50),
@KullaniciParola NVARCHAR(50),
@DogumTarih DATETIME,
@IseGirisTarih DATETIME,
@TCNO NVARCHAR(50),
@AdminYetki BIT
AS
INSERT INTO Calisan(Ad,Soyad,KullaniciAd,KullaniciParola,DogumTarih,IseGirisTarih,TCNO,AdminYetki) VALUES(@Ad,@Soyad,@KullaniciAd,@KullaniciParola,@DogumTarih,@IseGirisTarih,@TCNO,@AdminYetki)

GO
/****** Object:  StoredProcedure [dbo].[Calisan_Select]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Calisan_Select]
@CalisanID INT
AS
SELECT *FROM Calisan T1 WITH(NOLOCK) WHERE T1.CalisanID = @CalisanID

GO
/****** Object:  StoredProcedure [dbo].[Calisan_SelectList]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Calisan_SelectList]
AS
SELECT *FROM Calisan WITH(NOLOCK)

GO
/****** Object:  StoredProcedure [dbo].[Calisan_Update]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Calisan_Update]
@CalisanID INT,
@Ad NVARCHAR(50),
@Soyad NVARCHAR(50),
@KullaniciAd NVARCHAR(50),
@KullaniciParola NVARCHAR(50),
@DogumTarih DATETIME,
@IseGirisTarih DATETIME,
@TCNO NVARCHAR(50),
@AdminYetki BIT
AS
UPDATE Calisan SET Ad = @Ad,
				   Soyad = @Soyad,
				   KullaniciAd = @KullaniciAd,
				   KullaniciParola = @KullaniciParola,
				   DogumTarih = @DogumTarih,
				   @IseGirisTarih = @IseGirisTarih,
				   TCNO = @TCNO,
				   AdminYetki = @AdminYetki WHERE CalisanID = @CalisanID

GO
/****** Object:  StoredProcedure [dbo].[Film_Delete]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[Film_Delete]
@FilmID INT
AS
DELETE FROM Film WHERE FilmID = @FilmID

GO
/****** Object:  StoredProcedure [dbo].[Film_Insert]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Film_Insert]
@FilmAd NVARCHAR(50),
@Yonetmen NVARCHAR(50),
@Sure INT,
@YayinTarih DATETIME,
@Aktif BIT,
@Kategori NVARCHAR(50)
AS
INSERT INTO Film (FilmAd,Yonetmen,Sure,YayinTarih,Aktif,Kategori) VALUES(@FilmAd,@Yonetmen,@Sure,@YayinTarih,@Aktif,@Kategori)

GO
/****** Object:  StoredProcedure [dbo].[Film_Select]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Film_Select]
@FilmID INT
AS
SELECT *FROM Film T1 WITH(NOLOCK) WHERE T1.FilmID = @FilmID

GO
/****** Object:  StoredProcedure [dbo].[Film_SelectList]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Film_SelectList]
AS
SELECT *FROM Film WITH(NOLOCK)

GO
/****** Object:  StoredProcedure [dbo].[Film_Update]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Film_Update]
@FilmID INT,
@FilmAd NVARCHAR(50),
@Yonetmen NVARCHAR(50),
@Sure INT,
@YayinTarih DATETIME,
@Aktif BIT,
@Kategori NVARCHAR(50)
AS
UPDATE Film SET FilmAd = @FilmAd,
				Yonetmen = @Yonetmen,
				Sure = @Sure,
				YayinTarih = @YayinTarih,
				Aktif = @Aktif,
				Kategori = @Kategori WHERE FilmID = @FilmID

GO
/****** Object:  StoredProcedure [dbo].[Salon_Delete]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Salon_Delete]
@SalonID INT
AS
DELETE FROM Salon WHERE SalonID = @SalonID

GO
/****** Object:  StoredProcedure [dbo].[Salon_Insert]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Salon_Insert]
@SalonAd NVARCHAR(50),
@Kapasite INT
AS
INSERT INTO Salon(SalonAd,Kapasite) VALUES(@SalonAd,@Kapasite)

GO
/****** Object:  StoredProcedure [dbo].[Salon_Select]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Salon_Select]
@SalonID INT
AS
SELECT *FROM Salon T1 WITH(NOLOCK) WHERE T1.SalonID = @SalonID

GO
/****** Object:  StoredProcedure [dbo].[Salon_SelectList]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Salon_SelectList]
AS
SELECT *FROM Salon WITH(NOLOCK)

GO
/****** Object:  StoredProcedure [dbo].[Salon_Update]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Salon_Update]
@SalonID INT,
@SalonAd NVARCHAR(50),
@Kapasite INT
AS
UPDATE Salon SET SalonAd = @SalonAd, Kapasite = @Kapasite WHERE SalonID = @SalonID

GO
/****** Object:  StoredProcedure [dbo].[Seans_Delete]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Seans_Delete]
@SeansID INT
AS
DELETE FROM Seans WHERE SeansID = @SeansID

GO
/****** Object:  StoredProcedure [dbo].[Seans_Insert]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Seans_Insert]
@SeansSaat NVARCHAR(50)
AS
INSERT INTO Seans(SeansSaat) VALUES(@SeansSaat)

GO
/****** Object:  StoredProcedure [dbo].[Seans_Select]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC  [dbo].[Seans_Select]
@SeansID INT
AS
SELECT *FROM Seans T1 WITH(NOLOCK) WHERE T1.SeansID = @SeansID

GO
/****** Object:  StoredProcedure [dbo].[Seans_SelectList]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Seans_SelectList]
AS
SELECT *FROM Seans WITH(NOLOCK)

GO
/****** Object:  StoredProcedure [dbo].[Seans_Update]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Seans_Update]
@SeansID INT,
@SeansSaat NVARCHAR(50)
AS
UPDATE Seans SET SeansSaat = @SeansSaat WHERE SeansID = @SeansID

GO
/****** Object:  Table [dbo].[Bilet]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bilet](
	[BiletID] [int] IDENTITY(1,1) NOT NULL,
	[FilmID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
	[SeansID] [int] NOT NULL,
	[MusteriAd] [nvarchar](50) NOT NULL,
	[MusteriSoyad] [nvarchar](50) NOT NULL,
	[Koltuk] [nvarchar](100) NOT NULL,
	[BiletAdet] [int] NOT NULL,
	[Ucret] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Bilet] PRIMARY KEY CLUSTERED 
(
	[BiletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Calisan]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calisan](
	[CalisanID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[KullaniciAd] [nvarchar](50) NOT NULL,
	[KullaniciParola] [nvarchar](50) NOT NULL,
	[DogumTarih] [datetime] NOT NULL,
	[IseGirisTarih] [datetime] NOT NULL,
	[TCNO] [nvarchar](50) NOT NULL,
	[AdminYetki] [bit] NOT NULL,
 CONSTRAINT [PK_Calisan] PRIMARY KEY CLUSTERED 
(
	[CalisanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Film]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[FilmID] [int] IDENTITY(1,1) NOT NULL,
	[FilmAd] [nvarchar](50) NOT NULL,
	[Yonetmen] [nvarchar](50) NOT NULL,
	[Sure] [int] NOT NULL,
	[YayinTarih] [datetime] NOT NULL,
	[Aktif] [bit] NOT NULL,
	[Kategori] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[FilmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salon]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salon](
	[SalonID] [int] IDENTITY(1,1) NOT NULL,
	[SalonAd] [nvarchar](50) NOT NULL,
	[Kapasite] [int] NOT NULL,
 CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED 
(
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seans]    Script Date: 30.04.2017 16:31:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seans](
	[SeansID] [int] IDENTITY(1,1) NOT NULL,
	[SeansSaat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Seans] PRIMARY KEY CLUSTERED 
(
	[SeansID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [SINEMA] SET  READ_WRITE 
GO
