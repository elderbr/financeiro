-- DROP TRIGGER trg_validate_family_member_insert;

DELIMITER $$

CREATE TRIGGER trg_validate_member_insert
BEFORE INSERT ON tb_member
FOR EACH ROW
BEGIN

    -- Verifica somente vínculos ativos
    IF NEW.member_departure_at IS NULL THEN

        -- Procura o usuário se está com vínculo ativo com alguma família
        IF EXISTS (
            SELECT 1
            FROM tb_member fm
            WHERE 
              fm.person_id = NEW.person_id
              AND fm.member_departure_at IS NULL
        ) THEN

            -- Impede a inserção
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Esta pessoa já possui um vínculo ativo!';

        END IF;

    END IF;

END $$

DELIMITER ;
