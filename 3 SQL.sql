-- Create Database
CREATE DATABASE JomatoDB;
GO
USE JomatoDB;
GO

-- Create Table
CREATE TABLE Restaurants (
    OrderId INT PRIMARY KEY,
    RestaurantName NVARCHAR(255),
    RestaurantType NVARCHAR(255),
    Rating FLOAT,
    NoOfRating INT,
    AverageCost INT,
    OnlineOrder NVARCHAR(50),
    TableBooking NVARCHAR(50),
    CuisinesType NVARCHAR(255),
    Area NVARCHAR(255),
    LocalAddress NVARCHAR(255),
    DeliveryTime INT
);
GO

-- Import Data
BULK INSERT Restaurants
FROM 'C:\data\jomato.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
GO

-- 1: Stored Procedure
CREATE PROCEDURE GetRestaurantsWithTableBooking
AS
BEGIN
    SELECT RestaurantName, RestaurantType, CuisinesType
    FROM Restaurants
    WHERE TableBooking = 'Yes';
END;
GO
-- Execute: EXEC GetRestaurantsWithTableBooking;
GO

-- 2: Transaction
BEGIN TRANSACTION;

UPDATE Restaurants
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe';

SELECT * FROM Restaurants WHERE CuisinesType = 'Cafeteria';

ROLLBACK TRANSACTION;
GO

-- 3: Row Numbers and Top 5 Areas
SELECT Area, AverageRating
FROM (
    SELECT Area, AVG(Rating) AS AverageRating,
           ROW_NUMBER() OVER (ORDER BY AVG(Rating) DESC) AS RowNum
    FROM Restaurants
    GROUP BY Area
) AS SubQuery
WHERE RowNum <= 5;
GO

-- 4: While Loop
DECLARE @i INT = 1;

WHILE @i <= 50
BEGIN
    PRINT @i;
    SET @i = @i + 1;
END;
GO

-- 5: Create View
CREATE VIEW TopRatingRestaurants AS
SELECT TOP 5 RestaurantName, Rating
FROM Restaurants
ORDER BY Rating DESC;
GO
-- Query View: SELECT * FROM TopRatingRestaurants;
GO

-- 6: Create Trigger
CREATE TRIGGER trgAfterInsert ON Restaurants
AFTER INSERT
AS
BEGIN
    PRINT 'A new record has been inserted into the Restaurants table.';
END;
GO

-- Test Trigger
INSERT INTO Restaurants (OrderId, RestaurantName, RestaurantType, Rating, NoOfRating, AverageCost, OnlineOrder, TableBooking, CuisinesType, Area, LocalAddress, DeliveryTime)
VALUES (7105, 'Test Restaurant', 'Test Type', 4.5, 100, 500, 'Yes', 'No', 'Test Cuisine', 'Test Area', 'Test Address', 30);
GO