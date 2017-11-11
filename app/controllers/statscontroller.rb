class StatsController < ApplicationController
  
  
  get '/cuestionario/:id' do
    var = params['id']
    $identificador = var
    output = `ls app/views/cuestionarios`
    @cuestionario = Cuestionario.find_by(idcuestionario: params['id'])
  

    if output == "#{var}.html"
      puts "Ya estaba creado..."
    else
      system "ruql ./var/#{var}.rb HtmlForm -t ./public/templates/htmlform.html.erb > ./app/views/cuestionarios/#{var}.html"
    end
    send_file "./app/views/cuestionarios/#{var}.html"
  end
  
  post '/resultado' do
    @user = User.find(session[:id])
    var = params.keys[0]
    resultado = var[18..21].to_f
    @resultado = Resultado.create(idcuestionario: $identificador, name:@user.name, nota:resultado)
    
  end
  
  
end