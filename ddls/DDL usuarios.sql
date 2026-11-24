CREATE TABLE IF NOT EXISTS tb_usuarios (
	usuarios_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    usuarios_nome VARCHAR(50) NOT NULL UNIQUE,
    usuarios_cpf VARCHAR(11) NOT NULL UNIQUE,
    usuarios_email VARCHAR(100) NOT NULL UNIQUE,
    usuarios_telefone VARCHAR(11) NOT NULL UNIQUE,
    familia_id INTEGER DEFAULT 0,
    CONSTRAINT fk_usuarios_familia FOREIGN KEY (familia_id) 
                         REFERENCES tb_familia(familia_id)
);