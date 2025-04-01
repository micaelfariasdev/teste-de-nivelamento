use operadoras_ativas;
CREATE TABLE operadoras(
id INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT,
Registro_ANS INT ,
CNPJ BIGINT ,
Razao_Social VARCHAR(255) ,
Nome_Fantasia VARCHAR(255),
Modalidade VARCHAR(255) ,
Logradouro VARCHAR(255),
Numero VARCHAR(50),
Complemento VARCHAR(255),
Bairro VARCHAR(255),
Cidade VARCHAR(255),
UF CHAR(2),
CEP VARCHAR(15),
DDD TINYINT,
Telefone BIGINT,
Fax BIGINT,
Endereco_eletronico VARCHAR(255),
Representante VARCHAR(255),
Cargo_Representante VARCHAR(255),
Regiao_de_Comercializacao VARCHAR(255),
Data_Registro_ANS DATE
)default CHARSET = utf8mb4;

 CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
data_reg DATE,
REG_ANS INTEGER NOT NULL,
CD_CONTA_CONTABIL INTEGER NOT NULL,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL DECIMAL(15,2) NOT NULL,
VL_SALDO_FINAL DECIMAL(15,2) NOT NULL
)default CHARSET = utf8mb4;

#drop table operadoras;



