class CuestionarioController < ApplicationController

  get '/newcuestionario' do
    @user = User.find(session[:id])
    erb :newcuestionario
  end

  post '/newcuestionario' do
    array = []
    @data = params.values.to_a
    iterator = 0
    while iterator < @data.length 
         if @data[iterator] == '1'
           @verdadero = PreguntaVerdadero.new(@data[iterator+1],@data[iterator+2])
           array << @verdadero
         elsif  @data[iterator] == '2'
           @completar = PreguntaRelleno.new(@data[iterator+1],@data[iterator+2])
           array << @completar
         elsif @data[iterator] == '3'
           @seleccion = PreguntaSeleccion.new(@data[iterator+1],@data[iterator+2])
           array << @seleccion
         end
         iterator += 1 
    end
    @questionario = Questionario.new(@data[0], array)
    @questionario.write
    @cuestionario = Cuestionario.new(titulo:@data[0],idcuestionario: @questionario.identificador,npreguntas: array.length, notaaprobar: ((array.length)/2), notamaxima: array.length)
    if @cuestionario.save 
          flash[:error] = "Creado con éxito!"
          redirect to '/home_profesor'
    else
          flash[:error] = "Error al crear el cuestionario"
          redirect to '/newcuestionario'
    end
  end
  
  
  get '/showcuestionarios' do
    @cuestionarios = Cuestionario.all
    erb :showcuestionarios
    
  end
  
  get '/cuestionario/:id' do
    var = params['id']
    @cuestionario = Cuestionario.find_by(idcuestionario: params['id'])
    exec "ruql ./var/#{var}.rb HtmlForm -t ./public/templates/htmlform.html.erb > ./app/views/cuestionarios/#{var}.html.erb"
    erb :"#{var}.html"
  end
  
end