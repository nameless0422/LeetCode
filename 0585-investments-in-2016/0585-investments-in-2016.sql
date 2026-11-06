WITH FilteredTiv AS (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
FilteredLoc AS (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
)
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN FilteredTiv f_tiv ON i.tiv_2015 = f_tiv.tiv_2015
JOIN FilteredLoc f_loc ON i.lat = f_loc.lat AND i.lon = f_loc.lon;