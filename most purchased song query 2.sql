SELECT
  g.Name AS genre,
  COUNT(*) AS num_of_purchases
FROM Genre g
JOIN Track t
  ON g.GenreId = t.GenreId
JOIN InvoiceLine il
  ON t.TrackId = il.TrackId
GROUP BY 1
ORDER BY 2;
