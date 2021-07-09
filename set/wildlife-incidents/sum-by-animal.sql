SELECT "Species Common Name" AS Species,
       SUM("Sum of Number of Animals") AS Total

FROM animals.csv

GROUP BY "Species Common Name"
ORDER BY SUM("Sum of Number of Animals") DESC

LIMIT 10

