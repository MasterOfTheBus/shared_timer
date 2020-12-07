FROM node:12 as build
WORKDIR /shared_timer
COPY package* ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

FROM nginx:alpine
COPY --from=build /shared_timer/build /usr/share/nginx/html