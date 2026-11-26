-- Histórico da movimentação das contas
DROP TABLE tb_wallet_history;
CREATE TABLE IF NOT EXISTS tb_wallet_history(
	wl_history_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    wl_currency DECIMAL(10,2) NOT NULL COMMENT 'Valor da entrada ou saída do debito ou crédito',
    wl_currency_type ENUM('Debito','Crédito') NOT NULL DEFAULT 'Debito' COMMENT '1 para valores em debitos e 2 para valores em créditos',
    wl_date_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data e hora da corrência da movimentação',
    wallet_id BIGINT NOT NULL COMMENT 'Código da carteira',
    person_id BIGINT NOT NULL COMMENT 'Código da pessoa',
    CONSTRAINT fk_wallet_history_account FOREIGN KEY (wallet_id) 
        REFERENCES tb_wallet(wallet_id) ON DELETE CASCADE,
	CONSTRAINT fk_wallet_history_person FOREIGN KEY (person_id) 
        REFERENCES tb_person(person_id) ON DELETE CASCADE,
	CONSTRAINT fck_currenty_type CHECK (wl_currency_type IN (1, 2))
);
INSERT INTO tb_wallet_history (wl_currency, wl_date_at, wl_currency_type, wallet_id, person_id) VALUES 
(322.15, '2026-08-08', 1, 1, 1),
(233.21, '2026-09-08', 1, 1, 1),
(110.93, '2026-10-08', 2, 1, 2),
(350.52, '2026-11-08', 1, 2, 3),
(-181.31, '2026-08-05', 2, 2, 2)
;

INSERT INTO tb_wallet_history (wl_currency, wl_date_at, wl_currency_type, wallet_id, person_id) VALUES 
(210.03, '2026-08-15', 1, 2, 3);

SELECT * FROM tb_wallet_history;