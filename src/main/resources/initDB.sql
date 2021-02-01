CREATE TABLE IF NOT EXISTS countries (
 id INT PRIMARY KEY auto_increment,
 country varchar(30) unique
) ;

CREATE TABLE IF NOT EXISTS access (
 id INT PRIMARY KEY auto_increment,
email varchar(30) UNIQUE NOT null,
 password varchar(30)
)  ;


CREATE TABLE IF NOT EXISTS languages (
 id INT PRIMARY KEY auto_increment,
language varchar(30)  NOT null
);

CREATE TABLE IF NOT EXISTS currency (
 id INT PRIMARY KEY auto_increment,
language varchar(3)  NOT null
);


CREATE TABLE IF NOT EXISTS settings_Users (
 id INT PRIMARY KEY auto_increment,
language_id INT  NOT null,
 currency_id INT NOT NULL ,
 FOREIGN KEY(language_id) REFERENCES  languages(id),
  FOREIGN KEY(currency_id) REFERENCES  currency(id)
)  ;



CREATE TABLE IF NOT EXISTS clients (
 id INT PRIMARY KEY auto_increment,
 name VARCHAR(20) NOT null,
 surname varchar(20) NOT null,
 numberOfPhone VARCHAR(10) UNIQUE,
 country int ,
 access int ,
 settingsOfUser int NOT null,
 FOREIGN KEY(country) REFERENCES  countries(id),
  FOREIGN KEY(access) REFERENCES  access(id),
    FOREIGN KEY(settingsOfUser) REFERENCES  settings_Users(id)
);






CREATE TABLE IF NOT EXISTS hotels (
	id INT PRIMARY KEY auto_increment,
	name VARCHAR(30) NOT null,
	rating int NOT null,
	description varchar(2000)  NOT NULL
);

CREATE TABLE IF NOT EXISTS Photo_OF_ROOMS (
 id INT PRIMARY KEY auto_increment,
 photo BLOB
);



CREATE TABLE IF NOT EXISTS Amenities_In_Room (
id INT PRIMARY KEY auto_increment,
Amenity VARCHAR(30) NOT null
);

CREATE TABLE IF NOT EXISTS Occupancies(
id INT PRIMARY   KEY auto_increment,
	id_client INT NOT NULL,
	DateOccupied date,
	DateВeparture date,
	Notes nvarchar(255),
	FOREIGN KEY (id_client) REFERENCES clients(id)
);

CREATE TABLE IF NOT EXISTS ROOMS (
id INT PRIMARY KEY auto_increment,
class_of_room VARCHAR(30) NOT null,
No_of_room int NOT NULL,
price int NOT NULL ,
count_of_client int NOT NULL,
area_of_room int NOT NULL,
description varchar(1000),
Additional_services varchar(2000),
Occupancies_id int ,
id_hotel int,
FOREIGN KEY(id_hotel) REFERENCES hotels(id),
FOREIGN KEY(Occupancies_id) REFERENCES Occupancies(id)
);

CREATE TABLE IF NOT EXISTS rooms_Photo_OF_ROOMS (
 id_rooms INT  ,
  id_Photo_OF_ROOMS INT  ,
  FOREIGN KEY(id_rooms) REFERENCES  rooms(id),
  FOREIGN KEY(id_Photo_OF_ROOMS) REFERENCES  Photo_OF_ROOMS(id)
 );

CREATE TABLE IF NOT EXISTS hotels_rooms (
 id_hotels INT  ,
  id_room INT  ,
  FOREIGN KEY(id_hotels) REFERENCES  hotels(id),
  FOREIGN KEY(id_room) REFERENCES  ROOMS(id)
 );

CREATE TABLE IF NOT EXISTS room_Amenities_In_Room (
 id_room INT  ,
  id_Amenities_In_Room INT  ,
  FOREIGN KEY(id_room) REFERENCES  rooms(id),
  FOREIGN KEY(id_Amenities_In_Room) REFERENCES  Amenities_In_Room(id)
 );




CREATE TABLE IF NOT EXISTS category_reviews (
 id INT PRIMARY KEY auto_increment,
 comfortable int check(comfortable>=1 AND comfortable<=5) ,
 fortunes int check(fortunes>=1 AND fortunes<=5) ,
soundproof int check(soundproof>=1 AND soundproof<=5) ,
service int check(service>=1 AND service<=5)
);



CREATE TABLE IF NOT EXISTS reviews (
 id INT PRIMARY KEY auto_increment,
 review varchar(2000) ,
 datee date ,
 id_client int NOT null,
id_room int NOT NULL,
id_ratting int NOT NULL,
 FOREIGN KEY(id_client) REFERENCES  clients(id),
  FOREIGN KEY(id_room) REFERENCES  rooms(id),
  FOREIGN KEY(id_ratting) REFERENCES  category_reviews(id)
 );





INSERT INTO Amenities_In_Room(Amenity) VALUES
('PRIVATE_BATHROOM'),
('BALCONY'),
('FLAT_SCREEN_TV'),
('SOUNDPROOF'),
('CITY_VIEW'),
('MOUNTAIN_VIEW'),
('INNER_COURTYARD_VIEW'),
('COFFEE_MACHINE'),
('AIR_CONDITIONING'),
('MINIBAR'),
('LANDMARK_VIEW'),
('FAMILY_ROOM'),
('FREE_WIFI'),
('PET_FRIENDLY'),
('BEAUTIFUL_VIEW_FROM_WINDOWS');


INSERT INTO Hotels VALUES(1,'Y PANA OLEHA',5,'PERFECT HOTEL');

