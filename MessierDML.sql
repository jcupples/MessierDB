Create database Messier
GO

USE Messier

GO

/*Table Creation*/

Create TABLE [Object]
(
	MessierNumID INT Identity (1, 1) primary key,
	Name [varchar] (50) NULL,
	Magnitude [decimal] (18, 2) NOT null,
	RightAscension [text] Not null,
	Declination [text] not null,
	Distance [int] not null,
	ApparentSize [text] not null,
	TypeID [int] not null,
	ConstellationID [int] not null,
	Description [text] null
	
);


Create table [Constellation]
(
	ConstellationID INT identity (1 , 1) Primary Key,
	ConstellationName [varchar] (25) not null,
	SeasonVisibility [varchar] (6) not null
	
);



Create table [TypeOfObject]
(
	TypeID INT identity (1 , 1) Primary Key,
	ObjectType [varchar] (25) not null,
	Description [text] not null
);



create table [Observation]
(

	ObservationID int identity (1, 1) primary key,
	Observation [text] not null,
	MessierNumID [int] not null,
	UserID [int] not null
);



create table [Users]
(
	UserID int identity (1, 1) primary key,
	Username varchar (25) not null,
	Permission varchar(1) not null
);



ALTER TABLE [Object]
ADD CONSTRAINT Object_Constellation_FK
FOREIGN KEY (ConstellationID)
REFERENCES Constellation (ConstellationID)

ALTER TABLE [Observation]
ADD CONSTRAINT	Observation_Object_FK
FOREIGN KEY	(MessierNumID)
REFERENCES Object (MessierNumID)

ALTER TABLE [Observation]
ADD CONSTRAINT User_Observation_FK
FOREIGN KEY (UserID)
REFERENCES Users (UserID)

ALTER TABLE [Object]
ADD CONSTRAINT Object_TypeFK
FOREIGN KEY (TypeID)
REFERENCES TypeOfObject (TypeID)

GO

/*Population*/

SET IDENTITY_INSERT Constellation ON
INSERT Constellation (ConstellationID, ConstellationName, SeasonVisibility)

VALUES 
	(1, 'Andromeda', 'autumn'),
	(2, 'Aquarius', 'autumn'),
	(3, 'Augira', 'winter'),
	(4, 'Cancer', 'winter'),
	(5, 'Canes Venatici', 'spring'),
	(6, 'Canis Major', 'winter'),
	(7, 'Capricornus', 'autumn'),
	(8, 'Cassiopeia', 'autumn'),
	(9, 'Cetus', 'autumn'),
	(10, 'Coma Berenices', 'spring'),
	(11, 'Cygnus', 'summer'),
	(12, 'Draco', 'summer'),
	(13, 'Gemini', 'winter'),
	(14, 'Hercules', 'summer'),
	(15, 'Hydra', 'winter'),
	(16, 'Leo', 'spring'),
	(17, 'Lepus', 'winter'),
	(18, 'Lyra', 'summer'), 
	(19, 'Monoceros', 'winter'),
	(20, 'Ophiuchus', 'summer'),
	(21, 'Orion', 'winter'),
	(22, 'Pegasus', 'autumn'),
	(23, 'Perseus', 'autumn'),
	(24, 'Pisces', 'autumn'),
	(25, 'Puppis', 'winter'),
	(26, 'Sagitta', 'summer'),
	(27, 'Sagittarius', 'summer'),
	(28, 'Scorpius', 'summer'),
	(29, 'Scutum', 'summer'),
	(30, 'Serpens Caput', 'summer'),
	(31, 'Serpens Cauda', 'summer'),
	(32, 'Taurus', 'winter'),
	(33, 'Triangulum', 'autumn'),
	(34, 'Ursa Major', 'spring'),
	(35, 'Virgo',  'virgo'),
	(36, 'Vulpecula', 'summer');

SET IDENTITY_INSERT Constellation OFF
GO

SET IDENTITY_INSERT TypeofObject ON
INSERT TypeofObject (TypeID, ObjectType, Description)

