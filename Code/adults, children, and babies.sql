-- What is the annual count of adults, children, and babies in the bookings?
SELECT arrival_date_year AS Year,
	SUM(adults)  AS 'Adults',
	SUM(children) AS 'Children',
	SUM(babies) AS 'Babies'
FROM All_Hotel_Data
GROUP BY arrival_date_year
ORDER BY Year DESC;
