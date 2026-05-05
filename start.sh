#!/bin/bash

# Démarrer Nginx
service nginx start

# Démarrer le backend
cd /app/backend
node app.js &

# Démarrer Streamlit
cd /app/frontend
streamlit run app.py \
    --server.port=8501 \
    --server.address=0.0.0.0
