SELECT  S.name AS leverancier, 
	    IFNULL(C.name, 'tav de directie') AS aanhef, 
	    IF (S.p_address<>'', S.p_address, CONCAT(S.straat, ' ', S.huisnr)) AS adres, 
		IF (S.p_address<>'', S.P_postcode, S.postcode) AS postcode, 
		IF (S.p_address<>'', V.name, P.name) AS stad, 
		IF (S.p_address<>'', VP.name, PP.name) AS provincie
FROM mhl.mhl_suppliers AS S
LEFT JOIN mhl.mhl_cities AS V ON V.ID=S.city_ID
LEFT JOIN mhl.mhl_communes AS VC ON VC.ID=V.commune_ID
LEFT JOIN mhl.mhl_districts AS VP ON VP.ID=VC.district_ID
LEFT JOIN mhl.mhl_cities AS P ON P.ID=S.p_city_ID
LEFT JOIN mhl.mhl_communes AS PC ON PC.ID=P.commune_ID
LEFT JOIN mhl.mhl_districts AS PP ON PP.ID=PC.district_ID
LEFT JOIN mhl.mhl_contacts AS C ON S.ID=C.supplier_ID AND C.department=3;