FROM node:9.5.0

RUN apt-get update
RUN apt-get install apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update 
RUN apt-get install yarn
RUN yarn global add @angular/cli
RUN ng set --global packageManager=yarn

COPY . /var/node
WORKDIR "/var/node/Angular"

RUN yarn
WORKDIR "/var/node/Angular"

EXPOSE 4200
CMD [ "yarn", "start" ]
