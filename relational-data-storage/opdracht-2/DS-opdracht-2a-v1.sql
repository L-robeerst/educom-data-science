CREATE TABLE shadow_mhl_districts as
SELECT * FROM mhl_districts WHERE country_ID NOT IN (SELECT id FROM mhl_countries);
DELETE FROM mhl_districts WHERE country_ID NOT IN (SELECT id FROM mhl_countries);
CREATE TABLE shadow_mhl_communes as
SELECT * FROM mhl_communes WHERE district_ID NOT IN (SELECT id FROM mhl_districts);
DELETE FROM mhl_communes WHERE district_ID NOT IN (SELECT id FROM mhl_districts);
CREATE TABLE shadow_mhl_cities as
SELECT * FROM mhl_cities WHERE commune_ID NOT IN (SELECT id FROM mhl_communes);
DELETE FROM mhl_cities WHERE commune_ID NOT IN (SELECT id FROM mhl_communes);
CREATE TABLE shadow_mhl_suppliers as
SELECT * FROM mhl_suppliers WHERE membertype NOT IN (SELECT id FROM mhl_membertypes)
OR city_ID NOT IN (SELECT id FROM mhl_cities)
OR P_city_ID NOT IN (SELECT id FROM mhl_cities)
OR postcode NOT IN (SELECT pc6 FROM pc_lat_long)
OR (p_postcode NOT IN (SELECT pc6 FROM pc_lat_long) AND NOT p_postcode = '')
OR (company NOT IN (SELECT id FROM mhl_companies) AND NOT company = 0);
DELETE FROM mhl_suppliers WHERE membertype NOT IN (SELECT id FROM mhl_membertypes)
OR city_ID NOT IN (SELECT id FROM mhl_cities)
OR P_city_ID NOT IN (SELECT id FROM mhl_cities)
OR postcode NOT IN (SELECT pc6 FROM pc_lat_long)
OR (p_postcode NOT IN (SELECT pc6 FROM pc_lat_long) AND NOT p_postcode = '')
OR (company NOT IN (SELECT id FROM mhl_companies) AND NOT company = 0);
CREATE TABLE shadow_mhl_hitcount as
SELECT * FROM mhl_hitcount WHERE supplier_ID NOT IN (SELECT id FROM mhl_suppliers);
DELETE FROM mhl_hitcount WHERE supplier_ID NOT IN (SELECT id FROM mhl_suppliers);
CREATE TABLE shadow_mhl_contacts as
SELECT * FROM mhl_contacts WHERE department NOT IN (SELECT id FROM mhl_departments);
DELETE FROM mhl_contacts WHERE department NOT IN (SELECT id FROM mhl_departments);
CREATE TABLE shadow_mhl_detaildefs as
SELECT * FROM mhl_detaildefs WHERE group_ID NOT IN (SELECT id FROM mhl_detailgroups);
DELETE FROM mhl_detaildefs WHERE group_ID NOT IN (SELECT id FROM mhl_detailgroups); 
CREATE TABLE shadow_mhl_detaildefs_2 as
SELECT * FROM mhl_detaildefs WHERE propertytype_ID NOT IN (SELECT id FROM mhl_propertytypes) AND NOT propertytype_ID = 0;
DELETE FROM mhl_detaildefs WHERE propertytype_ID NOT IN (SELECT id FROM mhl_propertytypes) AND NOT propertytype_ID = 0;
CREATE TABLE shadow_mhl_properties as
SELECT * FROM mhl_properties WHERE propertytype_ID NOT IN (SELECT id FROM mhl_propertytypes);
DELETE FROM mhl_properties WHERE propertytype_ID NOT IN (SELECT id FROM mhl_propertytypes);
CREATE TABLE shadow_mhl_yn_properties as
SELECT * FROM mhl_yn_properties WHERE propertytype_ID NOT IN (SELECT id FROM mhl_propertytypes);
DELETE FROM mhl_yn_properties WHERE propertytype_ID NOT IN (SELECT id FROM mhl_propertytypes);
CREATE TABLE shadow_mhl_properties_2 as
SELECT * FROM mhl_properties WHERE supplier_ID NOT IN (SELECT id FROM mhl_suppliers);
DELETE FROM mhl_properties WHERE supplier_ID NOT IN (SELECT id FROM mhl_suppliers);
CREATE TABLE shadow_mhl_yn_properties_2 as
SELECT * FROM mhl_yn_properties WHERE supplier_ID NOT IN (SELECT id FROM mhl_suppliers);
DELETE FROM mhl_yn_properties WHERE supplier_ID NOT IN (SELECT id FROM mhl_suppliers);
CREATE TABLE shadow_mhl_suppliers_mhl_rubriek_view as
SELECT * FROM mhl_suppliers_mhl_rubriek_view WHERE mhl_suppliers_ID NOT IN (SELECT id FROM mhl_suppliers);
DELETE FROM mhl_suppliers_mhl_rubriek_view WHERE mhl_suppliers_ID NOT IN (SELECT id FROM mhl_suppliers);
CREATE TABLE shadow_mhl_suppliers_mhl_rubriek_view_2 as
SELECT * FROM mhl_suppliers_mhl_rubriek_view WHERE mhl_rubriek_view_ID NOT IN (SELECT id FROM mhl_rubrieken);
DELETE FROM mhl_suppliers_mhl_rubriek_view WHERE mhl_rubriek_view_ID NOT IN (SELECT id FROM mhl_rubrieken);

