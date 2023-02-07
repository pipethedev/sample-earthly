# Begin Earthfile
VERSION 0.6

# used node alpine because it's lighter
FROM node:16-alpine

WORKDIR /app 

deps:
  COPY package.json yarn.lock .env ./ 
  COPY src src
  RUN yarn install --production --forzen-lockfile && yarn cache clean && apt-get update && apt install -y nano ncdu

test:
  FROM +deps
  RUN yarn test # NOTE: these tests run but they do fail as expected based on how they're written. 

docker:
  FROM +deps

  EXPOSE 3000

  ENTRYPOINT ["node", "src/app.js"]

  SAVE IMAGE --push pipethedev/earthly-example
# End Earthfile