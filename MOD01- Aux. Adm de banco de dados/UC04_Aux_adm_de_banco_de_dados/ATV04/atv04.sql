
-- Tabela cliente:

CREATE TABLE cliente (
cliente_id INT PRIMARY KEY AUTO_INCREMENT,
cpf VARCHAR(11),
telefone VARCHAR(20)
);

 -- Tabela cliente_referencia:
 
CREATE TABLE cliente_referencia (
id INT PRIMARY KEY AUTO_INCREMENT,
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);

-- Criação da tabela "item_venda_quantidade:

CREATE TABLE item_venda (
  id INT PRIMARY KEY AUTO_INCREMENT,
  item_venda_id INT,
  FOREIGN KEY (item_venda_id) REFERENCES item_venda(id)
);

-- tabela item_venda_quantidade armazena as informações sobre a quantidade de cada item vendido.
CREATE TABLE item_venda_quantidade (
  id INT PRIMARY KEY AUTO_INCREMENT,
  item_venda_id INT,
  quantidade INT,
  FOREIGN KEY (item_venda_id) REFERENCES item_venda(id)
);

--  tabela venda 
CREATE TABLE venda_funcionario (
  venda_id INT,
  funcionario_id INT,
  PRIMARY KEY (venda_id, funcionario_id),
  FOREIGN KEY (venda_id) REFERENCES venda(id),
  FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);

CREATE TABLE venda (
  id INT PRIMARY KEY AUTO_INCREMENT,
  venda_id INT,
  FOREIGN KEY (venda_id) REFERENCES venda(id)
);

