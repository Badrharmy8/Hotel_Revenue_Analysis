-- Which meals and market segments (e.g., families, corporate clients, etc.) contribute the most to the total revenue for each hotel annually?
-- meals contribution
SELECT arrival_date_year AS Year,
	meal,
	ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount)) , 2) AS 'Profit Without Meal Cost',
	ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount)) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost ), 2) AS 'Profit With Meal Cost'
FROM All_Hotel_Data
GROUP BY arrival_date_year , meal
ORDER BY Year DESC , [Profit With Meal Cost] DESC;

-- markets segments contribution
SELECT arrival_date_year AS Year,
	market_segment,
	ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost) , 2) AS 'Profits Without Discount',
	ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1 - Discount)) -
	SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost ),2) AS 'Profits With Discount'
FROM All_Hotel_Data
GROUP BY arrival_date_year , market_segment
ORDER BY Year DESC ,[Profits With Discount] DESC;

