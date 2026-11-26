CREATE TABLE IF NOT EXISTS tb_renda_historico (
	renda_historico_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT AUTO_INCREMENT,
    renda_id INTEGER NOT NULL,
    renda_historico_valor DECIMAL(10,2) NOT NULL,
    renda_historico_data_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    renda_historico_update_at DATETIME DEFAULT NULL,
    CONSTRAINT fk_rendahistorico_usuario FOREIGN KEY (usuario_id) 
                         REFERENCES tb_usuarios(usuarios_id)
);