VALUES  
	(1, 'Globular Cluster', 'A roughly spherical grouping of hundreds of thousands of very old stars gravitationally bound to one another that are up to 200 light years in diameter'),
	(2, 'Open Cluster', 'A  loose grouping of up to several thousand stars that span several tens of light years across that originated from the same molecular cloud'),
	(3, 'Barred Galaxy', 'A type of spiral galaxy with a bar shaped core extending out to the arms'),
	(4, 'Elliptical Galaxy', 'A featureless elliptically shaped galaxy'),
	(5, 'Irregular Galaxy', 'A galaxy that has no distinct shape, central bulge or arms'),
	(6, 'Lenticular Galaxy', 'A galaxy with a central bulge surrounded by a flattened disc with no arms, they consist mostly of old stars with very little star formation'),
	(7, 'Spiral Galaxy', 'A galaxy with two or more arms that spiral outward from a central bulge'),
	(8, 'Diffuse Nebula',  'An irregularly shaped cloud of interstellar gas and dust in which stars are formed'),
	(9, 'Planetary Nebula', 'An expanding shell of ionized gas that is ejected from a dying or dead star'),
	(10, 'Supernova Remnant', 'The expanding nebulous remains of a star that has exploded or gone supernova'),
	(11, 'Double Star', 'Two stars that orbit one another'),
	(12, 'Milky Way Patch', 'A large star field that is actually a section of one of our galaxys spiral arms'),
	(13, 'Asterism', 'A prominent grouping of stars containing members from one or more constellations');
	
	SET IDENTITY_INSERT TypeofObject OFF
GO

SET IDENTITY_INSERT Object ON
INSERT Object (MessierNumID, Name, Magnitude, RightAscension, Declination, Distance, ApparentSize, TypeID, ConstellationID, Description)

