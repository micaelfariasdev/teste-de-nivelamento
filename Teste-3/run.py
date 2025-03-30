from mysql import connector

conn = connector.connect(
    host="localhost",
    user="adm",
    password="adm",
    database="database"
)

cursor = conn.cursor()

create_table_query = """
CREATE TABLE IF NOT EXISTS demonstrativos_contabeis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    operadora_id INT,
    data DATE,
    categoria VARCHAR(255),
    despesa DECIMAL(15, 2),
    receita DECIMAL(15, 2),
    saldo DECIMAL(15, 2)
);
"""

cursor.execute(create_table_query)

# Confirmar a transação
conn.commit()

# Fechar o cursor e a conexão
cursor.close()
conn.close()

print("Tabela criada com sucesso!")