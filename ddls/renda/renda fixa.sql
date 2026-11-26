CREATE TABLE IF NOT EXISTS tb_renda_fixa (
	renda_fixa_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    renda_fixa_data DATE NOT NULL,
    usuario_id INTEGER NOT NULL,
    renda_fixa_valor DECIMAL(10,2) NOT NULL,
    carteira_id INTEGER NOT NULL,
    CONSTRAINT fk_rendafixa_usuarios
		FOREIGN KEY (usuarios_id) REFERENCES tb_usuarios(usuarios_id),
    CONSTRAINT fk_rendafixa_carteira
		FOREIGN KEY (carteira_id) REFERENCES tb_carteira(carteira_id)
);