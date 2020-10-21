FROM node:alpine

#any folowinf command will be executed relative to workdir
WORKDIR /usr/app

#splitting this into two copy commands minimize cache  busting and rebuilds
COPY ./simpleweb/package.json ./



RUN npm install
COPY ./simpleweb/ ./

CMD ["npm", "start"]
