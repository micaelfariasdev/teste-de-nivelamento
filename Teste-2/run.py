import pdfplumber
import pandas as pd
from zipfile import ZipFile
import os

pdf_path = "anexos/anexo_1.pdf"
extract_csv = "anexos/tabela_anexo_1.csv"
tabelas = []
header = None

with pdfplumber.open(pdf_path) as pdf:
    for page in pdf.pages:
        tables = page.extract_tables()
        for table in tables:
            df = pd.DataFrame(table)
            df = df.dropna(how="all")  
            
            df = df.applymap(lambda x: " ".join(x.split()) if isinstance(x, str) else x)
            
            if header is None:
                header = df.iloc[0].tolist()  
            
            df.columns = header  
            df = df[1:]  
            tabelas.append(df)


resultado = pd.concat(tabelas, ignore_index=True)

rename = {
    "OD": "Seg. Odontológica",
    "AMB": "Seg. Ambulatorial"
}
resultado.rename(columns={k: v for k, v in rename.items() if k in resultado.columns}, inplace=True)

resultado.to_csv(extract_csv, sep=";", index=False, encoding="utf-8-sig")
print(f"Tabelas extraídas e salvas em {extract_csv}")

seu_nome = input("Qual seu nome?: ")
zip_path = f"anexos/Teste_{seu_nome}.zip"
with ZipFile(zip_path, "w") as f:
    f.write(extract_csv, os.path.basename(extract_csv))

print(f"Arquivo ZIP gerado: {zip_path}")
