-- What are the key factors (e.g., hotel type, market type, meals offered, number of nights booked) significantly impact hotel revenue annually?
-- Profits By Hotel Type
SELECT arrival_date_year AS Year,
	hotel,
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount))-
	SUM((stays_in_week_nights + stays_in_weekend_nights)* Cost)) /
	(SELECT (SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount))-
	SUM((stays_in_week_nights + stays_in_weekend_nights)* Cost))
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) ,'P2')AS Profits
FROM All_Hotel_Data AB
GROUP BY arrival_date_year , hotel
ORDER BY Year DESC ,Profits DESC;

-- Profits By Number Of Nights
SELECT arrival_date_year AS Year,
	SUM(stays_in_week_nights + stays_in_weekend_nights) AS 'Number Of Nights',
	FORMAT((SUM(adr * (1 - Discount)) - SUM(Cost))/
	(SELECT SUM(adr * (1 - Discount)) - SUM(Cost)
	FROM All_Hotel_Data) ,'P2') AS 'Profits Without Nights',
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount)) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost))/
	(SELECT SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount)) - 
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost)
	FROM All_Hotel_Data) ,'P2') AS 'Profits With Nights'
FROM All_Hotel_Data
GROUP BY arrival_date_year
ORDER BY Year DESC;

-- Profits By Meal Offered
SELECT arrival_date_year AS Year,
	meal,
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount)))/
	(SELECT SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount))
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year), 'P2') AS 'Profit Without Meal Cost',
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount)) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost ))/
	(SELECT (SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount)) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost ))
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year), 'P2') AS 'Profit With Meal Cost'
FROM All_Hotel_Data AB
GROUP BY arrival_date_year , meal
ORDER BY Year DESC , [Profit With Meal Cost] DESC;

-- Profits By Markets Segments Type
SELECT arrival_date_year AS Year,
	market_segment,
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost)) /
	(SELECT (SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost))
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year), 'P2') AS 'Profits Without Discount',
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount))-
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost)) /
	(SELECT (SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount))-
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost)) 
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year), 'P2') AS 'Profits With Discount'
FROM All_Hotel_Data AB
GROUP BY arrival_date_year , market_segment
ORDER BY Year DESC ,[Profits With Discount] DESC;