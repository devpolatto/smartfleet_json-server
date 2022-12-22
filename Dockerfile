FROM node:alpine3.15

RUN sudo su && npm install -g json-server

RUN git clone https://github.com/devpolatto/smartfleet_json-server

RUN mkdir /server
RUN cd /smartfleet_json-server/
RUN copy smartfleet_json-server/db.json /server

WORKDIR /server

RUN json-server --watch -p 3333 db.json

EXPOSE 3333
