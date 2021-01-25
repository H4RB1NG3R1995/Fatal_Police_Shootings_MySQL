/*1. Which state has maximum number of fatal police shootings of non white population.*/
select state, count(*) as numberofshootings
from policekillingsus
where race <> "W"
group by state
order by numberofshootings desc
limit 1;

/*2. City wise minority percentage share based on race.*/
select Geographic_area, City, round(share_black+share_asian+share_hispanic+share_native_american, 1) as minorityshare
from shareracebycity
order by minorityshare desc;

/*3. Top 10 states having number of Cities below average literacy rate.*/
select Geographic_Area, count(*) as numberofcities 
from (select Geographic_Area, city, percent_completed_hs
from percentover25completedhighschool
where percent_completed_hs < (select avg(percent_completed_hs) from percentover25completedhighschool)) as citesbelowavgliteracyrate
group by Geographic_Area
order by numberofcities desc
limit 10;

select avg(percent_completed_hs) from percentover25completedhighschool;

/*4. Race wise police shootings to determine racism related killings if any.*/
select race, count(*) as numberofshootings
from policekillingsus
group by race
order by numberofshootings desc;

/*5. Top 5 cities having unarmed, non fleeing, non aggressive shootings.*/
select state, city, count(*) as numberofshootings
from policekillingsus
where armed = "unarmed" and flee = "not fleeing" and threat_level <> "attack"
group by city
order by numberofshootings desc
limit 5;

/*6. Number of killings grouped by active and inactive body cams of police, when the victims were not fleeing.*/
select body_camera, flee, count(*) as numberofkillings
from policekillingsus
where flee = "not fleeing"
group by body_camera;

/*7. Most common weapons carrried by victims during shootings.*/
select armed, count(*) as numberoftimes
from policekillingsus
group by armed
having numberoftimes > 10
order by numberoftimes desc;

/*9. Number of shootings where the victims showed signs of mental illness or not.*/
select signs_of_mental_illness, count(*) as numberofshootings
from policekillingsus
group by signs_of_mental_illness;

/*10. Which US state had minimum number of shootings in all of 2015, 2016, 2017.*/
select state, count(*) as numberofshootings
from policekillingsus
group by state
having numberofshootings = (select min(shootings) from (select state, count(*) as shootings
from policekillingsus
group by state) as minshootings);

/*11. Top 10 Cities having lower than average median income in all of US in 2015.*/
select Geographic_Area, City, Median_Income
from medianhouseholdincome2015
where Median_Income < (select avg(Median_Income) from medianhouseholdincome2015)
order by Median_Income desc
limit 10;

/*12. Percent of population which completed high school of the top 10 cities having maximum percent of people below poverty level.*/
select hs.City, percent_completed_hs, poverty_rate
from percentagepeoplebelowpovertylevel as pl inner join percentover25completedhighschool as hs on pl.city = hs.city
where poverty_rate = (select max(poverty_rate) from percentagepeoplebelowpovertylevel)
order by percent_completed_hs desc
limit 10;

select *
from percentagepeoplebelowpovertylevel
order by poverty_rate desc;