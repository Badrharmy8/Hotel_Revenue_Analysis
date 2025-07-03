--Which meals and market segments (e.g., families, corporate clients, etc.) contribute the most to the total revenue for each hotel annually?
-- meals contribution
SELECT H.arrival_date_year AS Year,
	H.meal AS Meal,
	COUNT(hotel) AS Regersterations
FROM Hotel H
LEFT OUTER JOIN meal_cost MC
ON H.meal = MC.meal
GROUP BY H.arrival_date_year,H.meal
ORDER BY YEAR DESC , Regersterations DESC;

-- market segments contribution
SELECT H.arrival_date_year AS YEAR,
	H.market_segment AS Market_Semgment,
	COUNT(H.hotel) AS Regesterations
FROM Hotel H
LEFT OUTER JOIN market_segment MS
ON H.market_segment = MS.market_segment
GROUP BY H.arrival_date_year , H.market_segment
ORDER BY YEAR DESC , Regesterations DESC;