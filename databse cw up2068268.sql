CREATE TABLE customer (
    cust_id SERIAL PRIMARY KEY NOT NULL, 
    cust_fname VARCHAR(50) NOT NULL, 
    cust_lname VARCHAR(50) NOT NULL, 
    cust_phone VARCHAR(14) NOT NULL, 
    cust_email VARCHAR(100) NOT NULL,
    addr1 VARCHAR(50) NOT NULL,
    addr2 VARCHAR(50) NOT NULL,
    postcode CHAR(8) NOT NULL,
    city VARCHAR(40) NOT NULL
);

CREATE TABLE staff (
  staff_id SERIAL PRIMARY KEY NOT NULL,
  staff_fname VARCHAR(50) NOT NULL,
  staff_lname VARCHAR(50) NOT NULL,
  staff_dob DATE NOT NULL,
  staff_phone VARCHAR(14) NOT NULL,
  staff_email VARCHAR(100) NOT NULL,
  addr1 VARCHAR(50) NOT NULL,
  addr2 VARCHAR(50) NOT NULL,
  postcode CHAR(8) NOT NULL,
  city VARCHAR(40) NOT NULL
  );

CREATE TABLE role (
  role_id SERIAL PRIMARY KEY NOT NULL,
  role_name VARCHAR(35) NOT NULL
);

