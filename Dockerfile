FROM node:lts-alpine

RUN yarn install http-server
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn build
EXPOSE 8080
CMD [ "http-server", "dist" ]