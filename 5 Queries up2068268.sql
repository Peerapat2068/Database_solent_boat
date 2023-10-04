--1.
UPDATE service_sheet
SET finish_date = TO_DATE('22/04/2022', 'DD/MM/YYYY'), service_complete = 'Yes' 
WHERE service_id=3;

--2.
SELECT boat.boat_id, boat.boat_name, booking.booking_id, service_sheet.service_complete 
FROM boat INNER JOIN booking ON boat.boat_id = booking.booking_id 
INNER JOIN service_sheet ON booking.booking_id = service_sheet.service_id 
WHERE service_complete='No';

--3.
SELECT customer.cust_id, customer.cust_fname, customer.cust_lname, boat.boat_id, boat.boat_name 
FROM boat JOIN customer ON boat.boat_id = customer.cust_id WHERE boat_name like '%Sea doo%';

--4.
SELECT staff.staff_id as "staff id", CONCAT(staff.staff_fname, ' ', staff.staff_lname) as "staff name",
booking.service_descr as "service description" 
FROM staff JOIN role_staff ON role_staff.staff_id = staff.staff_id 
JOIN role ON role_staff.role_id = role.role_id 
JOIN service ON staff.staff_id = service.staff_id 
JOIN service_sheet ON service.service_id = service_sheet.service_id 
JOIN booking ON service_sheet.booking_id =booking.booking_id 
WHERE role.role_name = 'Electrician';

--5.
SELECT staff.staff_id, role_staff.role_id, role.role_name 
FROM staff RIGHT JOIN role_staff ON staff.staff_id = role_staff.staff_id 
RIGHT JOIN role ON role_staff.role_id = role.role_id;

