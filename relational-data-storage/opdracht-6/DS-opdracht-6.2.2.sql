SELECT
    name,
    REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(name, 
    '&Uuml;', 'Ü'),
    '&eacute;', 'é'),
    '&euml;', 'ë'),
    '&egrave;', 'è'),
	'&ouml;', 'ö'),
	'&iuml;','ï'),
    '&acirc;', 'â') AS nice_name
FROM mhl_suppliers
WHERE name LIKE'%&%' AND NOT name LIKE '% & %' AND NOT name LIKE '%& %' AND name LIKE '%;%' LIMIT 25