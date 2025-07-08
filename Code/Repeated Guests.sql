-- What is the annual percentage of repeated guests compared to non-repeated guests?
--View For Repeated Guests
CREATE VIEW Repeated_Guests
AS
SELECT arrival_date_year AS Year,
	FORMAT(CAST(COUNT(hotel) AS FLOAT) / (SELECT COUNT(hotel) 
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2') AS 'Repeated Guests'
FROM All_Hotel_Data AB
WHERE is_repeated_guest = 1
GROUP BY arrival_date_year;

--View For Unrepeated Guests
CREATE VIEW Not_Repeated_Guests
AS
 SELECT arrival_date_year AS Year,
	FORMAT(CAST(COUNT(hotel) AS FLOAT) / (SELECT COUNT(hotel) 
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2') AS 'Unrepeated Guests'
 FROM All_Hotel_Data AB
 WHERE is_repeated_guest = 0
 GROUP BY arrival_date_year;

 -- Final Result
 SELECT RG.*,
	NRG.[Unrepeated Guests]
 FROM Repeated_Guests RG
 JOIN Not_Repeated_Guests NRG
 ON RG.Year = NRG.Year
 ORDER BY RG.Year DESC;