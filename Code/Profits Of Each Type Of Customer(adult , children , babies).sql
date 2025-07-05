-- Type Of Customer(adult , children , babies)
SELECT arrival_date_year AS Year,
	FORMAT(SUM(adults)/ SUM(adults + children + babies),'P2') AS Adults,
	FORMAT(SUM(children)/ SUM(adults + children + babies),'P2') AS Children,
	FORMAT(SUM(babies)/ SUM(adults + children + babies),'P2') AS Babies
FROM Hotel
GROUP BY arrival_date_year
ORDER BY Year DESC;