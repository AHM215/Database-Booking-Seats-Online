use Booking_Seats
go

CREATE TRIGGER update_seat_status
ON BOOKING
AFTER INSERT, DELETE
AS
BEGIN
    -- If a new booking is being inserted, set the seat status to "booked"
	UPDATE SEATS
	SET Seat_status = 'BOOKED'
	FROM inserted i
	WHERE seats.Seat_num = i.Seat_num;

    -- If a booking is being deleted, set the seat status to "available"
    UPDATE SEATS
    SET Seat_status = 'AVAILABLE'
    FROM deleted d
    WHERE SEATS.Seat_num = d.Seat_num;
END

go

CREATE TRIGGER update_park_status
ON BOOKING
AFTER INSERT, DELETE
AS
BEGIN
    -- If a new booking is being inserted, set the seat status to "booked"
	UPDATE PARKS
	SET Park_status = 'BOOKED'
	FROM inserted i
	WHERE PARKS.Park_num = i.Park_num;

    -- If a booking is being deleted, set the seat status to "available"
    UPDATE PARKS
    SET Park_status = 'AVAILABLE'
    FROM deleted d
    WHERE PARKS.Park_num = d.Park_num;
END

CREATE TRIGGER tr_PreventDoubleBooking
ON BOOKING
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted i
               INNER JOIN Seats s ON i.Seat_num = s.Seat_num
               WHERE s.Seat_status = 'BOOKED')
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Cannot book a seat that is already booked', 16, 1);
    END
END

CREATE TRIGGER tr_PreventDoubleBookingPark
ON BOOKING
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted i
               INNER JOIN Parks p ON i.Park_num = p.Park_num
               WHERE p.Park_status = 'BOOKED')
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Cannot book a park that is already booked', 16, 1);
    END
END

go


DROP TRIGGER update_seat_status
go
sp_settriggerorder @triggername = 'tr_PreventDoubleBookingPark', @order = 'first', @stmttype = 'INSERT'
go
sp_settriggerorder @triggername = 'update_park_status', @order = 'last', @stmttype = 'INSERT' 

DROP TRIGGER update_park_status



-- produder




-- view



 