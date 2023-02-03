SELECT name, straat, huisnr, postcode
FROM mhl.mhl_suppliers
WHERE name LIKE '%&__%' AND name NOT LIKE '%& %';