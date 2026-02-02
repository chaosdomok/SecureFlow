FROM node:20-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

USER node

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/ || exit 1

EXPOSE 3000
CMD ["node", "app.js"]