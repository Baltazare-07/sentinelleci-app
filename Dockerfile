FROM python:3.9-slim

# Installer Node.js ET Nginx
RUN apt-get update && apt-get install -y curl nginx
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

COPY frontend/requirements.txt /app/frontend/requirements.txt
RUN pip install --no-cache-dir -r /app/frontend/requirements.txt

COPY backend/ ./backend/
COPY frontend/ ./frontend/
COPY start.sh .
COPY nginx.conf /etc/nginx/sites-enabled/default

WORKDIR /app/backend
RUN npm install

WORKDIR /app
RUN chmod +x start.sh

EXPOSE 80

CMD ["./start.sh"]
