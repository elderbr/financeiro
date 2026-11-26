DROP TABLE tb_credit_invoice;

-- Fatura de crédito
CREATE TABLE IF NOT EXISTS tb_credit_invoice (
	invoice_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    invoice_reference_month DATE NOT NULL COMMENT 'Mês de referência',    
    invoice_balance DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT 'Valor atual',
    invoice_used DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT 'Valor usado',
    invoice_used_another DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT 'Valores usado por terceiros',
    invoice_paid BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Se a fatura foi paga',
    credit_id BIGINT NOT NULL
);

SELECT * FROM tb_credit_invoice;