CREATE TABLE role_staff (
  staff_id INT NOT NULL,
  role_id INT NOT NULL,
  PRIMARY KEY (role_id, staff_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id),
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE category (
  boat_cat_id SERIAL PRIMARY KEY NOT NULL, 
  boat_cat_name VARCHAR(30) NOT NULL
);

CREATE TABLE boat (
  boat_id SERIAL NOT NULL,
  boat_cat_id INT NOT NULL,
  cust_id INT NOT NULL,
  boat_name VARCHAR(40) NOT NULL,
  boat_fuel VARCHAR(25) NOT NULL,
  boat_eng_size VARCHAR(25) NOT NULL,
  boat_capacity VARCHAR(15) NOT NULL,
  boat_created date NOT NULL,
  PRIMARY KEY (boat_id),
  FOREIGN KEY (boat_cat_id) REFERENCES category(boat_cat_id),
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE booking (
  booking_id SERIAL NOT NULL,
  boat_id INT NOT NULL,
  cust_id INT NOT NULL,
  service_type VARCHAR(30) NOT NULL,
  service_descr VARCHAR(100) NOT NULL,
  pre_booking_date date,
  PRIMARY KEY (booking_id),
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
  FOREIGN KEY (boat_id) REFERENCES boat(boat_id)
);

CREATE TABLE service_sheet (
  service_id SERIAL NOT NULL,
  booking_id INT NOT NULL,
  start_date date,
  finish_date date,
  service_complete VARCHAR(3) NOT NULL,
  service_cost VARCHAR(6) NOT NULL,
  PRIMARY KEY (service_id),
  FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
  );

CREATE TABLE service (
  service_id SERIAL NOT NULL,
  staff_id INT NOT NULL,
  PRIMARY KEY (service_id, staff_id), 
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
  FOREIGN KEY (service_id) REFERENCES service_sheet(service_id)
);

CREATE TABLE boatyard (
yard_id SERIAL NOT NULL,
yard_name VARCHAR(40) NOT NULL,
phone_number VARCHAR(14),
addr1 VARCHAR(50) NOT NULL,
addr2 VARCHAR(50),
postcode char(8) NOT NULL,
city VARCHAR(40) NOT NULL,
PRIMARY KEY (yard_id)
);

CREATE TABLE staff_boatyard (
yard_id INT NOT NULL,
staff_id INT NOT NULL,
PRIMARY KEY (yard_id, staff_id),
FOREIGN KEY (yard_id) REFERENCES boatyard(yard_id),
FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE boat_in_boatyard (
yard_id INT NOT NULL,
boat_id INT NOT NULL,
PRIMARY KEY (yard_id, boat_id), 
FOREIGN KEY (yard_id) REFERENCES boatyard(yard_id),
FOREIGN KEY (boat_id) REFERENCES boat(boat_id)
);

CREATE TABLE service_boatyard (
  yard_id int not null,
  service_id int not null,
  PRIMARY KEY (yard_id, service_id),
  FOREIGN KEY (yard_id) REFERENCES boatyard(yard_id),
  FOREIGN KEY (service_id) REFERENCES service_sheet(service_id)
);

INSERT INTO customer (cust_id, cust_fname, cust_lname, cust_phone, cust_email, addr1, addr2, postcode, city)
VALUES 
  (1, 'Rowan','Carpenter','+44 3128329327','rowan@icloud.com','Ap 162-7768 Ornare. St.','P.O. Box 447, 4755 Nam St.','ER1I 5ZY','Cardigan'),
  (2, 'Hasad','David','+44 6592982742','hasad8974@yahoo.com','Ap 230-3814 Sed St.','P.O. Box 982, 9681 Donec Ave','TS0I 9QP','Stourbridge'),
  (3, 'Carl','Mcclure','+44 8009311527','carl@gmail.co.uk','329-3716 Dignissim Street','568-6965 Vivamus St.','L1N 6SM','Mold'),
  (4, 'Ivy','Hoover','+44 4553415154','ivy8256@outlook.com','P.O. Box 732, 3629 In Avenue','3190 Sagittis Street','Y55 8SL','Melton Mowbray'),
  (5, 'Zeph','Bernard','+44 2868163766','zeph@outlook.com','333-8765 Semper St.','683-871 Dolor Ave','X6 0WG','Corby'),
  (6, 'Rana','Avery','+44 1471305593','rana6316@outlook.com','Ap 317-6502 Et Rd.','710-4818 In Avenue','BF7 9GS','Inverbervie'),
  (7, 'Lee','Shannon','+44 2361462582','lee8471@yahoo.com','9792 Sit Avenue','Ap 233-3517 Nisi Av.','RG07 0KT','Berwick-upon-Tweed'),
  (8, 'Jarrod','Robertson','+44 3681983073','jarrod@outlook.co.uk','234-4211 Ut Road','581-5902 Dolor Av.','AB7H 6SY','Montrose'),
  (9, 'Tucker','Myers','+44 1642856348','tucker@icloud.com','P.O. Box 530, 779 Tincidunt, St.','592-4318 Nisl Road','U2S 5PF','Inverbervie'),
  (10, 'Vielka','Jacobson','+44 4465737288','vielka8802@yahoo.co.uk','Ap 433-7239 Nunc Street','P.O. Box 816, 7910 Dapibus St.','XI8D 8NC','Yeovil'),
  (11, 'Justin','Atkins','+44 4237726132','justin@yahoo.co.uk','4395 Cras Av.','Ap 578-1044 Molestie St.','FT10 2YH','Llanidloes'),
  (12, 'Phelan','Ochoa','+44 2647161853','phelan@gmail.com','628-1347 Felis. Rd.','650-5948 Non Street','RN9O 0VS','New Quay'),
  (13, 'Nolan','Douglas','+44 6183562765','nolan@icloud.co.uk','P.O. Box 695, 2059 Augue Av.','111-9795 Augue Ave','R8X 8GG','Denbigh'),
  (14, 'Griffin','Jimenez','+44 2572148181','griffin9248@outlook.co.uk','6754 Massa St.','P.O. Box 983, 4614 Eu Road','K6 6IZ','Nottingham'),
  (15,'Ronan','Cox','+44 6568276423','ronan811@gmail.com','621-5054 Enim. St.','P.O. Box 372, 8809 Ac Rd.','L6 3VH','Ambleside'),
  (16, 'Hedley','Miranda','+44 3022318762','hedley@icloud.com','Ap 324-5440 Tortor, Rd.','830-8733 Tempor Rd.','X4E 0WU','Eyemouth'),
  (17, 'Fallon','Mccarthy','+44 8067678303','fallon@yahoo.co.uk','7708 Quisque Avenue','5104 Risus. Rd.','OX5P 5JQ','Campbeltown'), 
  (18, 'Nina','Lowery','+44 4857275252','nina5469@gmail.com','362-119 Enim. Rd.','Ap 452-6535 Amet, St.','K3 8CG','Halkirk'),
  (19, 'Marsden','Norman','+44 9875744742','marsden@icloud.co.uk','4831 Faucibus St.','740-5968 Est, Rd.','M5B 6XR','Appleby'),
  (20, 'Risa','Gray','+44 2884375716','risa769@gmail.co.uk','474-3465 Id Road','9012 Feugiat Avenue','Q1F 4IN','Kingston-on-Thames');
INSERT INTO customer (cust_id, cust_fname, cust_lname, cust_phone, cust_email, addr1, addr2, postcode, city)
VALUES
  (21, 'Ina','Douglas','+44 4128365801','ina@yahoo.com','Ap 530-3411 In St.','566-7926 Amet St.','GW8R 3AR','St. Ives'),
  (22, 'Reed','Randolph','+44 3623699926','reed@icloud.co.uk','P.O. Box 925, 7542 Sed, Ave','669-2618 Velit. Ave','E5V 6MC','Huntingdon'), 
  (23, 'Medge','Riley','+44 9578666246','medge3@icloud.co.uk','Ap 286-1393 Dolor. Av.','Ap 255-886 Nam St.','V5 7TE','Matlock'),
  (24, 'Noah','Fuller','+44 2823688850','noah6124@outlook.com','975-7933 Semper Ave','Ap 657-6053 Ornare, St.','F68 9SQ','Loughborough'),
  (25, 'Mariko','Kirkland','+44 8121278335','mariko1062@icloud.com','5906 Cubilia St.','5916 Montes, Rd.','R5 1HI','Rothesay'),
  (26, 'Fulton','Cochran','+44 5122061872','fulton6613@gmail.com','P.O. Box 301, 2886 Montes, Road','Ap 841-7495 Pharetra St.','E7 9XP','Uppingham. Cottesmore'),
  (27, 'Chava','Walsh','+44 4375361679','chava@yahoo.co.uk','Ap 846-1142 Venenatis Street','8569 Pede. St.','P8L 7JC','Kircudbright'),
  (28, 'Bert','Preston','+44 5703773620','bert7494@gmail.co.uk','Ap 675-6597 Pellentesque Road','349-7414 Velit. Rd.','E5 1PY','Newtonmore'), 
  (29, 'Yoko','Kaufman','+44 7445702843','yoko@gmail.com','Ap 482-3296 Dolor, Street','344-4199 Lorem, Avenue','V92 3HQ','Milton Keynes'),
  (30, 'Raya','Conway','+44 0362216261','raya@gmail.com','Ap 617-3412 Arcu. Street','P.O. Box 728, 7889 Molestie Avenue','H9S 6ET','Dalkeith'),
  (31, 'Jade','Rich','+44 1259498264','jade@yahoo.co.uk','903-9850 Natoque Road','611-8776 A, St.','R8I 1SQ','Lossiemouth'),
  (32, 'Madonna','Garrett','+44 2652402418','madonna8488@icloud.com','161 Lacinia St.','1949 Blandit Ave','EJ71 2DJ','Warwick'),
  (33, 'Ian','Davenport','+44 1367242579','ian2066@icloud.com','Ap 456-9551 Sit Road','175-3609 Arcu Avenue','FJ55 5ON','Lairg'), 
  (34, 'Katell','Kramer','+44 2788096591','katell@icloud.com','823-5768 Purus Rd.','P.O. Box 263, 3222 Condimentum. Avenue','ZT57 9ET','Oakham'),
  (35, 'Aimee','Lara','+44 2163627226','aimee2033@yahoo.co.uk','P.O. Box 279, 3564 INTerdum Rd.','160-7012 Ultrices Avenue','G2L 3NH','Milford Haven'),
  (36,'Oprah','Henderson','+44 7770568455','oprah1393@icloud.com','434-5814 Hendrerit Street','Ap 242-287 Duis Rd.','S9 0MP','Kirkcaldy'), 
  (37, 'Yasir','Graves','+44 7516251259','yasir1699@outlook.co.uk','2608 Augue St.','763-7999 Luctus Road','FB3 3YR','Retford'),
  (38, 'Ronan','Yang','+44 5482036779','ronan8316@outlook.com','Ap 984-5070 Aenean St.','P.O. Box 884, 9016 Eros Rd.','QH3 7MM','Luton'),
  (39, 'Fredericka','Norris','+44 7641615826','fredericka@icloud.com','1186 Ligula Rd.','Ap 337-2331 Et St.','JT4 2OM','Southampton'),
  (40, 'Akeem','Burch','+44 7884412699','akeem3553@outlook.co.uk','P.O. Box 821, 2003 Mi St.','Ap 836-2302 Dui. St.','NJ0 0EK','Aberystwyth'); 

INSERT INTO customer (cust_id, cust_fname, cust_lname, cust_phone, cust_email, addr1, addr2, postcode, city)
VALUES

  (41, 'Edan','Norton','+44 2588827852','edan@gmail.co.uk','P.O. Box 735, 6354 Cras Rd.','959-9612 Ante. Ave','X5R 2VD','Market Drayton'),
  (42, 'Rinah','Hardy','+44 7123882258','rinah@outlook.co.uk','564-8459 Felis Av.','P.O. Box 152, 5353 Mi Av.','Y4 8WF','Dalbeattie'),
  (43, 'Aurora','Howe','+44 0611057177','aurora@icloud.com','1133 Sagittis St.','Ap 850-643 Ut Av.','RS5Y 5YX','Hastings'), 
  (44, 'Molly','Jones','+44 9481266356','molly105@yahoo.com','603-4868 Risus. Road','P.O. Box 397, 134 Et Av.','KP1 3OY','Paisley'),
  (45, 'Odessa','Stephenson','+44 3511705118','odessa@gmail.com','359-8884 Molestie Road','3468 Ligula Rd.','O1 6MT','Weymouth'),    
  (46, 'Yen','Heath','+44 1770947936','yen5859@outlook.com','Ap 120-2357 Ut Rd.','Ap 347-8094 Nam Rd.','LJ22 4XV','Beaumaris'),
  (47, 'Ria','Vance','+44 6244746566','ria1839@gmail.com','P.O. Box 193, 7332 Elementum, Avenue','930-3021 Eros Road','K12 7ND','Sanquhar'),
  (48, 'Dominique','Daugherty','+44 5911163486','dominique@gmail.co.uk','8384 Ultrices Avenue','605-8990 Sed Avenue','B4K 9LT','Welshpool'),
  (49, 'Basil','Mcdaniel','+44 1723716641','basil@yahoo.co.uk','Ap 916-4459 Sed, Street','P.O. Box 624, 826 Bibendum Rd.','YS82 3WO','Kilmarnock'),  
  (50, 'Petra','Cantu','+44 2763612232','petra@yahoo.co.uk','7736 Fermentum Av.','509-7005 Nonummy St.','LK03 3BH','Campbeltown');

INSERT INTO staff (staff_fname, staff_lname, staff_dob, staff_phone, staff_email, addr1, addr2, postcode, city)
  VALUES 
  ('Dieter','Vaughn', TO_DATE('19/06/1982', 'DD/MM/YYYY'), '+44 339214618','dieter@solentboat.co.uk','9242 Augue Ave','Ap 726-104 Lacinia. St.','ME3 7LG','Poole'),
  ('Troy','Harrell', TO_DATE('26/04/1975', 'DD/MM/YYYY'), '+44 567775628','troy@solentboat.co.uk','686-6794 Ipsum Rd.','P.O. Box 236, 5172 Mattis St.','F14 5UV','Llanidloes'),
  ('Imelda','Shepherd', TO_DATE('04/07/1994', 'DD/MM/YYYY'), '+44 733225844','imelda@solentboat.co.uk','194-250 Erat. St.','3163 Non Av.','LV4 8RV','Barrow-in-Furness'),
  ('Jonas','Slater', TO_DATE('09/03/1985', 'DD/MM/YYYY'), '+44 831163689','jonas@solentboat.co.uk','119-9720 Sagittis St.','649-9415 Odio. Avenue','ZL3 2YI','March'),
  ('Oliver','Levy', TO_DATE('31/07/1997', 'DD/MM/YYYY'), '+44 648422600','oliver@solentboat.co.uk','4414 Viverra. Road','2484 Risus Street','A2E 7TV','Forfar'),
  ('Garrett','Wolf', TO_DATE('06/08/1979', 'DD/MM/YYYY'), '+44 560628805','garrett@solentboat.co.uk','P.O. Box 274, 5936 Sociis St.','849-6475 Sed St.','C49 7NG','Preston'),
  ('Chava','Ramirez', TO_DATE('12/09/1996', 'DD/MM/YYYY'), '+44 077874096','chava@solentboat.co.uk','516-9374 Fringilla Rd.','2044 Et, Rd.','N1 7MF','Darlington'),
  ('Jacqueline','Rodgers', TO_DATE('11/06/1998', 'DD/MM/YYYY'), '+44 036324718','jacqueline@solentboat.co.uk','Ap 496-6000 Lacinia Avenue','Ap 881-1459 In Rd.','W7 2GE','Clydebank'),
  ('Lani','Banks', TO_DATE('28/03/1977', 'DD/MM/YYYY'), '+44 713688764','lani@solentboat.co.uk','4063 Fusce Av.','Ap 108-8616 Lorem. Street','OA81 6HQ','Clackmannan'),
  ('Garrett','Hawkins', TO_DATE('14/09/1984', 'DD/MM/YYYY'), '+44 063564373','garrett@solentboat.co.uk','915 Lacinia St.','Ap 927-8710 Cras Av.','X41 1JK','Leicester'),
  ('Willow','Jennings', TO_DATE('20/12/1992','DD/MM/YYYY'),'+44 713573939','willow@solentboat.co.uk','684-629 Velit. Avenue','4718 Nisl Road','G8U 6YN','Windsor'),
  ('Ashely','Williams', TO_DATE('12/09/1998','DD/MM/YYYY'),'+44 525365617','ashely@solentboat.co.uk','Ap 138-9755 Enim Road','157-9758 Ante Rd.','CM5F 1BJ','Lauder'),
  ('Kenneth','Harrison', TO_DATE('18/10/1993','DD/MM/YYYY'),'+44 467294417','kenneth@solentboat.co.uk','3120 Dui, Road','3853 Dolor. Rd.','N2 7FR','Fort William'),
  ('Steven','Reed', TO_DATE('03/03/1999','DD/MM/YYYY'),'+44 569565041','steven@solentboat.co.uk','3367 Luctus. St.','888-8359 Fermentum Road','IV5 3FH','Woking'),
  ('Ruth','Ayala', TO_DATE('20/02/1976','DD/MM/YYYY'),'+44 738688865','ruth@solentboat.co.uk','166-702 Mi Ave','880-3428 Dolor. Rd.','L3 5OM','Glenrothes'),
  ('Nicholas','Holder', TO_DATE('01/08/1991','DD/MM/YYYY'),'+44 412044371','nicholas@solentboat.co.uk','P.O. Box 950, 1080 Consequat St.','629-2477 Commodo Street','GO4 6LS','KirkINTilloch'),
  ('Sacha','Gallegos', TO_DATE('10/09/2002','DD/MM/YYYY'),'+44 787601658','sacha@solentboat.co.uk','Ap 521-8724 Sed Rd.','828-7914 Nec, Street','J30 4SS','Dalbeattie'),
  ('Amery','Owens', TO_DATE('16/08/1984','DD/MM/YYYY'),'+44 792466566','amery@solentboat.co.uk','P.O. Box 804, 5625 Mauris Road','P.O. Box 736, 993 Ante Rd.','TU1 0RD','Motherwell'),
  ('Samuel','Sampson', TO_DATE('23/08/2002','DD/MM/YYYY'),'+44 387158058','samuel@solentboat.co.uk','Ap 347-6697 Faucibus Road','159-2472 Vivamus St.','UH92 8JM','Scunthorpe'),
  ('Marsden','Burch', TO_DATE('27/03/1991','DD/MM/YYYY'),'+44 616289517','marsden@solentboat.co.uk','4217 Aliquam St.','Ap 324-6796 Suspendisse Rd.','GU4 9KX','St. Andrews');

 INSERT INTO staff (staff_fname, staff_lname, staff_dob, staff_phone, staff_email, addr1, addr2, postcode, city)
  VALUES
  ('Phillip','Head', TO_DATE('12/01/2001', 'DD/MM/YYYY'),'+44 031131585','phillip@solentboat.co.uk','787-2306 Nec Av.','Ap 469-3982 Aliquet Avenue','GO35 8IB','Banbury'),
  ('Oliver','Pickett', TO_DATE('08/12/1983', 'DD/MM/YYYY'),'+44 188777972','oliver@solentboat.co.uk','P.O. Box 909, 4274 Blandit Street','713-258 Magnis Av.','O4J 9BH','Stafford'),
  ('Nerea','Austin', TO_DATE('08/01/1977', 'DD/MM/YYYY'),'+44 822712358','nerea@solentboat.co.uk','339-3228 Pede. Ave','141-2189 Ante Ave','G35 4RU','Appleby'),
  ('Alfonso','Harvey', TO_DATE('02/10/1992', 'DD/MM/YYYY'),'+44 401634767','alfonso@solentboat.co.uk','262-4626 Et Avenue','4585 Pellentesque Street','OG6B 2QM','Tullibody'),
  ('Thomas','Shaw', TO_DATE('21/10/1999', 'DD/MM/YYYY'),'+44 647493475','thomas@solentboat.co.uk','700-8982 Feugiat. St.','P.O. Box 539, 3079 Enim, Ave','QQ1G 4XR','Kircudbright'),
  ('Haley','Young', TO_DATE('24/07/1989', 'DD/MM/YYYY'),'+44 246279524','haley@solentboat.co.uk','7201 Velit. Road','4267 Magna. Rd.','PF6X 0GQ','Bodmin'),
  ('Ifeoma','Turner', TO_DATE('11/11/1998', 'DD/MM/YYYY'),'+44 147118545','ifeoma@solentboat.co.uk','791-1948 Aenean Avenue','342-6595 Neque Road','EV76 8HL','Tobermory'),
  ('Leroy','Blackburn', TO_DATE('27/05/2018', 'DD/MM/YYYY'),'+44 825623584','leroy@solentboat.co.uk','9579 Dui Av.','Ap 756-1958 Mi Rd.','LV7 4NU','Lockerbie'),
  ('Eleanor','Horton', TO_DATE('05/12/2000', 'DD/MM/YYYY'),'+44 307325414','eleanor@solentboat.co.uk','Ap 717-6138 Urna. Rd.','Ap 762-9971 Dignissim St.','OI31 8KS','Laurencekirk'),
  ('Kaye','Osborne', TO_DATE('08/02/1997', 'DD/MM/YYYY'),'+44 034789486','kaye@solentboat.co.uk','865-6259 Diam Av.','Ap 851-9589 Aenean Avenue','NB13 7RD','Weymouth'),
  ('Jael','Sherman', TO_DATE('02/03/1978','DD/MM/YYYY'),'+44 546465146','jael9996@solentboat.co.uk','1087 Orci. Rd.','P.O. Box 820, 2188 Sapien, Av.','EP99 2DL','Coalville'),
  ('Chanda','Keller', TO_DATE('15/05/1995','DD/MM/YYYY'),'+44 982887304','chanda@solentboat.co.uk','8349 Gravida Ave','Ap 168-6433 Ornare Road','W8A 7GC','KirkINTilloch'),
  ('Avram','Mcfarland', TO_DATE('30/01/2002','DD/MM/YYYY'),'+44 319667272','avram@solentboat.co.uk','P.O. Box 206, 5022 Elementum, St.','424-6040 Non, Av.','S1 3BC','Weymouth'),
  ('Kaitlin','Compton', TO_DATE('23/10/2001','DD/MM/YYYY'),'+44 389866326','kaitlin@solentboat.co.uk','2458 NULLam St.','944-4536 Sagittis Avenue','GQ81 5NG','Dunstable'),
  ('Lee','Sawyer', TO_DATE('30/08/1984','DD/MM/YYYY'),'+44 330380501','lee@solentboat.co.uk','Ap 564-6482 Tempus Rd.','P.O. Box 683, 490 Ipsum Street','HW01 1GY','Cannock'),
  ('Henry', 'Spence', TO_DATE('18/10/2002','DD/MM/YYYY'), '+44 136657989', 'henry@solentboat.co.uk', '104 Nightingale Road', 'Oakland Street', 'GU8 6DF', 'Guildford');


INSERT INTO role (role_name)
VALUES 
('Manager'),
('Glass Fibre Specialist'),
('Engine Technician'),
('General'),
('Electrician'),
('Technician');

INSERT INTO role_staff (staff_id, role_id)
VALUES 
(1, 1),
(2, 2),
(3, 3), 
(4, 4),
(5, 5),
(6, 6),
(7, 6),
(8, 2),
(9, 3),
(10, 4),
(11, 1),
(11, 6),
(12, 4),
(13, 5),
(14, 3),
(14, 6),
(15, 2),
(16, 5),
(17, 3),
(18, 2),
(19, 4),
(20, 5);

INSERT INTO role_staff (staff_id, role_id)
VALUES

(21, 6),
(22, 4),
(23, 1),
(24, 2),
(25, 5),
(26, 3),
(27, 3),
(28, 5),
(29, 5),
(29, 4),
(30, 6),
(31, 1),
(31, 6),
(31, 3),
(32, 2),
(33, 5),
(33, 4),
(34, 6),
(35, 1),
(35, 2),
(36, 3);

INSERT INTO category (boat_cat_name)
VALUES
('Speedboat'),
('Water Sports Boats'),
('Sailboat');

INSERT INTO boat (boat_cat_id, cust_id, boat_name, boat_fuel, boat_eng_size, boat_capacity, boat_created)
VALUES
(2, 1, 'Sea doo Jetski', 'Petrol', '899cc', '1-3 persons', TO_DATE('11/05/2015', 'DD/MM/YYYY')),
(1, 2, 'Bavaria 37 Cruiser', 'Diesel', '2 x 450cc', '4-6 persons', TO_DATE('09/12/2007', 'DD/MM/YYYY')), 
(2, 2, 'Sea doo Spark Trixx', 'Gasoline', '1350cc', '1-2 persons', TO_DATE('05/12/2022', 'DD/MM/YYYY')),
(1, 3, 'Princess V50', 'Diesel', '2 x 5500cc', '4 persons', TO_DATE('07/02/2018', 'DD/MM/YYYY')),
(2, 4, 'Sailing Dinghy', 'N/A', 'N/A', '1 person', TO_DATE('22/03/2022', 'DD/MM/YYYY')),
(1, 5, 'Sea Ray SDX 270', 'Petrol', '1000cc', '8-10 persons', TO_DATE('29/03/2010', 'DD/MM/YYYY')),
(3, 6, 'Gunfleet 58', 'Diesel', '8250cc', '7 persons', TO_DATE('30/12/2018', 'DD/MM/YYYY')),
(1, 7, 'Princess V50', 'Diesel', '2 x 5500cc', '4 persons', TO_DATE('18/09/2006', 'DD/MM/YYY')),
(1, 8, 'Starcraft MDX 211', 'Petrol', '2250cc', '4-6 persons', TO_DATE('22/08/2006', 'DD/MM/YYYY')),
(1, 9, 'Super Air Nautique GS20', 'Petrol', '6000cc', '7 persons', TO_DATE('09/05/2022', 'DD/MM/YYYY')),
(2, 9, 'Laser Vago', 'N/A', 'N/A', '1-3 persons', TO_DATE('23/05/2018', 'DD/MM/YYYY')),
(2, 10, 'Topper Sailing Dinghy', 'N/A', 'N/A', '1-2 persons', TO_DATE('18/01/2020', 'DD/MM/YYYY')),
(2, 11, 'Sea doo GTI', 'Gasoline', '1630cc', '1-2 persons', TO_DATE('06/10/2021', 'DD/MM/YYYY')),
(1, 12, 'Zodiac Pro 7', 'Petrol', '750cc', '16 persons', TO_DATE('08/01/2023', 'DD/MM/YYYY')),
(1, 13, 'Hunter Channel 323', 'Diesel', '1330cc', '6 persons', TO_DATE('09/07/2009', 'DD/MM/YYYY')),
(1, 14, 'Sea Ray SDX', 'Petrol', '5250cc', '8-10 persons', TO_DATE('27/10/2020', 'DD/MM/YYYY')),
(1, 15, 'Sessa C42', 'Diesel', '9300cc', '4-6 persons', TO_DATE('27/03/2020', 'DD/MM/YYYY')),
(2, 15, 'Honwave T32', 'Petrol', '225cc', '4 persons', TO_DATE('04/07/2019', 'DD/MM/YYYY')),
(2, 16, 'Sea Pro 3.1M', 'Petrol', '255cc', '4 persons', TO_DATE('02/02/2015', 'DD/MM/YYYY')),
(3, 17, 'Contessa 26', 'Diesel', '210cc', '4 persons', TO_DATE('01/12/2020', 'DD/MM/YYYY'));

INSERT INTO boat (boat_cat_id, cust_id, boat_name, boat_fuel, boat_eng_size, boat_capacity, boat_created)
VALUES
(1, 17, 'Azimut 48', 'Diesel', '2 x 7200cc', '7 persons', TO_DATE('13/08/2020', 'DD/MM/YYYY')),
(1, 18, 'Princess 35', 'Diesel', '2 x 2070cc', '4-6 persons', TO_DATE('21/03/2009', 'DD/MM/YYYY')),
(1, 19, 'Baja Marine 36 Outlaw', 'Petrol', '5700cc', '4 persons', TO_DATE('12/06/2014', 'DD/MM/YYYY')),
(2, 20, 'Mercedes-AMG Cigarette', 'Diesel', '4.6-liter V8', '4-6 persons', TO_DATE('28/11/2015', 'DD/MM/YYYY')),
(2, 21, 'Seago 230 Go Lite', 'N/A', 'N/A', '6 persons', TO_DATE('24/11/2021', 'DD/MM/YYYY')),
(2, 22, 'Yamaha FX Limited SVHO', 'Petrol', '1550cc', '1-3 persons', TO_DATE('03/12/2022', 'DD/MM/YYYY')),
(2, 22, 'Cigarette Racing 46', 'Petrol', '2 x 8062cc', '4 persons', TO_DATE('13/03/2020', 'DD/MM/YYYY')),
(1, 23, '48 Wallytender X', 'Diesel', '2 x 6750cc', '4-6 persons', TO_DATE('06/01/2018', 'DD/MM/YYYY')),
(1, 24, 'Baja Marine 36 Outlaw', 'Petrol', '5700cc', '4 persons', TO_DATE('06/06/2014', 'DD/MM/YYYY')),
(3, 25, 'Laser 2', 'N/A', 'N/A', '1-2 persons', TO_DATE('20/09/2023', 'DD/MM/YYYY')),
(1, 26, 'Fountain 34 Thundercat', 'Petrol', '6750cc', '7 persons', TO_DATE('16/09/2014', 'DD/MM/YYYY')),
(3, 27, 'SB20', 'N/A', 'N/A', '3 persons', TO_DATE('16/07/2012', 'DD/MM/YYYY')),
(3, 28, 'Laser Pico', 'N/A', 'N/A', '1 person', TO_DATE('08/10/2016', 'DD/MM/YYYY')),
(2, 29, 'Hobie Cat', 'N/A', 'N/A', '3 persons', TO_DATE('07/07/2020', 'DD/MM/YYYY')),
(2, 30, 'GP14', 'N/A', 'N/A', '2 persons', TO_DATE('05/06/2022', 'DD/MM/YYYY')),
(1, 31, 'Skater 28 Flat Deck', 'Petrol', '2 x 4500cc', '5 persons', TO_DATE('12/09/2014', 'DD/MM/YYYY')),
(1, 32, '48 wallytender X', 'Diesel', '2 x 6750cc', '4-6 persons', TO_DATE('13/11/2022', 'DD/MM/YYYY')),
(1, 33, 'Fountain 34 Thundercat', 'Petrol', '5700cc', '4 persons', TO_DATE('26/03/2014', 'DD/MM/YYYY')),
(3, 34, 'Laser Pico', 'N/A', 'N/A', '1 person', TO_DATE('14/09/2015', 'DD/MM/YYYY')),
(1, 35, 'Sea Ray SDX', 'Petrol', '1000cc', '8-10 persons', TO_DATE('27/09/2022', 'DD/MM/YYYY'));

INSERT INTO boat (boat_cat_id, cust_id, boat_name, boat_fuel, boat_eng_size, boat_capacity, boat_created)
VALUES
(1, 36, 'Regal 52 Sport Coupe', 'Diesel', '2 x 6600cc', '18 persons', TO_DATE('13/04/2016', 'DD/MM/YYYY')),
(1, 37, 'Azimut 50', 'Diesel', '2 x 5000cc', '18 persons', TO_DATE('30/12/2019', 'DD/MM/YYYY')),
(2, 38, 'Inflatable 330 Pro Black', 'Petrol', '225cc', '4 persons', TO_DATE('16/01/2023', 'DD/MM/YYYY')),
(2, 39, 'Honwave T32', 'Petrol', '225cc', '4 persons', TO_DATE('04/11/2019', 'DD/MM/YYYY')),
(3, 39, 'Contessa 26', 'Diesel', '210cc', '4 persons', TO_DATE('22/01/2022', 'DD/MM/YYYY')),
(1, 40, 'Mercedes-AMG Cigarette', 'Diesel', '4.6-liter V8', '4-6 persons', TO_DATE('23/11/2014', 'DD/MM/YYYY')),
(1, 40, 'Axis Wake A20', 'Gas', '6450cc', '4-6 persons', TO_DATE('03/12/2020', 'DD/MM/YYYY')),
(2, 41, 'MasterCraft ProStar', 'Gasoline', '4800cc', '7 persons', TO_DATE('10/06/2018', 'DD/MM/YYYY')),
(2, 41, 'MasterCraft ProStar', 'Gasoline', '4800cc', '7 persons', TO_DATE('10/06/2018', 'DD/MM/YYYY')),
(2, 42, 'Malibu TXi MO', 'Gasoline', '5400cc', '7 persons', TO_DATE('15/12/2022', 'DD/MM/YYYY')),
(1, 43, 'Ribeye Prime EIGHT21', 'Petrol', '4500cc', '6-8 persons', TO_DATE('03/12/2017', 'DD/MM/YYYY')),
(3, 44, 'DragonForce 65 V6', 'N/A', 'N/A', '1 person', TO_DATE('10/12/2019', 'DD/MM/YYYY')),
(1, 45, 'Nautique G25', 'Gas', '6750cc', '8 persons', TO_DATE('08/05/2021', 'DD/MM/YYYY')),
(2, 45, 'Sea doo Jetski', 'Petrol', '899cc', '1-3 persons', TO_DATE('09/05/2017', 'DD/MM/YYYY')),
(1, 46, 'Nautique G35 Paragon', 'Gas', '9000cc', '8 persons', TO_DATE('29/06/2017', 'DD/MM/YYYY')),
(2, 47, 'Honwave T32', 'Petrol', '225cc', '4 persons', TO_DATE('11/08/2018', 'DD/MM/YYYY')),
(3, 48, 'Gunfleet 58', 'Diesel', '8250cc', '7 persons', TO_DATE('10/09/2022', 'DD/MM/YYYY')),
(1, 48, 'Sea Ray SDX', 'Petrol', '5250cc', '8-10 persons', TO_DATE('11/11/2015', 'DD/MM/YYYY')),
(3, 49, 'Laser Pico', 'N/A', 'N/A', '1 person', TO_DATE('03/02/2021', 'DD/MM/YYYY')),
(2, 50, 'SeaGo 230 Go Lite', 'N/A', 'N/A', '6 persons', TO_DATE('02/09/2021', 'DD/MM/YYYY'));


INSERT INTO boatyard (yard_name, phone_number, addr1, addr2, postcode, city)
VALUES 
('Premier Southsea Marina & Boatyard', '023 9252 4811', 'Fort Cumberland Rd, Southsea', NULL, 'PO4 9RJ', 'Portsmouth'),
('Gosport Boatyard Ltd','023 9486 7895', 'Marina', 'Mumby Rd', 'PO12 1AH', 'Gosport'),
('Merlin Boatyard','023 8043 4466', '10 Hazel Rd', NULL, 'SO19 7GB', 'Southampton'),
('Eastlands Boatyard','01489 889177', 'Eastlands Boatyard', 'Coal Park Ln', 'SO31 7GW', 'Southampton'),
('Elephant Boatyard Ltd','023 8040 3268', 'Lands End Road', 'Bursledon', 'SO31 8DN', 'Southampton');

INSERT INTO staff_boatyard (yard_id, staff_id)
VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20);

INSERT INTO staff_boatyard (yard_id, staff_id)
VALUES 

(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(4, 28),
(4, 29),
(4, 30),
(4, 31),
(4, 32),
(5, 33),
(5, 34),
(5, 35),
(5, 36);

INSERT INTO boat_in_boatyard (yard_id, boat_id)
VALUES
(1, 55),
(1, 3),
(1, 27),
(1, 43),
(1, 56),
(1, 1),
(1, 59),
(1, 45),
(1, 29),
(1, 2),
(1, 57),
(1, 42),
(1, 60),
(1, 6),
(1, 28),
(1, 40),
(1, 52),
(1, 9),
(2, 4),
(2, 11);

INSERT INTO boat_in_boatyard (yard_id, boat_id)
VALUES
(2, 54),
(2, 36),
(2, 23),
(2, 26),
(2, 19),
(2, 7),
(2, 15),
(2, 25),
(3, 31),
(3, 32),
(3, 34),
(3, 30),
(3, 18),
(3, 17),
(3, 20),
(3, 21),
(3, 10),
(4, 8),
(4, 12),
(4, 16);

INSERT INTO boat_in_boatyard (yard_id, boat_id)
VALUES
(4, 13),
(4, 37),
(4, 38),
(4, 39),
(4, 44),
(4, 50),
(4, 47),
(4, 51),
(4, 41),
(5, 5),
(5, 14),
(5, 22),
(5, 24),
(5, 33),
(5, 35),
(5, 48),
(5, 49),
(5, 53),
(5, 46),
(5, 58);

INSERT INTO booking (boat_id, cust_id, service_type, service_descr, pre_booking_date)
VALUES 
(41, 36, 'Repair', 'Windscreen replacement.', TO_DATE('01/04/2022', 'DD/MM/YYYY')),
(40, 35, 'Repair', 'Gelcoat repair on glass fibre.', TO_DATE('14/04/2022', 'DD/MM?/YYYY')),
(46, 40, 'Repair', 'Repalce a head gasket and a belt to the engine.', TO_DATE('08/10/2022', 'DD/MM/YYYY')),
(7, 6, 'Repair', 'Need to replace a new wooden floor.', TO_DATE('01/12/2022', 'DD/MM/YYYY')),
(31, 26, 'Repair', 'Fix the wires system of the speaker.', TO_DATE('14/01/2023', 'DD/MM/YYYY')),
(9, 8, 'Maintenance check', 'Ensure the electric systems work properly.', TO_DATE('15/01/2023', 'DD/MM/YYYY')),
(4, 3, 'Repair', 'Engine replacement.', NULL),
(45, 39, 'Maintenance check', 'Inspect to see if there is any chaffing where the headsail sheets attach to the clew.', TO_DATE('14/02/2023', 'DD/MM/YYYY')),
(14, 12, 'Maintenance check', 'Make sure the propeller nut is secure, and tighten it with a deep socket wrench if needed.', TO_DATE('15/02/2023', 'DD/MM/YYYY')),
(1, 1, 'Maintenance check', 'Check to see if the coolant is topped up to its recommended level.', TO_DATE('28/02/2023','DD/MM/YYYY')),
(5, 4, 'Repair', 'Gelcoat repair on glass fibre.', NULL),
(1, 1, 'Maintenance check', 'Check to make sure there are no significant structural cracks.', TO_DATE('28/02/2023','DD/MM/YYYY')),
(6, 5, 'Repair', 'Fiberglass gel coat repair.', NULL),
(29, 34, 'Maintenance check', 'Check the sails for any damage or mould and mend as approriate.', TO_DATE('09/03/2023', 'DD/MM/YYYY')),
(8, 7, 'Repair', 'Replace a new fuel tank.', TO_DATE('29/03/2023', 'DD/MM/YYYY')),
(27, 22, 'Maintenance check', 'Inspect batteries are clean and dry, also ensure wire casings are ntact and fix if necessary.', NULL),
(43, 38, 'Repair', 'Puncture repair at the air leaking area.',TO_DATE('18/03/2023', 'DD/MM/YYYY')),
(46, 40, 'Maintenance check', 'Change ove the primary and secondary fuel filters.', TO_DATE('01/05/2022', 'DD/MM/YYYY')),
(15, 13, 'Maintenance check', 'Inspect the propeller and shaft.', NULL),
(27, 22, 'Maintenance check', 'Inspect and repair any bodywork or damage to maintain proper insulation.', TO_DATE('11/05/2023', 'DD/MM/YYYY'));

INSERT INTO booking (boat_id, cust_id, service_type, service_descr, pre_booking_date)
VALUES 
(25, 21, 'Repair', 'Puncture repair at the air leaking area.', NULL),
(54, 45, 'Maintenance check', 'Check the engine oil level and transmission fluid level.', NULL),
(44, 39, 'Repair', 'Rearrange the wires of the battery connection.', TO_DATE('06/06/2023', 'DD/MM/YYYY')),
(50, 42, 'Repair', 'Fix the fuel line for the engine.', NULL),
(19, 16, 'Repair', 'Puncture repair at the air leaking area.', TO_DATE('30/06/2023', 'DD/MM/YYYY')),
(47, 40, 'Repair', 'The damage on the deck need to be repaired.', NULL),
(50, 42, 'Repair', 'Gelcoat repair on glass fibre.', NULL),
(51, 43, 'Repair', 'Replace a new cushion on the boat seat.', TO_DATE('26/07/2023', 'DD/MM/YYYY')),
(13, 11, 'Maintenance', 'Add grease to all seals and bearings fittings.', TO_DATE('25/07/2023', 'DD/MM/YYYY')),
(3, 2, 'Maintenance', 'Inspect the back pump for any drop damage or liner wearing.', TO_DATE('25/07/2023', 'DD/MM/YYYY')),
(42, 37, 'Maintenance check', 'Check the fuses and breakers.', TO_DATE('03/07/2023', 'DD/MM/YYYY')),
(42, 37, 'Repair', 'Windscreen replacement.', TO_DATE('13/08/2023', 'DD/MM/YYYY')),
(55, 46, 'Maintenance check', 'Inspect your deck to make sure there is no damage to the wood.', NULL),
(55, 46, 'Maintenance check', 'Inspect your hull, keel and rudder for damage.', NULL),
(25, 21, 'Repair', 'Replace a new fuel tank.', TO_DATE('18/08/2023', 'DD/MM/YYYY'));

INSERT INTO service_sheet (booking_id, start_date, finish_date, service_complete, service_cost)
VALUES 
(1, TO_DATE('10/04/2022', 'DD/MM/YYYY'), TO_DATE('11/04/2022', 'DD/MM/YYYY'), 'Yes', '£400'),
(2, TO_DATE('22/04/2022', 'DD/MM/YYYY'), TO_DATE('22/04/2022', 'DD/MM/YYYY'), 'Yes', '£500'),
(3, TO_DATE('20/04/2022', 'DD/MM/YYYY'), null, 'No', '£3532'),
(4, TO_DATE('05/12/2022', 'DD/MM/YYYY'), TO_DATE('09/12/2022', 'DD/MM/YYYY'), 'Yes', '£600'),
(5, TO_DATE('15/01/2023', 'DD/MM/YYYY'), null, 'No', '£120'),
(6, TO_DATE('20/01/2023', 'DD/MM/YYYY'), TO_DATE('20/01/2023', 'DD/MM/YYYY'), 'Yes', '£100'),
(7, TO_DATE('18/01/2023', 'DD/MM/YYYY'), TO_DATE('18/01/2023', 'DD/MM/YYYY'), 'Yes', '£7000'),
(8, null, null, 'No', '£300'),
(9, null, null, 'No', '£240'),
(10, TO_DATE('28/02/2023', 'DD/MM/YYYY'), TO_DATE('28/02/2023', 'DD/MM/YYYY'), 'Yes', '£150'),
(11, TO_DATE('15/02/2023', 'DD/MM/YYYY'), TO_DATE('15/02/2023', 'DD/MM/YYYY'), 'Yes', '£500'),
(12, TO_DATE('21/02/2023', 'DD/MM/YYYY'), TO_DATE('21/02/2023', 'DD/MM/YYYY'), 'Yes', '£100'),
(13, TO_DATE('24/02/2023', 'DD/MM/YYYY'), TO_DATE('26/02/2023', 'DD/MM/YYYY'), 'Yes', '£700'),
(14, TO_DATE('13/03/2023', 'DD/MM/YYYY'), null, 'No', '£200'),
(15, TO_DATE('01/04/2023', 'DD/MM/YYYY'), TO_DATE('01/04/2023', 'DD/MM/YYYY'), 'Yes', '£1300'),
(16, TO_DATE('20/03/2023', 'DD/MM/YYYY'), TO_DATE('20/03/2023', 'DD/MM/YYYY'), 'Yes', '£200'), 
(17, TO_DATE('28/03/2023', 'DD/MM/YYYY'), TO_DATE('28/03/2023', 'DD/MM/YYYY'), 'Yes', '£350'),
(18, null, null, 'No', '£300'),
(19, TO_DATE('03/05/2023', 'DD/MM/YYYY'), TO_DATE('03/05/2023', 'DD/MM/YYYY'), 'Yes', '£250'),
(20, TO_DATE('15/05/2023', 'DD/MM/YYYY'), TO_DATE('15/05/2023', 'DD/MM/YYYY'), 'Yes', '£250');

INSERT INTO service_sheet (booking_id, start_date, finish_date, service_complete, service_cost)
VALUES 
(21, TO_DATE('16/05/2023', 'DD/MM/YYYY'), TO_DATE('16/05/2023', 'DD/MM/YYYY'), 'Yes', '£350'),
(22, TO_DATE('16/05/2023', 'DD/MM/YYYY'), TO_DATE('16/05/2023', 'DD/MM/YYYY'), 'Yes', '£200'),
(23, TO_DATE('08/06/2023', 'DD/MM/YYYY'), null, 'Yes', '£400'),
(24, TO_DATE('08/06/2023', 'DD/MM/YYYY'), TO_DATE('08/06/2023', 'DD/MM/YYYY'), 'Yes', '£1100'),
(25, null, null, 'No', '£350'),
(26, TO_DATE('17/06/2023', 'DD/MM/YYYY'), TO_DATE('20/06/2023', 'DD/MM/YYYY'), 'Yes', '£2000'),
(27, TO_DATE('20/06/2023', 'DD/MM/YYYY'), TO_DATE('21/06/2023', 'DD/MM/YYYY'), 'Yes', '£700'),
(28, null, null, 'No', '£550'),
(29, null, null, 'No', '£200'),
(30, TO_DATE('27/07/2023', 'DD/MM/YYYY'), TO_DATE('27/07/2023', 'DD/MM/YYYY'), 'Yes', '£250'),
(31, null, null, 'No', '£200'), 
(32, TO_DATE('14/08/2023', 'DD/MM/YYYY'), null, 'No', '£400'),
(33, TO_DATE('14/08/2023', 'DD/MM/YYYY'), TO_DATE('14/08/2023', 'DD/MM/YYYY'), 'Yes', '£200'),
(34, TO_DATE('18/08/2023', 'DD/MM/YYYY'), TO_DATE('18/08/2023', 'DD/MM/YYYY'), 'Yes', '£200'),
(35, null, null, 'No', '£1300');

INSERT INTO service_boatyard (yard_id, service_id)
VALUES 
(1, 2),
(1, 6),
(1, 8),
(1, 10),
(1, 12),
(1, 13),
(1, 14),
(1, 16),
(1, 17),
(1, 20),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 30),
(2, 4),
(2, 7),
(2, 19),
(2, 24),
(2, 22),
(2, 21),
(2, 25),
(3, 5),
(4, 1),
(4, 15),
(4, 29),
(4, 23),
(4, 26),
(4, 24),
(4, 27),
(4, 28),
(5, 3),
(5, 9),
(5, 11),
(5, 18);

INSERT INTO service (service_id, staff_id)
VALUES
(1, 32),
(2, 10),
(3, 36),
(4, 4),
(4, 12),
(5, 6),
(6, 5),
(7, 14),
(7, 17),
(10, 6),
(11, 33),
(12, 10),
(13, 2),
(14, 7),
(15, 3),
(16, 5),
(17, 4),
(19, 3),
(20, 3),
(20, 6),
(20, 10),
(21, 22),
(22, 14),
(23, 29),
(24, 31),
(26, 12),
(27, 29),
(30, 3),
(30, 4),
(32, 2),
(32, 8),
(33, 9),
(34, 10);