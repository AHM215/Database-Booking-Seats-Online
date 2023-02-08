CREATE DATABASE Booking_Seats
USE BOOKING_SEATS
GO
CREATE TABLE MANAGER(
Manager_id int primary key, -- unique identifier for each manager
Maneger_name VARCHAR(255) NOT NULL, -- name of the manager
Maneger_pass VARCHAR(255) NOT NULL -- pass of the manager
)

CREATE TABLE CUSTOMER (
  Customer_id INT PRIMARY KEY,  -- unique identifier for each customer
  Customer_name VARCHAR(255) NOT NULL,  -- name of the customer
  Customer_email VARCHAR(255) NOT NULL,  -- email of the customer
  Customer_phone VARCHAR(255) NOT NULL  -- phone number of the customer
)

 CREATE TABLE STADIUM(
  Stadium_id INT PRIMARY KEY,  -- unique identifier for each stadium
  Stadium_name VARCHAR(255) NOT NULL,  -- name of the stadium
  Stadium_location VARCHAR(255) NOT NULL  -- location of the stadium
)
 
 CREATE TABLE SPORTEVENT(
  Event_id INT PRIMARY KEY,  -- unique identifier for each Event
  Event_name VARCHAR(255) NOT NULL,  -- name of the Event
  StartDate DATE ,  -- START DATE of the Event
  ENDDate DATE ,  -- END DATE of the Event
  Manager_id int,  -- foreign key referencing the Manager table
  Stadium_id INT,  -- foreign key referencing the Stadium table
  FOREIGN KEY (Manager_id) REFERENCES MANAGER(Manager_id),
  FOREIGN KEY (Stadium_id) REFERENCES STADIUM(Stadium_id)
 )



CREATE TABLE SEATS (
  Seat_num INT PRIMARY KEY,  -- unique identifier for each seat
  Seat_status VARCHAR(255) DEFAULT 'AVAILABLE',
  Degree VARCHAR(255), -- degree of the seat
  Stadium_id INT,  -- foreign key referencing the stadium table
  FOREIGN KEY (Stadium_id) REFERENCES STADIUM(Stadium_id)
)

CREATE TABLE PARKS (
  Park_num INT PRIMARY KEY,  -- unique identifier for each park
  Park_status VARCHAR(255) DEFAULT 'AVAILABLE',
  Stadium_id INT,  -- foreign key referencing the stadium park
  FOREIGN KEY (Stadium_id) REFERENCES STADIUM(Stadium_id)
)


CREATE TABLE BOOKING (
  Booking_id INT PRIMARY KEY,  -- unique identifier for each booking
  Seat_num INT,  -- foreign key referencing the seat table
  Park_num INT,  -- foreign key referencing the park table
  Event_id INT,  -- foreign key referencing the sportevent table
  FOREIGN KEY (Seat_num) REFERENCES SEATS(Seat_num),
  FOREIGN KEY (Event_id) REFERENCES SPORTEVENT(Event_id),
  FOREIGN KEY (Park_num) REFERENCES PARKS(Park_num)
);
    
CREATE TABLE ORDER_ONLINE (
  Booking_id INT PRIMARY KEY,  -- unique identifier for each order
  Customer_id INT,  -- foreign key referencing the customer table
  Order_total DECIMAL(10,2) NOT NULL,  -- total cost of the order
  Credit_card_number VARCHAR(255) NOT NULL, -- credit card cost of the order
  FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id),
  FOREIGN KEY (Booking_id) REFERENCES BOOKING(Booking_id)  ON DELETE CASCADE
);


--drop database Booking_Seats




