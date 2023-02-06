SELECT mhl.mhl_cities.name, mhl.mhl_cities.commune_ID 
FROM mhl.mhl_cities 
LEFT JOIN mhl.mhl_communes ON mhl.mhl_communes.ID = mhl.mhl_cities.commune_ID
WHERE mhl.mhl_communes.name IS NULL;