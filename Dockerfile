FROM node:latest as node
WORKDIR /app
COPY ./ /app/
ARG MY_ARG
ENV TITLE=$MY_ARG
RUN sed -i 's/APIURL/'"$TITLE"'/g' ./src/enviroments/enviroments.ts
RUN npm install
RUN npm run build

FROM nginxinc/nginx-unprivileged as nginx
COPY --from=node /app/dist/prueba /usr/share/nginx/html

#### don't know what this is, but cool and techy
CMD ["nginx", "-g", "daemon off;"]