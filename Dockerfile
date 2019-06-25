FROM node:alpine as builder

WORKDIR /app

COPY ./package.json ./

RUN npm install

COPY . .

RUN npm run build



FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#default command of nginx image is running nginx so no need to specify