DELIMITER $$
CREATE TRIGGER trg_inv_before_insert
BEFORE INSERT ON tb_investiment
FOR EACH ROW
BEGIN
     -- Verifica se o nome possui pelo menos 3 caracteres
    IF CHAR_LENGTH(NEW.investiment_name) < 3 THEN

        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO = 50001,
                MESSAGE_TEXT = 'INV001';
    END IF;

    -- Verifica se o valor inicial é maior que zero
    IF NEW.investiment_value_initial < 0 THEN

        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO = 50002,
                MESSAGE_TEXT = 'INV002';
    END IF;
END$$
DELIMITER ;