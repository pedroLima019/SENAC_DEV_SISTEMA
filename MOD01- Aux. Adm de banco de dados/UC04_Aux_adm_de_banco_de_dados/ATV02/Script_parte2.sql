USE uc4atividades;

/*Crie uma stored function que receba id de cliente e retorne se o cliente é “PREMIUM” ou “REGULAR”. Um cliente é “PREMIUM” se já realizou mais de R$ 10 mil em compras nos últimos dois anos. Um cliente é “REGULAR” se ao contrário.*/

DELIMITER //

CREATE FUNCTION status_cliente(cliente_id INT)
RETURNS DECIMAL(9,2) DETERMINISTIC 
BEGIN
DECLARE cons_total DECIMAL(9,2);
DECLARE cons_status VARCHAR(15);

SELECT (v.valor_total)
INTO cons_total FROM venda v
JOIN cliente c ON v.cliente_id=c.id
WHERE c.id=cliente_id AND v.data BETWEEN curdate() - INTERVAL 730 day AND curdate();

IF cons_total > 10000.00 THEN
		SET cons_status = 'PREMIUM';
	ELSE 
		SET cons_status = 'RELUGAR';
	END IF;

RETURN cons_status;

END //

DELIMITER ;

SELECT status_cliente('35');