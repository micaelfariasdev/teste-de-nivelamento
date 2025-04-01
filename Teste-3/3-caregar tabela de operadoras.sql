LOAD DATA INFILE  'dados/Relatorio_cadop.csv'
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

