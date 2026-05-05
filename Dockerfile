FROM python:3.9-slim

# Installer Node.js
RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Créer le répertoire de travail
WORKDIR /app

# Copier les fichiers du backend
COPY backend/ ./backend/

# Copier les fichiers du frontend
COPY frontend/ ./frontend/

# Installer les dépendances Python (frontend)
RUN pip install --no-cache-dir -r frontend/requirements.txt

# Installer les dépendances Node.js (backend)
WORKDIR /app/backend
RUN npm install

# Revenir au répertoire racine
WORKDIR /app

# Copier et configurer le script de démarrage
COPY start.sh .
RUN chmod +x start.sh

# Exposer le port Streamlit (Render utilisera ce port)
EXPOSE 8501

# Démarrer les deux services
CMD ["./start.sh"]
