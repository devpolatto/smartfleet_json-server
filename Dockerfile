FROM node:current-alpine3.17

WORKDIR /server

COPY package.json .
COPY package-lock.json .

RUN npm install

RUN npm install -g json-server

COPY db.json /server

WORKDIR /server

EXPOSE 8081

# CMD ["npm", "run", "start"]
CMD ["json-server", "-w", "-p", "8081", "db.json", "--host", "0.0.0.0"]
