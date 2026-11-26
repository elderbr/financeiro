DROP TABLE tb_voucher_moviment;

CREATE TABLE IF NOT EXISTS tb_voucher_moviment (
	vch_mov_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    vch_mov_date DATE NOT NULL COMMENT 'Ano e mês da movimentação dos valores no formato YYYYMM. Ex: 202611',
    vch_mov_value DECIMAL(10,2) NOT NULL DEFAULT 0.0,
    vch_mov_date_second DATE,
    vch_mov_value_second DECIMAL(10,2) NOT NULL DEFAULT 0.0,   
    vch_mov_used DECIMAL(10,2) NOT NULL DEFAULT 0.0, 
    voucher_id BIGINT NOT NULL
);

INSERT INTO tb_voucher_moviment (vch_mov_date, vch_mov_value, voucher_id) VALUES (
	CURRENT_DATE(), 436.15, 1
);

UPDATE tb_voucher_moviment SET vch_mov_date = '2026-11-01', vch_mov_value_second = 425.10 WHERE vch_mov_id = 1;

SELECT * FROM tb_voucher_moviment vchm
INNER JOIN tb_voucher vch ON vch.voucher_id = vchm.voucher_id
INNER JOIN tb_wallet w ON w.wallet_id = vch.wallet_id
INNER JOIN tb_person p ON p.person_id = w.person_id
;