SELECT C1.name, C2.name, C1.id, C2.id, C1.commune_id, C2.commune_id
FROM mhl.mhl_cities C1
JOIN mhl.mhl_cities AS C2 ON C1.name = C2.name
WHERE C1.id < C2.id
ORDER BY C1.name