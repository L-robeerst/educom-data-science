SELECT mhl.mhl_suppliers.name, mhl.mhl_suppliers.straat, mhl.mhl_suppliers.huisnr, mhl.mhl_suppliers.postcode, mhl.mhl_cities.name as plaatsnaam
FROM mhl.mhl_suppliers
JOIN mhl.mhl_cities ON  mhl.mhl_cities.ID = mhl.mhl_suppliers.city_ID
WHERE mhl.mhl_cities.ID = 430;