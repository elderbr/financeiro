CREATE OR REPLACE VIEW vw_voucher_moviment AS
	SELECT 
    vch_mov_id, vch_mov_date, vch_mov_value, voucher_value, vch_mov_used, 
    w.wallet_id, wallet_name, wallet_type,
    p.person_id, p.person_name
    FROM tb_voucher_moviment vchm
	INNER JOIN tb_voucher vch ON vch.voucher_id = vchm.voucher_id
    INNER JOIN tb_wallet w ON w.wallet_id = vch.wallet_id
    INNER JOIN tb_person p ON p.person_id = w.person_id
	;
;

SELECT * FROM vw_voucher_moviment;