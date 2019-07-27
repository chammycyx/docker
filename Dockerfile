FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm i
COPY . .
CMD npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/shre/nginx/html

