# SQL Para Análise de Dados e Data Science - Capítulo 06


-- Criando a tabela 
CREATE TABLE cap06.vendas_loja_online (
    id_cliente INT PRIMARY KEY,
    pais_cliente VARCHAR(255),
    visitas_ultimo_mes VARCHAR(255),
    compras_ultimo_mes VARCHAR(255),
    total_gasto_ultimo_mes DECIMAL(10,2),
    fez_compra_mes_atual BOOLEAN
);



-- Inserindo registros na tabela 
INSERT INTO cap06.vendas_loja_online (id_cliente, pais_cliente, visitas_ultimo_mes, compras_ultimo_mes, total_gasto_ultimo_mes, fez_compra_mes_atual) VALUES 
(1000, 'Brasil', 'sim', '0-5', 100.50, TRUE),
(1001, 'Canadá', 'não', '6-10', 50.25, FALSE),
(1002, 'Inglaterra', 'não', '0-5', 250.75, TRUE),
(1003, 'Canadá', 'sim', '11-15', 340.20, FALSE),
(1004, 'Canadá', 'sim', '16-20', 150.00, FALSE),
(1005, 'Brasil', 'não', '11-15', 78.00, FALSE),
(1006, 'Canadá', 'sim', '0-5', 0.00, FALSE),
(1007, 'Canadá', 'não', '0-5', 0.00, FALSE),
(1008, 'Canadá', 'sim', '11-15', 90.00, FALSE),
(1009, 'Inglaterra', 'sim', '6-10', 179.30, TRUE);




-- Solução

CREATE TABLE cap06.vendas_loja_online_final AS


SELECT

    id_cliente,

    CASE WHEN pais_cliente = 'Brasil' THEN 1 ELSE 0 END AS pais_brasil,

    CASE WHEN pais_cliente = 'Canadá' THEN 1 ELSE 0 END AS pais_canada,

    CASE WHEN pais_cliente = 'Inglaterra' THEN 1 ELSE 0 END AS pais_inglaterra,

    CASE WHEN visitas_ultimo_mes = 'sim' THEN 1 ELSE 0 END AS visitas_num,

    CASE
        WHEN compras_ultimo_mes = '0-5' THEN 1
        WHEN compras_ultimo_mes = '6-10' THEN 2
        WHEN compras_ultimo_mes = '11-15' THEN 3
        WHEN compras_ultimo_mes = '16-20' THEN  4
        ELSE 0
    END AS compras_num,

    CASE WHEN fez_compra_mes_atual = TRUE THEN 1 ELSE 0 END AS fez_compras_num,

    total_gasto_ultimo_mes

FROM cap06.vendas_loja_online;


