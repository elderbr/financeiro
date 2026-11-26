DROP TABLE tb_renda;

CREATE TABLE IF NOT EXISTS tb_renda (
	renda_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_id INTEGER NOT NULL COMMENT 'ID do usuário dono da renda',
    renda_name VARCHAR(30) NOT NULL COMMENT 'Nome da renda',
    renda_value DECIMAL(10,2) NOT NULL,
    renda_fixa BOOLEAN NOT NULL DEFAULT 0,
    renda_dia_recebimento TINYINT NOT NULL DEFAULT 0,
    renda_familiar ENUM('Pessoal', 'Familiar') NOT NULL DEFAULT 'Pessoal',
    renda_carteira_id INTEGER NOT NULL,
    CONSTRAINT fk_renda_usuario FOREIGN KEY (usuario_id) 
                         REFERENCES tb_usuarios(usuarios_id),
	CONSTRAINT fk_renda_carteira FOREIGN KEY (renda_carteira_id) 
                         REFERENCES tb_carteira(carteira_id),
	
    -- Constraints
    CONSTRAINT chk_renda_valor
        CHECK (renda_value > 0)
);
SELECT * FROM tb_renda;

CREATE TABLE IF NOT EXISTS tb_renda_historico (
	renda_historico_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    renda_id BIGINT NOT NULL COMMENT 'ID da renda',    
    renda_historico_value DECIMAL(10,2) NOT NULL,
    renda_historico_create_at DATE DEFAULT (CURRENT_DATE) COMMENT 'Dia da criação da renda fixa',
    renda_historico_update_at DATE DEFAULT (CURRENT_DATE) COMMENT 'Dia da atualização (fim) da renda fixa',
    CONSTRAINT fk_renda_historico_renda FOREIGN KEY (renda_id) 
                         REFERENCES tb_renda(renda_id),
	-- Constrains
    CONSTRAINT chk_renda_historico_valor
        CHECK (renda_historico_value > 0)
);
SELECT * FROM tb_renda_historico;