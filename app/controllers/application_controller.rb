require 'sinatra'
require 'sinatra/activerecord'

class ApplicationController < Sinatra::Base
  
  set :views, Proc.new { File.join(root, "../views/") }
  set :database, "sqlite3:sytwdb.sqlite3"
  
  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do 
    erb :home
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/registrations' do
   redirect '/'
 end

end


  
