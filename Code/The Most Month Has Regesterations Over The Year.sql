--The Most Month Has Regesterations Over The Year
SELECT arrival_date_year AS Year,
	arrival_date_month AS Month,
	COUNT(hotel) AS Regesterations
FROM Hotel
GROUP BY arrival_date_year , arrival_date_month
ORDER BY YEAR DESC , Regesterations DESC;