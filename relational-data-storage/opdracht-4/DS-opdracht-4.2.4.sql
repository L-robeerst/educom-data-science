SELECT mhl.mhl_suppliers.name, mhl.mhl_propertytypes.name, IFNULL(mhl.mhl_yn_properties.content, "NOT SET") as value
FROM mhl.mhl_suppliers
CROSS JOIN mhl.mhl_propertytypes
LEFT JOIN mhl.mhl_yn_properties ON mhl.mhl_suppliers.id = mhl.mhl_yn_properties.supplier_ID and mhl.mhl_propertytypes.id = mhl.mhl_yn_properties.propertytype_ID
WHERE mhl.mhl_suppliers.city_ID = 104 AND mhl.mhl_propertytypes.proptype = "A";