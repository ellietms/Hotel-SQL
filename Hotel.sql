-- create database hotel
create  DATABASE Hotel;

-- use hotel database 
use Hotel;


-- Customer_info table (has just primary key)
CREATE TABLE  Customer_info(
	customer_id INTEGER ,
    customer_name VARCHAR(50) NOT NULL,
    cutomer_surname VARCHAr(50) NOT NULL,
    customer_dateOfBirth DATE,
    hotel_id INTEGER,
    CONSTRAINT pk_customer_id PRIMARY KEY (customer_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotel_info (hotel_id)
);

select *  from Customer_info;

-- Cutomer_contact_info table (has one foreign key from customer_info)
 CREATE TABLE Customer_contact_info(
	customer_contact_id INTEGER ,
    customer_id INTEGER,
    customer_email_address VARCHAR(100) NOT NULL,
    customer_phone_number VARCHAR(10) NOT NULL,
    hotel_id INTEGER,
    CONSTRAINT pk_customer_contact_id PRIMARY KEY (customer_contact_id),
    CONSTRAINT fk_customer_id FOREIGN KEY(customer_id) REFERENCES Customer_info (customer_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotel_info (hotel_id)
);  

select *  from Customer_contact_info;

-- Hotel_info table (has just primary key)
CREATE TABLE Hotel_info(
	hotel_id INTEGER,
	hotel_name VARCHAR(50) NOT NULL,
    hotel_star INTEGER NOT NULL,
	hotel_city VARCHAR(50) NOT NULL,
    customer_id  INTEGER,
    customer_contact_id INTEGER ,
    CONSTRAINT pk_hotel_id PRIMARY KEY (hotel_id),
    FOREIGN KEY (customer_id) REFERENCES Customer_info (customer_id),
    FOREIGN KEY (customer_contact_id) REFERENCES Customer_contact_info (customer_contact_id)
);
select *  from Hotel_info;

-- Hotel_services table(has one foreign key from hotel_info and primary key)
CREATE TABLE Hotel_services(
	hotel_service_id INTEGER,
    hotel_service_name VARCHAR(50) NOT NULL,
    hotel_id INTEGER,
    CONSTRAINT pk_hotel_service PRIMARY KEY (hotel_service_id),
    CONSTRAINT fk_hotel_id FOREIGN KEY (hotel_id) REFERENCES Hotel_info (hotel_id)
);

-- Cutomer_room table (has 2 foreign keys from hotel_info and customer_info tables and primary key)
CREATE TABLE Customer_room(
	room_id INTEGER,
    hotel_id INTEGER,
    customer_id INTEGER,
	room_name VARCHAR(20) NOT NULL,
    CONSTRAINT pk_room_id PRIMARY KEY (room_id),
	FOREIGN KEY (hotel_id) REFERENCES Hotel_info(hotel_id),
	FOREIGN KEY (customer_id) REFERENCES Customer_info(customer_id)
);

-- Cutomer_arrival_info (for checkIn,Checkout,and number of nights)
CREATE TABLE Customer_arrival_info(
	customer_arrival_id INTEGER,
    hotel_id INTEGER,
    customer_id INTEGER,
	customer_check_in DATE NOT NULL,
    customer_Number_Nights INTEGER NOT NULL,
    customer_check_out DATE NOT NULL,
    CONSTRAINT pk_customer_arrival_id PRIMARY KEY (customer_arrival_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotel_info(hotel_id),
    FOREIGN KEY (customer_id) REFERENCES Customer_info(customer_id)
);

-- customer room type and cost table
CREATE TABLE Customer_room_cost(
	customer_room_cost_id INTEGER,
	customer_id INTEGER,
    hotel_id INTEGER,
    room_id INTEGER,
	room_price INTEGER,
    room_type  VARCHAR(20) NOT NULL,
    CONSTRAINT pk_customer_room_cost PRIMARY KEY (customer_room_cost_id),
    FOREIGN KEY (customer_id) REFERENCES  Customer_info(customer_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotel_info(hotel_id),
    FOREIGN KEY (room_id) REFERENCES Customer_room(room_id)
);


-- insert data to Customer_info table 
INSERT INTO Customer_info(customer_id,customer_name,customer_surname,customer_dateOfBirth,hotel_id)
VALUES
(1,"Ellie","Tahmasebi","1992-12-26"),
(2,"Kim","Taylor","1998-02-16"),
(3,"Pink","Tahms","1982-10-06"),
(4,"Dave","Smith","1972-09-18"),
(5,"Saba","Tahmasebi","1998-09-09"),
(6,"Elias","Dasht","2000-01-03"),
(7,"Hasti","Salim","1994-08-22"),
(8,"Peter","Young","1962-07-12"),
(9,"Mike","Kayle","1980-11-16"),
(10,"Sana","Shamsi","2010-12-31");

 -- in the middle of my work I understood for joins I need hotel_id as foreign key of my customer_info table
UPDATE Customer_info SET hotel_id = 1 WHERE customer_id = 1;
UPDATE Customer_info SET hotel_id = 2 WHERE customer_id = 2;
UPDATE Customer_info SET hotel_id = 3 WHERE customer_id = 3;
UPDATE Customer_info SET hotel_id = 4 WHERE customer_id = 4;
UPDATE Customer_info SET hotel_id = 5 WHERE customer_id = 5;
UPDATE Customer_info SET hotel_id = 6 WHERE customer_id = 6;
UPDATE Customer_info SET hotel_id = 7 WHERE customer_id = 7;
UPDATE Customer_info SET hotel_id = 8 WHERE customer_id = 8;
UPDATE Customer_info SET hotel_id = 9 WHERE customer_id = 9;
UPDATE Customer_info SET hotel_id = 10 WHERE customer_id = 10;

select * from  Customer_info;


-- insert data to Cutomer_contact_info table 
INSERT INTO Customer_contact_info(customer_contact_id,customer_id,customer_email_address,customer_phone_number)
VALUES
(1,1,"ellietahmasebi@gmail.com",07943547608),
(2,2,"kimtaylor@gmail.com",07743997608),
(3,3,"pinktahms@gmail.com",07546647609),
(4,4,"davesmith@gmail.com",07241477618),
(5,5,"sabatahmasebi@gmail.com",07643227602),
(6,6,"eliasdasht@gmail.com",07440540600),
(7,7,"hastisalim@gmail.com",07343597009),
(8,8,"peteryoung@gmail.com",07756747987),
(9,9,"mikekayle@gmail.com",07563547123),
(10,10,"sanashamsi@gmail.com",07845607404);

-- in the middle of my work I understood for joins I need hotel_id as foreign key of my customer_contact_info table
UPDATE Customer_contact_info SET hotel_id = 1 WHERE customer_contact_id = 1;
UPDATE Customer_contact_info SET hotel_id = 2 WHERE customer_contact_id = 2;
UPDATE Customer_contact_info SET hotel_id = 3 WHERE customer_contact_id = 3;
UPDATE Customer_contact_info SET hotel_id = 4 WHERE customer_contact_id = 4;
UPDATE Customer_contact_info SET hotel_id = 5 WHERE customer_contact_id = 5;
UPDATE Customer_contact_info SET hotel_id = 6 WHERE customer_contact_id = 6;
UPDATE Customer_contact_info SET hotel_id = 7 WHERE customer_contact_id = 7;
UPDATE Customer_contact_info SET hotel_id = 8 WHERE customer_contact_id = 8;
UPDATE Customer_contact_info SET hotel_id = 9 WHERE customer_contact_id = 9;
UPDATE Customer_contact_info SET hotel_id = 10 WHERE customer_contact_id = 10;

select * from  Customer_contact_info;



-- insert data to Hotel_info table
INSERT INTO Hotel_info(hotel_id,hotel_name,hotel_star,hotel_city)
VALUES
(1,"Burj Al Arab",7,"Dubai"),
(2,"The Plaza Hotel",5,"New York"),
(3,"Marina Bay Sands",5,"Singapore"),
(4,"Brown's Hotel",5,"London"),
(5,"Atlantis Bahamas",5,"Nassau"),
(6,"The Beverly Hills Hotel",5,"Los Angeles"),
(7,"The Brando",5,"Tahiti"),
(8,"La Mamunia",5,"Marakesh"),
(9,"Hotel Ritz",5,"Paris"),
(10,"Taj Mahal Palace",5,"India");

UPDATE Hotel_info SET customer_id  = 1 , customer_contact_id = 1  WHERE hotel_id = 1; 
UPDATE Hotel_info SET customer_id = 2  , customer_contact_id = 2 WHERE hotel_id = 2;
UPDATE Hotel_info SET customer_id = 3 , customer_contact_id = 3  WHERE hotel_id = 3;
UPDATE Hotel_info SET customer_id = 4 , customer_contact_id = 4  WHERE hotel_id =4;
UPDATE Hotel_info SET customer_id = 5 , customer_contact_id = 5 WHERE hotel_id = 5;
UPDATE Hotel_info SET customer_id = 6 , customer_contact_id = 6 WHERE hotel_id = 6;
UPDATE Hotel_info SET customer_id = 7 , customer_contact_id = 7 WHERE hotel_id = 7;
UPDATE Hotel_info SET customer_id = 8 , customer_contact_id = 8 WHERE hotel_id = 8;
UPDATE Hotel_info SET customer_id = 9 , customer_contact_id = 9  WHERE hotel_id = 9;
UPDATE Hotel_info SET customer_id = 10 , customer_contact_id = 10 WHERE hotel_id = 10;

select * from  Hotel_info;



-- insert data to Hotel_services table 
INSERT INTO Hotel_services (hotel_service_id,hotel_service_name,hotel_id)
VALUES
(1,"Gold Ipad",1),
(2,"Turkish Baths",2),
(3,"Fancy pool",3),
(4,"Spa",4),
(5,"Baby sitting",5),
(6,"Spa treatments & pool",6),
(7,"Ocean View",7),
(8,"a swimup bar",8),
(9,"luxury Suites",9),
(10,"business center",10);
select * from  Hotel_services;


-- insert data to Cutomer_room 
INSERT INTO Customer_room(room_id,hotel_id,customer_id,room_name)
VALUES
(1,1,1,"BurjA-20"),
(2,2,2,"Plaza-05"),
(3,3,3,"Marina-100"),
(4,4,4,"Brown-18"),
(5,5,5,"Atlantis-34"),
(6,6,6,"Beverly-46"),
(7,7,7,"Brando-33"),
(8,8,8,"LMamunia-09"),
(9,9,9,"Ritz-82"),
(10,10,10,"TajMahal-55");
select * from  Customer_room;

-- insert data to Customer_arrival_info
INSERT INTO Customer_arrival_info(customer_arrival_id,hotel_id,customer_id,customer_check_in,customer_Number_Nights,customer_check_out)
VALUES
(1,1,1,"2019-05-05",5,"2019-05-10"),
(2,2,2,"2019-04-25",6,"2019-05-01"),
(3,3,3,"2017-08-10",10,"2017-08-20"),
(4,4,4,"2018-09-19",7,"2018-09-26"),
(5,5,5,"2020-01-10",10,"2020-01-20"),
(6,6,6,"2020-01-15",5,"2020-01-20"),
(7,7,7,"2021-05-01",4,"2021-05-05"),
(8,8,8,"2021-12-25",10,"2022-01-04"),
(9,9,9,"2021-11-11",7,"2021-11-18"),
(10,10,10,"2018-12-25",12,"2019-01-06");
select * from  Customer_arrival_info;
-- insert data to Customer_room_cost
INSERT INTO Customer_room_cost(customer_room_cost_id,customer_id,hotel_id,room_id,room_price,room_type)
VALUES
(1,1,1,1,1500,"Double"),
(2,2,2,2,1000,"Double"),
(3,3,3,3,1200,"Single"),
(4,4,4,4,1600,"Twin"),
(5,5,5,5,2000,"Family"),
(6,6,6,6,3000,"Family"),
(7,7,7,7,2200,"Triple"),
(8,8,8,8,1800,"Twin"),
(9,9,9,9,1920,"Family"),
(10,10,10,10,1400,"Double");
select * from Customer_room_cost;

-- inner join (customer_info table on customer_contact_info)
SELECT info.customer_name , info.customer_surname , contact.customer_email_address
FROM Customer_info info INNER JOIN Customer_contact_info contact ON info.customer_id = contact.customer_contact_id;

-- view -- Inner join -- combine table customer_info and hotel_info
CREATE VIEW Traveller_Hotel_info AS
SELECT c.customer_name,c.customer_surname,h.hotel_name,h.hotel_star,h.hotel_city
FROM Customer_info c INNER JOIN  Hotel_info h ON c.customer_id = h.customer_id
WHERE c.customer_id > 4;
select * from Traveller_Hotel_info;

-- view - Inner join --  combine able customer_info and hotel_info
CREATE VIEW Traveller_Hotel AS
SELECT c.customer_name,c.customer_surname,h.hotel_name,h.hotel_star,h.hotel_city
FROM Customer_info c INNER JOIN  Hotel_info h ON c.customer_id = h.customer_id
WHERE h.hotel_star > 4;
select * from Traveller_Hotel;

-- view -- inner join and Left join of 3 tables ( inner join customer_info and customer_contact_info and left join customer_contact_info and hotel_info)
CREATE VIEW Customer_informations AS
SELECT info.customer_name,info.customer_surname,contact.customer_phone_number
FROM Customer_info info INNER JOIN Customer_contact_info contact ON info.customer_id = contact.customer_id
LEFT JOIN Hotel_info hotel ON contact.customer_contact_id = hotel.customer_contact_id
WHERE hotel.hotel_name LIKE '%a%';
select * from Customer_informations;

-- View -- inner join and Left join of 3 tables ( inner join customer_info and customer_contact_info and left join customer_contact_info and hotel
CREATE VIEW Customer_informations_and_hotel AS
SELECT info.customer_name,info.customer_surname,contact.customer_phone_number,hotel.hotel_name
FROM Customer_info info INNER JOIN Customer_contact_info contact ON info.customer_id = contact.customer_id
LEFT JOIN Hotel_info hotel ON contact.customer_contact_id = hotel.customer_contact_id
WHERE hotel.hotel_name LIKE '%a%';
select * from Customer_informations_and_hotel;

-- Subquery : find hotel_name and hotel_city where the hotel_id are bigger than 5
SELECT hotel_name , hotel_city FROM Hotel_info
WHERE hotel_id IN (SELECT hotel_id FROM Customer_room_cost where hotel_id > 5 ); 

-- Subquery : find the customer emails  where the hotel_id in hotel_services is between 3 and 5
SELECT hotel_id,customer_email_address FROM Customer_contact_info 
WHERE hotel_id IN ( SELECT hotel_id FROM Hotel_info WHERE hotel_id IN (SELECT hotel_id FROM Hotel_services WHERE (hotel_id  BETWEEN 3 AND 8)));


-- function number_nights
DELIMITER //

CREATE FUNCTION Number_Nights(Nights INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
DECLARE loyal_customer VARCHAR(20);
IF (Nights > 5) THEN
SET loyal_customer = "100% Loyal";
ELSEIF (Nights <= 5 AND Nights >= 3) THEN
SET loyal_customer = "60% Loyal";
ELSEIF (Nights = 2) THEN
SET loyal_customer = "40% Loyal";
ELSEIF (Nights <= 1) THEN
SET loyal_customer = "10% Loyal";
END IF;
RETURN (loyal_customer);
END;// 

DELIMITER ;

SELECT customer_id,customer_Number_Nights,
Number_Nights (customer_Number_Nights)
FROM Customer_arrival_info;






