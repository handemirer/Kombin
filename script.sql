USE [master]
GO
/****** Object:  Database [kombindb]    Script Date: 1/16/2022 9:07:17 PM ******/
CREATE DATABASE [kombindb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kombindb', FILENAME = N'D:\Programs\mssql\MSSQL15.MSSQLSERVER\MSSQL\DATA\kombindb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kombindb_log', FILENAME = N'D:\Programs\mssql\MSSQL15.MSSQLSERVER\MSSQL\DATA\kombindb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kombindb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kombindb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kombindb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kombindb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kombindb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kombindb] SET ARITHABORT OFF 
GO
ALTER DATABASE [kombindb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kombindb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kombindb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kombindb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kombindb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kombindb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kombindb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kombindb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kombindb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kombindb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kombindb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kombindb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kombindb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kombindb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kombindb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kombindb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [kombindb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kombindb] SET RECOVERY FULL 
GO
ALTER DATABASE [kombindb] SET  MULTI_USER 
GO
ALTER DATABASE [kombindb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kombindb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kombindb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kombindb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kombindb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'kombindb', N'ON'
GO
ALTER DATABASE [kombindb] SET QUERY_STORE = OFF
GO
USE [kombindb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/16/2022 9:07:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/16/2022 9:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[CategoryStatus] [bit] NOT NULL,
	[MainCategory] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 1/16/2022 9:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[defination] [nvarchar](max) NULL,
	[imageDestination] [nvarchar](max) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/16/2022 9:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserUsername] [nvarchar](max) NULL,
	[UserFullname] [nvarchar](max) NULL,
	[UserPassword] [nvarchar](max) NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211216064237_mig1', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220109103835_postmigration', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220109103953_postmigration2', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220109105106_postmigration3', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220109105246_postmigration4', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220109113529_postmigration6', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220109155946_postmigration7', N'5.0.10')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (1, N'Casual', N'Casual', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (2, N'Business Casual', N'Business Casual', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (3, N'Business', N'Business', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (4, N'Basic', N'Basic', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (5, N'Street Style', N'Street Style', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (6, N'Man in Black', N'Man in Black', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (7, N'Outdoor', N'Outdoor', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (8, N'Sportluxe', N'SportLuxe', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (9, N'Retro', N'Retro', 1, 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (10, N'Causal', N'Causal', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (11, N'Smart Causal', N'Smart Causal', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (12, N'Business', N'Business', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (13, N'Sokak Stili', N'Sokak Stili', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (14, N'Spor Giyim', N'Spor Giyim', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (15, N'Basic', N'Basic', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (16, N'Minimalist', N'Minimalist', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (17, N'Bohem', N'Bohem', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (18, N'Tesettür', N'Tesettür', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (19, N'Outdoor', N'Outdoor', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (20, N'Vintage', N'Vintage', 1, 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryStatus], [MainCategory]) VALUES (21, N'Abiye', N'Abiye', 1, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (6, 0, 1, N'Gri Oduncu Gömlek ', N'Gündelik şıklıkta iyi bir görünüm elde edebilmek için sana salaş bir ekose gömlek ve slim fit jean pantolon yardımcı olacaktır. Gömleğinin içerisine basic bir tişört ekleyerek kombin de rahat bir görünüm oluşturabilirsin. Serin havalar da stilini tamamlamak için kombine bir deri ceket ekleyebilirsin. Mevsimin soğuk ve sıcak geçişlerinde ne giyeceğine karar veremiyorsan eğer gününü kurtaracak bir kombin.', N'0011bb20-26f8-4e9e-b350-b7af811a697b.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (7, 3, 1, N'Bej Boğazlı Kazak', N'Tam balıkçı yaka kazaklar bu sene çok moda. Kemik rengi ​boğazlı kazağınızın üzerine benim en sevdiğim parça olan hemen hemen her parça ile kombinleyebileceğiniz camel kabanınız ile girdiğiniz her ortamda fark edileceksiniz. ​Koyu mavi tonlarındaki jean ve vizon rengindeki nubuk botunuz ile şimdiden ortamdaki en şık kişiler arasında yerinizi aldınız bile benden söylemesi.', N'4af50443-23f8-402c-a12e-20370bd3b6a1.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (8, 3, 1, N'Siyah Kürklü Mont', N'Hem ​b​as​i​c hem de ​m​an in ​b​lack tarzı için bu kombini kullanabilirsiniz. Olmazsa olmaz parçalardan olan beyaz baskısız t-shirt ve yakası kürklü bomber ceket kombinini sizler için yaptım. Aksesuar severseniz siyah-beyaz boncuklu bileklik takabilirsiniz. Tüm kış severek kullanacağınız nubuk siyah botlarınız ile oldukça şık görüneceksiniz.', N'3979e455-0607-4566-af48-15848fdfab2b.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (9, 3, 1, N'Bordo Ceket ', N'Oldukça tarz olan süet-triko bordo kabanını içerisine kemik rengi bisiklet yaka kombinini sizler için yaptım :) Lacivert tonlarında seçtiğim bu jean ile hem spor hem de çok basic görüneceksiniz. Beyaz renkli sneakerslarınız ve ceketinizin renginde olan bilekliğiniz ile oldukça şık olacaksınız. Aksesuar olarak dilerseniz beyaz dilerseniz de kemik rengi boncuklu bileklik ekleyebilirsiniz.', N'daa9e4bb-30ab-4cb6-ba9a-7c071f92d301.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (10, 3, 1, N'Boğazlı Siyah Kazak', N'Kış mevsiminde içinizi ısıtacak bej rengi kabanı siyah kazak ve jean pantolon ile gündelik şıklıkta değerlendirebilmeniz için bir araya getirdim. Dilerseniz siz jean renk seçimini siyah olarak da tercih edebilirsiniz.', N'b79f52ec-8a2c-4e43-b3fa-75094e9adaec.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (11, 3, 2, N'Gri Ekose Desenli Blazer Ceket', N'Tarz sahibi bir erkek imajı vermek isteyen, bulunduğu ortamda tarz alanında bir adım önde olmak isteyen erkekler için ideal bir kombin. Hem rahat edeceğiniz hem şık bir görünüm kazanacağınız slim fit kesim bir kombin. Omuzları dar, üçgen vücut tipine sahip erkeklerin rahatlıkla tercih edebileceği üst bedeni detaylarla dolu kare desenli blazer ceket kombini. Metal saat ve boncuk bileklikler ekleyerek daha şık bir görünüm elde edebilirsiniz.', N'9f7f35bf-1729-49df-9ab2-e92a283d2513.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (12, 3, 2, N'Bej Boğazlı Kazak', N'Slim fit lacivert jean ile kemik rengi boğazlı kazağımızı bir arada kullandım. Bu senenin trendlerinden olan haki yeşil kaşmir kabanımız, taba rengi deri ayakkabı ve kemerimiz ile tam bir uyum içerisinde olacaksın. Hem soğuktan korunman hem de şık olmanı düşünerek hazırladığım bu kombinde boyunluk olmazsa olmazlardan. Detaylı kişiliğini ortaya çıkarmak istersen desenli çorap ve bilekliklerini unutmamalısın.', N'dd20ec12-542a-4882-ad16-d0b04d331c52.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (13, 3, 2, N'Çizgi Desenli Lacivert Blazer Ceket', N'İlkbahar ve yazın en fresh Business Casual kombini ile tanışın. Mavi ve beyazın rahatlığını en iyi şekilde hissedebilirsiniz. Kaliteli ürünlerden oluşan kombinde dilerseniz aksesuar olarak deri kordonlu saat tercih edebilirsiniz.', N'99f1ba17-4109-4841-8d11-e69ed4cb1a6a.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (14, 3, 3, N'Desenli Mor Gömlek', N'Business giyim yalnızca desensiz tek tip gömlekler giymek demek değildir. Mor desenli slim fit gömlek ile gri kumaş pantolonu kombinlediğimizde siyah makosen ayakkabılar ile nasıl da hoş durduğunu görüyoruz. Artık ofiste değişiklik vakti beyler..', N'f0ee1b65-811c-44c7-957a-1deb9e0415b5.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (15, 3, 3, N'Gri Kaban', N'Resmiyetten uzak ofis tarzı kombin arayışında olan erkekler için şık ve modern duruş sergilemeye yardımcı yelekli ve bağcıklı botu bir araya kolayca getirebileceğiniz şık bir kombin. Siyah ve tonları ile uyumlu evrak çantası veya el çantaları ile kombininizi zenginleştirebilirsiniz.', N'643e76dc-f2ba-44ea-a3e4-b89fbaddddfc.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (16, 3, 3, N'Bej Blazer Ceket', N'İş hayatında kararlı ve olgun bir tavır sergilemek için en uyumlu renkleri sizler için bir araya getirdim. Kahve tonları kişide olgun bir görünüm sergilemekte yardımcı olur. Esmer bir ten rengine sahip erkekler için oldukça uygun bir hale getirdiğim kombinde üst beden kahve tonlarının daha açık renkler de tercih etmenizi sağladım. Bej rengi ceket ve beyaz gömlek tercih edebilmeniz ten renginiz ile sizi boğmayacaktır. Özgüvenli bir şekilde bu kombini üzerinizde taşıyabilirsiniz. Metal bir saat ile kombininizi daha canlı bir hale de getirebilirsiniz.', N'8533bc56-fd2c-44e2-bd97-98ff505aecdd.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (17, 3, 4, N'Slim Fit Beyaz Gömlek', N'Bu kombin gömlek ve jean pantolonun rahatlığından vazgeçemeyen erkekler için hazırladım. Jean üstünde beyaz bir gömlek spor ve şık bir görünüm elde etmeni sağlayacak. Daha güçlü ve şık bir hava katmak istiyorsan; hava şartları el veriyor ve akşam randevun da varsa bu kombine blazer ceket giymeni tavsiye ederim.', N'866eeb6c-6554-4ee2-a6e4-60fc86ff92b2.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (18, 3, 4, N'Siyah Deri Ceket ', N'Tam balıkçı yakaların bu sene çok trend olduğunu söylememe gerek yok galiba beyler… Saks mavisi tam balıkçı kazak ve omuz detaylı deri ceket kombinini sizler için yaptım. Siyah regular fit jean pantolonunuzu gri, siyah, beyaz tonlarındaki deri ayakkabı ile kombinledim. Siyah bilekliğiniz ile de kombininizi tamamladım.', N'3d93602b-950b-4230-aa52-b9c2a26f1052.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (19, 3, 4, N'Lacivert Kot Ceket ', N'Sizin için yaptığım tam balıkçı yaka kemik rengi kazak ile denim ceket ve jean pantolonunuz ile girdiğiniz her ortamda fark edileceksiniz. Vizon rengi nubuk botlar ise tam da bu tarzın ayakkabısı beyler.', N'2efa3673-3842-4204-b4ec-0036eb84f116.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (20, 3, 5, N'Kırmızı Oduncu Gömlek ', N'Kırmızı ekose gömlek ve deri ceket sokak tarzının vazgeçilmezleridir. Ekoseli gömleğini beline bağlayarak daha salaş ve havalı bir görünümün sahibi olabilirsin. Deri detaylı veya eskitme detaylı jeanler tercih ederek kombininde oluşturduğun stil iddianı ortaya koyabilirsin. Stilini aksesuarlarla desteklemelisin. Boynuna, bileğine veya pantolon kemer köprülerine bir bandana bağlayarak kombinini vurucu hale getirebilirsin.', N'76550ffb-5ef9-4f60-a9dc-064bcdb3b651.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (21, 3, 5, N'Şişme Mont', N'Kış sezonu sokak stilinde tek renk kombinlerin detaylarında patlatacağınız renkler tarz olma yolunda on numara hareketlerden oluyor. Kombinin mont turuncu iç astarını bu kombinde siyah renkler ile değerlendirdim. Kombine ek olarak siyah bir bere ile kışın çetin soğuklarından korunarak tarz bir duruş sergileyebilirsiniz.', N'030cf24e-bf3d-407e-938d-043e36f86050.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (22, 3, 5, N'Mavi Jean Pantolon', N'Siyah ve mavi jean severleri buraya alalım beyler. Gardrobunuzun vazgeçilmez parçalarından olan siyah deri ceket ile bu sene kış sezonuna bomba gibi gireceksiniz. Zincir kolye ve metal detaylı deri siyah ayakkabı ile bu kombini bütünledim ve hem rahat hem şık olan bu kombini sizler için hazırladım. Sezonun trend parçasından olan desenli çorapları eklemeyi de unutmadım.', N'f92995d8-ba79-4880-8dae-49bd94b49e70.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (23, 3, 6, N'Fermuarlı Siyah Deri Ceket', N'Siyah taşlamalı jean ve baskılı t-shirt kombinine, hava koşullarını da düşünerek vazgeçilmez parçanız olan deri ceketi ekledim. Hem kombini renklendirmek hem de sezona uyum sağlamak için desenli çoraplar kullandım. Hava koşulları demişken şapkayı da es geçmedim tabiki.', N'af10c0cd-4353-4f0d-a13e-cb5af44728d8.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (24, 3, 6, N'Gri Havuç Pantolon', N'İşte en sevdiğim uyum ve parçalar ile karşınızdayım. Ekose desenli havuç pantolon ve yarım balıkçı yaka siyah kazak ancak bu kadar şahane olabilirdi. Bu senenin ekose trendine uyum sağlarken bir yandan da tarz sahibi olmanızı sağlayacak bu kombini sizler için hazırladım. Siyah fötr şapka ve nubuk siyah bot ile muhteşem durmuyor mu sizcede. Bu kombinde dilerseniz desenli dilerseniz de düz çoraplar tercih edebilirsiniz.', N'095f0b75-07b3-4fee-a099-869c2ee36c16.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (25, 3, 6, N'Siyah Kaşmir Kaban', N'Siyah İtalyan kesim pantolon ile bisiklet yaka gri kazak ve tabiki siyah kaban ile kombin dediğin budur. Siyah klasik ayakkabı ve siyah bir kemer ile kombinini tamamladım. Ve tabiki kışın vazgeçilmezlerinden olan olan atkı. Siyah ve gri desenli olan bu atkı tam da bu kombinin atkısı değil mi sizce de. Bu arada siyah ve beyaz bilekliklerini de unutmadım beyler.', N'861353ed-9989-423c-82eb-106114a0f098.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (26, 3, 7, N'Haki Kargo Pantolon ', N'Haki rengi oduncu gömleklerinizi haki rengi kargo pantolonlarınız ile kombinleyebilirsiniz beyler. Gömleklerinizin içerisine tam balıkçı yaka kazaklarınızı kullanabilir outdoor botlar kulanabilirsiniz. Traveller tarzının en vazgeçilmezlerinden olan montlarınız ile de kombini tamamlayabilirsiniz.', N'f51867f0-a4d0-46e6-913c-14cc61391951.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (27, 3, 7, N'Şal Yaka Kazak ', N'Traveller ama daha klasik tarzda giyinmeyi seviyorsanız bu şal yaka desenli kazak tam size göre beyler. Şal yaka kazağınızın içerisine beyaz, gri, siyah desensiz gömleklerinizi giyinebilir ve siyah jean pantolonunuz ile kombinleyebilirsiniz.Traveller tarzının en vazgeçilmezi olan outdoor ayakkabılar ile kombini tamamlayabilirsiniz.', N'128f7e36-1201-4d03-a319-98e4d7ca85ae.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (28, 3, 7, N'Lacivert Ekose Gömlek', N'Bu senenin en trendlerinden olan oduncu gömleğinizi tam balıkçı yaka kazaklarınız ile kombinleyebilirsiniz. Lacivert bej tonlarındaki oduncu gömleğinizi bej tonlarındaki kazağınız ile kombinleyebilir kargo cepli jogger pantolonlarınız ile kombininizi tamamlayabilirsiniz. Traveller tarzı kombininizi outdoor ayakkabılarınız ile kombinleyebilirsiniz.', N'dd3648e0-bd64-48cc-a282-80f7ac6411fa.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (29, 3, 8, N'Gri Eşofman Altı ', N'Rahat ve hareketlerinizi engellemeyen gündelik egzersizlerinizi yapabileceğiniz bir kombin. Tempolu yürüyüş ve ya koşu gibi rutin egzersizleriniz de değerlendirebileceğiniz ideal kombinleriniz arasında yerini alacak.', N'42bf4fcb-f672-4b68-9c66-be375085e0ad.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (30, 3, 8, N'Gri Kapüşonlu Sweatshirt ', N'Sokak stilinde gününüzü kurtaran gündelik bir kombin olarak ya da gündelik egzersizleriniz de değerlendirebileceğiniz bir kombin. İsterseniz yürüyüş kombini, isterseniz de evde rahat bir kombin olarak düşünebilirsiniz.', N'29a99a78-1047-45ea-8816-266805d78e08.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (31, 3, 8, N'Yeşil Jogger Eşofman', N'Eşofmanda siyah ve haki uyumunu severler için hazırladığım bu kombin tam da size göre. Haki yeşili jogger erkek eşofman pantolonu ve kamuflaj desenli haki yeşili ceket kombinini sizler için bir araya getirdim. Siyah lastik ayakkabı ve siyah patik çoraplarınız ile spor salonunun en şık ve en rahat erkeği siz olacaksınız.', N'92647a35-f885-498e-bfb5-822e3a6c62c1.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (32, 3, 9, N'Ekose Desenli Takım Elbise ', N'Eskilerin etkisinden kurtulmak istemeyen ve yenilenen şekline adeta hayran kalan erkekler burada mı? Evet dediğinizi duyar gibiyim beyler. Pantolon, yelek, ceket takımı ve kravat ile birleştirdiğim bu kombindeki vintage esintisini sende hissettin biliyorum. İçine beyaz gömlek giymeni tavsiye ettiğim bu kombin ile kasket şapka kullanabilirsin. Bu senenin trendlerinden olan camel rengi kaban ile kombinini tamamlayabilirsin. Ceket zinciri ile de detaycı kişiliğini öne çıkartıp şıklık kazanabilirsin.', N'9897964e-eaf9-4e25-b0fd-7cbb31ec1043.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (33, 3, 9, N'Haki Yeşili Kaban', N'Kabanlardan vazgeçemeyenler için oluşturduğum bu kombin tam da size göre. Tam balıkçı yaka kazak ve bu senenin trend renklerinden olan doğa ve toprak tonlarının uyumunu bu kombinde görebilirsiniz. Deri detaylı kahve fötr şapka ve vizon tonlarındaki süet bot ile tam bir uyum sağlayabilirsiniz. Desenli çorap ve bilekliklerinizi aman unutmayın derim beyler benden söylemesi.', N'db97a039-91c9-4ddb-8e9b-679832af0cdf.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (34, 3, 9, N'Ekose Bordo Takım Elbise ', N'Bordo tonlarının kullanıldığı pantolon, yelek, kravat ve cep mendili ile bir araya getirilen mükemmel bir kombin seni bekliyor. Beyaz gömlek ile oluşturduğum bu kombinde ceketindeki zincir seni de büyüledi öyle değil mi? Bordo ayakkabılar ile yaptığım bu kombinin sahibi kesinlikle sensin.', N'118e4120-4258-4e75-b6cc-8fdea718cf95.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (35, 3, 10, N'Deri Ceket Kadın ', N'Deri Ceket Kadın ', N'803db6fa-779b-452a-b155-579f96528f41.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (36, 3, 10, N'Taba Askılı ', N'Taba Askılı ', N'f9a92de2-1c8f-4974-880a-4134babeadbb.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (37, 3, 10, N'Yırtık Siyah Kot Pantolon ', N'Yırtık Siyah Kot Pantolon ', N'6f11f114-1b71-47d2-af54-b3fe15072176.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (38, 3, 11, N'Gri Blazer Ceket', N'Gri Blazer Ceket', N'6fb92239-0fdc-4192-814c-e6c7250af51c.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (39, 3, 11, N'Lacivert Blazer Ceket ', N'Lacivert Blazer Ceket ', N'169718fb-8a3c-4ee2-b959-d4660fe3ff7d.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (40, 3, 11, N'Pudra Rengi Kumaş Pantolon ', N'Pudra Rengi Kumaş Pantolon ', N'5127e2ab-9ed8-4aa0-8ac0-550809ba1623.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (41, 3, 12, N'Kahve Kaban', N'Kahve Kaban', N'fece6627-1a72-4502-b88d-5fb8a8366644.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (42, 3, 12, N'Lacivert Kaban', N'Lacivert Kaban', N'946b0aca-3aee-4d24-bac6-47565c2d2bc9.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (43, 3, 13, N'Gri Yırtık Kot Pantolon', N'Gri Yırtık Kot Pantolon', N'4d4654bc-f262-476d-a26c-373228e7d35e.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (44, 3, 13, N'Hardal Sarısı Ceket ', N'Hardal Sarısı Ceket ', N'1acc2916-e5b0-4bc1-9bbe-31d316de3d7b.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (45, 3, 13, N'Baskılı Tişört', N'Baskılı Tişört', N'194f39b3-4ee8-4e44-b617-7a237df9fa68.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (46, 3, 14, N'Kapüşonlu Gri Sweatshirt ', N'Kapüşonlu Gri Sweatshirt ', N'c294e8e1-5d38-411a-b9c6-a24d69dbf798.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (47, 3, 14, N'Pembe Eşofman Altı ', N'Pembe Eşofman Altı ', N'9b9bdeef-db21-44c0-a606-02c492e91c86.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (48, 3, 14, N'Pudra Eşofman', N'Pudra Eşofman', N'39af52f4-82ec-4b62-9eda-ff088bfec792.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (49, 3, 15, N'İspanyol Paça Kot Pantolon ', N'İspanyol Paça Kot Pantolon ', N'd51cc3d3-c8c2-46f6-80fb-c1162063cf67.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (50, 3, 15, N'Çizgili Mavi Gömlek', N'Çizgili Mavi Gömlek', N'65b8daa5-c4f8-498a-934b-27a85add22f5.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (51, 3, 15, N'Taşlamalı Kot Pantolon', N'Taşlamalı Kot Pantolon', N'e62a97d4-50b4-4d92-8795-dcef1517ee05.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (52, 3, 16, N'Pembe Blazer Ceket', N'Pembe Blazer Ceket', N'0e4dcb7e-bbdb-4ea7-96f8-c99d4ecdfd7f.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (53, 3, 16, N'Pudra Rengi Kadın Pantolon ', N'Pudra Rengi Kadın Pantolon ', N'38914602-1df8-4515-a6bb-a05fda77329a.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (54, 3, 16, N'Siyah Kumaş Pantolon', N'Siyah Kumaş Pantolon', N'aa6e837a-c710-4de5-a64b-a561bd304b93.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (55, 3, 17, N'Desenli Uzun Elbise', N'Desenli Uzun Elbise', N'1daae8a1-edfc-41f6-86aa-ea9232089aaa.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (56, 3, 17, N'Çiçek Desenli Etek ', N'Çiçek Desenli Etek ', N'cb93f914-db21-486e-b1bd-9c08b63d82ce.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (57, 3, 17, N'Kırmızı Uzun Elbise', N'Kırmızı Uzun Elbise', N'16c16239-3c32-4043-bafd-10279deb971b.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (58, 3, 18, N'Kahverengi Uzun Etek Kadın', N'Kahverengi Uzun Etek Kadın', N'c30da9e6-acd3-4f44-9b5a-db43ab642607.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (59, 3, 18, N'Pudra Kumaş Pantolon Kadın', N'Pudra Kumaş Pantolon Kadın', N'1f65418b-6b4a-4c9e-adbb-fc5b9d59ccd2.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (60, 3, 19, N'Antrasit Mont Kadın', N'Antrasit Mont Kadın', N'5f4d44c1-9da0-4e6c-baa7-f546bc19c731.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (61, 3, 20, N'Yeşil Kaban', N'Yeşil Kaban', N'6e96f702-3082-439f-89f0-9989f2d16114.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (62, 3, 20, N'Koyu Kahve Kaban', N'Koyu Kahve Kaban', N'77b025d2-dd74-4c95-9a9b-5c0a5ac0d88a.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (63, 3, 20, N'Boğazlı Yaka Beyaz Kazak', N'Boğazlı Yaka Beyaz Kazak', N'9ca2b81d-9f25-4b3b-b11e-0e01880abad3.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (64, 3, 21, N'Yırtmaçlı Abiye', N'Yırtmaçlı Abiye', N'f56e5761-e0aa-4495-91f4-be7e6978aaf2.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (65, 3, 21, N'Güpürlü Gri Abiye', N'Güpürlü Gri Abiye', N'f522e482-2f77-45a9-b2f7-1a8d1ab4305c.png')
INSERT [dbo].[Posts] ([PostId], [userId], [categoryId], [name], [defination], [imageDestination]) VALUES (66, 3, 21, N'Güpürlü Abiye', N'Güpürlü Abiye', N'84b572a0-93ec-42c5-a3fa-c4f6da2e897d.png')
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserUsername], [UserFullname], [UserPassword], [Role]) VALUES (3, N'han', N'Han Demirer', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0)
INSERT [dbo].[Users] ([UserId], [UserUsername], [UserFullname], [UserPassword], [Role]) VALUES (4, N'hande', N'Hande Mirer', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 1)
INSERT [dbo].[Users] ([UserId], [UserUsername], [UserFullname], [UserPassword], [Role]) VALUES (5, N'ismail', N'İsmail Önder', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 1)
INSERT [dbo].[Users] ([UserId], [UserUsername], [UserFullname], [UserPassword], [Role]) VALUES (6, N'admin', N'Admin', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [MainCategory]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ((0)) FOR [userId]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ((0)) FOR [categoryId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Role]
GO
USE [master]
GO
ALTER DATABASE [kombindb] SET  READ_WRITE 
GO
