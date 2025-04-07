-- Stored Procedure to display restaurant name, type, and cuisine where table booking is not zero
DELIMITER //
CREATE PROCEDURE GetRestaurantsWithTableBooking()
BEGIN
    SELECT RestaurantName, RestaurantType, CuisinesType
    FROM jomato_dataset
    WHERE TableBooking = 'Yes';
END //
DELIMITER ;

-- Call the stored procedure
CALL GetRestaurantsWithTableBooking();
