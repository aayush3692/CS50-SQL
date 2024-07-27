/*Your colleague is preparing a map of all public schools in Massachusetts. In 1.sql,
write a SQL query to find the names and cities of all public schools in Massachusetts.*/

select "name", "city" from schools where type = "Public School";

/*2. Your team is working on archiving old data. In 2.sql, write a SQL query to find the names of districts that are no longer operational.

Districts that are no longer operational have “(non-op)” at the end of their name.*/

select "name" from districts where "name" LIKE "%non-op%";

/*3. The Massachusetts Legislature would like to learn how much money, on average, districts spent per-pupil last year.
 In 3.sql, write a SQL query to find the average per-pupil expenditure.
 Name the column “Average District Per-Pupil Expenditure”.*/

 select avg("per_pupil_expenditure") AS 'Average District Per-Pupil Expenditure' from expenditures;

/*Some cities have more public schools than others.
 In 4.sql, write a SQL query to find the 10 cities with the most public schools.
  Your query should return the names of the cities and the number of public schools within them,
  ordered from greatest number of public schools to least.
 If two cities have the same number of public schools, order them alphabetically*/

select city, count("name") from schools where type = "Public School"
group by city
order by count("name") desc, "city" ASC limit 10 ;

/*DESE would like you to determine in what cities additional public schools might be needed.
In 5.sql, write a SQL query to find cities with 3 or fewer public schools. Your query should return the names of the
cities and the number of public schools within them, ordered from greatest number of public schools to least.
 If two cities have the same number of public schools, order them alphabetically.*/

 select city, count("name") from schools where type = "Public School"
group by city
HAVING count("name") <= 3
order by count("name") desc, "city" ASC;

/*DESE wants to assess which schools achieved a 100% graduation rate.
In 6.sql, write a SQL query to find the names of schools (public or charter!)
that reported a 100% graduation rate.*/

select name from schools where id IN(
    select school_id from graduation_rates where graduated = 100
);

/*DESE is preparing a report on schools in the Cambridge school district.
In 7.sql, write a SQL query to find the names of schools (public or charter!) in the Cambridge school district.
Keep in mind that Cambridge, the city, contains a few school districts,
 but DESE is interested in the district whose name is “Cambridge.”*/

select name from schools where district_id = (
    select id from districts where name = "Cambridge"
);


/*A parent wants to send their child to a district with many other students.
 In 8.sql, write a SQL query to display the names of all school districts and
 the number of pupils enrolled in each.*/

 select name, pupils from districts
JOIN expenditures ON districts.id = expenditures.district_id;

Another parent wants to send their child to a district with few other students.
 In 9.sql, write a SQL query to find the name
(or names) of the school district(s) with the single least number of pupils. Report only the name(s).

select name from districts JOIN expenditures
on districts.id = expenditures.district_id
order by(pupils) asc limit 1;

/*In Massachusetts, school district expenditures are in part determined by local taxes on
property (e.g., home) values. In 10.sql, write a SQL query to find the 10 public school
districts with the highest per-pupil expenditures.
Your query should return the names of the districts and the per-pupil expenditure for each.*/

select name, per_pupil_expenditure from districts
JOIN expenditures ON districts.id = expenditures.district_id
where type LIKE "Public School%"
ORDER BY (per_pupil_expenditure) DESC limit 10;

/*Is there a relationship between school expenditures and graduation rates?
In 11.sql, write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate.
 Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure,
 sort by school name.

You should assume a school spends the same amount per-pupil their district as a whole spends.*/

select name, per_pupil_expenditure, graduated from schools
JOIN expenditures ON schools.district_id = expenditures.district_id
JOIN graduation_rates ON schools.id = graduation_rates.school_id
ORDER BY(per_pupil_expenditure) DESC , name ASC;

/*A parent asks you for advice on finding the best public school districts in Massachusetts.
In 12.sql, write a SQL query to find public school districts with above-average per-pupil expenditures and an
above-average percentage of teachers rated “exemplary”. Your query should return the districts’ names,
along with their per-pupil expenditures and percentage of teachers rated exemplary.
Sort the results first by the percentage of teachers rated exemplary (high to low),
 then by the per-pupil expenditure (high to low).*/

 select districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary from districts
join expenditures on districts.id = expenditures.district_id
join staff_evaluations on districts.id = staff_evaluations.district_id
where
    districts.type = "Public School District"
    AND per_pupil_expenditure >
        (select avg(per_pupil_expenditure) from expenditures)

AND exemplary >
        (select avg(exemplary) from staff_evaluations)

    order by (exemplary) desc, per_pupil_expenditure desc;

/*In 13.sql, write a SQL query to answer a question you have about the data! The query should:

Involve at least one JOIN or subquery*/

select districts.name, schools.name from districts
JOIN schools on districts.id = schools.district_id
where schools.type = "Public School" AND districts.type = "Public School District";


