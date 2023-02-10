# Movie_DB

The Movie_DB project is a project I carried out alongside with a team mate from India.
We took part of a an online Data and SQL introductory bootcamp offered by instructors from the UK.
At the end of the bootcamp we had to present a group/individual project in which we showcase the skills we have learnt on MySQL throughout the course.
As the topic we decided to create a Database that can be used to suggest movies to an individual based on various filter settings while also obtaining 
other interesting informations with regards to the movie, actors, etc. 

Due to time limitation, we limited ourselves to holding 25 records in the database i.e. 25 movies.

This project consists of three files:

1 - Movie_Recommendations.sql.  
  The SQL script for the creation of the database. Here you'll find the queries for the creation of the tables and insertion of the records for the tables.
  
  The database consists of 8 eight tables:
  -Genres -  records of all the genres a movie can have
  -Companies -  records of production companies for the movie
  -Actors -  records of actors starring in the movie along with some additional information that might influence the way to filter movies. Example movies starring american or indian actors only
  -Viewer_Advisory - records of potential movie advisory rating, example movies rated R or for peple aged +13
  -Movie_Ratings -  records of possible review ratings on a scale of 1.0 to 10.0.
  -Directors -  records of diractors for the movies
  -Languages - records of languages a movie is in
  -Movies - records of all the movie titles in the database
  
2 - MovieRecommendation.mwb
  This file contains the Entity relationship diagram for the Movie database created.

3 - Implementation_Movie_DB.sql
  This file contains examples of how you can use queries to carry out analysis on the data or filter for results for suggestions.
  
  Suggestions for improving the Database:
  1. obviously have more movie titles records to imrpove suggestions and provide more options
  2. add columns that show co-stars of the movie, often people enjoy movies with their go to favorite pair of film stars
  3. add columns to share the sub genres of a movie
  4. add columns that share more fun facts about the actors, directors, a user may build a stronger connection to the actor or diretor by learning 
    something interesting about them and that may influence their decision to watch the movie too. For example, an actor supports an important cause 
     that the user supports.
