-- Use WHILE loop to display numbers 1 to 50
DELIMITER //
CREATE PROCEDURE DisplayNumbers()
BEGIN
    DECLARE num INT DEFAULT 1;
    WHILE num <= 50 DO
        SELECT num;
        SET num = num + 1;
    END WHILE;
END //
DELIMITER ;

-- Call the procedure
CALL DisplayNumbers();
