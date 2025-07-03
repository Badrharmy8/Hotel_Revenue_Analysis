-- Number Of Regesterations When Reserved Room , Assigned Room Are Different 
SELECT arrival_date_year AS Year, 
	COUNT(hotel) AS Regesterations 
FROM Hotel
WHERE reserved_room_type != assigned_room_type
GROUP BY arrival_date_year
ORDER BY Year DESC;

-- Percentage Of Guests Repeated The Journey
SELECT FORMAT(CAST(COUNT(hotel) AS FLOAT) / (SELECT COUNT(hotel) FROM Hotel) , 'P2') AS Repeated_Guests
FROM Hotel
WHERE is_repeated_guest = 1;