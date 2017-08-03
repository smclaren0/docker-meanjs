FROM ubuntu:latest
MAINTAINER Stephanie McLaren

EXPOSE 80 443 3000 35729 8080

ENV NODE_ENV development

RUN apt-get update -q \
    && apt-get install -yqq \
    curl \
    git \
    ssh \
    gcc \
    make \
    build-essential \
    libkrb5-dev \
    sudo \
    apt-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -yq nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install --global nodemon @angular/cli

RUN mkdir -p /opt/mean.js/public/lib
WORKDIR /opt/mean.js

ADD /scripts/start.sh /scripts/start.sh
RUN chmod +x /scripts/start.sh

CMD nodemon