VALUES
(1,	'Crab Nebula',	'8.4',	'15h 34.5m',	'22° 01''',	'6500',	'6x4',	'10',	'32',	null),
(2,	null,	'6.5',	'21h 33.5m',	'+00° 49''',	'37900',	'12.9',	'1',	'2',	null),
(3,	null,	'6.2',	'13h 42.2m',	'+28° 23''',	'33900',	'16.2',	'1',	'5',	null),
(4,	null,	'5.6',	'16h 23.6m',	'-26° 32''',	'7200',	'26.3',	'1',	'28',	null),
(5,	null,	'5.6',	'15h 18.6m',	'+02° 06''',	'24500',	'17.4',	'1',	'30',	null),
(6,	'Butterfly Cluster',	'4.2',	'17h 40.1m',	'-32° 13''',	'1600',	'25',	'2',	'28',	null),
(7,	'Ptolemys Cluster',	'3.3',	'17h 53.9m',	'-34° 49''',	'800',	'80',	'2',	'28',	null),
(8,	'Lagoon Nebula',	'6.0',	'18h 03.8m',	'-24° 23''',	'5200',	'90x40',	'8',	'27',	null),
(9,	null,	'7.7',	'17h 19.2m', 	'-18° 31''',	'26700',	'9.3',	'1',	'20',	null),
(10,	null,	'6.6',	'16h 57.1m',	'-04° 06''',	'14400',	'15.1',	'1',	'20',	null),
(11,	'Wild Duck Cluster',	'6.3',	'18h 51.1m',	'-06° 16''',	'6000',	'14',	'2',	'29',	null),
(12,	null,	'6.7',	'16h 47.2m',	'-01° 57''',	'16000',	'14.5',	'1',	'20',	null),
(13,	'Great Hercules Globular Cluster',	'5.8',	'16h 41.7m',	'+36° 28''',	'25100',	'16.6',	'1',	'14',	null),
(14,	null,	'7.6',	'17h 37.6m',	'-03° 15''',	'29000',	'11.7',	'1',	'20',	null),
(15,	'Great Pegasus Globular Cluster',	'6.2',	'21h 30m',	'+12° 10''',	'33600',	'12.3',	'1',	'22',	null),
(16,	'Eagle Nebula',	'6.4',	'18h 18.8m',	'-13° 47''',	'7000',	'7',	'2',	'31',	null),
(17,	'Omega Nebula',	'7.0',	'18h 20.8m',	'-16° 11''',	'5000',	'11',	'8',	'27',	null),
(18,	null,	'7.5',	'18h 19.9m',	'-17° 08''',	'4900',	'9',	'2',	'27',	null),
(19,	null, 	'6.8',	'17h 02.6m',	'-26° 16''',	'28400',	'13.5',	'1',	'20',	null),
(20,	'Trifid Nebula',	'9.0',	'18h 02.6m',	'-23° 02''',	'5200',	'28',	'8',	'27',	null),
(21,	null,	'6.5',	'18h 04.6m',	'-22° 30''',	'4250',	'13',	'2',	'27',	null),
(22,	'Sagittarius Cluster',	'5.1',	'18h 36.4m',	'-23° 54''',	'10400',	'24',	'1',	'27',	null),
(23,	null,	'6.9',	'17h 56.8m',	'-19° 01''',	'2150',	'27',	'2',	'27',	null),
(24,	'Sagittarius Star Cloud',	'4.6',	'18h 16.9m',	'-18° 30''',	'10000',	'90',	'12',	'27',	null),
(25,	null,	'6.5',	'18h 31.6m',	'-19° 15''',	'2000',	'40',	'2',	'27',	null),
(26,	null,	'8.0',	'18h 45.2m',	'-09° 24''',	'5000',	'15',	'2',	'29',	null),
(27,	'Dumbbell Nebula',	'7.4',	'19h 59.6m',	'+22° 43''',	'1250',	'8x5.7',	'9',	'36',	null),
(28,	null,	'6.8',	'18h 24.5m',	'-24° 52''',	'18600',	'11.2',	'1',	'27',	null),
(29,	null,	'7.1',	'20h 23.9m',	'+38° 32''',	'4000',	'7',	'2',	'11',	null),
(30,	null,	'7.2',	'21h 40.4m',	'-23° 11''',	'26100',	'11',	'1',	'7',	null),
(31,	'Andromeda Galaxy',	'3.4',	'0h 41.8m',	'+41° 16''',	'2500000',	'178x63',	'7',	'1',	null),
(32,	null,	'8.1',	'0h 42.8m',	'+40° 52''',	'2500000',	'8x6',	'4',	'1',	null),
(33,	'Triangulum Galaxy',	'5.7',	'1h 33.9m',	'+30° 39''',	'2700000',	'73x45',	'7',	'33',	null),
(34,	null,	'5.5',	'2h 42m',	'+42° 47''',	'1400',	'35',	'2',	'23',	null),
(35,	null,	'5.3',	'6h 8.9m',	'+24° 20''',	'2800',	'28',	'2',	'13',	null),
(36,	null,	'6.3',	'5h 36.1m',	'+34° 08''',	'4100',	'12',	'2',	'3',	null),
(37,	null,	'6.2',	'5h 52.4m',	'+32° 33''',	'4400',	'24',	'2',	'3',	null),
(38,	null,	'7.4',	'5h 28.7m',	'+35° 50''',	'4200',	'21',	'2',	'3',	null),
(39,	null,	'4.6',	'21h 32.2m',	'+48° 26''',	'825',	'32',	'2',	'11',	null),
(40,	'Winnecker 4',	'8.4',	'12h 22.4m',	'+58° 05''',	'510',	'.8',	'11',	'34',	null),
(41,	null,	'4.6',	'6h 47m',	'-20° 44''',	'2300',	'38',	'2',	'6',	null),
(42,	'Great Orion Nebula',	'4.0',	'5h 35.4m',	'-05° 16''',	'1600',	'85x60',	'8',	'21',	null),
(43,	'De Mairans Nebula',	'9.0',	'5h 35.6m',	'-05° 16''',	'1600',	'20x15',	'8',	'21',	null),
(44,	'Beehive Cluster',	'3.7',	'8h 40.1m',	'+19° 59''',	'577',	'95',	'2',	'4',	null),
(45,	'The Pleiades',	'1.6',	'3h 47m',	'+24° 07''',	'380',	'110',	'2',	'32',	null),
(46,	null,	'6.0',	'7h 41.8m',	'-14° 49''',	'5400',	'27',	'2',	'25',	null),
(47,	null,	'5.2',	'7h 36.6m',	'-14° 30''',	'1600',	'30',	'2',	'25',	null),
(48,	null,	'5.5',	'8h 13.8m',	'-05° 48''',	'1500',	'54',	'2',	'15',	null),
(49,	null,	'8.4',	'12h 29.8m',	'+8° 00''',	'60000000',	'9x7.5',	'4',	'35',	null),
(50,	null,	'6.3',	'7h 3.2m',	'-08° 20''',	'3000',	'16',	'2',	'19',	null),
(57,	'Ring Nebula',	'8.8',	'18h 53.6m',	'33° 02''',	'2300',	'1.4x1.0',	'9',	'18',	null),
(79,	null,	'7.7',	'5h 24.5m',	'-24° 33''',	'42100',	'8.7',	'1',	'17',	null)


	SET IDENTITY_INSERT Object OFF
	GO
	
