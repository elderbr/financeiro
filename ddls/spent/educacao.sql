CREATE TABLE IF NOT EXISTS tb_educacao (
	educacao_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    educacao_nome VARCHAR(30) NOT NULL UNIQUE
);

INSERT IGNORE INTO tb_educacao (educacao_nome) VALUES 
('Mensalidades'),
('Cursos'),
('Material escolar'),
('Uniformes'),
('Passeios'),
('Transporte')
;