FROM ruby:2.4-onbuild 

RUN apt-get update 
RUN apt-get install -y mongodb-server 
RUN service mogodb start 

RUN mkdir -pv /usr/src/api 
ADD . /usr/src/api
WORKDIR /usr/src/api 

CMD ["ruby", "/usr/src/api/main.rb", "-p", "8000"] 
