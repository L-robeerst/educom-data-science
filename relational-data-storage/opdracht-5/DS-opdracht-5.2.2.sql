SELECT 
	C.name AS stad, 
	COUNT(IF(M.name='Gold',1,NULL))AS Gold,
    COUNT(IF(M.name='Silver',1,NULL))AS Silver,
    COUNT(IF(M.name='Bronze',1,NULL))AS Bronze,
    COUNT(IF(M.name<>'Gold' AND M.name<>'Silver' AND M.name<>'Bronze' ,1,NULL)) AS Other
FROM mhl.mhl_suppliers AS S
JOIN mhl.mhl_cities AS C ON S.city_ID = C.id
JOIN mhl.mhl_membertypes AS M ON S.membertype= M.id
GROUP BY C.id
ORDER BY Gold DESC, Silver DESC, Bronze DESC, Other DESC;