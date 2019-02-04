FROM drecom/ubuntu-ruby:latest

RUN apt update 
RUN apt install -y mongodb-server 

RUN service mongodb start

RUN mkdir -pv /usr/src/api 
ADD . /usr/src/api
WORKDIR /usr/src/api 

CMD ["ruby", "/usr/src/api/main.rb", "-p", "8000"] 
