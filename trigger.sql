-- Create a trigger to display a message on new record insertion
DELIMITER //
CREATE TRIGGER AfterInsertMessage
AFTER INSERT ON jomato_dataset
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'A new restaurant record has been inserted successfully!';
END //
DELIMITER ;

-- Test the trigger (example insert)
INSERT INTO jomato_dataset (OrderId, RestaurantName, RestaurantType, Rating, No_of_Rating, AverageCost, OnlineOrder, TableBooking, CuisinesType, Area, LocalAddress, Delivery_time)
VALUES (7105, 'Test Restaurant', 'Quick Bites', 4.0, 50, 500, 'Yes', 'No', 'North Indian', 'Test Area', 'Test Address', 45);
