CREATE TABLE `employeeArchive` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `date_fired` date DEFAULT NULL
);

DROP TRIGGER IF EXISTS employees_aur;

DELIMITER $$

CREATE TRIGGER employees_aur
AFTER UPDATE
ON employees FOR EACH ROW
BEGIN
    IF new.date_fired IS NOT NULL AND old.date_fired IS NULL THEN
        INSERT INTO employeearchive (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle, salary, date_hired, date_fired)
        VALUES (new.employeeNumber, new.lastName, new.firstName, new.extension, new.email, new.officeCode, new.reportsTo, new.jobTitle, new.salary, new.date_hired, new.date_fired);
    END IF;
END$$

DELIMITER ;




DROP FUNCTION IF EXISTS f_is_fired;

DELIMITER $$

CREATE FUNCTION f_is_fired (
    fire_date DATE
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE fstatus VARCHAR(5);
    
    IF fire_date IS NOT NULL THEN
        SET fstatus = 'FIRED';
    ELSE 
		SET fstatus = '';
    END IF;
    RETURN (fstatus);
END$$

DELIMITER ;




CREATE VIEW v_employee_status
AS 
SELECT 
    *, f_is_fired(date_fired)
FROM
    employees;



DELIMITER $$

CREATE PROCEDURE p_all_raise()
BEGIN
    UPDATE employees
    SET salary = salary*1.05 ;
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE p_get_customers()
BEGIN
    DELETE FROM employees
    WHERE date_fired IS NOT NULL;
END$$

DELIMITER ;

CREATE TABLE `salaryArchive` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `jobTitle` varchar(50) NOT NULL,
  `old_salary` int(11) DEFAULT NULL,
  `new_salary` int(11) DEFAULT NULL,
  `date_of_change` date DEFAULT NULL
);



DROP TRIGGER IF EXISTS employees_salary_aur;

DELIMITER $$

CREATE TRIGGER employees_salary_aur
AFTER UPDATE
ON employees FOR EACH ROW
BEGIN
        INSERT INTO salaryarchive (employeeNumber, lastName, firstName,  jobTitle, old_salary, new_salary, date_of_change)
        VALUES (new.employeeNumber, new.lastName, new.firstName, new.jobTitle, old.salary, new.salary, curdate() );
END$$

DELIMITER ;