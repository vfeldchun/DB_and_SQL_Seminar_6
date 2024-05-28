-- Задание 1
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP PROCEDURE IF EXISTS convert_sec; 
DELIMITER // 

CREATE PROCEDURE convert_sec
(
	IN seconds INT
)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE sec_reminder INT;
    
    SET days = TRUNCATE(seconds / 86400, 0); -- 60 * 60 * 24 = 86400
    SET hours = TRUNCATE((seconds -  days * 86400) / 3600, 0); -- 60 * 60 = 3600
    SET minutes = TRUNCATE((seconds - days * 86400 - hours * 3600) / 60, 0);
    SET sec_reminder = seconds - days * 86400 - hours * 3600 - minutes * 60;
    
    SELECT CONCAT (
	days, " days ", 
        hours, " hours ",
        minutes, " minutes ",
        sec_reminder, " seconds"
    ) AS 'Time String';	
END //

DELIMITER ;

-- Вызов процедуры 
CALL convert_sec (123456);
