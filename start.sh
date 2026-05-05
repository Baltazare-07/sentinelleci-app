#!/bin/bash
# Démarrer le backend Node.js
cd /app/backend
node app.js &

# Démarrer le frontend Streamlit
cd /app/frontend
streamlit run app.py --server.port=8501 --server.address=0.0.0.0
