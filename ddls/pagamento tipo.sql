CREATE TABLE IF NOT EXISTS tb_pagamento_tipo (
	pagamento_tipo_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    pagamento_tipo_nome VARCHAR(30) NOT NULL UNIQUE
);
INSERT IGNORE INTO tb_pagamento_tipo (pagamento_tipo_nome) VALUES 
('Credito'), 
('Debito'),
('Dinheiro'),
('Pix'),
('Poupança'),
('Vale Alimentação'),
('Vale Refeição')
;