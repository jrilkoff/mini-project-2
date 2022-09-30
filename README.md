# Miniproject 2

### [Assignment](assignment.md)

## Files in Project

root directory
README.md - readme file (you are here)
assignment.md - assignment requirements

data
database_schema.txt - SQL code for creating database tables

notebooks
EDA.ipynb - submission paper for assignment
miniproject2.ipynb - working paper used to prepare EDA.ipynb
miniproject2.sql - SQL code for querying database to generate tables for presentation
miniproject2.db - Database file comprised of clean, parsed data


## Project/Goals
This project was to connect to two APIs (Foursquare and Yelp) and call information related to various points of interest at a select location. 

From this API call the requirements were to parse and present the data in a way that would show the top 10 POIs in the area.  

The goal was to highlight where some data was better than others across the platforms

## Process
My process was as follows:

Step 1 - API Call Functions

First an API call was made by referring to the documentation provided by the platform
In most instances their code itself was used as part of the function created for the call
These were created with specific variables outlining location, Places Of Interest (POIs)
The API calls were loaded into a payload variable to be used for future parsing and analysis

Step 2 - Parsing Functions

Next a function was created that would parse the data and create separate tables for the database
A lot of time was spent refining the functions to reduce code repetition, this was the most time consuming part
The goal was to have a category table that would be used as a foreign key in the POI table
These categories were nested in a list within a data column, so the function was made to return two tables
Afterwards these tables were concatenated and had minor duplication removal/clean up work done on them

Step 3 - Database Creation

A function was created here to create the various tables based on the DataFrames column headers
This was mostly successful, but I was unable to get the data loaded in the same function, so code was put outside for this purpose
When these tables were created I used an SQL file to review for accuracy
At this point I found some column headers had '.' in them, so I had to go back and add data cleanup lines into early parts of my code

## Results
What I saw from the results:

Yelp had the best coverage and user interaction levels
Not many people use FourSquare as a review platform, review counts were very low and this results in overly high or low ratings
Yelp's 5 star review system doesn't allow for the level of granularity that gives the user confidence
Comparing reviews across the two platforms saw some issues with data consistency (Red Collar Brewing vs. Red Collar Brewing Company)
As a result it is difficult to get an apples to apples comparison across the two platforms
Yelp was clearly the more used platform, but low review counts tend to skew 5 star ratings onto areas that may not be truly tested

## Challenges 
Time management became an issue at the end
I became obsessed with making my code as pythonic as possible, which was a valuable lesson to myself, but cost me in the end
Cleaning up and getting the API calls to return exactly what I was looking for
SQL column names were coming out with 'icon.prefix' in the yelp_cats table, and I was having issues doing queries on columns with '.'
Fully understanding deliverables, I will definitely look at the evaluation rubric more closely as I could've spent more time being less pythonic

## Future Goals
If I had more time I would build in user experience (input fields, text returns)
I would also like to have more metrics analyzed (does the # of photos a place have impact their rating score? - these types of question)
Building functions right away - I found I spent a ton of my time cleaning up my code and trying to optimize it