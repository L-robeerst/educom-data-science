SELECT mhl.mhl_cities.name AS stads_naam, IFNULL(mhl.mhl_communes.name,"invalid") AS gemeente_naam 
FROM mhl.mhl_cities 
LEFT JOIN mhl.mhl_communes ON mhl.mhl_communes.ID = mhl.mhl_cities.commune_ID;
