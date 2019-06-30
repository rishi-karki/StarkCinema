create DATABASE [strakcinema];
GO

USE [strakcinema]
GO

/** Object:  Table [dbo].[users]    Script Date: 03-Apr-19 1:35:21 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[last_name] [varchar](25),
	[first_name] [varchar] (25),
	[phone] [varchar](15),
	[street_no] [varchar](4),
	[street_name] varchar(50),
	[city] [varchar](40),
	[province] [varchar](15),
	[postal_code] [varchar](10),
	[country] [varchar] (40),
 	[email] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/** Object:  Table [dbo].[creditcards]    Script Date: 03-Apr-19 1:35:21 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[creditcards](
	[card_id] [int] IDENTITY(1,1) NOT NULL,
	[card_num] [varchar](16) NOT NULL,
	[card_type] [varchar](10) NOT NULL,
	[card_name] varchar(30) NOT NULL,
	[card_expiry] [varchar](12) NOT NULL,
	[card_cvv] decimal(3,0) NOT NULL,
 CONSTRAINT [PK_creditcards] PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[movies]    Script Date: 03-Apr-19 1:35:21 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movies](
	[movie_id] [int] IDENTITY(1,1) NOT NULL,
	[movie_name] [varchar](100) NOT NULL,
	[genre] [varchar](100) NOT NULL,
	[runtime] [varchar](100) NOT NULL,
	[release_date] [varchar](100) NOT NULL,
	[language] [varchar](100) NOT NULL,
	[subtitle] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[image_path] [varchar](max) NOT NULL,
	[video_path] [varchar](max) NOT NULL,
	[rating] [varchar](100) NOT NULL,
	[director] [varchar](100) NOT NULL,
 CONSTRAINT [PK_movies] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/** Object:  Table [dbo].[theaters]    Script Date: 03-Apr-19 1:35:21 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theaters](
	[theater_id] [int] IDENTITY(1,1) NOT NULL,
	[theater_name] [varchar](100) NOT NULL,
	[city] [varchar](20),
	[country][varchar](15),
 CONSTRAINT [PK_theaters] PRIMARY KEY CLUSTERED 
(
	[theater_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/* table */
