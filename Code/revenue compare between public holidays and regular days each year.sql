--How does revenue compare between public holidays and regular days each year?
SELECT arrival_date_year AS YEAR,
	SUM(stays_in_weekend_nights) AS Public_Holidays,
	SUM(stays_in_week_nights) AS Regular_Days,
CASE
	WHEN SUM(stays_in_weekend_nights) > SUM(stays_in_week_nights) THEN 'Public Holidays'
	WHEN SUM(stays_in_week_nights) > SUM(stays_in_weekend_nights) THEN 'Regular Days'
	ELSE 'Same Revenue'
END AS Revenue_Days_Type
FROM Hotel
GROUP BY arrival_date_year
ORDER BY YEAR DESC;
