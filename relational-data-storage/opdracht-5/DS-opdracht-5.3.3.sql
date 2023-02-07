SELECT
	S.name,
	IFNULL(D.contact, 'tav de directie') AS contact,
	P.adres,
	P.postcode,
	P.stad
FROM mhl_suppliers AS S
JOIN POSTADRES AS P ON P.ID=S.ID
LEFT JOIN V_DIRECTIE AS D ON D.supplier_ID=S.ID