CREATE TABLE IF NOT EXISTS tb_carteira (
	carteira_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    usuario_id INTEGER NOT NULL,
    carteira_nome varchar(30) NOT NULL,
    carteira_pix varchar(30),
    carteira_creadito DECIMAL(10,2) DEFAULT 0.0,
    carteira_limite DECIMAL(10,2) DEFAULT 0.0,
    carteira_limite_terceiro DECIMAL(10,2) DEFAULT 0.00,
    carteira_fechamento INTEGER DEFAULT 0,
    carteira_vencimento INTEGER DEFAULT 0,
    carteira_validade VARCHAR(7),
    pagamento_tipo_id INTEGER NOT NULL, 
    CONSTRAINT fk_carteira_usuarios
		FOREIGN KEY (carteira_id) REFERENCES tb_usuarios(usuarios_id),
	CONSTRAINT fk_carteira_pagamentotipo
		FOREIGN KEY (pagamento_tipo_id) REFERENCES tb_pagamento_tipo(pagamento_tipo_id)
);