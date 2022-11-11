DROP DATABASE if exists NeyssaHotelDB;
CREATE DATABASE NeyssaHotelDB; 
USE NeyssaHotelDB;

CREATE TABLE room (
	Room_ID INT NOT NULL,
	Room_number INT,
    RoomType VARCHAR(10),
    ADA_accessible boolean,
    Standard_Occupancy INT,
    Max_Occupancy INT,
    BasePrice DECIMAL(5,2),
    Extra_Person DECIMAL(5,2) NULL,
    PRIMARY KEY(Room_ID)
);

CREATE TABLE guests (
	Guest_ID INT NOT NULL,
	FirstName VARCHAR(50) , 
    LastName VARCHAR(50),
    Address VARCHAR(100) NULL, 
    City VARCHAR(50) NULL, 
    State VARCHAR(2) NULL, 
    Zip INT NULL, 
    Phone VARCHAR(20) NOT NULL,
    PRIMARY KEY(Guest_ID)
);

CREATE TABLE reservations (
	Reservation_ID INT NOT NULL,
    Guest_ID INT,
	Room_ID INT,
    Adults INT NOT NULL, 
    Children INT NOT NULL, 
    StartDate date NOT NULL, 
    EndDate date NOT NULL, 
    TotalRoomCost DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(Reservation_ID),
    CONSTRAINT FK_GuestReservation FOREIGN KEY (Guest_ID) REFERENCES guests (Guest_ID),
    CONSTRAINT FK_RoomReservation FOREIGN KEY (Room_ID) REFERENCES room (Room_ID)
); 

CREATE TABLE Amenities (
	Amenities_ID INT NOT NULL,
    Amenities VARCHAR(15),
    PRIMARY KEY(Amenities_ID)
);

CREATE TABLE room_amenities (
	Room_ID INT, 
    Amenities_ID INT, 
    CONSTRAINT FOREIGN KEY (Room_ID) REFERENCES room (Room_ID),
    CONSTRAINT FOREIGN KEY (Amenities_ID)REFERENCES Amenities (Amenities_ID),
    PRIMARY KEY (Room_ID, Amenities_ID)
);

-- allows to check for Jeremiah's guest ID 
SELECT * FROM guests
WHERE FirstName ='Jeremiah' AND LastName = 'Pendergrass';
-- deletes from reservation 
DELETE FROM reservations
WHERE Guest_ID = 228;
-- deletes from guests 
DELETE FROM guests
WHERE Guest_ID = 228;
