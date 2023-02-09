SELECT
mhl_hitcount.year,
v_maanden.name,
count(mhl_hitcount.supplier_ID) as aantal_leveranciers,
SUM(hitcount) AS total_hit
FROM mhl_hitcount
JOIN v_maanden ON v_maanden.id = mhl_hitcount.month
GROUP BY year, month 
ORDER BY year DESC, month DESC
---waarom in het voorbeeld antwoord opgeslpitst in 2 selects? het lijkt onnodig en maakt de querrie alleen maar ingewikkelder