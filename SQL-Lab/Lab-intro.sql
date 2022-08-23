# Lab | SQL Intro
use sakila;
#Select titles from filmoriginal_language_id
SELECT * FROM film;
select title from film;

#Select one column from a table and alias it. Get unique list of film languages under the alias language
select name  as Language  
from language;

#Numbers of the stores blongs to the company
select * from store;

#Return a list of employee first names only
select first_name from staff;