FROM ubuntu:18.04

RUN apt update 
RUN apt install -y mongodb-server ruby2.5 

RUN service mongodb start
RUN apt install -y  bundler

RUN mkdir -pv /usr/src/api 
ADD . /usr/src/api
WORKDIR /usr/src/api 

RUN bundle install 

CMD ["ruby2.5", "/usr/src/api/main.rb", "-p", "8000"] 
