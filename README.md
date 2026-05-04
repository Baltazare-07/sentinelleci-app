# 📍 Sentinelle.CI - Plateforme citoyenne de signalement avec blockchain

[![Streamlit App](https://static.streamlit.io/badges/streamlit_badge_black_white.svg)](https://sentinelleci-app.streamlit.app)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Made with Python](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/)

## 📋 Description

**Sentinelle.CI** est une plateforme citoyenne permettant aux habitants de signaler les travaux publics non terminés ou abandonnés par l'administration. Les signalements sont enregistrés sur blockchain (simulée) pour garantir leur immuabilité et leur traçabilité.

### 🎯 Problématique résolue
- ❌ Manque de canal de communication entre citoyens et mairie
- ❌ Absence de preuve formelle des signalements
- ❌ Difficulté de suivi des travaux publics
- ❌ Opacité du traitement des plaintes citoyennes

### ✨ Fonctionnalités

| Module | Fonctionnalités |
|--------|-----------------|
| **Citoyen** | 📍 Signalement géolocalisé (carte / position actuelle / manuel)<br>📸 Photo (caméra ou galerie)<br>🔗 Enregistrement blockchain<br>📋 Suivi des signalements |
| **Mairie** | 🗺️ Carte communale des signalements<br>📊 Indicateurs clés (statistiques)<br>🚨 Liste des signalements non pris en charge<br>👥 Assignation aux agents terrain |
| **Technique** | 🔗 Hash blockchain unique par signalement<br>📱 Interface responsive<br>💾 Stockage session_state |

---

## 🚀 Démo en ligne

➡️ **https://sentinelleci-app.streamlit.app**

> ⚠️ *Note : La démo utilise une simulation blockchain (hash SHA-256). Pour une vraie blockchain, déployez le backend avec vos propres clés Infura/Ethereum.*

---

## 📦 Prérequis

- **Python 3.9+** (Frontend Streamlit)
- **Node.js 16+** (Backend blockchain)
- **npm** ou **yarn**

---

## 🔧 Installation et lancement local

### 1. Cloner le dépôt

```bash
git clone https://github.com/Baltazare-07/sentinelleci-app.git
cd sentinelleci-app



2. Lancer le Backend (Node.js)
bash
# Se déplacer dans le dossier backend
cd backend

# Installer les dépendances
npm install

# Démarrer le serveur
node app.js
✅ Le backend tourne sur : http://localhost:3001

3. Lancer le Frontend (Streamlit)
⚠️ Ouvrez un NOUVEAU terminal (le backend continue de tourner dans l'autre)

bash
# Retourner à la racine du projet
cd /chemin/vers/sentinelleci-app

# Se déplacer dans le dossier frontend
cd frontend

# Créer et activer l'environnement virtuel
python3 -m venv venv
source venv/bin/activate  # Sur Windows : venv\Scripts\activate

# Installer les dépendances Python
pip install streamlit streamlit-folium folium requests

# Lancer l'application
streamlit run app.py
✅ Le frontend s'ouvre dans votre navigateur : http://localhost:8501

🖥️ Récapitulatif des commandes (deux terminaux)
Terminal	Commande	URL
Terminal 1 (Backend)	cd backend && npm install && node app.js	http://localhost:3001
Terminal 2 (Frontend)	cd frontend && source venv/bin/activate && streamlit run app.py	http://localhost:8501
📂 Structure du projet
text
sentinelleci-app/
├── frontend/
│   ├── app.py                    # Application Streamlit
│   ├── requirements.txt          # Dépendances Python
│   └── venv/                     # Environnement virtuel (ignoré)
├── backend/
│   ├── app.js                    # Serveur Node.js/Express
│   ├── package.json              # Dépendances Node.js
│   └── node_modules/             # (ignoré)
├── .gitignore
└── README.md
🧪 Test de l'API backend
bash
# GET - Récupérer tous les signalements
curl http://localhost:3001/api/signalements

# POST - Créer un signalement
curl -X POST http://localhost:3001/api/signalements \
  -H "Content-Type: application/json" \
  -d '{"type":"Route","description":"Test","quartier":"Azito","latitude":5.3415,"longitude":-4.0142}'
🧑‍💻 Utilisation de l'application
Pour un citoyen
Cliquez sur "➕ NOUVEAU SIGNALEMENT"

Sélectionnez le type de problème (Route, Eau, École, Éclairage)

Choisissez la localisation (carte, position actuelle ou saisie manuelle)

Ajoutez une photo (optionnel)

Décrivez le problème

Acceptez la publication sur blockchain

Validez → un hash unique est généré

Pour la mairie
Sidebar → "🏛️ Vue Mairie"

Consultez la carte communale

Prenez en charge un signalement dans la liste

Assignez à un agent terrain

Ajoutez un commentaire public et une date d'intervention

Pour suivre ses signalements
Sidebar → "📋 Mes signalements"

Voir le statut évoluer (en attente → en cours → résolu)

Cliquer sur le lien Etherscan pour vérifier la transaction (simulée)

🛠️ Technologies utilisées
Catégorie	Technologie
Frontend	Streamlit, Folium (cartes), HTML/CSS
Backend	Node.js, Express
Blockchain	Simulation SHA-256 (évolutif vers Web3.js)
Déploiement	Streamlit Cloud, Render
Versionnement	Git, GitHub
🔮 Évolutions possibles
Intégration réelle à Ethereum (Web3.js / ethers.js)

Authentification des utilisateurs (connexion)

Base de données persistante (PostgreSQL / MongoDB)

Notifications en temps réel

Export de rapports PDF

Application mobile (Flutter / React Native)

👥 Équipe
Développeur : ahmed SANON

📄 Licence
MIT © Baltazare-07

📞 Contact
Pour toute question relative au projet :

🐛 Issues : GitHub Issues

Dernière mise à jour : mai 2026
