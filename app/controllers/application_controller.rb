class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do 
    erb :index
  end

  get '/registro' do
    erb :registro
  end

  post '/registro' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.instructor = params[:instructor] == 'yes' ? true : false 
    if @user.instructor
        puts "Hola profesor!"
    else
        puts "Hola alumno!"
    end
    if @user.save
        session[:id] = @user.id
        redirect '/home'
    else
        redirect to '/registro'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(name: params["name"])
    if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        redirect '/home'
    else 
        redirect '/login'
    end
  end

  get '/logout' do 
    session.clear
    redirect '/'
  end

  get '/home' do
    @user = User.find(session[:id])
    erb :home
  end

end
