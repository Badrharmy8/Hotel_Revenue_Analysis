-- What is the annual ratio of individual bookings (adults only) versus family bookings (with children or babies)?
-- Individual Bookings
CREATE VIEW Individual_Bookings
AS
SELECT arrival_date_year AS Year,
	FORMAT(CAST(COUNT(hotel) AS FLOAT) / 
	(SELECT COUNT(hotel)
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2') AS 'Individual Bookings'
FROM All_Hotel_Data AB
WHERE adults != 0 AND babies = 0 AND children = 0
GROUP BY arrival_date_year;

-- Family Bookings
CREATE VIEW Family_Bookings
AS
SELECT arrival_date_year AS Year,
	FORMAT(CAST(COUNT(hotel) AS FLOAT) / 
	(SELECT COUNT(hotel)
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2') AS 'Family Bookings'
FROM All_Hotel_Data AB
WHERE adults != 0 AND (babies != 0 OR children != 0)
GROUP BY arrival_date_year;

-- Final Result
SELECT IB.*,
	FB.[Family Bookings]
FROM Individual_Bookings IB
JOIN Family_Bookings FB
ON IB.Year = FB.Year
ORDER BY IB.Year DESC;