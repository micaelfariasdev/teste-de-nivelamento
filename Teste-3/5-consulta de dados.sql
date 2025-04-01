SELECT 
    operadoras.Razao_Social,
    operadoras.Registro_ANS,
    SUM(demonstracoes_contabeis.VL_SALDO_FINAL) AS total_despesas
FROM demonstracoes_contabeis
JOIN operadoras ON demonstracoes_contabeis.REG_ANS = operadoras.Registro_ANS
WHERE 
    LOWER(demonstracoes_contabeis.DESCRICAO) LIKE '%sinistros conhecidos ou avisados de assistência a saúde medico hospitalar%'
    AND demonstracoes_contabeis.data_reg >= (CURRENT_DATE - INTERVAL 3 MONTH)
GROUP BY operadoras.Razao_Social, operadoras.Registro_ANS
ORDER BY total_despesas DESC
LIMIT 10;



SELECT 
    operadoras.Razao_Social,
    operadoras.Registro_ANS,
    SUM(demonstracoes_contabeis.VL_SALDO_FINAL) AS total_despesas
FROM demonstracoes_contabeis
JOIN operadoras ON demonstracoes_contabeis.REG_ANS = operadoras.Registro_ANS
WHERE 
    LOWER(demonstracoes_contabeis.DESCRICAO) LIKE '%SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND YEAR(demonstracoes_contabeis.data_reg) = 2024
GROUP BY operadoras.Razao_Social, operadoras.Registro_ANS
ORDER BY total_despesas DESC
LIMIT 10;