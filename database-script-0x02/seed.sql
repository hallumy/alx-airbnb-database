INSERT INTO Users
    (user_id, first_name, last_name, email, password_hash, role, created_at)
    VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', 'password', '1234567890', 'guest'), 
    (2, 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0723456789', 'host'),
    (3, 'Clara', 'Williams', 'clara@example.com', 'hashed_pw_3', NULL, 'admin');

INSERT INTO Property
    (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
     VALUES
      (1, 2, 'Cozy Cottage', 'A quiet cottage near the lake.', 'Nairobi, Kenya', 7500),
      (2, 2, 'City Apartment', 'Modern apartment in the city center.', 'Mombasa, Kenya', 12000),
      (3, 2, 'Enzi Homes', 'Cozy 3 bedroom modern apartment all ensuited with swimming pool at the rooftop', 'South C, Nairobi', 6000);

INSERT INTO Booking
    (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
     VALUES
     (1, 1, 1, '2025-09-10', '2025-09-15', 375.00, 'confirmed'),
     (2, 2, 1, '2025-10-01', '2025-10-05', 480.00, 'pending');

INSERT INTO Payment 
    (payment_id, booking_id, amount, payment_method)
     VALUES
     (1, 1, 375.00, 'credit_card');

INSERT INTO Review 
    (review_id, property_id, user_id, rating, comment)
    VALUES
    (1, 1, 1, 5, 'Amazing stay! Very cozy and peaceful.'),
    (2, 2, 1, 4, 'Great location, but could be cleaner.');

INSERT INTO Message 
    (message_id, sender_id, recipient_id, message_body)
    VALUES
    (1, 1, 2, 'Hi Bob, is the property available in October?'),
    (2, 2, 1, 'Yes, I have it open for October 1st–5th.');
