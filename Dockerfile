FROM spittet/ruby-mongodb

RUN mkdir -pv /usr/src/api
ADD . /usr/src/api
WORKDIR /usr/src/api

CMD ["ruby", "/usr/src/api/main.rb", "-p", "4040"]

