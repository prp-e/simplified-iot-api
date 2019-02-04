FROM mongo:4.0.5-xenial 

RUN apt update 
RUN apt install -y mongodb-server ruby

RUN apt install -y  bundler

RUN mkdir -pv /usr/src/api 
ADD . /usr/src/api
WORKDIR /usr/src/api 

RUN bundle install 

CMD ["chmod", "+x", "service.sh"] 
CMD ["exec", "service.sh"]
CMD ["ruby", "/usr/src/api/main.rb", "-p", "8000"] 
