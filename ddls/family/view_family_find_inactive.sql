-- Famílias inativas
CREATE OR REPLACE VIEW find_family_inactive AS 
	SELECT p.person_id, p.person_name, f.family_id, f.family_name, f.family_status FROM tb_family f
    INNER JOIN tb_member m ON  m.family_id = f.family_id
    INNER JOIN tb_person p ON p.person_id = m.person_id
    WHERE f.family_status = 'INATIVO'
    GROUP BY
    p.person_id,
    p.person_name,
    f.family_id,
    f.family_name,
    f.family_status
    ORDER BY f.family_name, p.person_name
;
SELECT * FROM find_family_inactive;

SELECT person_id, MAX(member_departure_at) AS member_departure_at FROM tb_member m GROUP BY person_id HAVING member_departure_at IS NOT null;
