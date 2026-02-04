FROM node:20-alpine

# W Alpine używamy 'apk' zamiast 'apt-get'
RUN apk add --no-cache curl

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

USER node

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/ || exit 1

EXPOSE 3000
CMD ["node", "app.js"]