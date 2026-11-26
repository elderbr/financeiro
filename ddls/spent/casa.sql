CREATE TABLE IF NOT EXISTS tb_casa (
	casa_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    casa_nome VARCHAR(50) NOT NULL UNIQUE
);

INSERT IGNORE INTO tb_casa (casa_nome) VALUES 
('Aluguel / financiamento'),
('Condomínio'),
('IPTU'),
('Energia elétrica'),
('Água'),
('Gás'),
('Internet'),
('Telefone'),
('Manutenção e reparos'),
('Móveis e eletrodomésticos'),
('Telefone'),
('Supermercado'),
('Feira'),
('Padaria'),
('Serviços domésticos'),
('Seguro residencial')
;