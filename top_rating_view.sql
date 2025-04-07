-- Create a view for the top 5 highest-rated restaurants
CREATE VIEW TopRatingRestaurants AS
SELECT 
    RestaurantName,
    RestaurantType,
    Rating,
    Area
FROM jomato_dataset
WHERE Rating IS NOT NULL
ORDER BY Rating DESC
LIMIT 5;

-- Query the view
SELECT * FROM TopRatingRestaurants;
