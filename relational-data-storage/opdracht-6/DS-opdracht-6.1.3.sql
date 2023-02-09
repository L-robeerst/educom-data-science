SELECT 
concat(IFNULL(H.name, S.name), IF(ISNULL(H.name), '', ' - '),   IF(ISNULL(H.name), '', S.name)) AS Rubriek_name, 
count(mhl_suppliers.id) as number_suppliers
FROM mhl_rubrieken AS S
JOIN mhl_suppliers_mhl_rubriek_view ON mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID = S.id
JOIN mhl_suppliers ON mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID = mhl_suppliers.id
left JOIN mhl.mhl_rubrieken AS H ON S.parent = H.id
GROUP BY Rubriek_name
ORDER BY Rubriek_name;