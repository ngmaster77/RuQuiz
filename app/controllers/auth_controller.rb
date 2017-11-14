Dotenv.load
class ExternalAuthController < ApplicationController
  use OmniAuth::Builder do
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  end

  #   get '/remove' do
  #     #User.delete(name: 'alu0100816167')
  #     p "El numero de usuarios antes de borrar es "
  #     n1 = User.all.count
  #     puts n1
  #
  #     User.find_by(:name => 'alu0100816167').delete
  #
  #     p 'El numero de usuarios despues de borrar es '
  #     n2 = User.all.count
  #     puts n2
  #     #User.find(name: 'alu0100816167').destroy
  #   end

  get '/auth/github/callback' do
    auth = env['omniauth.auth']
    @user = User.find_by(name: auth.info.nickname)
    if @user
      redirect to '/home_alumno'
    else
      puts 'ENTRE A CREAR'
      @user = User.new(name: auth.info.nickname, email: auth.info.email || auth.info.nickname, password: auth.uid)
      @user.instructor = false
    end
    if @user.save
      session[:id] = @user.id
      redirect '/home_alumno'
    else
      flash[:error] = 'Error al crear el usuario mediante OAuth'
      redirect to '/registro'
    end
  end
end