SET IDENTITY_INSERT Users ON
INSERT Users (UserID, Username, Permission)
Values
	(1, 'Admin', 1),
	(2, 'User2', 0)
	
SET IDENTITY_INSERT Users OFF	
GO

INSERT Observation (Observation, MessierNumID, UserID)
VALUES
	('A localized semi bright fuzzball resembling a slightly diffuse yellow comet. No arm disk was visible from my location.', 31, 1),
	('M32 is off center from M31, it is much more difficult to see against the light pollution of the suburbs. It resembles a dim ellipse.', 32, 1),
	('Even under semi dark skies, the nebula is extremely difficult to discern from the background of the sky, almost requiring peripheral vision. It looked like an tiny elongated smudge on my optics.', 1, 1),
	('The Great Nebula was easily seen from suburban skies and is just barely visible to the naked eye. It is a bright cloud looking object with four tightly clustered stars. Away from city lights I observed the constrast between the areas that reflect starlight and the dust lane that separates M43 and blocks the rest of the stellar nurserys starlight become clearer.', 42, 1),
	('M43 is not as brilliant as its brighter counterpart, resembling a hazy star sitting atop M42.', 43, 1),
	('The Pleiades are easily visible to the naked eye from suburban skies as long as you know where to look. In my telescope it is a beautiful and bright arrangement of seven main blue stars surrounded by a few dozen dimmer stars.', 45, 1),
	('The Ring Nebula is surprisingly observable even from suburban skies. It is not an easy find, but by no means is it challenging, either, especially taking into consideration its size and magnitude. I observed a very small object; a dim star surrounded by a grey ring.', 57, 1),
	('I could only observe M79 somewhat away from city lights. It shows up as a dim circular blob in my telescope with no star resolution.', 79, 1);
GO

/* Creating a View */ 
Create View ObservationView
AS
SELECT     dbo.Users.Username, dbo.Object.MessierNumID, dbo.Object.Name, dbo.Object.Magnitude, dbo.Object.RightAscension, dbo.Object.Declination, 
                      dbo.Constellation.ConstellationName, dbo.TypeOfObject.ObjectType, dbo.Observation.Observation
FROM         dbo.Constellation INNER JOIN
                      dbo.Object ON dbo.Constellation.ConstellationID = dbo.Object.ConstellationID INNER JOIN
                      dbo.Observation ON dbo.Object.MessierNumID = dbo.Observation.MessierNumID INNER JOIN
                      dbo.TypeOfObject ON dbo.Object.TypeID = dbo.TypeOfObject.TypeID INNER JOIN
                      dbo.Users ON dbo.Observation.UserID = dbo.Users.UserID
                        
GO           

 /*Users and Permissions*/
 
 
/*Test userwithout Login ================*/

			
Create USER [USER2] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[MESSIER] /*Can create user without login no problem*/
GO



/*Grants*/

GRANT SELECT ON [Messier].[dbo].[Observation] TO [User2];
GO

GRANT INSERT ON [Messier].[dbo].[Observation] TO [User2];
GO

GRANT Update ON [Messier].[dbo].[Observation] TO [User2];
GO

GRANT SELECT ON [Messier].[dbo].[Object] TO [User2];
GO

GRANT SELECT ON [Messier].[dbo].[TypeOfObject] TO [User2];
GO

GRANT SELECT ON [Messier].[dbo].[Constellation] TO [User2];
GO

