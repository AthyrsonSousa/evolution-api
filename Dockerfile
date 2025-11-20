FROM evolutionapi/evolution-api:latest

ENV PORT=8080
ENV SERVER_PORT=8080

EXPOSE 8080

CMD ["npm", "start"]
