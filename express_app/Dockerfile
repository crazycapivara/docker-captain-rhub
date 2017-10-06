FROM node:alpine

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

ADD ./app /app

WORKDIR /app

RUN npm install express passport passport-http

EXPOSE 3000

#ENTRYPOINT ["node"]
CMD ["node", "index.js"]

