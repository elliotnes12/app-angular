FROM node:latest as node
WORKDIR /app
COPY ./ /app/
ARG CONFIGMAP
ENV JSON=$CONFIGMAP
RUN sed -i 's/"JSON"/'"$JSON"'/g' ./src/enviroments/enviroments.ts
RUN npm install
RUN npm run build

FROM nginxinc/nginx-unprivileged as nginx
COPY --from=node /app/dist/prueba /usr/share/nginx/html

#### don't know what this is, but cool and techy
CMD ["nginx", "-g", "daemon off;"]