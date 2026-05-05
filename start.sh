#!/bin/bash

echo "========================================="
echo "🚀 Démarrage de SentinelleCI"
echo "========================================="

# Démarrer le backend Node.js en arrière-plan
echo "📡 Démarrage du backend sur le port 3001..."
cd /app/backend
node app.js &
BACKEND_PID=$!

# Attendre que le backend soit prêt
sleep 3

# Démarrer le frontend Streamlit sur le port 80 (au lieu de 8501)
echo "🎨 Démarrage du frontend Streamlit sur le port 80..."
cd /app/frontend
streamlit run app.py \
    --server.port=80 \
    --server.address=0.0.0.0 \
    --server.enableCORS=false \
    --server.enableXsrfProtection=false \
    --server.headless=true

wait $BACKEND_PID
