# Build Phase
FROM node:alpine as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Run Phase
FROM nginx

EXPOSE 80

# Copy data from "builder" the first image
COPY --from=builder /app/build /usr/share/nginx/html