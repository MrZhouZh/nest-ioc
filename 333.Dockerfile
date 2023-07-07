FROM node:14-alpine3.14

ARG aaa
ARG bbb

WORKDIR /app

COPY /test.js .

ENV aaa=${aaa} \
    bbb=${bbb}

CMD [ "node", "./test.js" ]
