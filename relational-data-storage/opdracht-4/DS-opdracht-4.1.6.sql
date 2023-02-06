SELECT H.hitcount, S.name AS leverancier, P.name AS stad, G.name AS gemeente, D.name AS provincie
FROM mhl.mhl_suppliers S
JOIN mhl.mhl_hitcount H ON S.ID = H.supplier_ID
JOIN mhl.mhl_cities P ON P.id = S.city_ID
JOIN mhl.mhl_communes G ON G.id = P.commune_ID
JOIN mhl.mhl_districts D ON D.id = G.district_ID
WHERE (D.id = 6 OR D.id = 7 OR D.id = 11) AND H.year=2014 AND H.month=1;