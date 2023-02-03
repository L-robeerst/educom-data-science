SELECT name, straat, huisnr, postcode
FROM mhl.mhl_suppliers
WHERE city_ID = 104 AND NOT p_city_ID = 104;