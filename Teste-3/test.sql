CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
    id SERIAL PRIMARY KEY,
    data DATE,
    reg_ans INTEGER NOT NULL,
    cd_conta_contabil INTEGER NOT NULL,
    descricao VARCHAR(255),
    vl_saldo_inicial DECIMAL(15,2) NOT NULL,
    vl_saldo_final DECIMAL(15,2) NOT NULL
);

LOAD DATA INFILE '../dados/2023/1T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);


cursor.execute(
    '''
SELECT o.razao_social, o.reg_ans, SUM(d.vl_saldo_final) AS total_despesas
FROM demonstracoes_contabeis d
JOIN operadoras_ativas o ON d.reg_ans = o.reg_ans
WHERE d.descricao LIKE '%SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
AND d.data >= (CURRENT_DATE - INTERVAL '3 months')
GROUP BY o.razao_social, o.reg_ans
ORDER BY total_despesas DESC
LIMIT 10;
    '''
)