DROP TABLE tb_family;

CREATE TABLE IF NOT EXISTS tb_family (
    family_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    family_name VARCHAR(50) NOT NULL UNIQUE COMMENT 'Nome único da família',
    family_status ENUM('ATIVO', 'INATIVO') DEFAULT 'ATIVO' COMMENT 'Status da família',
    family_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    family_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO tb_family (family_name) VALUES ('Barbosa');
INSERT INTO tb_family (family_name) VALUES ('Paz');

-- Atualizando o status da família
UPDATE tb_family SET family_status = 'INATIVO' WHERE family_id = 2;

SELECT * FROM tb_family;

SELECT * FROM tb_family f
INNER JOIN tb_member m ON m.family_id = f.family_id;