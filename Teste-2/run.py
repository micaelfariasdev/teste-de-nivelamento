import tabula
import pandas as pd
from zipfile import ZipFile
import os

pdf_path = "./anexos/anexo_1.pdf"


dfs = tabula.read_pdf(pdf_path, pages='all', lattice=True)

rename = {
    'OD': 'Seg. Odontológica',
    'AMB': 'Seg. Ambulatorial'
}

df = pd.concat(dfs)
df = df.loc[:, ~df.columns.str.contains("^Unnamed", na=False)]
for k, v in rename.items():
    df.rename(columns={k: v}, inplace=True)

df.to_csv("anexos/tabela_anexo_1.csv", sep=";",
          index=False, encoding="utf-8-sig")

seu_nome = str(input('Qual seu nome?: '))

with ZipFile(f'anexos/Teste_{seu_nome}.zip', "w") as f:
    f.write('anexos/tabela_anexo_1.csv',
            os.path.basename('tabela_anexo_1.csv'))
