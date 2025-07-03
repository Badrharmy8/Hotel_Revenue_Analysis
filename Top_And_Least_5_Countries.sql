-- Top 5 AND Least 5 Countries Has Regesterations For Each Year
-- Top 5
SELECT Year ,
	country ,
	Regestartions
FROM(
	SELECT arrival_date_year AS Year,
		country,
		COUNT(hotel) AS Regestartions,
		ROW_NUMBER() OVER(PARTITION BY arrival_date_year ORDER BY COUNT(hotel) DESC) AS Row_Number
	FROM Hotel
	GROUP BY arrival_date_year , country) AS Ranked_Data
WHERE Row_Number IN (1 , 2 , 3 , 4 , 5)	
ORDER BY Year DESC , Regestartions DESC;
-- Least 5
SELECT Year ,
	country ,
	Regestartions
FROM(
	SELECT arrival_date_year AS Year,
		country,
		COUNT(hotel) AS Regestartions,
		ROW_NUMBER() OVER(PARTITION BY arrival_date_year ORDER BY COUNT(hotel)) AS Row_Number
	FROM Hotel
	GROUP BY arrival_date_year , country) AS Ranked_Data
WHERE Row_Number IN (1 , 2 , 3 , 4 , 5)	
ORDER BY Year DESC , Regestartions DESC;