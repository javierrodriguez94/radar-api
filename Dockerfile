FROM ruby:2.5
MAINTAINER Javier Rodríguez <javier.ri94@outlook.com>

RUN apt-get update && apt-get install -y \ 
  build-essential \
  nodejs

RUN mkdir /radar-api 

WORKDIR /radar-api

COPY . /radar-api
RUN bundle install

CMD puma -e production -p 8888
