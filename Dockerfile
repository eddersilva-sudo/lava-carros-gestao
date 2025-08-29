# Imagem base Python
FROM python:3.10-slim

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Definir diretório de trabalho
WORKDIR /app

# Copiar arquivos
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Streamlit precisa rodar na porta 7860 no Hugging Face
EXPOSE 7860

# Comando de inicialização
CMD ["streamlit", "run", "app.py", "--server.port=7860", "--server.address=0.0.0.0"]
