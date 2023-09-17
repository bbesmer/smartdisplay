### STAGE 1: Build ###
FROM node:20-alpine3.17 AS build
WORKDIR /usr/src/app
COPY source/smartdisplay .
RUN npm install
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.25.2-alpine
#COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/smartdisplay /usr/share/nginx/html