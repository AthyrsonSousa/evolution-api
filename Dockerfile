FROM node:18-bullseye

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm install --legacy-peer-deps

COPY . .

ENV PORT=8080

EXPOSE 8080

CMD ["npm", "start"]
