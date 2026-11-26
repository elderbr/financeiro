CREATE TABLE IF NOT EXISTS tb_renda_extra (
	renda_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT AUTO_INCREMENT,
    usuario_id INTEGER NOT NULL, 
    renda_name DATE NOT NULL,
    renda_value DECIMAL(10,2) NOT NULL,    
    renda_familiar ENUM('Pessoal', 'Familiar') NOT NULL DEFAULT 'Pessoal',
    renda_carteira_id INTEGER NOT NULL,
	renda_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    renda_update_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_rendaextra_usuario FOREIGN KEY (usuario_id) 
                         REFERENCES tb_usuarios(usuarios_id),
	CONSTRAINT fk_rendaextra_carteira FOREIGN KEY (renda_carteira_id) 
                         REFERENCES tb_carteira(carteira_id)
);