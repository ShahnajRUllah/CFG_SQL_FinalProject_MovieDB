
-- Demonstration of the application of the movie_recommendation database project created

-- CORE REQUIREMENTS ---------------------------------
-- 1 - Use any type of joins create a view that combines multiple tables in a logical manner
-- Example: This view gives us a base summary of the info people generally come across when first looking into 
-- a movie, that is the release year, movie name, the starring actor, the rating it got, the main genre 
-- and a description of the film. Sometimes people are huge fans of specific directors so they may look 
-- at that info as well
CREATE VIEW movie_info AS 
SELECT Release_Year, Movie_name, Actors.Actor_name, Directors.Director_name, Genres.Genre_name, Description, Movie_Ratings.Rating
FROM Movies
INNER JOIN 
Actors
ON
Movies.Actor_ID = Actors.Actor_ID
INNER JOIN
Directors
ON
Movies.Director_ID = Directors.Director_ID
INNER JOIN 
Genres
ON
Movies.Genre_ID = Genres.Genre_ID
INNER JOIN
Movie_Ratings
ON
Movies.Rating_ID = Movie_Ratings.Rating_ID;

-- Implementation of the view movie_info
SELECT * FROM movie_info;

-- 2 - Create a stored function that can be applied to a query in your DB
-- This stored function determines how old a movie is

DELIMITER $$

CREATE FUNCTION movie_age(
	Release_Year INT
) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT; 
    SET Age = (YEAR(current_date()) - Release_Year);
	RETURN (Age);
END$$
DELIMITER ;

-- Implementation of stored function movie_age()
SELECT Movie_name, movie_age(Release_Year) AS "Movie Age"
FROM Movies
WHERE Movie_name = 'Inception';

-- 3 - Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
-- This subquery demonstrates how you can retrieve the movie with the highest rating
SELECT movie_name, rating_ID
FROM movies 
WHERE movies.rating_ID IN (SELECT movie_ratings.rating_ID
							FROM movie_ratings
                            WHERE rating IN (SELECT MAX(rating)
												FROM movie_ratings));

-- ADVANCED REQUIREMENTS ---------------------------
-- 1 - Create a stored procedure and demonstrate how it runs
-- creating a stored procedure called "GetDirector" that selects a director's name from the "Directors" table based on the given Director_ID
DELIMITER //
CREATE PROCEDURE GetDirector(IN DirectorID INT)
BEGIN
    SELECT Director_name FROM Directors WHERE Director_ID = DirectorID;
END //
DELIMITER ;




-- 2 - Create a trigger and demonstrate how it runs
-- Creating a trigger called "LogCompanies" that will run after a new row is inserted into the "Companies" table. 
-- Creating the "Companies_log" table
CREATE TABLE Companies_log (
Company_log_ID INT AUTO_INCREMENT PRIMARY KEY,
Company_ID INT,
Company_name VARCHAR(255),
Change_Date DATETIME
);
-- The trigger will insert a new row into the "Companies_log" table with the values of the "Company_ID" and "Company_name" from the inserted row in the "Companies" table, as well as the current date and time (using the "NOW()" function). 
DELIMITER $$
CREATE TRIGGER LogCompanies
AFTER INSERT ON Companies
FOR EACH ROW
BEGIN
    INSERT INTO Companies_log (Company_ID, Company_name, Change_Date)
    VALUES (NEW.Company_ID, NEW.Company_name, NOW());
END $$
DELIMITER ;


-- 3 - Create an event and demonstrate how it runs
-- An event named "update_director_name" is created that will execute every day. 
-- The event will update the Director_name in the "Directors" table and will append "_updated" to the Director_name where Director_ID = 1.

CREATE EVENT update_director_name
ON SCHEDULE EVERY 1 DAY
DO
  UPDATE Directors SET Director_name = CONCAT(Director_name, '_updated')
  WHERE Director_ID = 1;



-- 4 - Create a view that uses at least 3-4 base tables: Prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis
-- This code creates a view called "Director_View" which combines data from the "Directors", "Companies", "Viewer_Advisory", and "Language" tables using inner joins on the Director_ID column.
CREATE VIEW Director_View AS
SELECT Directors.Director_name, Companies.Company_name, Viewer_Advisory.Restriction_name, Language.Language_name
FROM Directors
INNER JOIN Companies ON Directors.Director_ID = Companies.Company_ID
INNER JOIN Viewer_Advisory ON Directors.Director_ID = Viewer_Advisory.Restriction_ID
INNER JOIN Language ON Directors.Director_ID = Language.Language_ID;

-- query to retrieve data from the view:
-- To query the view:
SELECT * FROM Director_View;


-- 5 - Prepare an example query with GROUP BY and HAVING to demonstrate how to extract data from your DB for analysis
-- This query would return the names of all directors with more than 1 movies in the Movies table, along with the number of movies they directed.
SELECT Director_name, COUNT(*) as Num_Movies
FROM Directors
JOIN Movies ON Directors.Director_ID = Movies.Director_ID
GROUP BY Director_name
HAVING Num_Movies > 1;