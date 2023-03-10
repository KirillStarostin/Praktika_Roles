USE [master]
GO
/****** Object:  Database [ПрактикаПДД]    Script Date: 15.12.2022 10:16:43 ******/
CREATE DATABASE [ПрактикаПДД]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ПрактикаПДД', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\ПрактикаПДД.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ПрактикаПДД_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\ПрактикаПДД_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ПрактикаПДД] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ПрактикаПДД].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ПрактикаПДД] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET ARITHABORT OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ПрактикаПДД] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ПрактикаПДД] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ПрактикаПДД] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ПрактикаПДД] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET RECOVERY FULL 
GO
ALTER DATABASE [ПрактикаПДД] SET  MULTI_USER 
GO
ALTER DATABASE [ПрактикаПДД] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ПрактикаПДД] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ПрактикаПДД] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ПрактикаПДД] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ПрактикаПДД] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ПрактикаПДД', N'ON'
GO
ALTER DATABASE [ПрактикаПДД] SET QUERY_STORE = OFF
GO
USE [ПрактикаПДД]
GO
/****** Object:  Table [dbo].[Автошколы]    Script Date: 15.12.2022 10:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Автошколы](
	[idAuto] [tinyint] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[ЦенаКатегорииА] [int] NULL,
	[ЦенаКатегорииBМех] [int] NULL,
	[ЦенаКатегорииBАвт] [int] NULL,
	[ЦенаКатегорииС] [int] NULL,
	[ЦенаКатегорииD] [int] NULL,
	[Рейтинг] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAuto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Билеты]    Script Date: 15.12.2022 10:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Билеты](
	[idBilet] [tinyint] NOT NULL,
 CONSTRAINT [PK__Билеты__04780CC9533876B5] PRIMARY KEY CLUSTERED 
(
	[idBilet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Варианты_ответов]    Script Date: 15.12.2022 10:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Варианты_ответов](
	[idVar] [tinyint] IDENTITY(1,1) NOT NULL,
	[idQue] [tinyint] NOT NULL,
	[ВариантОтвета] [nvarchar](1000) NOT NULL,
	[ПравильностьВарианта] [tinyint] NULL,
 CONSTRAINT [PK__Варианты__3D8FC254AFE98831] PRIMARY KEY CLUSTERED 
(
	[idVar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Вопрос]    Script Date: 15.12.2022 10:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вопрос](
	[idQue] [tinyint] IDENTITY(1,1) NOT NULL,
	[idBilet] [tinyint] NOT NULL,
	[Вопрос] [nvarchar](2550) NOT NULL,
	[Подсказка] [nvarchar](50) NULL,
 CONSTRAINT [PK__Вопрос__02CF0C6EF12EC252] PRIMARY KEY CLUSTERED 
(
	[idQue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Обучающиеся]    Script Date: 15.12.2022 10:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Обучающиеся](
	[idStudent] [tinyint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[passwords] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Обучающиеся] PRIMARY KEY CLUSTERED 
(
	[idStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Попытки]    Script Date: 15.12.2022 10:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Попытки](
	[idTry] [tinyint] IDENTITY(1,1) NOT NULL,
	[idStudent] [tinyint] NOT NULL,
	[idBilet] [tinyint] NOT NULL,
 CONSTRAINT [PK_Попытки] PRIMARY KEY CLUSTERED 
(
	[idTry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статистика]    Script Date: 15.12.2022 10:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статистика](
	[idStat] [tinyint] IDENTITY(1,1) NOT NULL,
	[idStudent] [tinyint] NOT NULL,
	[КоличествоПройденныхБилетов] [int] NULL,
	[КоличествоНепройденныхБилетов] [int] NULL,
	[КоличествоЗатраченногоВремемни] [int] NULL,
 CONSTRAINT [PK_Статистика] PRIMARY KEY CLUSTERED 
(
	[idStat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Автошколы] ON 

INSERT [dbo].[Автошколы] ([idAuto], [Название], [ЦенаКатегорииА], [ЦенаКатегорииBМех], [ЦенаКатегорииBАвт], [ЦенаКатегорииС], [ЦенаКатегорииD], [Рейтинг]) VALUES (1, N'Профиавто', 14900, 20500, 23000, 31000, 42000, 4.3)
INSERT [dbo].[Автошколы] ([idAuto], [Название], [ЦенаКатегорииА], [ЦенаКатегорииBМех], [ЦенаКатегорииBАвт], [ЦенаКатегорииС], [ЦенаКатегорииD], [Рейтинг]) VALUES (2, N'Магерм', 22000, 33000, 33000, 44000, 66000, 4)
INSERT [dbo].[Автошколы] ([idAuto], [Название], [ЦенаКатегорииА], [ЦенаКатегорииBМех], [ЦенаКатегорииBАвт], [ЦенаКатегорииС], [ЦенаКатегорииD], [Рейтинг]) VALUES (3, N'МясоКомбо', 5000, 10000, NULL, NULL, NULL, 2.5)
INSERT [dbo].[Автошколы] ([idAuto], [Название], [ЦенаКатегорииА], [ЦенаКатегорииBМех], [ЦенаКатегорииBАвт], [ЦенаКатегорииС], [ЦенаКатегорииD], [Рейтинг]) VALUES (4, N'УмаГомеда', 599, 999, NULL, 1499, 1999, 0.9)
INSERT [dbo].[Автошколы] ([idAuto], [Название], [ЦенаКатегорииА], [ЦенаКатегорииBМех], [ЦенаКатегорииBАвт], [ЦенаКатегорииС], [ЦенаКатегорииD], [Рейтинг]) VALUES (5, N'Шашлык', 120, 150, 200, 250, 20, 5)
INSERT [dbo].[Автошколы] ([idAuto], [Название], [ЦенаКатегорииА], [ЦенаКатегорииBМех], [ЦенаКатегорииBАвт], [ЦенаКатегорииС], [ЦенаКатегорииD], [Рейтинг]) VALUES (6, N'Халяль2000', 39999, 54999, 64999, NULL, NULL, 4.9)
SET IDENTITY_INSERT [dbo].[Автошколы] OFF
GO
INSERT [dbo].[Билеты] ([idBilet]) VALUES (1)
INSERT [dbo].[Билеты] ([idBilet]) VALUES (2)
INSERT [dbo].[Билеты] ([idBilet]) VALUES (3)
INSERT [dbo].[Билеты] ([idBilet]) VALUES (4)
GO
SET IDENTITY_INSERT [dbo].[Варианты_ответов] ON 

INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (1, 1, N'Остановившись непосредственно перед пешеходным переходом, чтобы уступить дорогу пешеходу.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (2, 1, N'Остановившись на проезжей части из-за технической неисправности транспортного средства.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (3, 1, N'В обоих перечисленных случаях.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (4, 2, N'Разрешен.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (6, 2, N'Разрешен только при технической неисправности транспортного средства.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (7, 2, N'Запрещен.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (8, 3, N'Можно.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (9, 3, N'Можно, если Вы управляете такси.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (10, 3, N'Нельзя.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (11, 4, N'Нельзя.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (12, 4, N'Только Б.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (13, 4, N'В и Г.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (14, 4, N'Все.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (15, 5, N'Перед знаком.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (16, 5, N'Перед перекрестком у линии разметки.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (17, 5, N'На перекрестке перед прерывистой линией разметки.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (18, 5, N'В любом месте по усмотрению водителя.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (19, 6, N'Предупреждает о неисправности светофора.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (20, 6, N'Запрещает дальнейшее движение.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (21, 7, N'Перед началом движения или перестроением.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (22, 7, N'Перед остановкой.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (23, 7, N'Во всех перечисленных случаях.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (24, 8, N'Перестроиться на правую полосу, затем осуществить поворот.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (25, 8, N'Продолжить движение по второй полосе до перекрестка, затем повернуть.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (26, 8, N'Возможны оба варианта действий.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (27, 9, N'Только по А.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (28, 9, N'Только по Б.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (29, 9, N'По любой из указанных.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (31, 10, N'Не более 50 км/ч.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (32, 10, N'Не менее 50 км/ч и не более 70 км/ч.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (33, 10, N'Не менее 50 км/ч и не более 90 км/ч.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (34, 11, N'Можно.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (35, 11, N'Можно, если скорость грузовых автомобилей менее 30 км/ч.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (36, 11, N'Нельзя.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (37, 12, N'Только если расстояние до сплошной линии разметки не менее 3 м.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (38, 12, N'Только если расстояние до края пересекаемой проезжей части не менее 5 м.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (39, 12, N'При соблюдении обоих перечисленных условий.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (40, 13, N'Только велосипедисту.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (41, 13, N'Только пешеходам.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (43, 13, N'Пешеходам и велосипедисту.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (44, 13, N'Никому.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (45, 14, N'Обоим трамваям.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (46, 14, N'Только трамваю А.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (47, 14, N'Только трамваю Б.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (48, 14, N'Никому.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (49, 15, N'Только автобусу.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (50, 15, N'Только легковому автомобилю.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (51, 15, N'Никому.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (52, 16, N'60 км/ч.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (53, 16, N'50 км/ч.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (54, 16, N'30 км/ч.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (55, 16, N'20 км/ч.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (56, 17, N'Категории «A» или подкатегории «A1».', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (57, 17, N'Любой категории или подкатегории в течение двух и более лет.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (58, 17, N'Только категории «A» или подкатегории «A1» в течение двух и более лет.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (59, 18, N'Не работают пробки топливных баков.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (60, 18, N'Не работает механизм регулировки положения сиденья водителя.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (61, 18, N'Не работают устройства обогрева и обдува стекол.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (62, 18, N'Не работает стеклоподъемник.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (63, 19, N'Затормозить и полностью остановиться.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (64, 19, N'Затормозить и плавно направить автомобиль на проезжую часть.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (65, 19, N'Не прибегая к торможению, плавно направить автомобиль на проезжую часть.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (66, 20, N'Время с момента обнаружения водителем опасности до полной остановки транспортного средства.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (67, 20, N'Время с момента обнаружения водителем опасности до начала принятия мер по ее избежанию.', 1)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (68, 20, N'Время, необходимое для переноса ноги с педали управления подачей топлива на педаль тормоза.', 0)
INSERT [dbo].[Варианты_ответов] ([idVar], [idQue], [ВариантОтвета], [ПравильностьВарианта]) VALUES (69, 6, N'Разрешает движение и информирует о том, что вскоре будет включен запрещающий сигнал.', 1)
SET IDENTITY_INSERT [dbo].[Варианты_ответов] OFF
GO
SET IDENTITY_INSERT [dbo].[Вопрос] ON 

INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (1, 1, N'В каком случае Вы совершите вынужденную остановку?
', N'2')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (2, 1, N'Разрешен ли Вам съезд на дорогу с грунтовым покрытием?
', N'1')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (3, 1, N'Можно ли Вам остановиться в указанном месте для посадки пассажира?
', N'1')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (4, 1, N'Какие из указанных знаков запрещают движение водителям мопедов?
', N'4')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (5, 1, N'Вы намерены повернуть налево. Где следует остановиться, чтобы уступить дорогу легковому автомобилю?
', N'2')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (6, 2, N'Что означает мигание зеленого сигнала светофора?
', N'2')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (7, 2, N'Водитель обязан подавать сигналы световыми указателями поворота (рукой):
', N'4')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (8, 2, N'Как Вам следует поступить при повороте направо?
', N'3')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (9, 2, N'По какой траектории Вам разрешено выполнить разворот?
', N'1')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (10, 2, N'С какой скоростью Вы можете продолжить движение вне населенного пункта по левой полосе на легковом автомобиле?
', N'3')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (11, 3, N'Можно ли водителю легкового автомобиля выполнить опережение грузовых автомобилей вне населенного пункта по такой траектории?
', N'1')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (12, 3, N'В каком случае водителю разрешается поставить автомобиль на стоянку в указанном месте?
', N'3')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (13, 3, N'При повороте направо Вы должны уступить дорогу:
', N'3')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (14, 3, N'Вы намерены проехать перекресток в прямом направлении. Кому следует уступить дорогу?
', N'1')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (15, 3, N'Кому Вы обязаны уступить дорогу при повороте налево?
', N'3')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (16, 4, N'С какой максимальной скоростью можно продолжить движение за знаком?
', N'4')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (17, 4, N'Для перевозки людей на мотоцикле водитель должен иметь водительское удостоверение на право управления транспортными средствами:
', N'3')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (18, 4, N'При какой неисправности разрешается эксплуатация транспортного средства?
', N'4')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (19, 4, N'В случае, когда правые колеса автомобиля наезжают на неукрепленную влажную обочину, рекомендуется:
', N'3')
INSERT [dbo].[Вопрос] ([idQue], [idBilet], [Вопрос], [Подсказка]) VALUES (20, 4, N'Что понимается под временем реакции водителя?
', N'2')
SET IDENTITY_INSERT [dbo].[Вопрос] OFF
GO
SET IDENTITY_INSERT [dbo].[Обучающиеся] ON 

INSERT [dbo].[Обучающиеся] ([idStudent], [username], [passwords], [Email]) VALUES (1, N'kringe158', N'oxxxximiron2009', N'limba208.mail.ru')
INSERT [dbo].[Обучающиеся] ([idStudent], [username], [passwords], [Email]) VALUES (2, N'username', N'nameuser', N'username@mail.ru')
INSERT [dbo].[Обучающиеся] ([idStudent], [username], [passwords], [Email]) VALUES (3, N'natehiggers1', N'westa', N'kanina@mail.ru')
INSERT [dbo].[Обучающиеся] ([idStudent], [username], [passwords], [Email]) VALUES (4, N'swat', N'chillout', N'annapopkova@mail.ru')
INSERT [dbo].[Обучающиеся] ([idStudent], [username], [passwords], [Email]) VALUES (5, N'hobohobo', N'cuma', N'pudge@mail.ru')
INSERT [dbo].[Обучающиеся] ([idStudent], [username], [passwords], [Email]) VALUES (6, N'lupa', N'za', N'zazazay@mail.ru')
SET IDENTITY_INSERT [dbo].[Обучающиеся] OFF
GO
ALTER TABLE [dbo].[Вопрос]  WITH CHECK ADD  CONSTRAINT [FK_Вопрос_Билеты] FOREIGN KEY([idBilet])
REFERENCES [dbo].[Билеты] ([idBilet])
GO
ALTER TABLE [dbo].[Вопрос] CHECK CONSTRAINT [FK_Вопрос_Билеты]
GO
ALTER TABLE [dbo].[Попытки]  WITH CHECK ADD  CONSTRAINT [FK_Попытки_Билеты] FOREIGN KEY([idBilet])
REFERENCES [dbo].[Билеты] ([idBilet])
GO
ALTER TABLE [dbo].[Попытки] CHECK CONSTRAINT [FK_Попытки_Билеты]
GO
ALTER TABLE [dbo].[Попытки]  WITH CHECK ADD  CONSTRAINT [FK_Попытки_Обучающиеся] FOREIGN KEY([idStudent])
REFERENCES [dbo].[Обучающиеся] ([idStudent])
GO
ALTER TABLE [dbo].[Попытки] CHECK CONSTRAINT [FK_Попытки_Обучающиеся]
GO
ALTER TABLE [dbo].[Статистика]  WITH CHECK ADD  CONSTRAINT [FK_Статистика_Обучающиеся] FOREIGN KEY([idStudent])
REFERENCES [dbo].[Обучающиеся] ([idStudent])
GO
ALTER TABLE [dbo].[Статистика] CHECK CONSTRAINT [FK_Статистика_Обучающиеся]
GO
USE [master]
GO
ALTER DATABASE [ПрактикаПДД] SET  READ_WRITE 
GO
