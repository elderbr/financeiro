-- Configuração do cartão
DROP TABLE tb_card_config;
CREATE TABLE IF NOT EXISTS tb_card_config (
	card_config_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,    
    card_due_date DATE NOT NULL COMMENT 'Data de vencimento do cartão físico',
    card_pix VARCHAR(100) UNIQUE COMMENT 'Dados do Pix',
    card_pix_type ENUM('CPF', 'E-mail', 'Celular', 'Código') NULL,
    wallet_id BIGINT NOT NULL,
    CONSTRAINT fk_wallet_card FOREIGN KEY (wallet_id) 
        REFERENCES tb_wallet(wallet_id) ON DELETE CASCADE,
	CONSTRAINT chk_pix_type CHECK (
		card_pix_type IS NULL
        OR card_pix_type = 'CPF'
        OR card_pix_type = 'E-mail'
        OR card_pix_type = 'Celular'
        OR card_pix_type = 'Código'
	)
);

-- PERMITE INSERIR
INSERT INTO tb_card_config (card_due_date, card_pix, card_pix_type, wallet_id) VALUES (
	'2030-12-01', '#664%1234567890', 'Código', 1
);
INSERT INTO tb_card_config (card_due_date, card_pix, card_pix_type, wallet_id) VALUES (
	'2030-12-01', '32266188810', 'Celular', 2
);

-- Não permite
INSERT INTO tb_card_config (card_due_date, card_pix, card_pix_type, wallet_id) VALUES (
	'2030-12-01', '32266188811', 'Nome', 3
);


SELECT * FROM tb_card_config;