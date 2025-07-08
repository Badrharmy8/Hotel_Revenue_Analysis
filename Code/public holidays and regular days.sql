-- How does revenue compare between public holidays and regular days each year?
SELECT arrival_date_year AS Year,
	FORMAT((SUM(stays_in_week_nights * adr * (1 - Discount)) - SUM(stays_in_week_nights * Cost ))/
	(SELECT SUM((stays_in_week_nights +stays_in_weekend_nights) * adr * (1 - Discount)) - SUM((stays_in_weekend_nights + stays_in_week_nights) * Cost )
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2')AS 'regular days',
	FORMAT((SUM(stays_in_weekend_nights * adr * (1 - Discount)) - SUM(stays_in_weekend_nights * Cost ))/
	(SELECT SUM((stays_in_weekend_nights + stays_in_week_nights) * adr * (1 - Discount)) - SUM((stays_in_weekend_nights + stays_in_week_nights) * Cost )
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2') AS 'public holidays'
FROM All_Hotel_Data AB
GROUP BY arrival_date_year
ORDER BY Year DESC;