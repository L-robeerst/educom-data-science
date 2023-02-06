SELECT mhl.mhl_suppliers.name, mhl.mhl_suppliers.straat, mhl.mhl_suppliers.huisnr, mhl.mhl_suppliers.postcode, mhl.pc_lat_long.lat, mhl.pc_lat_long.lng
FROM mhl.mhl_suppliers
JOIN mhl.pc_lat_long ON mhl.pc_lat_long.pc6 = mhl.mhl_suppliers.postcode
ORDER BY mhl.pc_lat_long.lat DESC
LIMIT 5;