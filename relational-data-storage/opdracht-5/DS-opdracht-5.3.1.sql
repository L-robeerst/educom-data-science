CREATE VIEW v_DIRECTIE AS
SELECT 
	supplier_ID, 
    mhl_contacts.name AS contact, 
    mhl_contacts.contacttype AS functie,
    mhl_departments.name AS department
FROM mhl_contacts
JOIN mhl_departments ON department=mhl_departments.id
WHERE mhl_departments.name="Directie" OR contacttype LIKE '%directeur%';