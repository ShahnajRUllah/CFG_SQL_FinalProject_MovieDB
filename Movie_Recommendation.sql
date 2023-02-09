-- A movie database by Shahnaj and Manisha

-- This database holds records of movies with information about them such as the movie name, director name
-- main actor featured in the movie, released year, a brief description of the movie, genres, viewer advisory 
-- rating, the language, film rating and as well as the production company. This database can come in useful 
-- for movie recommendation applications. One can filter from a the selection of records in this movie 
-- database to find specific film suggestions.
CREATE DATABASE Movie_Recommendations;

USE Movie_Recommendations;

-- Creation of table of directors from selection of movies in DB
CREATE TABLE Directors (
Director_ID INT NOT NULL AUTO_INCREMENT,
Director_name varchar(40) NOT NULL,  
PRIMARY KEY (Director_ID)
);

INSERT INTO Directors
(Director_ID, Director_name) 
VALUES 
	   (1,"Frank Darabont"),
	   (2,"Christopher Nolan"),
       (3,"Francis Ford Coppola"),
       (4,"Mathieu Kassovitz"),
       (5,"Oliver Hirschbiegel"),
       (6,"Florian Henckel von Donnersmarck"),
       (7,"Jean Renoir"),
       (8,"Tim Miller"),
       (9,"Ashutosh Gowariker"),
       (10,"Eric Toledano"),
       (11,"Charles Chaplin"),
       (12,"Juan Jose Campanella"),
       (13,"Gabriele Muccino"),
       (14,"Wolfgang Petersen"),
       (15,"Rakeysh Omprakash Mehra"),
       (16,"Sergio Leone"),
       (17,"Bong Joon-ho"),
       (18,"Milos Forman"),
       (19,"Chloe Zhao"),
       (20,"Wes Anderson"),
       (21,"Ryan Murphy"),
       (22,"Aparna Sen"),
       (23,"Michael Haneke"),
       (24,"Denis Villeneuve");

-- Creation of table of production companies from selection of movies in DB
CREATE TABLE Companies (
Company_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Company_name varchar(50) NOT NULL
); 

INSERT INTO Companies
(Company_ID, Company_name)
VALUES 
	   (1,"Castle Rock Entertainment"),
	   (2,"Syncopy Inc."),
       (3,"DC Entertainment"),
       (4,"Paramount Pictures"),
       (5,"Les Productions Lazennec"),
       (6,"Constantin Film"),
       (7,"X Filme Creative Pool"),
       (8,"Societe des Cineromans"),
       (9,"20th Century Fox Marvel Entertainment Kinberg"),
       (10,"Aamir Khan Productions"),
       (11,"Quad Productions"),
       (12,"United Artists"),
       (13,"Haddock Films"),
       (14,"Overbrook Entertainment"),
       (15,"Bavaria Film"),
       (16,"UTV Motion Pictures"),
       (17,"Produzioni Europee Associati"),
       (18,"Barunson E&A"),
       (19,"Saul Zaentz Company"),
       (20,"Searchlight Pictures"),
       (21,"Netflix"),
       (22,"Windows Production"),
       (23,"Les Films du Losange"),
       (24,"Warner Bros. Pictures");

-- Creation of table of possible viewer advisory rating movies can have
CREATE TABLE Viewer_Advisory (
Restriction_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Restriction_name varchar(8) NOT NULL, 
Description varchar(250) NOT NULL
); 

INSERT INTO Viewer_Advisory
(Restriction_ID, Restriction_name, Description)
VALUES 
	   (1,"G", "General Audiences - All ages admitted. Nothing that would offend parents for viewing by children."),
	   (2,"PG", "Parental Guidance Suggested - Some material may not be suitable for children. Parents urged to give parental guidance. May contain some material parents might not like for their young children."),
       (3,"PG-13", "Parents Strongly Cautioned - Some material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers."),
       (4,"R", "Restricted - Under 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them."),
       (5,"NC-17", "NC-17 – Adults Only - No One 17 and Under Admitted. Clearly adult. Children are not admitted."),
       (6,"NR", "Not Rated"),
       (7, "N/A", "Not Available");

-- Creation of table of language a film is
CREATE TABLE Language (
Language_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Language_name varchar(15) NOT NULL
); 

INSERT INTO Language
(Language_ID, Language_name) 
VALUES (1,"English"),
	   (2,"French"),
       (3,"Spanish"),
       (4,"German"),
       (5,"Hindi"),
       (6,"Korean"),
       (7,"Bengali");

-- Creation of table of possible genres movies have
CREATE TABLE Genres (
Genre_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Genre_name varchar(15) NOT NULL
); 

INSERT INTO Genres
(Genre_ID, Genre_name)
VALUES 
	   (1,"Action"),
	   (2,"Biography"),
       (3,"Comedy"),
       (4,"Crime"),
       (5,"Drama"),
       (6,"Romance"),
       (7,"Sci-Fi"),
       (8,"War"),
       (9,"Western"),
       (10,"Superhero"),
       (11,"Political"),
       (12,"Musical"),
       (13,"Mystery"),
       (14,"Historical"),
       (15,"Inspirational"),
       (16,"Social Satire"),
       (17,"Adventure"),
       (18,"Thriller"),
       (19,"History"),
       (20,"Buddy"),
       (21,"LGBT+"),
       (22,"Mafia"),
       (23,"Revenge"),
       (24,"Prison"),
       (25,"Spy"),
       (26,"Road Trip");

