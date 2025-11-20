# Evolution API — Render Docker starter (wrapper repo)

Este repositório é um **starter** pronto para subir no GitHub e fazer deploy no **Render** usando **Docker**.
Em vez de publicar o código do Evolution API aqui, a imagem Docker **clona** o repositório oficial do Evolution API
(tag padrão `v2.3.6`) durante o build e o executa — isso mantém este repositório leve e facilita atualizar a versão.

## O que está neste repositório
- `Dockerfile` — clona o repositório oficial `EvolutionAPI/evolution-api` e roda `npm install` + `npm start`.
- `.env.example` — variáveis de ambiente necessárias para rodar localmente / no Render.
- `docker-compose.yml` — para testes locais (usa a imagem construída localmente).
- `.gitignore`

## Como usar

### 1) Clone este starter localmente
```bash
git clone https://github.com/SEU_USUARIO/evolution-api-render-starter.git
cd evolution-api-render-starter
```

### 2) Ajuste `.env.example` → `.env` com as suas credenciais (Postgres, Redis etc.)

### 3) Testar localmente com Docker (opcional)
```bash
docker build -t evolution-api-starter .
docker run -p 8080:8080 --env-file .env evolution-api-starter
```

### 4) Subir para o GitHub
- Crie um repositório no GitHub
- `git remote add origin https://github.com/SEU_USUARIO/SEU_REPO.git`
- `git push -u origin main`

### 5) Deploy no Render
- Em Render: **New → Web Service**
- Escolha o repositório que você criou
- Runtime: **Docker**
- Build command / Start command: deixe em branco (o Dockerfile faz tudo)
- Em Environment → adicione as variáveis do `.env`
- Se quiser usar outra versão do Evolution API, adicione `EVOLUTION_TAG` como Build Arg no Render (ou altere no Dockerfile)

## Observações importantes
- Este starter **clona** o repo oficial do Evolution API durante o build. O projeto oficial e a documentação estão aqui:
  - Repositório oficial: https://github.com/EvolutionAPI/evolution-api
  - Documentação oficial: https://doc.evolution-api.com/
- Versão padrão usada no build: **v2.3.6** (pode ser alterada com `EVOLUTION_TAG`).
- Se preferir, você pode incorporar todo o código do Evolution API neste repositório em vez de cloná-lo — mas cada atualização exigirá merge manual.

## Links úteis
- Repositório oficial: https://github.com/EvolutionAPI/evolution-api
- Documentação: https://doc.evolution-api.com/

