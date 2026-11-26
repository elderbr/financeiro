
CREATE OR REPLACE VIEW vw_find_wallet AS
	SELECT w.wallet_id, w.wallet_name, w.wallet_type, p.person_id, p.person_name FROM tb_wallet w
    INNER JOIN tb_person p ON p.person_id = w.person_id
;

SELECT * FROM vw_find_wallet;

-- Buscando carteira do tipo Familiar
CREATE OR REPLACE VIEW vw_find_wallet_type_family AS
	SELECT 
    -- Carteira
    w.wallet_id, w.wallet_name, w.wallet_type, w.wallet_active,
    -- Pessoa
    p.person_id, p.person_name,
    -- Família
    f.family_id, f.family_name
    FROM tb_wallet w
    INNER JOIN tb_person p ON p.person_id = w.person_id
    INNER JOIN tb_member m ON m.person_id = p.person_id
    INNER JOIN tb_family f ON f.family_id = m.family_id
    WHERE w.wallet_type = 'Familiar'
;

SELECT * FROM vw_find_wallet_type_family;

-- Buscando carteira do tipo pessoal
CREATE OR REPLACE VIEW vw_find_wallet_type_personal AS
	SELECT 
    -- Carteira
    w.wallet_id, w.wallet_name, w.wallet_type, w.wallet_active,
    -- Pessoa
    p.person_id, p.person_name
    FROM tb_wallet w
    INNER JOIN tb_person p ON p.person_id = w.person_id
    WHERE w.wallet_type = 'Pessoal'
;
SELECT * FROM vw_find_wallet_type_personal;

SELECT * FROM tb_wallet;
