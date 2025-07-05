--Based on stay data, what are the yearly trends in customer preferences for room types (e.g., family rooms vs. single rooms), and how do these preferences influence revenue?
SELECT arrival_date_year AS Year, 
	reserved_room_type AS Room_Type,
	COUNT(hotel) AS Regesterations,
	FORMAT(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) / 
	(SELECT SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) 
	FROM Hotel) , 'P2') AS Profits
FROM Hotel
GROUP BY arrival_date_year,reserved_room_type
ORDER BY Year DESC,Regesterations DESC; 