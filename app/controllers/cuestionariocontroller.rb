class CuestionarioController < ApplicationController
  get '/newcuestionario' do
    @user = User.find(session[:id])
    erb :newcuestionario
  end

  post '/newcuestionario' do
    @user = User.find(session[:id])
    array = []
    @data = params.values.to_a
    iterator = 0
    while iterator < @data.length
      if @data[iterator] == '1'
        @verdadero = PreguntaVerdadero.new(@data[iterator + 1], @data[iterator + 2])
        array << @verdadero
      elsif @data[iterator] == '2'
        @completar = PreguntaRelleno.new(@data[iterator + 1], @data[iterator + 2])
        array << @completar
      elsif @data[iterator] == '3'
        @seleccion = PreguntaSeleccion.new(@data[iterator + 1], @data[iterator + 2], @data[iterator + 3])
        array << @seleccion
      elsif @data[iterator] == '4'
        @drop = PreguntaDrop.new(@data[iterator + 1], @data[iterator + 2])
        array << @drop
      elsif @data[iterator] == '5'
        @relation = PreguntaRelation.new(@data[iterator + 1], @data[iterator + 2], @data[iterator + 3])
        array << @relation
      end
      iterator += 1
    end
    @questionario = Questionario.new(@data[0], array)
    @cuestionario = Cuestionario.new(titulo: @data[0], descripcion: @data[1], creador: @user.name, npreguntas: array.length, notaaprobar: (array.length / 2), notamaxima: array.length, fechacre: Time.new)
    if @cuestionario.save
      $identificador = @cuestionario.id
      @questionario.write($identificador)

      redirect to '/home', flash[:notice] = 'Cuestionario creado con éxito!'
    else
      redirect to '/newcuestionario', flash[:error] = 'Error al crear el cuestionario'
    end
  end
end
