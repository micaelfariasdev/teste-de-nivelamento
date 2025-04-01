from flask import Flask, request, jsonify
from flask_cors import CORS
import pandas as pd
import os

app = Flask(__name__)
CORS(app)  

# Verifica se o arquivo existe antes de carregar
csv_path = "Relatorio_cadop.csv"
if not os.path.exists(csv_path):
    raise FileNotFoundError(f"Arquivo CSV não encontrado: {csv_path}")

df = pd.read_csv(csv_path, sep=";") 

# Confirma se a coluna 'Nome_Fantasia' existe
if 'Nome_Fantasia' not in df.columns:
    raise ValueError("Coluna 'Nome_Fantasia' não encontrada no CSV!")

@app.route('/buscar_operadora', methods=['GET'])
def buscar_operadora():
    termo = request.args.get('q', '').lower()
    if not termo:
        return jsonify({"erro": "Nenhum termo fornecido"}), 400

    # Filtra os resultados e substitui NaN por None
    resultados = df[df['Nome_Fantasia'].str.lower().str.contains(termo, na=False)]
    resultados = resultados.where(pd.notna(resultados), 'None')

    return jsonify(resultados.to_dict(orient='records')) if not resultados.empty else jsonify([])

if __name__ == '__main__':
    print(f"Servidor Flask rodando...\nArquivo CSV: {csv_path}")
    app.run(debug=True)
