require 'json'
require 'mongoid'
require 'sinatra' 

set :bind, '0.0.0.0' 

configure do 
    Mongoid.load!("./database.yml")
end 

class Environment 
    include Mongoid::Document 
    field :username, type: String 
    field :temperature, type: String 
    field :humidity, type: String
end 

get '/' do 
    'please use GET /env/:temp/:humid to write and /env/guest to get the data' 
end 

get '/env/:temp/:humid' do 
    env = Environment.create(:username => "guest", :temperature => params[:temp], :humidity => params[:humid])
end 

get '/env/:username' do 
    content_type :json 

    env = Environment.where(username: "guest") 
    env = env.to_json 
end
