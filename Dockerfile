FROM node:14-alpine3.14

WORKDIR /app

COPY package.json .

COPY *.lock .

RUN npm config set registry https://registry.npmmirror.com/

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

ENTRYPOINT [ "node", "./dist/main.js" ]
