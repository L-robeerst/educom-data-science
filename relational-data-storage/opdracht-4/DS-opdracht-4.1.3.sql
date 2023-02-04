SELECT mhl.mhl_rubrieken.name as R_name, mhl.mhl_suppliers.name as S_name, mhl.mhl_suppliers.straat, mhl.mhl_suppliers.huisnr, mhl.mhl_suppliers.postcode
FROM mhl.mhl_suppliers
JOIN mhl.mhl_suppliers_mhl_rubriek_view ON  mhl.mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID = mhl.mhl_suppliers.ID
JOIN mhl.mhl_rubrieken ON  mhl.mhl_rubrieken.ID = Mhl.mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID
WHERE (mhl.mhl_rubrieken.id = 235 OR mhl.mhl_rubrieken.parent = 235) AND mhl.mhl_suppliers.city_ID = 104
ORDER BY mhl.mhl_rubrieken.name, mhl.mhl_suppliers.name;