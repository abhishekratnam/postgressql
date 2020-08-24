
create table person_test (
	id NUMERIC NOT NULL PRIMARY KEY,
	first_name VARCHAR(50)
);
CREATE PROCEDURE insert_to_person_test (NUMERIC,VARCHAR)
LANGUAGE 'plpgsql'
AS $$
BEGIN
insert into person_test (id, first_name) values ($1,$2);
END;
$$;
call insert_to_person_test(1, 'Abhishek');
select * from person_test;




create table person_details (
	id NUMERIC NOT NULL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100),
	gender VARCHAR(50) NOT NULL,
	country_of_birth VARCHAR(50)
);


CREATE PROCEDURE insert_to_person_details (NUMERIC,VARCHAR,VARCHAR,VARCHAR,VARCHAR,VARCHAR)
LANGUAGE 'plpgsql'
AS $$
BEGIN
insert into person_details (id, first_name,last_name,email,gender,country_of_birth) values ($1,$2,$3,$4,$5,$6);
END;
$$;
call insert_to_person_details(1, 'Abhishek', 'Ratnam','anshu98@outlook.com','Male','India');
call insert_to_person_details(2, 'Madelon', 'Perrie', null, 'Female', 'Poland');
select * from person_details;


CREATE OR REPLACE PROCEDURE display_message (INOUT msg TEXT)
LANGUAGE 'plpgsql' 
AS $$
BEGIN
RAISE NOTICE 'Procedure Parameter: %', msg ;
END ;
$$;
call display_message('Procedure called');



CREATE OR REPLACE PROCEDURE control_transaction()
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
CREATE TABLE test_1 (id int);
INSERT INTO test_1 VALUES (1);
RAISE NOTICE 'Table 1 created';
RAISE NOTICE 'values inserted in Table 1 ';
COMMIT;
RAISE NOTICE 'Transaction committed';
CREATE TABLE test_2 (id int);
INSERT INTO test_2 VALUES (1);
ROLLBACK;
RAISE NOTICE 'Transaction Rolled back sucessfully';
END $$;
call control_transaction();



CREATE OR REPLACE PROCEDURE datestyle_change() LANGUAGE plpgsql
SET datestyle TO postgres, dmy
AS $$
BEGIN
RAISE NOTICE 'Current Date is : % ', now();
END;
$$ ;
call datestyle_change();
select now();

CREATE OR REPLACE FUNCTION totalRecords ()
RETURNS integer AS $total$
declare
	total integer;
BEGIN
   SELECT count(*) into total FROM person;
   RETURN total;
END;
$total$ LANGUAGE plpgsql;
select totalRecords();


CREATE OR REPLACE FUNCTION total_Chinese_emails ()
RETURNS integer AS $total$
declare
	total integer;
BEGIN
   SELECT count(email) into total FROM person where country_of_birth='China';
   RETURN total;
END;
$total$ LANGUAGE plpgsql;
select total_Chinese_emails();


CREATE OR REPLACE FUNCTION increment(i INT) RETURNS INT AS $$
BEGIN
RETURN i + 1;
END;
$$ LANGUAGE plpgsql; 
SELECT increment(10);


CREATE FUNCTION mathCalcs(x int, y int) AS $
BEGIN
    sum := x + y;
    subtract := x - y;
    multiplication := x * y;
    division := x / y;
	PRINT 'sum';

END;            
$ LANGUAGE plpgsql;
call mathCalcs(5,6);


CREATE table Account_data(
	Acc_no int NOT NULL,
	Holder_NAME VARCHAR(50),
	Balance DEC
);
insert into Account_data(Acc_no,Holder_Name,Balance) VALUES (101, 'Abhishek', 12300);
insert into Account_data(Acc_no,Holder_Name,Balance) VALUES (102, 'Jane', 12000);
select * from Account_data;
CREATE OR REPLACE PROCEDURE Ttransfer_Money(INT, INT, DEC)
LANGUAGE 'plpgsql'    
AS $$
BEGIN
UPDATE Account_data
SET Balance = Balance - $3
WHERE Acc_no = $1;
UPDATE Account_data
SET Balance = Balance + $3
WHERE Acc_no = $2;
COMMIT;
END;
$$;
CALL Ttransfer_Money(101,102,2000);