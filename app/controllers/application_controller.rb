class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Contrib
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
        redirect '/home'
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
        redirect '/home'
    else
        flash[:error] = "No se ha encontrado el usuario"
        redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/home' do
    @user = User.find(session[:id])
    if !@user.instructor
      @resultados = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("titulo,nota,notamaxima,creador,descripcion,cuestionario_id,fechacre,fechares,notaaprobar").group("cuestionario_id").having("max(nota is not null)")
      @resultados.each do |resultado|
        resultado.fechacre = TimeDifference.between(resultado.fechacre, Time.now).humanize
        resultado.fechares = TimeDifference.between(resultado.fechares, Time.now).humanize
      end
    else
      @resultados = Cuestionario.where(creador: @user.name)
      @resultados.each do |resultado|
        resultado.fechacre = TimeDifference.between(resultado.fechacre, Time.now).humanize
      end
    end
    erb :home
  end

  get '/search' do
    @user = User.find(session[:id])
    if params
      if params["quiz"]
        aux = "%#{params["quiz"]}%"
        @searches = Cuestionario.where("titulo LIKE ?", aux)
      elsif params["show"]
        @searches = Cuestionario.all
      end
    end
    erb :search
  end

  get '/stats' do
    @user = User.find(session[:id])
    @cuestionarios = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("titulo,nota,notamaxima,creador,descripcion,cuestionario_id,fechacre,fechares,notaaprobar").group("cuestionario_id").having("max(nota is not null)")
    @aprobados = Resultado.joins(:user,:cuestionario).where("nota >= notaaprobar", resultados: {user_id: @user.id}).count(:cuestionario_id)
    @nota_media = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("nota, notamaxima")
    @show_media = Array.new
    @nota_media.each do |nota|
      aux = (nota.nota * 100) / nota.notamaxima
      @show_media << aux
    end
    @show_media = @show_media.reduce(:+) / @show_media.size.to_f
    @data = {'prueba' => :user}
    erb :stats
  end
end
