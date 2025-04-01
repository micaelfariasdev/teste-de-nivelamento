from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy
import pandas as pd
import os

app = Flask(__name__)
CORS(app)  

csv_path = "dados/Relatorio_cadop.csv"
if not os.path.exists(csv_path):
    raise FileNotFoundError(f"Arquivo CSV não encontrado: {csv_path}")

df = pd.read_csv(csv_path, sep=";") 

if 'Nome_Fantasia' not in df.columns:
    raise ValueError("Coluna 'Nome_Fantasia' não encontrada no CSV!")

@app.route('/buscar_operadora', methods=['GET'])
def buscar_operadora():
    termo = request.args.get('q', '').lower()
    if not termo:
        return jsonify({"erro": "Nenhum termo fornecido"}), 400

    resultados = df[df['Razao_Social'].str.lower().str.contains(termo, na=False)]
    resultados = resultados.replace(numpy.nan, None)

    return jsonify(resultados.to_dict(orient='records')) if not resultados.empty else jsonify([])

if __name__ == '__main__':
    print(f"Servidor Flask rodando...\nArquivo CSV: {csv_path}")
    app.run(debug=True)
