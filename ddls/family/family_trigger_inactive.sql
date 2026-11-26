-- Trigger para desativar membros quando família ficar inativa
-- DROP TRIGGER trg_family_inactive;
DELIMITER $$
CREATE TRIGGER trg_family_inactive
BEFORE UPDATE ON tb_family
FOR EACH ROW
BEGIN
    IF NEW.family_status = 'INATIVO' AND OLD.family_status = 'ATIVO' THEN        
        
        UPDATE tb_member 
        SET member_departure_at = current_timestamp()
        WHERE family_id = NEW.family_id 
        AND member_departure_at IS NULL;
        
    END IF;
END $$
DELIMITER ;