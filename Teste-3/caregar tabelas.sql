LOAD DATA INFILE  'C:/wamp64/tmp/Relatorio_cadop.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, Logradouro, Numero, Complemento, Bairro, Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_eletronico, Representante, Cargo_Representante, Regiao_de_Comercializacao, @Data_Registro_ANS)
SET Data_Registro_ANS = IF(@Data_Registro_ANS = '', NULL, STR_TO_DATE(@Data_Registro_ANS, '%Y-%m-%d')),
    Razao_Social = IF(Razao_Social = '', NULL, Razao_Social),
    Nome_Fantasia = IF(Nome_Fantasia = '', NULL, Nome_Fantasia),
    Modalidade = IF(Modalidade = '', NULL, Modalidade),
    Logradouro = IF(Logradouro = '', NULL, Logradouro),
    Numero = IF(Numero = '', NULL, Numero),
    Complemento = IF(Complemento = '', NULL, Complemento),
    Bairro = IF(Bairro = '', NULL, Bairro),
    Cidade = IF(Cidade = '', NULL, Cidade),
    UF = IF(UF = '', NULL, UF),
    CEP = IF(CEP = '', NULL, CEP),
    DDD = IF(DDD = '', NULL, DDD),
    Telefone = IF(Telefone = '', NULL, Telefone),
    Fax = IF(Fax = '', NULL, Fax),
    Endereco_eletronico = IF(Endereco_eletronico = '', NULL, Endereco_eletronico),
    Representante = IF(Representante = '', NULL, Representante),
    Cargo_Representante = IF(Cargo_Representante = '', NULL, Cargo_Representante),
    Regiao_de_Comercializacao = IF(Regiao_de_Comercializacao = '', NULL, Regiao_de_Comercializacao);

LOAD DATA INFILE  'C:/wamp64/tmp/demonstracoes/2023/1T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO,VL_SALDO_INICIAL,VL_SALDO_FINAL)
SET DATA= IF(@DATA = '', NULL, STR_TO_DATE(@DATA, '%Y-%m-%d'));

LOAD DATA INFILE  'C:/wamp64/tmp/demonstracoes/2023/2T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO,VL_SALDO_INICIAL,VL_SALDO_FINAL)
SET DATA= IF(@DATA = '', NULL, STR_TO_DATE(@DATA, '%Y-%m-%d'));

LOAD DATA INFILE  'C:/wamp64/tmp/demonstracoes/2023/3T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO,VL_SALDO_INICIAL,VL_SALDO_FINAL)
SET DATA= IF(@DATA = '', NULL, STR_TO_DATE(@DATA, '%Y-%m-%d'));

LOAD DATA INFILE  'C:/wamp64/tmp/demonstracoes/2023/4T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO,VL_SALDO_INICIAL,VL_SALDO_FINAL)
SET DATA= IF(@DATA = '', NULL, STR_TO_DATE(@DATA, '%Y-%m-%d'));

LOAD DATA INFILE  'C:/wamp64/tmp/demonstracoes/2024/1T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO,VL_SALDO_INICIAL,VL_SALDO_FINAL)
SET DATA= IF(@DATA = '', NULL, STR_TO_DATE(@DATA, '%Y-%m-%d'));

LOAD DATA INFILE  'C:/wamp64/tmp/demonstracoes/2024/2T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO,VL_SALDO_INICIAL,VL_SALDO_FINAL)
SET DATA= IF(@DATA = '', NULL, STR_TO_DATE(@DATA, '%Y-%m-%d'));

LOAD DATA INFILE  'C:/wamp64/tmp/demonstracoes/2024/3T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO,VL_SALDO_INICIAL,VL_SALDO_FINAL)
SET DATA= IF(@DATA = '', NULL, STR_TO_DATE(@DATA, '%Y-%m-%d'));

LOAD DATA INFILE  'C:/wamp64/tmp/demonstracoes/2024/4T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA,REG_ANS,CD_CONTA_CONTABIL,DESCRICAO,VL_SALDO_INICIAL,VL_SALDO_FINAL)
SET DATA= IF(@DATA = '', NULL, STR_TO_DATE(@DATA, '%Y-%m-%d'));