-- What is the profit percentage for each month across all years?
SELECT arrival_date_year AS Year,
	arrival_date_month,
CASE
	WHEN arrival_date_month = 'January' THEN 1
	WHEN arrival_date_month = 'February' THEN 2
	WHEN arrival_date_month = 'March' THEN 3
	WHEN arrival_date_month = 'April' THEN 4
	WHEN arrival_date_month = 'May' THEN 5
	WHEN arrival_date_month = 'June' THEN 6
	WHEN arrival_date_month = 'July' THEN 7
	WHEN arrival_date_month = 'August' THEN 8
	WHEN arrival_date_month = 'September' THEN 9
	WHEN arrival_date_month = 'October' THEN 10
	WHEN arrival_date_month = 'November' THEN 11
	WHEN arrival_date_month = 'December' THEN 12
END	AS Month_Number,
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1- Discount)) 
	- SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost )) / 
	(SELECT SUM((stays_in_week_nights + stays_in_weekend_nights) * adr * (1- Discount)) 
	- SUM((stays_in_week_nights + stays_in_weekend_nights) * Cost )
	FROM All_Hotel_Data AH
	WHERE AH.arrival_date_year = AB.arrival_date_year) , 'P2') AS 'Profit Percentage'
FROM All_Hotel_Data AB
GROUP BY arrival_date_year , arrival_date_month
ORDER BY Year DESC , Month_Number;

