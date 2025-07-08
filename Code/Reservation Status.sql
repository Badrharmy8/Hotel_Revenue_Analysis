-- What is the annual percentage of bookings by reservation status?
SELECT arrival_date_year AS Year,
	reservation_status,
	FORMAT(CAST(COUNT(*) AS FLOAT) /(SELECT COUNT(*)
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2') AS 'Bookings Percentage'
FROM All_Hotel_Data AB
GROUP BY arrival_date_year ,reservation_status
ORDER BY Year DESC;