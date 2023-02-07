# ==
# Serve
FROM node:16me-alpine as serve

WORKDIR /app

ARG ENVIRONMENT
ENV ENVIRONMENT=$ENVIRONMENT

COPY package.json .
COPY yarn.lock .
COPY .env .
COPY src src

RUN yarn install --production --frozen-lockfile && \
      yarn cache clean && \
      apt-get update && apt install -y nano ncdu

# Expose server port
EXPOSE 3000

ENTRYPOINT ["node", "src/app.js"]
