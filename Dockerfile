FROM python:3.9-slim

# Installer Node.js
RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Copier les fichiers
WORKDIR /app
COPY backend/ ./backend/
COPY frontend/ ./frontend/

# Installer les dépendances Python
RUN pip install --no-cache-dir -r frontend/requirements.txt

# Installer les dépendances Node.js
WORKDIR /app/backend
RUN npm install

# Exposer les ports
EXPOSE 8501 3001

# Script de démarrage
COPY start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
