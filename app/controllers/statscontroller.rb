class StatsController < ApplicationController
  
  
  get '/cuestionario/:id' do
    $identificador = params['id']
    output = `ls app/views/cuestionarios`
    @cuestionario = Cuestionario.find($identificador)
  

    if output == "#{$identificador}.html"
      puts "Ya estaba creado..."
    else
      system "ruql ./var/#{$identificador}.rb HtmlForm -t ./public/templates/htmlform.html.erb > ./app/views/cuestionarios/#{$identificador}.html"
    end
    send_file "./app/views/cuestionarios/#{$identificador}.html"
  end
  
  post '/resultado' do
    @user = User.find(session[:id])
    var = params.keys[0]
    resultado = var[18..21].to_f
    @resultado = Resultado.new(user_id:session[:id],cuestionario_id: $identificador, name:@user.name, nota:resultado)
    if @resultado.save
      puts "Resultado guardado con exito"
    else
      puts "Error al guardar resultado"
    end
  end
end