FROM node:15-alpine as build

WORKDIR /build
COPY . .
RUN yarn
RUN yarn build

FROM nginx:alpine as deploy

COPY --from=0 /build/dist /usr/share/nginx/html

EXPOSE 80