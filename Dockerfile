FROM mongo:xenial 
FROM ruby:2.3-onbuild 

RUN apt update 

RUN mkdir -pv /usr/src/api
ADD . /usr/src/api
WORKDIR /usr/src/api

CMD ["ruby", "/usr/src/api/main.rb", "-p", "4040"]