/** Object:  Table [dbo].[shows]    Script Date: 03-Apr-19 1:35:21 PM **/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shows](
	[show_id] [int] IDENTITY(1,1) NOT NULL,
	[movie_id] [int] NOT NULL,
	[theater_id] [int] NOT NULL,
	[date] date NOT NULL,
	[timing] time,
	[price] float,
	foreign key (movie_id) references movies(movie_id),
	foreign key (theater_id) references theaters(theater_id),
 CONSTRAINT [PK_shows] PRIMARY KEY CLUSTERED 
(
	[show_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
	
GO


/** Object:  Table [dbo].[orders]    Script Date: 03-Apr-19 1:35:21 PM **/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[show_id] [int],
	[total_tickets] [int] NOT NULL,
	[total_cost] float NOT NULL,
	[date] date NOT NULL,
	[card_id] int,
	foreign key (show_id) references shows(show_id),
	foreign key (user_id) references users(user_id),
	foreign key (card_id) references creditcards(card_id),

 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT INTO strakcinema.dbo.movies(
[movie_name],
[genre],
[runtime],
[release_date],
[language],
[subtitle],
[description],
[image_path],
[video_path],
[rating],
[director]) VALUES 
(
'SHAZAM!',
'ACTION', 
'175 min',
'01 APR',
'ENGLISH', 
'FRENCH',
'David F. Sandberg (“Annabelle: Creation”) directs New Line Cinema’s “Shazam!,” the origin story that stars Zachary Levi (TV’s “Chuck”) as the titular DC Super Hero, along with Asher Angel (TV’s “Andi Mack”) as Billy Batson, and Mark Strong (the “Kingsman” movies) in the role of Super-Villain Dr. Thaddeus Sivana. Peter Safran (upcoming “Aquaman,” “The Conjuring” and “Annabelle” films) serves as the film’s producer. We all have a superhero inside us, it just takes a bit of magic to bring it out. In Billy Batson’s (Angel) case, by shouting out one word—SHAZAM!—this streetwise 14-year-old foster kid can turn into the adult Super Hero Shazam (Levi), courtesy of an ancient wizard. Still a kid at heart—inside a ripped, godlike body—Shazam revels in this adult version of himself by doing what any teen would do with superpowers: have fun with them! Can he fly? Does he have X-ray vision? Can he shoot lightning out of his hands? Can he skip his social studies test? Shazam sets out to test the limits of his abilities with the joyful recklessness of a child. But he’ll need to master these powers quickly in order to fight the deadly forces of evil controlled by Dr. Thaddeus Sivana (Strong).',
'https://assets.voxcinemas.com/posters/P_HO00006027.jpg', 
'https://www.youtube.com/embed/uilJZZ_iVwY?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'PG13',
'DIRECTOR 1'),
(
'PET SEMATARY',
'HORROR', 
'135 min',
'02 APR',
'ENGLISH', 
'FRENCH',
'Louis Creed, his wife Rachel and their two children Gage and Ellie move to a rural home where they are welcomed and enlightened about the eerie Pet Sematary located near their home. After the tragedy of their cat being killed by a truck, they resort to burying it in the mysterious pet sematary which is definitely not as it seems as it proves to the Creeds that a pet isnt just for life..',
'https://assets.voxcinemas.com/posters/P_HO00006029.jpg', 
'https://www.youtube.com/embed/mqNcC0PJ2qY?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'15+',
'DIRECTOR 2'),
(
'DUMBO',
'ANIMATION', 
'115 min',
'03 APR',
'ENGLISH', 
'FRENCH',
'A young elephant, whose oversized ears enable him to fly, helps save a struggling circus, but when the circus plans a new venture, Dumbo and his friends discover dark secrets beneath its shiny veneer.',
'https://assets.voxcinemas.com/posters/P_HO00005940.jpg', 
'https://www.youtube.com/embed/NkybsSmCXtg?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'PG',
'DIRECTOR 3'),
(
'ROMEO AKBAR WALTER',
'ACTION', 
'125 min',
'05 APR',
'HINDI', 
'FRENCH',
'Movie based on Ravindra Kaushik. He was an Ex RAW agent. His spy mind benefitted India in 1971 war and many more secrets revealed by him. He went to major post in Pak Army and through their he was leaking the details and Giving to India.',
'https://assets.voxcinemas.com/posters/P_HO00006647.jpg', 
'https://www.youtube.com/embed/HSHjC8VdzCM?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'13+',
'DIRECTOR 4'),
(
'CAPTAIN MARVEL',
'Animation', 
'115 min',
'06 APR',
'ENGLISH', 
'FRENCH',
'Carol Danvers becomes one of the universe’s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.Carol Danvers becomes one of the universe’s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.',
'https://assets.voxcinemas.com/posters/P_HO00005896.jpg', 
'https://www.youtube.com/embed/0LHxvxdRnYc?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'PG15',
'DIRECTOR 5'),
(
'US',
'HORROR', 
'155 min',
'07 APR',
'ENGLISH', 
'FRENCH',
'A mother and father take their kids to their beach house, expecting to enjoy time with friends, but their serenity turns to tension and chaos when some visitors arrive uninvited.',
'https://assets.voxcinemas.com/posters/P_HO00006023.jpg', 
'https://www.youtube.com/embed/1qEQmpprzSM?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'15+',
'DIRECTOR 6'),
(
'PROJECT GHAZI',
'ACTION', 
'125 min',
'08 APR',
'ENGLISH', 
'FRENCH',
'Two super soldiers from the Pakistan Army must stop a sinister organization that plans to destabilize the nation by unleashing a toxin gas that has the potential to incite intolerance, anarchy and chaos',
'https://assets.voxcinemas.com/posters/P_HO00006696.jpg', 
'https://www.youtube.com/embed/zksQSQrRhWk?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'PG15',
'DIRECTOR 7'),
(
'MY HERO ACADEMIA THE MOVIE',
'ANIMATION', 
'90 min',
'04 APR',
'HINDI', 
'ENGLISH',
'In Boku no Hiro Academia: Futari no Hiro -- All Might and Deku accept an invitation to visit a floating man-made city called I Island where they meet a girl and battle against a villain who takes the island hostage.',
'https://assets.voxcinemas.com/posters/P_HO00006695.jpg', 
'https://www.youtube.com/embed/yJ6Y03BuqsM?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'PG13',
'DIRECTOR 8'),
(
'ARGENTINA FANS',
'DRAMA', 
'100 min',
'09 APR',
'MALAYALAM', 
'ENGLISH',
'The movie spans over three football World Cup tournaments from 2010 to 2018. The story revolves around the lead pair who are die hard football fans and how their friendship blossoms over the tournaments',
'https://assets.voxcinemas.com/posters/P_HO00006719.jpg', 
'https://www.youtube.com/embed/kumqmNfAlAk?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'PG15',
'DIRECTOR 9'),
(
'LUCIFER',
'ACTION', 
'115 min',
'09 APR',
'MALAYALAM', 
'ENGLISH',
'In God`s own country, the supreme leader of the ruling party dies, leaving a huge vacuum, not only in the electoral and leadership sphere of the party but also that of the state. In the inevitable succession squabble and the power struggle that ensues, the thin line that separates good and bad becomes irrecoverably blurred and out of this seemingly endless mayhem, emerge forces that are hitherto unheard of.',
'https://assets.voxcinemas.com/posters/P_HO00006649.jpg', 
'https://www.youtube.com/embed/zUMWAK4ZJ-c?rel&#x3D;0&amp;amp;showinfo&#x3D;0&amp;amp;hd&#x3D;1&amp;amp;enablejsapi&#x3D;1',
'PG13',
'DIRECTOR 10')


INSERT INTO strakcinema.dbo.theaters(
[theater_name],
[city],
[country]) VALUES 
(
'Cinemas Park Lane',
'HALIFAX', 
'CANADA'),
(
'Cinemas Dartmouth Crossing',
'HALIFAX', 
'CANADA'),
(
'Cinemas Lower Sackville',
'HALIFAX', 
'CANADA')



INSERT INTO strakcinema.dbo.shows(
[movie_id],
[theater_id],
[date],
[timing],
[price]) VALUES 
(
1,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
1,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
1,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
2,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
2,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
2,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
3,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
3,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
3,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
4,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
4,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
4,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
5,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
5,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
5,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
6,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
6,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
6,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
7,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
7,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
7,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
8,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
8,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
8,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
9,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
9,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
9,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
10,
1, 
'10-apr-2019',
'12:00:00', 
20),
(
10,
1, 
'10-apr-2019',
'14:00:00', 
20),
(
10,
1, 
'10-apr-2019',
'16:00:00', 
20),
(
1,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
1,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
1,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
2,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
2,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
2,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
3,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
3,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
3,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
4,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
4,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
4,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
5,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
5,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
5,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
6,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
6,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
6,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
7,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
7,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
7,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
8,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
8,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
8,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
9,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
9,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
9,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
10,
1, 
'11-apr-2019',
'12:00:00', 
20),
(
10,
1, 
'11-apr-2019',
'14:00:00', 
20),
(
10,
1, 
'11-apr-2019',
'16:00:00', 
20),
(
1,
2, 
'10-apr-2019',
'12:00:00', 
20),
(
1,
2, 
'10-apr-2019',
'14:00:00', 
20),
(
1,
2, 
'10-apr-2019',
'16:00:00', 
20),
(
2,
2, 
'10-apr-2019',
'12:00:00', 
20),
(
2,
2, 
'10-apr-2019',
'14:00:00', 
20),
(
2,
2, 
'10-apr-2019',
'16:00:00', 
20),
(
3,
2, 
'10-apr-2019',
'12:00:00', 
20),
(
3,
2, 
'10-apr-2019',
'14:00:00', 
20),
(
3,
2, 
'10-apr-2019',
'16:00:00', 
20),
(
1,
2, 
'11-apr-2019',
'12:00:00', 
20),
(
1,
2, 
'11-apr-2019',
'14:00:00', 
20),
(
1,
2, 
'11-apr-2019',
'16:00:00', 
20),
(
2,
2, 
'11-apr-2019',
'12:00:00', 
20),
(
2,
2, 
'11-apr-2019',
'14:00:00', 
20),
(
2,
2, 
'11-apr-2019',
'16:00:00', 
20),
(
3,
2, 
'11-apr-2019',
'12:00:00', 
20),
(
3,
2, 
'11-apr-2019',
'14:00:00', 
20),
(
3,
2, 
'11-apr-2019',
'16:00:00', 
20),
(
1,
3, 
'10-apr-2019',
'16:00:00', 
20),
(
1,
3, 
'11-apr-2019',
'16:00:00', 
20)
