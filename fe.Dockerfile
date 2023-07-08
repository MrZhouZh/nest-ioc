FROM node:14-alpine3.14 as build-stage

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

# production stage
FROM nginx:stable-perl as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html

COPY --from=build-stage /app/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# refs: [nginx daemon on/off 选项有什么区别?](https://devpress.csdn.net/cloud/6304be57c67703293080dc94.html)
CMD [ "nginx", "-g", "daemon off;" ]

