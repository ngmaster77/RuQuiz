class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views") }
  set :public_folder, 'public'
  use Rack::Flash
  $identificador

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  not_found do
    erb :error
  end

  get '/' do
    erb :index
  end

  get '/registro' do
    erb :registro
  end

  post '/registro' do
    @user = User.find_by(name: params["name"])
    if @user
      flash[:errorInvalidName] = "Nombre de usuario no disponible. Introduzca un nombre diferente."
      redirect to '/registro'
    else
      @user = User.new(name: params["name"], email: params["email"], password: params["password"])
      @user.instructor = params[:instructor] == 'yes' ? true : false
    end
    if @user.save
        session[:id] = @user.id
        if @user.instructor
          redirect '/home_profesor'
        else
          redirect '/home_alumno'
        end
    else
        flash[:error] = "No se ha creado el usuario correctamente."
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
        puts @user.id
        if @user.instructor
          redirect '/home_profesor'
        else
          redirect '/home_alumno'
        end
    else
        flash[:error] = "No se ha encontrado el usuario"
        redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/home_alumno' do
    @user = User.find(session[:id])
    @resultados = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("titulo,nota,notamaxima,creador,descripcion,cuestionario_id")
    erb :home_alumno
  end

  get '/home_profesor' do
    @user = User.find(session[:id])
    erb :home_profesor
  end

  get '/search' do
    @user = User.find(session[:id])
    if params
      @searches = Cuestionario.where(cuestionarios: {titulo: params["quiz"]})
    end
    erb :search
  end

  get '/stats' do
    @user = User.find(session[:id])
    @resultados = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("titulo,nota,notamaxima")
    erb :stats
  end
end
