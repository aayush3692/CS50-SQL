/*You should start by getting a sense for how average player salaries have changed over time. In 1.sql,
write a SQL query to find the average player salary by year.

Sort by year in descending order.
Round the salary to two decimal places and call the column “average salary”.
Your query should return a table with two columns, one for year and one for average salary.*/

select year, round(avg(salary), 2) as 'Average Salary' from salaries group by (year) ORDER by year DESC;

/*Your general manager (i.e., the person who makes decisions about player contracts) asks you whether the team
should trade a current player for Cal Ripken Jr., a star player who’s likely nearing his retirement.
 In 2.sql, write a SQL query to find Cal Ripken Jr.’s salary history.

Sort by year in descending order.
Your query should return a table with two columns, one for year and one for salary.*/

select year, salary from salaries where player_id = (
    select id from players where "first_name" =  "Cal" and "last_name" = "Ripken"
);
/*Your team is going to need a great home run hitter. Ken Griffey Jr., a long-time Silver Slugger and Gold Glove award
winner, might be a good prospect. In 3.sql, write a SQL query to find Ken Griffey Jr.’s home run history.

Sort by year in descending order.
Note that there may be two players with the name “Ken Griffey.” This Ken Griffey was born in 1969.
Your query should return a table with two columns, one for year and one for home runs.*/
select year, HR from performances where player_id = (
    select id from players where "first_name" = "Ken" and
    "last_name" = "griffey" and birth_year= 1969
);

/*You need to make a recommendation about which players the team should consider hiring.
 With the team’s dwindling budget, the general manager wants to know which players were paid the lowest salaries in 2001.
  In 4.sql, write a SQL query to find the 50 players paid the least in 2001.

Sort players by salary, lowest to highest.
If two players have the same salary, sort alphabetically by first name and then by last name.
If two players have the same first and last name, sort by player ID.
Your query should return three columns, one for players’ first names, one for their last names, and one for their salaries.*/
select first_name, last_name, salary from players JOIN salaries on
players.id = salaries.player_id where year = 2001 order by salary asc, first_name, last_name,
salaries.player_id;

/*It’s a bit of a slow day in the office. Though Satchel no longer plays,
 in 5.sql, write a SQL query to find all teams that Satchel Paige played for.

Your query should return a table with a single column, one for the name of the teams.*/

select teams.name from teams join performances on teams.id = performance.team_id where
player_id = (
    select id from players where first_name = "Satchel" and last_name = "Paige"
) group by team_id;

/*Which teams might be the biggest competition for the A’s this year?
In 6.sql, write a SQL query to return the top 5 teams, sorted by the total number of hits by players in 2001.

Call the column representing total hits by players in 2001 “total hits”.
Sort by total hits, highest to lowest.
Your query should return two columns, one for the teams’ names and one for their total hits in 2001.*/

select teams.name, sum(performances.H) as 'total hits'
from teams
JOIN performances
on teams.id = performances.team_id
where performances.year = 2001 group by teams.name
order by "total hits"
desc limit 5;

/*You need to make a recommendation about which player (or players) to avoid recruiting.
 In 7.sql, write a SQL query to find the name of the player who’s been paid the highest salary, of all time,
 in Major League Baseball.

Your query should return a table with two columns, one for the player’s first name and one for their last name.*/
select first_name, last_name from players
where id = (
    select player_id from salaries where salary = (
        select max(salary) from salaries
    )
);

/*How much would the A’s need to pay to get the best home run hitter this past season?
 In 8.sql, write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.

Your query should return a table with one column, the salary of the player.
*/

select salary from performances
join players on players.id = performances.player_id
join salaries on players.id = salaries.player_id
where salaries.year = 2001
order by performances.HR DESC
limit 1;

/*What salaries are other teams paying? In 9.sql, write a SQL query to find the 5 lowest
 paying teams
 (by average salary) in 2001.
Round the average salary column to two decimal places and call it “average salary”.
Sort the teams by average salary, least to greatest.
Your query should return a table with two columns, one for the teams’ names and
one for their average salary.*/
select teams.name, round(avg(salaries.salary), 2) as 'average salary'
from teams
join salaries on teams.id = salaries.team_id
where salaries.year = 2001
group by teams.name
order by "average salary" asc
limit 5;

/*The general manager has asked you for a report which details each player’s name, their salary for each year
they’ve been playing, and their number of home runs for each year they’ve been playing. To be precise,
the table should include:

All player’s first names
All player’s last names
All player’s salaries
All player’s home runs
The year in which the player was paid that salary and hit those home runs
In 10.sql, write a query to return just such a table.

Your query should return a table with five columns, per the above.
Order the results, first and foremost, by player’s IDs (least to greatest).
Order rows about the same player by year, in descending order.
Consider a corner case: suppose a player has multiple salaries or performances for a given year.
 Order them first by number of home runs, in descending order, followed by salary, in descending order.
Be careful to ensure that, for a single row, the salary’s year and the performance’s year match.*/

select players.first_name, players.last_name, salaries.salary, performances.HR, performances.year from performances
join salaries on performances.player_id = salaries.player_id
join players on performances.player_id = players.id
And salaries.year = performances.year
order by players.id asc, salaries.year desc, HR desc, salaries.salary desc;

/*You need a player that can get hits. Who might be the most underrated?
In 11.sql, write a SQL query to find the 10 least expensive players per hit in 2001.

Your query should return a table with three columns, one for the players’ first names, one of their last names, and one called “dollars per hit”.
You can calculate the “dollars per hit” column by dividing a player’s 2001 salary by the number of hits they made in 2001. Recall you can use AS to rename a column.
Dividing a salary by 0 hits will result in a NULL value. Avoid the issue by filtering out players with 0 hits.
Sort the table by the “dollars per hit” column, least to most expensive. If two players have the same “dollars per hit”,
order by first name, followed by last name, in alphabetical order.
As in 10.sql, ensure that the salary’s year and the performance’s year match.
You may assume, for simplicity, that a player will only have one salary and one performance in 2001.*/

select first_name, last_name, salary/H as 'dollars per hit' from performances
join players on performances.player_id = players.id
join salaries on players.id = salaries.player_id
And salaries.year = performances.year
where performances.year = 2001 and H > 0
order by "dollars per hit" asc, first_name, last_name
limit 10;

/*Hits are great, but so are RBIs! In 12.sql, write a SQL query to find the players among the 10
least expensive players per hit and among the 10 least expensive players per RBI in 2001.

Your query should return a table with two columns, one for the players’ first names and one of their last names.
You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
Keep in mind the lessons you’ve learned in 10.sql and 11.sql!*/

select first_name, last_name from(select first_name, last_name, id from(
    select first_name, last_name, players.id as "id" from performances
join players on performances.player_id = players.id
join salaries on players.id = salaries.player_id
And salaries.year = performances.year
where performances.year = 2001 and H > 0
order by "salary"/"H"
limit 10)

intersect

select first_name, last_name, id from (select first_name, last_name, players.id as "id" from performances
join players on performances.player_id = players.id
join salaries on players.id = salaries.player_id
And salaries.year = performances.year
where performances.year = 2001 and RBI > 0
order by "salary"/"RBI"
limit 10))
order by "id" asc
;
