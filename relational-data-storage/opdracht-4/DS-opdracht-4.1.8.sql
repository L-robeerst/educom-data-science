SELECT C1.name, C1.id AS cid1, C2.id AS cid2, G1.id AS gid1, G2.id AS gid2, G1.name AS gemeente_1, G2.name AS gemeente_2 
FROM mhl.mhl_cities AS C1
JOIN mhl.mhl_cities AS C2 ON C1.name = C2.name
JOIN mhl.mhl_communes AS G1 ON C1.commune_id = G1.id
JOIN mhl.mhl_communes AS G2 ON C2.commune_id = G2.id
WHERE C1.id < C2.id
ORDER BY C1.name;