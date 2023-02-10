SELECT
name,
CASE WHEN name LIKE '\'%'
	 THEN CONCAT(LOWER(SUBSTRING(name, 1, 2)), UPPER(SUBSTRING(name, 3, 2)), SUBSTRING(name, 5))
	 ELSE CONCAT(UPPER(SUBSTRING(name, 1, 1)), SUBSTRING(name, 2))
     END AS nice_name
FROM mhl_cities
ORDER BY name
--- \ laat het volgende teken leterlijk implementeren