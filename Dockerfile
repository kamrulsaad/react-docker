FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Path: /app/build
# This is the build folder that will be copied to the nginx container
# The nginx container will serve the static files from this folder

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html