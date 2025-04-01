# Teste de Nivelamento - v.250321

## 📌 Descrição
Este repositório contém a solução para o teste de nivelamento, abordando Web Scraping, Transformação de Dados, Banco de Dados e API. O código foi desenvolvido utilizando Python e Vue.js.

## 🛠 Tecnologias Utilizadas
- Python
- SQL (MySQL)
- Flask (Para subir a API localmente)
- Vue.js (para a interface da API)
- Postman (para documentação e testes de API)

## 📂 Estrutura do Projeto
```
/
|-- dados/              # Dados para o teste 3 e 4
    |-- demonstracoes/  # Registros contábeis para o teste 3
|-- Teste-1/           
    |-- run.py          # Salva os anexos e compacta em uma pasta 'Anexos' que será criada
|-- Teste-2/           
    |-- run.py          # Extrai dados do anexo_1 que foi adquirido no teste 1 e salva em um arquivo CSV em seguida e compactado
|-- Teste-3/           
    |-- 1-...sql        # Script para criação da Database
    |-- 2-...sql        # Script para a criação da tabela de operadoras e registros contábeis
    |-- 3-...sql        # Carrega a tabela operadoras com dados de 'Relatorio_cadop.csv' da pasta 'dados/'
    |-- 4-...sql        # Carrega a tabela de registros contábeis da pasta 'dados/demonstracoes/'.
    |-- 5-...sql        # Consulta de dados com base nos últimos 3 meses e do último ano
|-- Teste-4/           
    |-- API/
        |-- main.py     # Execute para subir a API localmente usando Flask
    |-- operadoras/     # Pasta do front-end com Vue.js
    |-- package-lock.json
    |-- Teste de API.postman_collection.json # Collection do Postman
|-- .gitignore          # Arquivo de configuração do Git
|-- LICENSE             # Licença do projeto
|-- README.md           # Documentação do projeto
|-- requirements.txt    # Dependências do projeto
```

## 🚀 Execução dos Testes

### 1️⃣ Web Scraping
1. Acesse a pasta `Teste-1/`.
2. Execute o script para baixar os PDFs e compactá-los:
   ```bash
   python run.py
   ```

### 2️⃣ Transformação de Dados
1. Acesse a pasta `Teste-2/`.
2. Execute o script extrair os dados da tabela do PDF e salvar como CSV:
   ```bash
   python run.py
   ```
3. Digite seu nome.
4. O arquivo CSV será compactado automaticamente.

### 3️⃣ Banco de Dados
1. Acesse a pasta `Teste-3/`.
2. Execute os scripts SQL para criação das tabelas e importação dos dados:
   ```bash
   mysql -u usuario -p < 1-...sql
   mysql -u usuario -p < 2-...sql
   mysql -u usuario -p < 3-...sql
   mysql -u usuario -p < 4-...sql
   ```
3. Execute as queries analíticas para obter os relatórios:
   ```bash
   mysql -u usuario -p < 5-...sql
   ```

### 4️⃣ API e Interface Web
1. Acesse a pasta `Teste-4/API/` e inicie o servidor Flask:
   ```bash
   python main.py
   ```
2. Acesse a pasta `Teste-4/operadoras/` e inicie o Vue.js:
   ```bash
   npm install
   npm run serve
   ```
3. Use o Postman para testar a rota de busca de operadoras.

## 📄 Licença
Este repositório é confidencial e não deve ser compartilhado sem autorização expressa.
🔗 Links Úteis

## 🔗 Links Úteis
- [Repositório Oficial](https://github.com/micaelfariasdev/teste-de-nivelamento)
- [Meu GitHub](https://github.com/micaelfariasdev)
- [Meu LinkedIn](https://www.linkedin.com/in/micaelfariasdev/)

---
Desenvolvido por *[Micael Farias]*
