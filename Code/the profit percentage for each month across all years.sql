-- What is the profit percentage for each month across all years?
SELECT arrival_date_year,
	arrival_date_month,
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) / 
	(SELECT SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) AS Total_Profits
	FROM Hotel)) , 'P2')  AS Profit_Percentage 
FROM Hotel
GROUP BY arrival_date_year,arrival_date_month
ORDER BY arrival_date_year;