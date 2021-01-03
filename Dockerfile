FROM node:12.4-alpine

RUN mkdir /app
WORKDIR /app

COPY package.json package.json
RUN npm install && mv node_modules /node_modules

COPY . .

LABEL maintainer="Yuchi Chen"

EXPOSE 8080

CMD node app.js

