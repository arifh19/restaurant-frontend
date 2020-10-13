FROM node:lts-alpine

RUN yarn global add http-server
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
ENV VUE_APP_URL $VUE_APP_URL
ENV VUE_APP_STATIC_URL $VUE_APP_STATIC_URL
RUN yarn build
EXPOSE 8080
CMD [ "http-server", "dist" ]