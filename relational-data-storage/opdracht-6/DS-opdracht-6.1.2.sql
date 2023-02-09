SELECT
mhl_communes.name,
mhl_suppliers.name,
SUM(mhl_hitcount.hitcount) as totale_hitcount,
avg_gemeente.average_hitcount
FROM mhl_suppliers
JOIN mhl_cities ON mhl_suppliers.city_ID = mhl_cities.id
JOIN mhl_communes ON mhl_cities.commune_ID = mhl_communes.id
JOIN mhl_districts ON mhl_communes.district_ID = mhl_districts.id
JOIN mhl_countries ON mhl_districts.country_ID = mhl_countries.ID
JOIN mhl_hitcount ON mhl_suppliers.id = mhl_hitcount.supplier_ID

JOIN ( SELECT avg(hita.hitcount) as average_hitcount, coma.name AS name 
FROM mhl_suppliers AS supa
JOIN mhl_cities as cta ON supa.city_ID = cta.id
JOIN mhl_communes as coma ON cta.commune_ID = coma.id
JOIN mhl_districts as disa ON coma.district_ID = disa.id
JOIN mhl_countries as couna ON disa.country_ID = couna.ID
JOIN mhl_hitcount as hita ON supa.id = hita.supplier_ID
WHERE couna.name = 'Nederland'
GROUP BY coma.name
) AS avg_gemeente ON avg_gemeente.name = mhl_communes.name

WHERE mhl_countries.name = 'Nederland'
GROUP BY mhl_suppliers.name
HAVING totale_hitcount > average_hitcount
ORDER BY mhl_communes.name, (SUM(mhl_hitcount.hitcount)-average_hitcount) DESC;