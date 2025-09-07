SELECT *
FROM Property
WHERE (
    SELECT AVG(Review.rating)
    FROM Review
    WHERE Review.property_id = Property.property_id
) > 4.0;

SELECT *
FROM Users
WHERE (
    SELECT COUNT(Booking.booking_id)
    FROM Booking
    WHERE Booking.user_id = Users.user_id
) > 3;