SELECT
  *,
  (SELECT
    ROUND(ROUND((total_qty * 100), 2) / SUM(quantity), 2)
  FROM invoiceline)
  percentage

FROM (SELECT
  m.name media_type,
  SUM(quantity) AS total_qty
FROM mediatype m
JOIN track t
  ON t.mediatypeid = m.mediatypeid
JOIN invoiceline il
  ON il.trackid = t.trackid
GROUP BY 1
ORDER BY 2 DESC) subquery;