create database fatalpoliceshootings;

create table MedianHouseholdIncome2015
(Geographic_Area char(2),	
City varchar(100),
Median_Income INT
);

alter table medianhouseholdincome2015
modify column Geographic_Area varchar(10);

create table PercentagePeopleBelowPovertyLevel
(Geographic_Area char(2),	
City varchar(100),
poverty_rate double
);

alter table percentagepeoplebelowpovertylevel
modify column Geographic_Area varchar(10);

create table PercentOver25CompletedHighSchool
(Geographic_Area char(2),	
City varchar(100),
percent_completed_hs double
);

alter table percentover25completedhighschool
modify column Geographic_Area varchar(10);

create table policekillingsus
(id INT,	
pk_name	varchar(100),
pk_date	varchar(100),
manner_of_death	varchar(100),
armed varchar(100),
age	INT,
gender varchar(10),
race varchar(10),
city varchar(100),
state varchar(10),
signs_of_mental_illness varchar(10),	
threat_level varchar(100),
flee varchar(100),
body_camera varchar(10)
)
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

create table ShareRaceByCity
(Geographic_area char(2),
City varchar(100),
share_white	double,
share_black	double,
share_native_american double,	
share_asian double, 
share_hispanic double
);

alter table policekillingsus
add column newpkdate date;

update policekillingsus
set newpkdate = str_to_date(pk_date, '%d-%m-%Y');