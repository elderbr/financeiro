DROP TABLE tb_voucher;
CREATE TABLE IF NOT EXISTS tb_voucher (
    voucher_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,    
    voucher_day TINYINT UNSIGNED NOT NULL DEFAULT 1 
        COMMENT 'Primeiro dia do mês em que o crédito é recebido (1 a 31)',
    voucher_day_second TINYINT UNSIGNED NOT NULL DEFAULT 0 
        COMMENT 'Segundo dia do mês. 0 = não há segundo dia (pagamento único)',
    voucher_value DECIMAL(10,2) NOT NULL 
        COMMENT 'Valor da recarga mensal (deve ser > 0)',
    voucher_date_start CHAR(6) NOT NULL 
        COMMENT 'Formato YYYYMM. Ex: 202611',
    voucher_date_end CHAR(6) DEFAULT NULL 
        COMMENT 'Formato YYYYMM. NULL = vigência eterna',
    wallet_id BIGINT NOT NULL 
        COMMENT 'Código da conta (carteira)',
    
    -- Foreign Key
    CONSTRAINT fk_voucher_wallet FOREIGN KEY (wallet_id) 
        REFERENCES tb_wallet(wallet_id) ON DELETE CASCADE,
    
    -- Índice composto (já atende buscas por wallet_id sozinho)
    INDEX idx_voucher_vigencia(wallet_id, voucher_date_start, voucher_date_end),
    
    -- Validações de domínio (intervalos válidos)
    CONSTRAINT chk_voucher_day_range CHECK (voucher_day BETWEEN 1 AND 31),
    CONSTRAINT chk_voucher_day_second_range CHECK (voucher_day_second BETWEEN 0 AND 31),
    
    -- Validação de valor positivo
    CONSTRAINT chk_voucher_value CHECK (voucher_value > 0),
    
    -- Ordem cronológica condicional
    CONSTRAINT chk_ordem_cronologica CHECK (
        voucher_day_second = 0 OR voucher_day_second > voucher_day
    ),
    
    -- Validação de datas (fim deve ser maior que início, ou NULL)
    CONSTRAINT chk_voucher_date CHECK (
        voucher_date_end IS NULL OR voucher_date_start < voucher_date_end
    )
) ENGINE=InnoDB;

INSERT INTO tb_voucher (voucher_day, voucher_day_second, voucher_value, voucher_date_start, voucher_date_end, wallet_id) VALUES (
	1,
    0,
    800.00,
    '202601',
    '202603',
    2
);

UPDATE tb_voucher SET voucher_date_end = '202603' WHERE voucher_id = 1;
UPDATE tb_voucher SET voucher_value = 900, voucher_date_end = '202603' WHERE voucher_id = 1;

SELECT * FROM tb_voucher
WHERE voucher_date_start >= '202511'
AND voucher_date_end IS NULL
;

SELECT * FROM tb_voucher v
INNER JOIN tb_wallet cc ON cc.wallet_id = v.wallet_id
;