SELECT S.ID, IFNULL(H.name, S.name) AS hoofdrubriek, IF(ISNULL(H.name), '', S.name) AS subrubriek
FROM mhl.mhl_rubrieken S
left JOIN mhl.mhl_rubrieken H ON S.parent = H.id
ORDER BY hoofdrubriek, subrubriek