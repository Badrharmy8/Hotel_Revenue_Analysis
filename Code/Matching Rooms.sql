-- What is the annual percentage of cases where the reserved room matches the assigned room?
-- Matching Rooms
CREATE VIEW Matching_Rooms
AS
SELECT arrival_date_year AS Year,
	FORMAT(CAST(COUNT(hotel) AS FLOAT) / (SELECT COUNT(hotel)
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2')
	AS 'Matching Rooms'
FROM All_Hotel_Data AB
WHERE reserved_room_type = assigned_room_type
GROUP BY arrival_date_year;

-- Not Matching Rooms
CREATE VIEW Not_Matching_Rooms
AS
SELECT arrival_date_year AS Year,
	FORMAT(CAST(COUNT(hotel) AS FLOAT) / (SELECT COUNT(hotel)
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2')
	AS 'Not Matching Rooms'
FROM All_Hotel_Data AB
WHERE reserved_room_type != assigned_room_type
GROUP BY arrival_date_year;

-- Final Result
SELECT MR.*,
	NMR.[Not Matching Rooms]
FROM Matching_Rooms MR
JOIN Not_Matching_Rooms NMR
ON MR.Year = NMR.Year
ORDER BY MR.Year DESC;