SELECT 
concat(IFNULL(H.name, S.name), IF(ISNULL(H.name), '', ' - '),   IF(ISNULL(H.name), '', S.name)) AS Rubriek_name,
IFNULL(sum(mhl_hitcount.hitcount), 'Geen hits')
FROM mhl_rubrieken AS S
LEFT JOIN mhl_suppliers_mhl_rubriek_view ON mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID = S.id
LEFT JOIN mhl_suppliers ON mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID = mhl_suppliers.id
LEFT JOIN mhl_hitcount ON mhl_suppliers.id = mhl_hitcount.supplier_ID
LEFT JOIN mhl.mhl_rubrieken AS H ON S.parent = H.id
GROUP BY Rubriek_name
ORDER BY Rubriek_name;