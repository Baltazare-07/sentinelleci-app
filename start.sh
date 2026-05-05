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

# Vérifier que le backend répond
if curl -s http://localhost:3001/api/health > /dev/null; then
    echo "✅ Backend opérationnel"
else
    echo "⚠️  Backend non vérifié, mais on continue..."
fi

# Démarrer le frontend Streamlit
echo "🎨 Démarrage du frontend Streamlit..."
cd /app/frontend
streamlit run app.py \
    --server.port=8501 \
    --server.address=0.0.0.0 \
    --server.enableCORS=false \
    --server.enableXsrfProtection=false \
    --server.maxUploadSize=50

# Garder le processus en vie
wait $BACKEND_PID
