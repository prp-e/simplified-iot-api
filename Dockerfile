FROM haghiri75/sinatra-mongo 

RUN apt update 

RUN mkdir -pv /usr/src/app 

ADD . /usr/src/app 
WORKDIR /usr/src/app 

RUN bundle install 


CMD ["ruby", "/usr/src/app/main.rb", "-p", "4040"]