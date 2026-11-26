SELECT * FROM tb_wallet_history;

CREATE OR REPLACE VIEW vw_find_history_wallet AS
	SELECT 		
        pw.person_id AS person_id_wallet, pw.person_name AS person_wallet, pc.person_id AS person_id_currency, pc.person_name AS person_currency, wh.wl_currency,
        -- Carteira
		w.wallet_id, w.wallet_name, wh.wl_date_at, wallet_type
    FROM tb_wallet_history wh    
    INNER JOIN tb_wallet w ON w.wallet_id = wh.wallet_id
    LEFT JOIN tb_card_config con ON con.wallet_id = w.wallet_id
    INNER JOIN tb_person pc ON pc.person_id  = wh.person_id
    INNER JOIN tb_person pw ON pw.person_id = w.person_id
    ;
;

SELECT wallet_id, wallet_name, DATE_FORMAT(wl_date_at, '%Y-%m') AS wl_date_at, SUM(wl_currency) AS wl_currency 
FROM vw_find_history_wallet
WHERE person_id_currency = 2
GROUP BY wallet_id, wallet_name, DATE_FORMAT(wl_date_at, '%Y-%m')
ORDER BY DATE_FORMAT(wl_date_at, '%Y-%m')
;

SELECT * FROM vw_find_history_wallet
-- WHERE wallet_id = 2
;

