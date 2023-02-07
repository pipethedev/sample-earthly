# ==
# Serve
FROM node:16-alpine as serve

WORKDIR /app

ARG ENVIRONMENT

ENV ENVIRONMENT=$ENVIRONMENT

COPY package.json .

COPY yarn.lock .

COPY .env .

COPY src src

# Only install necessary dependencies.
RUN yarn install --production --frozen-lockfile && \
      yarn cache clean

# Expose server port
EXPOSE 3000

ENTRYPOINT ["node", "src/app.js"]
