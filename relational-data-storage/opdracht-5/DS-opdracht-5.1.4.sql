SELECT mhl_suppliers.name, SUM(hitcount) AS numhits, COUNT(month) AS nummonths, AVG(hitcount)
FROM mhl.mhl_hitcount
JOIN mhl.mhl_suppliers on mhl.mhl_hitcount.supplier_ID = mhl.mhl_suppliers.id
GROUP BY supplier_ID;