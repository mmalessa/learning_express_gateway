ARG BASE_IMAGE
FROM ${BASE_IMAGE} AS base

RUN npm install -g npm@9.8.1 \
    npm install -g express-gateway

WORKDIR /app

FROM base AS dev

RUN apt-get update && apt-get install -y vim git curl inetutils-ping

USER node
