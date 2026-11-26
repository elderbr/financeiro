CREATE TABLE IF NOT EXISTS tb_saude (
	saude_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    saude_nome VARCHAR(30) NOT NULL UNIQUE
);

INSERT IGNORE INTO tb_saude (saude_nome) VALUES 
('Plano de saúde'),
('Consultas'),
('Exames'),
('Dentista'),
('Medicamentos'),
('Óculos / lentes'),
('Terapias'),
('Academia / atividades físicas')
;