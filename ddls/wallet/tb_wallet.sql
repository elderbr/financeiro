DROP TABLE tb_wallet;
CREATE TABLE IF NOT EXISTS tb_wallet (
	wallet_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    wallet_name VARCHAR(50) NOT NULL,
    wallet_create_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    wallet_update_at DATETIME NOT NULL DEFAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    wallet_active TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Ativo, 0=Inativo (Soft Delete)',
    person_id BIGINT NOT NULL,
    wallet_type ENUM('Pessoal', 'Familiar') NOT NULL DEFAULT 'Pessoal',
    CONSTRAINT fk_wallet_person FOREIGN KEY (person_id) 
        REFERENCES tb_person(person_id),
	-- Não permite adicionar os mesmo nome de conta para o mesma pessoa
    UNIQUE KEY uq_wallet_person (person_id, wallet_name),    
	INDEX idx_wallet_name (wallet_name),
    -- Verifica se o nome contém mais do que 2 caracteres
    CONSTRAINT chk_wallet_name
        CHECK (CHAR_LENGTH(TRIM(wallet_name)) > 2),
	-- Verifica se está ativo ou não esperando o número 0 ou 1, sendo 0 para desativado 1 para ativado
    CONSTRAINT chk_wallet_active
        CHECK (wallet_active IN (0, 1)),
	-- Verificando se o tipo de conta é Pessoal ou Familiar, sendo 1 para Pessoal e 2 para Familiar
	CONSTRAINT chk_wallet_type
        CHECK (wallet_type IN ('Pessoal', 'Familiar'))
)ENGINE=InnoDB;

-- 1) Deve FALHAR (active = 2)
INSERT INTO tb_wallet (person_id, wallet_name, wallet_active)
VALUES (1, 'Teste', 2);
-- Erro esperado: Check constraint 'chk_wallet_active' violated

-- 2) Deve FALHAR (nome com 2 caracteres ou menos)
INSERT INTO tb_wallet (person_id, wallet_name) VALUES (1, 'AB');
-- Erro esperado: Check constraint 'chk_wallet_name' violated

-- 3) Deve FALHAR (wallet_type inválido)
INSERT INTO tb_wallet (person_id, wallet_name, wallet_type) 
VALUES (1, 'Teste', 'Outro');
-- Erro esperado: Data truncated for column 'wallet_type'

-- 4) Deve PASSAR (nomes duplicados para pessoas diferentes)
INSERT INTO tb_wallet (person_id, wallet_name) VALUES (1, 'PicPay');
INSERT INTO tb_wallet (person_id, wallet_name) VALUES (2, 'Itaú');
-- Ambos devem ser criados

-- 5) Deve FALHAR (pessoa com conta não pode ser deletada)
DELETE FROM tb_person WHERE person_id = 1;
-- Erro esperado: Cannot delete or update a parent row: a foreign key constraint fails



SELECT * FROM tb_wallet;