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

    if !@user.instructor
      @cuestionarios = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("titulo,nota,notamaxima,creador,descripcion,cuestionario_id,fechacre,fechares,notaaprobar").group("cuestionario_id").having("max(nota is not null)")
      
      @aprobados = Resultado.joins(:user,:cuestionario).where("nota >= notaaprobar", resultados: {user_id: @user.id}).count(:cuestionario_id)
      @totales = Resultado.joins(:user,:cuestionario).where( resultados: {user_id: @user.id}).count(:cuestionario_id)
      @suspendidos = @totales - @aprobados
    
      @nota_media = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("nota, notamaxima")
      @show_media = Array.new
      @nota_media.each do |nota|
        aux = (nota.nota * 100) / nota.notamaxima
        @show_media << aux
      end
      
      @show_media = (@show_media.reduce(:+) / @show_media.size.to_f).round(2)
      @last_10 = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("nota,fechares,notamaxima").limit(10)
      @area_chart = Hash.new
      @last_10.each do |nota|
        aux = (nota.nota * 100) / nota.notamaxima
        @area_chart[nota.fechares] = aux
      end
      
      @resultados_cuestionario = Resultado.joins(:user,:cuestionario).where(resultados: {user_id: @user.id}).select("titulo, cuestionario_id").group("titulo")
      @column_chart = Hash.new
      @resultados_cuestionario.each do |quiz|
        @aux = Resultado.joins(:user,:cuestionario).where(cuestionario_id: quiz.cuestionario_id, resultados: {user_id: @user.id}).count()
        @column_chart[quiz.titulo] = @aux
      end
    
      @quiz_array = Array.new
      x = 1
      @cuestionarios.each do |quiz|
        x += 1
        @totales_ind = Resultado.joins(:user,:cuestionario).where(cuestionario_id: quiz.cuestionario_id, resultados: {user_id: @user.id}).count()
        @totales2 = Resultado.joins(:user,:cuestionario).where(cuestionario_id: quiz.cuestionario_id, resultados: {user_id: @user.id}).select("nota,notamaxima,notaaprobar")
        @aprobados_ind = 0
        @array_aux = Array.new
        @totales2.each do |quiznota|
          if(quiznota.nota >= quiznota.notaaprobar)
            @aprobados_ind += 1
          end
          aux = (quiznota.nota * 100) / quiznota.notamaxima
          @array_aux << aux
        end
        @nota_ind = (@array_aux.reduce(:+) / @array_aux.size.to_f).round(2)
        @suspendidos_ind = @totales_ind - @aprobados_ind
        @quiz_hash = Hash.new
        @quiz_hash["titulo"] = quiz.titulo
        @quiz_hash["id"] = quiz.cuestionario_id
        @quiz_hash["n_resuelto"] = @totales_ind
        @quiz_hash["n_aprobado"] = @aprobados_ind
        @quiz_hash["n_suspensos"] = @suspendidos_ind
        @quiz_hash["n_media"] = @nota_ind
        

        @last_10_ind = Resultado.joins(:user,:cuestionario).where(cuestionario_id: quiz.cuestionario_id, resultados: {user_id: @user.id}).select("nota,fechares,notamaxima").limit(10)
        @area_chart_ind = Hash.new
        @last_10_ind.each do |nota|
          aux = (nota.nota * 100) / nota.notamaxima
          @area_chart_ind[nota.fechares] = aux
        end

        @quiz_hash["line_chart"] = @area_chart_ind
        @quiz_array << @quiz_hash

      end
    else
      @profesor_stats = Array.new
      
      #General
      @profesor_general = Hash.new
      
      @cuest_profesor = Cuestionario.where(creador: @user.name)
      @profesor_general["creados"] = @cuest_profesor.length

      @datos_profesor = Resultado.joins(:user,:cuestionario).where(cuestionarios: {creador: @user.name}).select("nota,notaaprobar,notamaxima,fechares")
      @profesor_general["totales"] = @datos_profesor.length

      aux = 0
      notamedia = 0
      @datos_profesor.each do |cuest|
        notamedia += (cuest.nota * 100) / cuest.notamaxima
        if cuest.nota >= cuest.notaaprobar
          aux += 1
        end
      end
      @profesor_general["aprobados"] = aux
      @profesor_general["suspendidos"] = @profesor_general["totales"] - @profesor_general["aprobados"]
      @profesor_general["%aprobados"] = (@profesor_general["aprobados"].to_f * 100 / @profesor_general["totales"].to_f).round(2)
      @profesor_general["notamedia"] = (notamedia / @datos_profesor.length).round(2)

      @last_10_prof = Resultado.joins(:user,:cuestionario).where(cuestionarios: {creador: @user.name}).select("nota,fechares,notamaxima").limit(10)
      @area_chart_prof = Hash.new
      @last_10_prof.each do |nota|
        aux = (nota.nota * 100) / nota.notamaxima
        @area_chart_prof[nota.fechares] = aux
      end
      @profesor_general["line_chart"] = @area_chart_prof

      @profesor_stats << @profesor_general

      #Individual
      @cuest_profesor.each do |cuestionario|
        @profesor_ind = Hash.new
        @totales_ind = Resultado.joins(:user,:cuestionario).where(cuestionario_id: cuestionario.id, cuestionarios: {creador: @user.name}).select("titulo,nota,notamaxima,notaaprobar")

        if @totales_ind.length != 0
          aux = 0
          notamedia = 0
          @totales_ind.each do |cuest|
            notamedia += (cuest.nota * 100) / cuest.notamaxima
            if cuest.nota >= cuest.notaaprobar
              aux += 1
            end
          end      
          @profesor_ind["id"] = cuestionario.id
          @profesor_ind["titulo"] = cuestionario.titulo
          @profesor_ind["n_resuelto"] = @totales_ind.length
          @profesor_ind["n_media"] = (notamedia / @profesor_ind["n_resuelto"]).round(2)
          @profesor_ind["n_aprobados"] = aux
          @profesor_ind["n_suspensos"] = @profesor_ind["n_resuelto"] - @profesor_ind["n_aprobados"]

          @last_10_prof_ind = Resultado.joins(:user,:cuestionario).where(cuestionario_id: cuestionario.id, cuestionarios: {creador: @user.name}).select("nota,fechares,notamaxima").limit(10)
          @area_chart_prof_ind = Hash.new
          @last_10_prof_ind.each do |nota|
            aux = (nota.nota * 100) / nota.notamaxima
            @area_chart_prof_ind[nota.fechares] = aux
          end
          @profesor_ind["line_chart"] = @area_chart_prof_ind
        else
          @profesor_ind["id"] = cuestionario.id
          @profesor_ind["titulo"] = cuestionario.titulo
          @profesor_ind["n_resuelto"] = 0
          @profesor_ind["n_media"] = 0
          @profesor_ind["line_chart"] = 0
          @profesor_ind["n_aprobados"] = 0
          @profesor_ind["n_suspensos"] = 0
        end

        @profesor_stats << @profesor_ind

      end

      

    end

    erb :stats
  end
end
