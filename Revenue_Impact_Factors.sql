-- the key factors (e.g., hotel type, market type, meals offered, number of nights booked) significantly impact hotel revenue annually?
-- Hotel Type
SELECT arrival_date_year AS Year 
	,hotel AS Hotel_Type,
	FORMAT(SUM(adr)/(SELECT SUM(adr) FROM Hotel), 'P2') AS Profits
FROM Hotel
GROUP BY arrival_date_year,hotel
ORDER BY Year DESC , Hotel_Type;

-- Market Type
SELECT H.arrival_date_year AS Year,
	H.market_segment,
	FORMAT(SUM(H.adr) / (SELECT SUM(adr) FROM Hotel H
							LEFT OUTER JOIN market_segment MS
							ON H.market_segment = MS.market_segment) , 'P2') AS Profits,
	FORMAT((SUM(H.adr) / (SELECT SUM(adr) FROM Hotel H
							LEFT OUTER JOIN market_segment MS
							ON H.market_segment = MS.market_segment)) - 
	((SUM(H.adr) / (SELECT SUM(adr) FROM Hotel H
							LEFT OUTER JOIN market_segment MS
							ON H.market_segment = MS.market_segment)) * MS.Discount ),'P2') AS After_Discount
	
FROM Hotel H
LEFT OUTER JOIN market_segment MS
ON H.market_segment = MS.market_segment
GROUP BY H.arrival_date_year , H.market_segment , MS.Discount
ORDER BY Year DESC;

-- Meals Offered
SELECT H.arrival_date_year AS Year,
	H.meal AS Meal,
	FORMAT(SUM(adr) /(SELECT SUM(adr) FROM Hotel H
						LEFT OUTER JOIN meal_cost MC
						ON H.meal = MC.meal) , 'P2') AS Profits
FROM Hotel H
LEFT OUTER JOIN meal_cost MC
ON H.meal = MC.meal
GROUP BY H.arrival_date_year , H.meal
ORDER BY YEAR DESC;

-- Number Of Nights Booked
SELECT arrival_date_year AS Year,
	SUM(stays_in_week_nights + stays_in_weekend_nights) AS Number_Of_Nights,
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) / 
	(SELECT SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) AS Total_Profits
	FROM Hotel)) , 'P2')  AS Profit_Percentage 
FROM Hotel H
GROUP BY arrival_date_year
ORDER BY Year DESC;

-- the yearly trends in customer preferences for room types (e.g., family rooms vs. single rooms), and how do these preferences influence revenue?
SELECT arrival_date_year AS Year, 
	reserved_room_type AS Room_Type,
	COUNT(hotel) AS Regesterations,
	FORMAT(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) / 
	(SELECT SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) 
	FROM Hotel) , 'P2') AS Profits
FROM Hotel
GROUP BY arrival_date_year,reserved_room_type
ORDER BY Year DESC,Regesterations DESC; 