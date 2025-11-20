import Evolution from "evolution-api";

const server = new Evolution({
  port: process.env.PORT || 8080,
  serverOptions: {
    baseRoute: "/",
  }
});

server.start();
