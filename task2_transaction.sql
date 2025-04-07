-- Transaction to update 'Cafe' to 'Cafeteria' and rollback
START TRANSACTION;

-- Update cuisine type from 'Cafe' to 'Cafeteria'
UPDATE jomato_dataset
SET CuisinesType = REPLACE(CuisinesType, 'Cafe', 'Cafeteria')
WHERE CuisinesType LIKE '%Cafe%';

-- Check the result
SELECT RestaurantName, CuisinesType
FROM jomato_dataset
WHERE CuisinesType LIKE '%Cafeteria%';

-- Rollback the changes
ROLLBACK;

-- Verify rollback
SELECT RestaurantName, CuisinesType
FROM jomato_dataset
WHERE CuisinesType LIKE '%Cafe%';
