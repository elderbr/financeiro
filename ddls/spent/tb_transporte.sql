CREATE TABLE IF NOT EXISTS tb_transporte (
	transporte_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    transporte_nome VARCHAR(30) NOT NULL UNIQUE
);

INSERT IGNORE INTO tb_transporte (transporte_nome) VALUES 
('Uber / 99 / taxi'),
('Ônibus'),
('IPTU'),
('Gasolina'),
('Alguel de carro'),
('Estacionamento'),
('Pedágios'),
('Seguro do veículo'),
('IPVA'),
('Licenciamento'),
('Manutenção'),
('Multas'),
('Lavagem')
;