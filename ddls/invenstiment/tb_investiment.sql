DROP TABLE tb_investiment;

CREATE TABLE IF NOT EXISTS tb_investiment (
	investiment_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    investiment_name VARCHAR(100) NOT NULL,
    investiment_value_initial DECIMAL(10,2) NOT NULL COMMENT 'Valor inicial do investimento',
    investiment_value_application DECIMAL(10,2) COMMENT 'Valor que será aplicado todos os meses',
    investiment_interest DECIMAL(10,2) COMMENT 'Valor do juros Ex: 10.56',
    investiment_interest_yield ENUM('Diário', 'Mensal', 'Semestral', 'Anual') COMMENT 'Os tipos de rendimentos dos juros',
    investiment_value_desired DECIMAL(10,2) COMMENT 'Valor que seja alcançar',
    investiment_forecast_month INT UNSIGNED NOT NULL COMMENT 'Quantidade de meses necessários para alcançar objetivo',
    investiment_date_start DATE DEFAULT (current_date) COMMENT 'Data da criação',
    investiment_date_final DATE COMMENT 'Data prevista para o termino do investimento',
    wallet_id BIGINT NOT NULL COMMENT 'Código da conta vinculada',
    CONSTRAINT fk_investiment_wallet FOREIGN KEY (wallet_id) 
        REFERENCES tb_wallet(wallet_id),
	UNIQUE KEY(investiment_name, wallet_id),
    -- Garante que o nome do investimento precisa conter 3 ou mais caracteres
    CONSTRAINT chk_inv_name_min_name CHECK (CHAR_LENGTH(investiment_name) >= 3),
    -- Garante que os semeses necessários para alcançar o objetivo seja positivo
    CONSTRAINT chk_inv_forecast_month_positive CHECK (investiment_forecast_month > 0 )
)ENGINE=InnoDB;

DROP TRIGGER trg_inv_before_insert;

DELIMITER $$

CREATE TRIGGER trg_inv_before_insert
BEFORE INSERT ON tb_investiment
FOR EACH ROW
BEGIN
     -- Verifica se o nome possui pelo menos 3 caracteres
    IF CHAR_LENGTH(NEW.investiment_name) < 3 THEN

        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO = 50001,
                MESSAGE_TEXT = 'INV001';
    END IF;

    -- Verifica se o valor inicial é maior que zero
    IF NEW.investiment_value_initial < 0 THEN

        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO = 50002,
                MESSAGE_TEXT = 'INV002';
    END IF;
END$$

DELIMITER ;

-- 1) Deve PASSAR
INSERT INTO tb_investiment (investiment_name, investiment_value_initial, investiment_value_application, investiment_forecast_month, wallet_id) VALUES (
	'Estudo', 100.00, 100.00, 300, 1
);

-- 2) Deve FALHAR ( Nome precisa ter mais que dois caraceteres )
INSERT INTO tb_investiment (investiment_name, investiment_value_initial, investiment_value_application, investiment_forecast_month, wallet_id) VALUES (
	'AB', 215.13, 150.00, 200, 1
);
-- Error Code: 4025. CONSTRAINT `chk_investiment_name` failed for `financeiro`.`tb_investiment`

-- 3) Deve FALHAR ( Valor inicial não pode ser negativo )
INSERT INTO tb_investiment (investiment_name, investiment_value_initial, investiment_value_application, investiment_forecast_month, wallet_id) VALUES (
	'Geladeira', -50, 200.00, 150, 1
);

-- 2) Deve FALHAR (Quantidade de meses precisa ser maior que zero)
INSERT INTO tb_investiment (investiment_name, investiment_value_initial, investiment_value_application, investiment_forecast_month, wallet_id) VALUES (
	'Carro', 100.00, 100.00, -5, 1
);
-- Error Code: 4025. CONSTRAINT `chk_investiment_month` failed for `financeiro`.`tb_investiment`

SELECT * FROM tb_investiment;