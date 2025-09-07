SELECT Booking.booking_id, Booking.property_id, Booking.user_id, Booking.start_date, Booking.end_date, Booking.total_price, Booking.status, Booking.created_at, Users.first_name, Users.last_name, Users.email, Users.phone_number
FROM 
    Booking
INNER JOIN 
    Users
ON 
    Booking.user_id = Users.user_id


SELECT
    *
FROM
    Property
LEFT JOIN
    Review
ON
    Property.property_id = Review.property_id

SELECT
    *
FROM
    Users
FULL OUTER JOIN
    Booking
ON
    Users.user_id = Booking.user_id