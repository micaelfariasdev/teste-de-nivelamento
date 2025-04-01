import sqlite3
import os
import csv

conn = sqlite3.connect("meubanco.db")
cursor = conn.cursor()

cursor.execute("""
    CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        DATA DATE,
        REG_ANS INTEGER NOT NULL,
        CD_CONTA_CONTABIL INTEGER NOT NULL,
        DESCRICAO VARCHAR(255),
        VL_SALDO_INICIAL DECIMAL(15,2) NOT NULL,
        VL_SALDO_FINAL DECIMAL(15,2) NOT NULL
        )
""")

cursor.execute("""
    CREATE TABLE IF NOT EXISTS operadoras_ativas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        Registro_ANS  NOT NULL,
        CNPJ INTEGER NOT NULL,
        Razao_Social VARCHAR(255) NOT NULL,
        Nome_Fantasia VARCHAR(255),
        Modalidade VARCHAR(255) NOT NULL,
        Logradouro VARCHAR(255),
        Numero VARCHAR(255),
        Complemento VARCHAR(255),
        Bairro VARCHAR(255),
        Cidade VARCHAR(255),
        UF VARCHAR(255),
        CEP INTEGER,
        DDD INTEGER,
        Telefone INTEGER,
        Fax INTEGER,
        Endereco_eletronico VARCHAR(255),
        Representante VARCHAR(255),
        Cargo_Representante VARCHAR(255),
        Regiao_de_Comercializacao VARCHAR(255),
        Data_Registro_ANS DATE
        )
""")




path = '../dados/demonstracoes'
anos = os.listdir(path)
arquivos = []

for ano in anos:
    path_dados = f'{path}/{ano}'
    dados = os.listdir(path_dados)
    for csv_arq in dados:
        caminho = f'{path_dados}/{csv_arq}'
        arquivos.append(caminho)


for csv_path in arquivos:
    with open(csv_path, newline='', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        next(reader)  

        for row in reader:
            cursor.execute("""
                INSERT INTO demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
                VALUES (?, ?, ?, ?, ?, ?)
            """, row)



conn.commit()

conn.close()
