DROP TABLE tb_person;

CREATE TABLE IF NOT EXISTS tb_person (
    person_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    person_name VARCHAR(100) NOT NULL COMMENT 'Nome completo da pessoa',
    person_cpf VARCHAR(11) NOT NULL UNIQUE COMMENT 'CPF sem formatação',
    person_email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email da pessoa',
    person_phone VARCHAR(15) NOT NULL COMMENT 'Telefone com DDD',
    person_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    person_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Index
    INDEX idx_person_name (person_name),
    -- Constraints de validação
    CONSTRAINT chk_person_cpf CHECK (LENGTH(person_cpf) = 11),
    CONSTRAINT chk_person_phone CHECK (LENGTH(person_phone) >= 10)
);

INSERT INTO tb_person (person_name, person_cpf, person_email, person_phone)
VALUES
    ('Elder Barbosa Romão', '32266188810', 'elder@gmail.com', '11962678834'),
    ('Luanna Paz Barbosa', '35618217807', 'luanna@gmail.com', '11962636615'),
    ('Welder Paz Barbosa', '35618217808', 'welder@gmail.com', '11962636616'),
    ('Laura Barbosa Paz', '32266188812', 'laura@gmail.com', '11962678836');

INSERT INTO tb_person (person_name, person_cpf, person_email, person_phone)
VALUES
('Edija Barbosa Romão Dias', '32266188813', 'edija@gmail.com', '11962678801');

SELECT *
FROM
    tb_person;