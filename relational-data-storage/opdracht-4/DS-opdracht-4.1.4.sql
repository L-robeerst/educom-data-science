SELECT mhl.mhl_suppliers.name, mhl.mhl_suppliers.straat, mhl.mhl_suppliers.huisnr, mhl.mhl_suppliers.postcode
FROM mhl.mhl_suppliers
JOIN mhl.mhl_yn_properties ON mhl.mhl_yn_properties.supplier_ID = mhl.mhl_suppliers.ID
JOIN mhl.mhl_propertytypes ON  mhl.mhl_propertytypes.ID = mhl.mhl_yn_properties.propertytype_ID 
WHERE mhl.mhl_propertytypes.ID = 462 OR mhl.mhl_propertytypes.ID = 467;

--of nog simpeler

SELECT mhl.mhl_suppliers.name, mhl.mhl_suppliers.straat, mhl.mhl_suppliers.huisnr, mhl.mhl_suppliers.postcode
FROM mhl.mhl_suppliers
JOIN mhl.mhl_yn_properties ON mhl.mhl_yn_properties.supplier_ID = mhl.mhl_suppliers.ID 
WHERE mhl.mhl_yn_properties.propertytype_ID = 462 OR mhl.mhl_yn_properties.propertytype_ID = 467;