-- Creation of table of actors in the selection of movies in the DB
CREATE TABLE Actors (
Actor_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Actor_name varchar(40) NOT NULL,
Actor_ethnicity varchar(20) NOT NULL
); 

INSERT INTO Actors
(Actor_ID, Actor_name, Actor_ethnicity)
VALUES 
	(1, 'Tim Robbins', 'American'),
	(2, 'Leonardo DiCaprio', 'American'),
	(3, 'Christian Bale', 'British'),
	(4, 'Marlon Brando', 'American'),
	(5, 'Vincent Cassel', 'French'),
	(6, 'Bruno Ganz', 'Swiss'),
	(7, 'Ulrich Mühe', 'German'),
	(8, 'Jean Gabin', 'French'),
	(9, 'Ryan Reynolds', 'American'),
	(10, 'Aamir Khan', 'Indian'),
	(11, 'François Cluzet', 'French'),
	(12, 'Charles Chaplin', 'British'),
	(13, 'Ricardo Darín', 'Argentinian'),
	(14, 'Will Smith', 'British'),
	(15, 'Jürgen Prochnow', 'German'),
	(16, 'Clint Eastwood', 'American'),
	(17, 'Song Kang-ho', 'South Korean'),
	(18, 'F. Murray Abraham', 'American'),
	(19, 'Frances McDormand', 'American'),
	(20, 'Tilda Swinton', 'British'),
	(21, 'Meryl Streep', 'American'),
	(22, 'Jisshu Sengupta', 'Indian'),
	(23, 'Jean-Louis Trintignant', 'French'),
	(24, 'Timothée Chalamet', 'American');

-- Creation of table of movies we have in the DB
CREATE TABLE Movies (
  Movie_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Movie_name VARCHAR(50) NOT NULL,
  Release_Year INT,
  Description VARCHAR(300),
  Language_ID INT NOT NULL,
  Genre_ID INT NOT NULL,
  Subgenres1_ID INT,
  Subgenres2_ID INT,
  Actor_ID INT NOT NULL,
  Rating_ID INT NOT NULL,
  Director_ID INT NOT NULL,
  Company_ID INT NOT NULL,
  Restriction_ID INT NOT NULL
);

