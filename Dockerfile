FROM node:18-bullseye

# Install git and build tools
RUN apt-get update && apt-get install -y git build-essential python3 && rm -rf /var/lib/apt/lists/*

# Choose tag or main
ARG EVOLUTION_TAG=v2.3.4

WORKDIR /app

# Clone repo
RUN git clone --depth 1 --branch ${EVOLUTION_TAG} https://github.com/EvolutionAPI/evolution-api.git .

# Install deps
RUN npm install --force

# Build project
RUN npm run build || true

# Set environment
ENV PORT=8080
ENV SERVER_PORT=8080

EXPOSE 8080

CMD ["npm", "start"]
