from zipfile import ZipFile
import requests
from bs4 import BeautifulSoup
import os

os.makedirs("anexos", exist_ok=True)

url = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'
site = requests.get(url).text
soup = BeautifulSoup(site, 'html.parser')
list_links = soup.find_all('a', href=True)
list_pdf = []

for index, link in enumerate(list_links):
    if '.pdf' in link.attrs['href'] and 'anexo' in link.attrs['href'].lower():
        list_pdf.append(link.attrs['href'])


for index, link in enumerate(list_pdf):
    response = requests.get(link)
    with open(f'anexos/anexo_{index+1}.pdf', "wb") as f:
        f.write(response.content)


pasta_anexo = './anexos/'
anexos = os.listdir(pasta_anexo)

with ZipFile(f'anexos/Anexos_zipado.zip', "w") as f:
    for arquivo in anexos:
        f.write(f'anexos/{arquivo}', os.path.basename(arquivo))
