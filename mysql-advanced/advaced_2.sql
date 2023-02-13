DELIMITER $$

CREATE PROCEDURE p_get_total_order(IN customer INT)
BEGIN
    DECLARE totalOrderCustomer INT DEFAULT 0;
    
    SELECT COUNT(*) 
    INTO totalOrderCustomer
    FROM orders
    WHERE customerNumber = customer;
    
    SELECT totalOrderCustomer;
END$$

DELIMITER ;