USE NeyssaHotelDB;

-- first query 
SELECT 
reservations.Reservation_ID,
reservations.Guest_ID,
reservations.Room_ID,
reservations.StartDate,
reservations.EndDate,
guests.FirstName,
guests.LastName,
room.Room_number
FROM reservations
INNER JOIN guests ON reservations.Guest_ID = guests.Guest_ID
INNER JOIN room ON reservations.Room_ID = room.Room_ID
WHERE reservations.EndDate BETWEEN '2023-07-01' AND '2023-07-31';

-- SELECT * FROM reservations
-- WHERE EndDate BETWEEN '2023-07-01' AND '2023-07-31';

-- second query
-- incorrect 
SELECT 
reservations.Reservation_ID,
guests.FirstName,
guests.LastName,
reservations.StartDate,
reservations.EndDate
FROM reservations
INNER JOIN guests ON reservations.Guest_ID = guests.Guest_ID
INNER JOIN room ON reservations.Room_ID = room.Room_ID
INNER JOIN room_amenities ON reservations.Room_ID = room_amenities.Room_ID
WHERE room_amenities.Amenities_ID = '1004';

-- 3rd query 
SELECT 
guests.Guest_ID,
guests.FirstName,
guests.LastName,
room.Room_number,
reservations.Adults,
reservations.Children,
reservations.StartDate
FROM reservations
INNER JOIN guests ON reservations.Guest_ID = guests.Guest_ID
INNER JOIN room ON reservations.Room_ID = room.Room_ID;


-- 4th query 
-- correct 
SELECT 
room.Room_ID,
room.Room_number,
reservations.Reservation_ID,
reservations.TotalRoomCost
FROM room
LEFT JOIN reservations ON room.Room_ID = reservations.Room_ID;


-- 5th query 
-- correct
SELECT 
room.Max_Occupancy,
room.Room_ID,
room.Room_number,
reservations.StartDate,
reservations.EndDate
FROM room 
INNER JOIN reservations ON room.Room_ID = reservations.Room_ID
WHERE reservations.StartDate BETWEEN '2023-04-01' AND '2023-04-30' AND room.Max_Occupancy >=3;

-- 6th query


-- 7th query 
-- correct 
SELECT * FROM guests 
WHERE Phone = '(949) 482-0803';