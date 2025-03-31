from flask import Flask, request, jsonify
from flask_cors import CORS


app = Flask(__name__)
CORS(app)  

# df = pd.read_csv("Relatorio_cadop.csv") 

@app.route('/buscar_operadora', methods=['GET'])
def buscar_operadora():
    termo = request.args.get('q', '').lower()
    if not termo:
        return jsonify({"erro": "Nenhum termo fornecido"}), 400

    resultados = df[df['nome'].str.lower().str.contains(termo, na=False)]
    return jsonify(resultados.to_dict(orient='records'))

if __name__ == '__main__':
    print("Servidor Flask rodando...")
    app.run(debug=True)
