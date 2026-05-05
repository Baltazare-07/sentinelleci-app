FROM python:3.9-slim

# Installer Node.js
RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

# Copier et installer les dépendances
COPY frontend/requirements.txt /app/frontend/requirements.txt
RUN pip install --no-cache-dir -r /app/frontend/requirements.txt

COPY backend/ ./backend/
COPY frontend/ ./frontend/
COPY start.sh .

WORKDIR /app/backend
RUN npm install

WORKDIR /app
RUN chmod +x start.sh

# Exposer le port que Render utilisera (changer de 8501 à 80)
EXPOSE 80

CMD ["./start.sh"]
