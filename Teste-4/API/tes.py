import os

caminho = "Relatorio_cadop.csv"
print("Caminho absoluto:", os.path.abspath(caminho))
print("Arquivo existe?", os.path.exists(caminho))
