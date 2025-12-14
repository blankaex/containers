FROM node:20 AS build

WORKDIR /app

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/blankaex/akochandaaaaaa.git .

RUN npm install
RUN npm run build


FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html
