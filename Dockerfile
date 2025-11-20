FROM node:18-bullseye

# Install git (needed to clone the official repo) and build tools
RUN apt-get update && apt-get install -y git build-essential && rm -rf /var/lib/apt/lists/*

# build arg to set which tag/version to clone (default: v2.3.6)
ARG EVOLUTION_TAG=main

WORKDIR /app

# Clone only the specific tag to keep the image small
RUN git clone --depth 1 --branch ${EVOLUTION_TAG} https://github.com/EvolutionAPI/evolution-api.git evolution

WORKDIR /app/evolution

# Install dependencies and build (if the project requires a build step)
RUN npm install --legacy-peer-deps
RUN npm run build || echo "no build step defined or build failed, continuing"

# Expose the port the Evolution API uses (default 8080)
EXPOSE 8080

# Use environment variable PORT or SERVER_PORT if set (Render passes through)
ENV PORT=8080
ENV SERVER_PORT=8080

# Default command: start the Evolution API (this assumes repo defines npm start)
CMD [ "npm", "start" ]
