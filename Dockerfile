FROM node:latest as node
WORKDIR /app
COPY ./ /app/
ARG MY_ARG
ENV TITLE=$MY_ARG
RUN jq -c '.' ./src/environments/environment.ts | sed -e 's/\//\\\//g' -e 's/$/\\/g' | tr -d '\n' | sed -e "s/APIURL/$TITLE/" > ./src/environments/environment.ts
RUN npm install
RUN npm run build

FROM nginxinc/nginx-unprivileged as nginx
COPY --from=node /app/dist/prueba /usr/share/nginx/html

#### don't know what this is, but cool and techy
CMD ["nginx", "-g", "daemon off;"]