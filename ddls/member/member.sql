DROP TABLE tb_member;

-- Tabela de Membros
CREATE TABLE IF NOT EXISTS tb_member (
    member_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    person_id BIGINT NOT NULL,
    family_id BIGINT NOT NULL,
    member_entry_at DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP) COMMENT 'Data da entrada do membro na família',
    member_departure_at DATETIME DEFAULT NULL COMMENT 'Data da saída do membro da família iniciada com vazia (null)',    
    
    -- Chaves Estrangeiras
    CONSTRAINT fk_member_person FOREIGN KEY (person_id) 
        REFERENCES tb_person(person_id) ON DELETE CASCADE,
    CONSTRAINT fk_member_family FOREIGN KEY (family_id) 
        REFERENCES tb_family(family_id) ON DELETE CASCADE,
    
    -- Constraint para garantir que não haja sobreposição de períodos
    CONSTRAINT chk_member_periodo_valido CHECK (
        member_departure_at IS NULL OR member_departure_at >= member_entry_at
    )
)ENGINE=InnoDB;

-- Adicionando novos membros
INSERT INTO tb_member (person_id, family_id) VALUES (1,1), (2,1);
INSERT INTO tb_member (person_id, family_id) VALUES (3,2), (4,2);
INSERT INTO tb_member (person_id, family_id) VALUES (4,1);

-- Alterando a pessoa de família
CALL sp_member_update(3, 1);

SELECT * FROM tb_member;





