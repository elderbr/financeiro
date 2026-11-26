-- Criação PROCEDURE para atualização na transferencia de como membro da família
-- DROP PROCEDURE sp_member_update;

DELIMITER $$

CREATE PROCEDURE sp_member_update(
	IN p_person_id BIGINT,
    IN p_family_id BIGINT
)
BEGIN
	-- Criando váriavel
    DECLARE v_family_id BIGINT;
    
    START TRANSACTION;    
		
		SELECT family_id INTO v_family_id FROM tb_member WHERE person_id = p_person_id AND member_departure_at IS NULL;
        
        -- Verificar se a pessoa já pertence a família
        IF v_family_id = p_family_id THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'A pessoa já pertence a esta família.';
		END IF;
        
        -- Adicionando a data da saída da como membro da família
        UPDATE tb_member SET member_departure_at = current_timestamp() WHERE person_id = p_person_id AND member_departure_at IS NULL;
        
        -- Adicionando a pessoa como novo membro da família
        INSERT INTO tb_member (person_id, family_id) VALUES (p_person_id, p_family_id);
        
        SELECT * FROM tb_member WHERE person_id = p_person_id AND member_departure_at IS NULL;
    
    -- Confirma as duas operações
    COMMIT;

END$$

DELIMITER ;
