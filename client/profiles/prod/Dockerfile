FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build
#/app/build result of npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
# nginx already contains the start command no need to add it