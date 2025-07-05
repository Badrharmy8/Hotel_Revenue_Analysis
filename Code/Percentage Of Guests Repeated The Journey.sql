-- Percentage Of Guests Repeated The Journey
SELECT FORMAT(CAST(COUNT(hotel) AS FLOAT) / (SELECT COUNT(hotel) FROM Hotel) , 'P2') AS Repeated_Guests
FROM Hotel
WHERE is_repeated_guest = 1;