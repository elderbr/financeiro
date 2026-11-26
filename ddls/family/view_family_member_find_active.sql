CREATE OR REPLACE VIEW find_family_members_active AS 
	SELECT p.person_id, p.person_name, f.family_id, f.family_name, f.family_status FROM tb_family f
    INNER JOIN tb_member m ON  m.family_id = f.family_id
    INNER JOIN tb_person p ON p.person_id = m.person_id
    WHERE f.family_status = 'ATIVO' AND m.member_departure_at IS NULL
    ORDER BY f.family_name, p.person_name
;
SELECT * FROM find_family_members_active;
