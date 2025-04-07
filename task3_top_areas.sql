-- Generate row number and find top 5 areas with highest average rating
SELECT 
    Area,
    AVG(Rating) AS AverageRating,
    ROW_NUMBER() OVER (ORDER BY AVG(Rating) DESC) AS RowNum
FROM jomato_dataset
WHERE Rating IS NOT NULL
GROUP BY Area
ORDER BY AverageRating DESC
LIMIT 5;
