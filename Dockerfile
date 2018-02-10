FROM node:9.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install yarn
RUN yarn global add @angular/cli
RUN ng set --global packageManager=yarn

COPY . /var/node
WORKDIR "/var/node"

RUN yarn
RUN ng serve --open