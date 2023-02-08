use Booking_Seats
go

INSERT INTO MANAGER (Manager_id, Maneger_name, Maneger_pass)
VALUES 
	(1, 'AHMED', 'AHM215'),
	(2, 'MOHAMED', 'MOHHH'),
	(3, 'AYMEN', 'AYMM555');

INSERT INTO CUSTOMER (Customer_id, Customer_name, Customer_email,Customer_phone)
VALUES 
	(1, 'AHMED', 'AHM215@ASFFD','21654897844'),
	(2, 'Sophia', 'Sophia@ASFFD','216554656456'),
	(3, 'Theodore', 'Theodore@ASFFD','216554654654'),
	(4, 'Lucas', 'Lucas@ASFFD','4565454897844'),
	(5, 'Benjamin', 'Benjamin@ASFFD','54654897844'),
	(6, 'William', 'William@ASFFD','254654567844'),
	(7, 'James', 'James@ASFFD','4564546844'),
	(8, 'Elijah', 'Elijah@ASFFD','4655647844'),
	(9, 'Oliver', 'Oliver@ASFFD','4563678979'),
	(10, 'Noah', 'Noah@ASFFD','456365436'),
	(11, 'Liam', 'Liam@ASFFD','463864588'),
	(12, 'Lucas', 'Lucas5@ASFFD','879835452543');


INSERT INTO STADIUM (Stadium_id, Stadium_name, Stadium_location)
VALUES 
	(1, 'Al Bayt', 'Al Khor, 35km north of central Doha'),
	(2, 'Ahmad Bin Ali', 'Umm Al Afaei, 20km west of central Doha'),
	(3, '974 ', 'Ras Abu Aboud, 10km east of central Doha');


INSERT INTO SPORTEVENT (Event_id, Event_name, StartDate,ENDDate,Manager_id,Stadium_id)
VALUES 
	(1, 'ARG vs FRA', '2022-02-18','2022-02-18',1,2),
	(2, 'ALG vs EGY', '2022-02-19','2022-02-19',2,3),
	(3, 'MAC vs MWI', '2022-02-20','2022-02-20',1,1),
	(4, 'ESP vs GRE', '2022-02-21','2022-02-21',3,2),
	(5, 'BIH vs GUM', '2022-02-22','2022-02-22',2,3),
	(6, 'ARG vs BEL', '2022-02-23','2022-02-23',1,1),
	(7, 'EGY vs FRA', '2022-02-24','2022-02-24',3,2),
	(8, 'BEL vs FRA', '2022-02-25','2022-02-25',1,3),
	(9, 'ARG vs FRA', '2022-02-26','2022-02-26',2,1),
	(10, 'ARG vs ALG', '2022-02-27','2022-02-27',3,2),
	(11, 'ARG vs ESP', '2022-02-28','2022-02-28',1,3),
	(12, 'FRA vs BIH', '2022-02-28','2022-02-28',2,1);

INSERT INTO SEATS (Seat_num, Degree,Stadium_id)
VALUES 
	(1, 'FIRST',1),
	(2, 'SECOND',2),
	(3 ,'THIRD',3),
	(4, 'FIRST',1),
	(5, 'SECOND',2),
	(6 ,'THIRD',3),
	(7, 'FIRST',1),
	(8, 'SECOND',2),
	(9 ,'THIRD',3),
	(10, 'FIRST',1),
	(11, 'SECOND',2),
	(12 ,'THIRD',3),
	(13, 'FIRST',1),
	(14, 'SECOND',2),
	(15, 'FIRST',1),
	(16, 'SECOND',2),
	(17 ,'THIRD',3),
	(18, 'FIRST',1),
	(19, 'SECOND',2),
	(20 ,'THIRD',3),
	(21, 'FIRST',1),
	(22, 'SECOND',2),
	(23 ,'THIRD',3),
	(24, 'FIRST',1),
	(25, 'SECOND',2),
	(26 ,'THIRD',3),
	(27 ,'THIRD',3);

INSERT INTO PARKS (Park_num ,Stadium_id)
VALUES 
	(1,1),
	(2,2),
	(3 ,3),
	(4,1),
	(5,2),
	(6 ,3),
	(7,1),
	(8,2),
	(9 ,3),
	(10,1),
	(11,2),
	(12 ,3),
	(13,1),
	(14,2),
	(15,1),
	(16,2),
	(17 ,3),
	(18,1),
	(19,2),
	(20 ,3),
	(21,1),
	(22,2),
	(23 ,3),
	(24,1),
	(25,2),
	(26 ,3),
	(27 ,3);

INSERT INTO BOOKING (Booking_id,Seat_num,Park_num,Event_id)
VALUES 
	(1, 27,1,1),
	(2, 26,2,2),
	(3, 22,3,2),
	(4, 11,4,3),
	(5, 10,5,3),
	(6, 9,6,3),
	(7, 8,7,5),
	(8, 5,8,4),
	(9, 4,9,6),
	(10, 3,10,7),
	(11, 2,11,7),
	(12, 1,12,6);


INSERT INTO ORDER_ONLINE (Booking_id, Order_total, Credit_card_number,Customer_id)
VALUES 
	(1, 100, '2148784132165',1),
	(2, 105, '21651320165120',2),
	(3, 150, '45687654654567',3),
	(4, 121, '45345312387789',4),
	(5, 164, '54387665436587',5),
	(6, 156, '45386768769789',5),
	(7, 185, '46387965432876',7),
	(8, 102, '453879876456453',8),
	(9, 112, '7867856545687978',9),
	(10, 100, '453678675864535678',10),
	(11, 100, '4356879789764536546',11),
	(12, 100, '4568797864564535468',12);



DELETE FROM BOOKING WHERE Booking_id=1;

INSERT INTO BOOKING (Booking_id,Seat_num,Park_num,Event_id)
VALUES 
	(15,12,17,1);

SELECT *
FROM BOOKING i INNER JOIN SEATS s ON i.Seat_num = s.Seat_num 
