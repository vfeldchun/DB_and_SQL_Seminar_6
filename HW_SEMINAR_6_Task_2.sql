-- Задание 2
-- Выведите только чётные числа от 1 до 10.
-- Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS print_even_number_in_range; 
DELIMITER // 

CREATE PROCEDURE print_even_number_in_range
(
	IN start_number INT,
    IN end_number INT
)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE result TEXT DEFAULT '';
    
    -- Установим стартоое четное число
    SET i = IF(ABS(start_number) % 2 = 0, start_number, start_number + 1);
    
	-- Определим количество четных чисел
	WHILE i <= end_number DO
		SET result = CONCAT(result, i, ' ');
        SET i = i + 2;
	END WHILE;
    
    -- Выводим результат
    SELECT RTRIM(result) AS 'Even Numbers';
END //

DELIMITER ;

-- Вызов процедуры 
CALL print_even_number_in_range (-11, 15);