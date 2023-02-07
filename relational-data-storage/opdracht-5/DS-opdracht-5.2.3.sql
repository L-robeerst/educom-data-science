SELECT 
	year, 
    SUM(IF(month < 4, hitcount,0)) as eerste_kwartaal,
    SUM(IF(month >3 AND month < 7 , hitcount,0)) as tweede_kwartaal,
    SUM(IF(month >6 AND month < 10 , hitcount,0)) as derde_kwartaal,
    SUM(IF(month > 9, hitcount,0)) as vierde_kwartaal,
    SUM(hitcount) as totaal
FROM mhl.mhl_hitcount
GROUP BY year;