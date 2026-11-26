DROP TABLE tb_credit_card;
CREATE TABLE IF NOT EXISTS tb_credit_card (
    credit_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    credit_limit DECIMAL(10,2) NOT NULL COMMENT 'Crédito limite do cartão não pode ser zero ou nulo',
    credit_percentage DECIMAL(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Limite para terceiros em porcentagem EX: 10.50',
    credit_update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    card_config_id BIGINT UNIQUE NOT NULL COMMENT 'FK para a configuração do cartão', 
    CONSTRAINT fk_limit_cardconfig FOREIGN KEY (card_config_id) 
        REFERENCES tb_card_config(card_config_id) ON DELETE CASCADE,
    INDEX idx_credit_limit(credit_update_at),
    -- Valido o valor do crédito do cartão deve ser superior que zero
    CONSTRAINT chk_credit_limit CHECK (credit_limit > 0),
    -- Valida o valor para uso de terceiros deve ser igual ou maior que zero
    CONSTRAINT chk_credit_percentage CHECK (credit_percentage >= 0)
);
INSERT INTO tb_credit_card (card_config_id, credit_limit, credit_percentage) VALUES (1, 10000.00, 15.52);
INSERT INTO tb_credit_card (card_config_id, credit_limit, credit_percentage) VALUES (2, -10, 10.00);
INSERT INTO tb_credit_card (card_config_id, credit_limit, credit_percentage) VALUES (1, 10000, -10.00);
INSERT INTO tb_credit_card (card_config_id, credit_limit, credit_percentage) VALUES (2, 8000.00, 20.00);
UPDATE tb_credit_card SET credit_percentage = 20.10 WHERE credit_id = 1;
SELECT * FROM tb_credit_card;

SELECT w.wallet_id, w.wallet_name, cred.credit_id, cred.credit_limit, cred.credit_percentage, w.wallet_type 
FROM tb_credit_card cred
INNER JOIN tb_card_config conf ON conf.card_config_id = cred.card_config_id
INNER JOIN tb_wallet w ON w.wallet_id = conf.wallet_id
;