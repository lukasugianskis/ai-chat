FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl nodejs npm

RUN curl https://ollama.ai/install.sh | sh

RUN ollama pull mistral &

RUN npm install -g pm2

WORKDIR /app
COPY . .

EXPOSE 3000 11434

CMD ollama serve & sleep 5 && npm start