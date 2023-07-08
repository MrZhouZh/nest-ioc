FROM node:14-alpine3.14 as build-stage

WORKDIR /app

COPY . /app

EXPOSE 8080

RUN npm install && npm run build

# production stage
FROM node:14-alpine3.14

WORKDIR /app

COPY --from=build-stage /app/dist ./dist

RUN npm i -g http-server

CMD http-server ./dist