ALTER TABLE mhl_districts
ADD FOREIGN KEY (country_ID) REFERENCES mhl_countries(id);
ALTER TABLE mhl_communes
ADD FOREIGN KEY (district_ID) REFERENCES mhl_districts(id);
ALTER TABLE mhl_cities
ADD FOREIGN KEY (commune_ID) REFERENCES mhl_communes(id);
ALTER TABLE mhl_hitcount
ADD FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);
ALTER TABLE mhl_contacts
ADD FOREIGN KEY (department) REFERENCES mhl_departments(id);
ALTER TABLE mhl_detaildefs
ADD FOREIGN KEY (group_ID) REFERENCES mhl_detailgroups(id);
ALTER TABLE mhl_detaildefs MODIFY propertytype_ID INT;
UPDATE mhl_detaildefs 
SET propertytype_ID = NULL WHERE propertytype_ID = 0;
ALTER TABLE mhl_detaildefs
ADD FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);
ALTER TABLE mhl_properties
ADD FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);
ALTER TABLE mhl_yn_properties
ADD FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);
ALTER TABLE mhl_properties
ADD FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);
ALTER TABLE mhl_yn_properties
ADD FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);
ALTER TABLE mhl_suppliers_mhl_rubriek_view
ADD FOREIGN KEY (mhl_suppliers_ID) REFERENCES mhl_suppliers(id);
ALTER TABLE mhl_suppliers_mhl_rubriek_view
ADD FOREIGN KEY (mhl_rubriek_view_ID) REFERENCES mhl_rubrieken(id);
ALTER TABLE mhl_suppliers
ADD FOREIGN KEY (membertype) REFERENCES mhl_membertypes(id);
ALTER TABLE mhl_suppliers
ADD FOREIGN KEY (city_ID) REFERENCES mhl_cities(id);
ALTER TABLE mhl_suppliers
ADD FOREIGN KEY (P_city_ID) REFERENCES mhl_cities(id);
ALTER TABLE mhl_suppliers
ADD FOREIGN KEY (postcode) REFERENCES pc_lat_long(pc6);
UPDATE mhl_suppliers 
SET p_postcode = NULL WHERE p_postcode = '';
ALTER TABLE mhl_suppliers
ADD FOREIGN KEY (p_postcode) REFERENCES pc_lat_long(pc6);
ALTER TABLE mhl_suppliers MODIFY company INT;
UPDATE mhl_suppliers 
SET company = NULL WHERE company = 0;
ALTER TABLE mhl_suppliers
ADD FOREIGN KEY (company) REFERENCES mhl_companies(id);


SELECT 
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 'mhl';