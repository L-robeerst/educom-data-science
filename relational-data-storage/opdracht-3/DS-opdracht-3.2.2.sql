SELECT name, straat, huisnr, postcode
FROM mhl.mhl_suppliers
WHERE membertype = 1 OR membertype = 2 OR membertype = 3 OR membertype = 8;