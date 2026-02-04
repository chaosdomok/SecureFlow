FROM node:20-alpine

RUN npm install -g npm@latest

RUN apk add --no-cache curl

WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .

USER node

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/ || exit 1

EXPOSE 3000
CMD ["node", "app.js"]