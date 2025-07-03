-- The Most Month Has Regesterations Over The Year
SELECT arrival_date_year AS Year,
	arrival_date_month AS Month,
	COUNT(hotel) AS Regesterations
FROM Hotel
GROUP BY arrival_date_year , arrival_date_month
ORDER BY YEAR DESC , Regesterations DESC;

-- What is the profit percentage for each month across all years?
SELECT arrival_date_year,
	arrival_date_month,
	FORMAT((SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) / 
	(SELECT SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) AS Total_Profits
	FROM Hotel)) , 'P2')  AS Profit_Percentage 
FROM Hotel
GROUP BY arrival_date_year,arrival_date_month
ORDER BY arrival_date_year;

-- Type Of Customer(adult , children , babies) Of Regesterations Over The Year
SELECT arrival_date_year AS Year,
	FORMAT(SUM(adults)/ SUM(adults + children + babies),'P2') AS Adults,
	FORMAT(SUM(children)/ SUM(adults + children + babies),'P2') AS Children,
	FORMAT(SUM(babies)/ SUM(adults + children + babies),'P2') AS Babies
FROM Hotel
GROUP BY arrival_date_year
ORDER BY Year DESC;