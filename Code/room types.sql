-- Based on stay data, what are the yearly trends in customer preferences for room types (e.g., family rooms vs. single rooms), and how do these preferences influence revenue?
SELECT arrival_date_year AS Year,
	reserved_room_type AS 'Room Type',
	COUNT(reserved_room_type) AS 'Room Count',
	ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1- Discount)) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost ) , 2)AS 'Room Profits'
FROM All_Hotel_Data
GROUP BY arrival_date_year , reserved_room_type
ORDER BY Year DESC, [Room Count] DESC;

