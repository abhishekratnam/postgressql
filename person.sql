create table person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100),
	gender VARCHAR(50) NOT NULL,
	date DATE NOT NULL,
	country_of_birth VARCHAR(50)
);
insert into person (id, first_name, last_name, email, gender, date, country_of_birth) values (1, 'Ginnie', 'Klampk', 'gklampk0@edublogs.org', 'Female', '22.01.2020', 'Nigeria');
insert into person (id, first_name, last_name, email, gender, date, country_of_birth) values (2, 'Madelon', 'Perrie', null, 'Female', '26.12.2019', 'Poland');
insert into person (id, first_name, last_name, email, gender, date, country_of_birth) values (3, 'Mollee', 'Peirone', 'mpeirone2@edublogs.org', 'Female', '11.03.2020', 'Sri Lanka');
insert into person (id, first_name, last_name, email, gender, date, country_of_birth) values (4, 'Carlin', 'Lawles', 'clawles3@posterous.com', 'Male', '01.05.2020', 'Portugal');
insert into person (id, first_name, last_name, email, gender, date, country_of_birth) values (5, 'Nataline', 'Andrioni', 'nandrioni4@last.fm', 'Female', '29.12.2019', 'Indonesia');
insert into person (id, first_name, last_name, email, gender, date, country_of_birth) values (6, 'Annabal', 'McKinn', 'amckinn5@amazon.de', 'Female', '28.05.2020', 'Brazil');
insert into person (id, first_name, last_name, email, gender, date, country_of_birth) values (7, 'Mariquilla', 'Meaton', null, 'Female', '19.06.2020', 'India');


select * from person;
select first_name, last_name from person where email LIKE' @.com';
select country from person where gender ='Female' AND last_name ='Perrie';	
select email from person where country_of_birth='India' AND gender='Female'