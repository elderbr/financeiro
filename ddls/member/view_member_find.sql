CREATE OR REPLACE VIEW find_member AS
    SELECT 
        *
    FROM
        tb_member
	ORDER BY member_entry_at DESC   
;
SELECT * FROM find_member;

-- Buscando membros desativados pegando a ultima data cadastrada 
CREATE OR REPLACE VIEW find_member_active AS 
	SELECT
    -- Pessoa
    p.person_id, p.person_name, 
    -- Família
    f.family_id, f.family_name, f.family_status,
    -- Membros
    m.member_id, m.member_entry_at, m.member_departure_at 
    FROM tb_member m
    INNER JOIN tb_person p ON p.person_id = m.person_id
    INNER JOIN tb_family f ON f.family_id = m.family_id
    WHERE member_departure_at IS NULL;
;
SELECT * FROM find_member_active;

CREATE OR REPLACE VIEW find_member_inactive AS 
	WITH members AS (
		SELECT 
		*,
		ROW_NUMBER() OVER (
			PARTITION BY person_id
			ORDER BY member_departure_at DESC
		) AS rn FROM tb_member
		WHERE member_departure_at IS NOT NULL
	)
	SELECT 
    -- Pessoa
    p.person_id, p.person_name, 
    -- Família
    f.family_id, f.family_name, f.family_status,
    -- Membros
    m.member_id, m.member_entry_at, m.member_departure_at 
    FROM members m
	INNER JOIN tb_person p ON p.person_id = m.person_id
    INNER JOIN tb_family f ON f.family_id = m.family_id
	WHERE m.rn = 1
;
SELECT * FROM find_member_inactive;