INSERT INTO Movies (Movie_ID, Movie_name, Release_Year, Description, Language_ID, Genre_ID, Subgenres1_ID, Subgenres2_ID, Actor_ID, Rating_ID, Director_ID, Company_ID, Restriction_ID) 
VALUES
	(1, 'The Shawshank Redemption', '1994', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 1, '5', '4', 24, 1, 1, 1, 1, 4),
	(2, 'Inception', '2010', 'A thief, who steals corporate secrets through the use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.', 1, 1, 7, 18, 2, 2, 2, 2, 3),
	(3, 'The Dark Knight', '2008', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 1, 1, 10, 18, 3, 3, 2, 3, 3),
	(4, 'The Godfather', '1972', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 1, 4, 5, 22, 4, 4, 3, 4, 4),
	(5, 'La Haine', '1995', 'After a riots, three friends, damaged by poverty and racism, seek revenge on those responsible.', 2, 4, 5, 23, 5, 5, 4, 5, 4),
	(6, 'Der Untergang', '2004', 'Traudl Junge, the final secretary for Adolf Hitler, tells of the Nazi dictator\'s final days in his Berlin bunker at the end of WWII.', 4, 8, 2, 19, 6, 6, 5, 6, 4),
	(7, 'The Lives of Others', '2006', 'A story of surveillance and betrayal in East Germany', 4, 5, 11, 25, 7, 7, 6, 7, 4),
	(8, 'La Grande Illusion', '1937', 'Two French soldiers are captured during WWI and sent to a German prison camp', 2, 8, 14, 5, 8, 8, 7, 8, 2),
	(9, 'Deadpool', '2016', 'A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge.', 1, 1, 3, 10, 9, 9, 8, 9, 4),
	(10, 'Lagaan', '2001', 'A village in British India fights against a high tax imposed by their British rulers', 5, 5, 14, 12, 10, 10, 9, 10, 2),
	(11, 'The Intouchables', '2011', 'An aristocrat hires a young man from the projects to be his caretaker', 2, 3, 5, 20, 11, 11, 10, 11, 4),
	(12, 'The Great Dictator', '1940', 'A Jewish Barber goes up against a dictator who is a dead ringer for him.', 1, 3, 11, 5, 12, 12, 11, 12, 2),
	(13, 'The Secret in Their Eyes', '2009', 'A retired legal counselor writes a novel hoping to find closure for one of his past unresolved homicide cases and for his unreciprocated love with his superior - both of which still haunt him decades later.', 3, 4, 13, 5, 13, 13, 12, 13, 4),
	(14, 'The Pursuit of Happyness', '2006', 'A struggling salesman takes custody of his son as he\'s poised to begin a life-changing professional endeavor.', 1, 5, 15, NULL, 14, 14, 13, 14, 3),
	(15, 'Das Boot', '1981', 'The claustrophobic world of a WWII German U-boat; boredom, filth, and sheer terror', 4, 8, 1, 18, 15, 15, 14, 15, 4),
	(16, 'Rang De Basanti', '2006', 'As five young Indians become friends, they learn how much they have in common, despite their vastly different backgrounds', 5, 5, 1, 11, 10, 16, 15, 16, 7),
	(17, '"The Good, the Bad and the Ugly"', '1966', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery', 1, 9, 17, 1, 16, 17, 16, 17, 2),
	(18, 'Parasite', '2019', '"A poor family, the Kims, con their way into becoming the servants of a wealthy family, the Parks. But their newfound privileged lifestyles unravel to a sinister end when a parasitic interloper threatens the Kims\' newfound comfort."', 6, 5, 16, 18, 17, 18, 17, 18, 4),
	(19, 'Amadeus', '1984', 'The incredible story of Wolfgang Amadeus Mozart, told in flashback by his peer and secret rival Antonio Salieri - now confined to an insane asylum.', 1, 2, 5, 19, 18, 19, 18, 19, 2),
	(20, 'Nomadland', '2020', 'A woman in her 60s becomes a modern-day nomad, traveling in a van throughout the American West and camping in Bureau of Land Management sites.', 1, 5, 17, 26, 19, 20, 19, 20, 4),
	(21, 'The French Dispatch', '2020', 'A collection of stories from the French magazine Télérama.', 1, 6, 3, 5, 20, 21, 20, 20, 4),
	(22, 'The Prom', '2021', 'A group of high school students in small-town Indiana plan to stage a prom for their fellow students.', 1, 3, 12, 21, 21, 22, 21, 21, 3),
	(23, 'Ghawre Baire Aaj', '2020', '"A contemporary retelling of Rabindranath Tagore\'s novel, Ghawre Baire Aaj explores the themes of love, power and politics set in present-day Bengal."', 7, '5', 6, 11, 22, 23, 22, 22, 6),
	(24, 'Amour', '2012', 'An aging couple\'s daughter takes them to live with her in a high-rise apartment, but their relationship becomes strained as the wife\'s health deteriorates.', 2, '5', 6, NULL, 23, 24, 23, 23, 3),
	(25, 'Dune', '2021', 'A science fiction film based on the 1965 novel of the same name by Frank Herbert, directed by Denis Villeneuve and starring Timothée Chalamet, Rebecca Ferguson, Oscar Isaac, Josh Brolin and Zendaya.', 1, 7, 1, 17, 24, 25, 24, 24, 3);

-- Creation of table of ratings the movies have
CREATE TABLE Movie_Ratings (
Rating_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Movie_ID INT NOT NULL,
Rating FLOAT, 
FOREIGN KEY (Movie_ID) REFERENCES Movies(Movie_ID)
);

INSERT INTO Movie_Ratings
(Rating_ID, Movie_ID, Rating)
VALUES 
	(1, 1, 9.3),
	(2, 2, 8.8),
	(3, 3, 9.0),
	(4, 4, 9.2),
	(5, 5, 8.1),
	(6, 6, 8.2),
	(7, 7, 8.5),
	(8, 8, 8.1),
	(9, 9, 8.0),
	(10, 10, 8.0),
	(11, 11, 8.5),
	(12, 12, 8.5),
	(13, 13, 8.2),
	(14, 14, 8.0),
	(15, 15, 8.4),
	(16, 16, 8.2),
	(17, 17, 8.8),
	(18, 18, 8.6),
	(19, 19, 8.4),
	(20, 20, 7.5),
	(21, 21, 7.2),
	(22, 22, 7.3),
	(23, 23, 7.4),
	(24, 24, 7.9),
	(25, 25, 8.1);

ALTER TABLE Movies
ADD FOREIGN KEY (Language_ID) REFERENCES Language(Language_ID),
ADD FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID),
ADD FOREIGN KEY (Subgenres1_ID) REFERENCES Genres(Genre_ID),
ADD FOREIGN KEY (Subgenres2_ID) REFERENCES Genres(Genre_ID),
ADD FOREIGN KEY (Actor_ID) REFERENCES Actors(Actor_ID),
ADD FOREIGN KEY (Rating_ID) REFERENCES Movie_Ratings(Rating_ID),
ADD FOREIGN KEY (Director_ID) REFERENCES Directors(Director_ID),
ADD FOREIGN KEY (Company_ID) REFERENCES Companies(Company_ID),
ADD FOREIGN KEY (Restriction_ID) REFERENCES Viewer_Advisory(Restriction_ID);

SELECT * FROM Actors;
SELECT * FROM Directors;
SELECT * FROM Companies;
SELECT * FROM Genres;
SELECT * FROM Language;
SELECT * FROM movie_ratings;
SELECT * FROM movies;
SELECT * FROM viewer_advisory;
