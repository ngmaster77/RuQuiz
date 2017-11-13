Dotenv.load
class ExternalAuthController < ApplicationController
  use OmniAuth::Builder do
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  end

  get '/test' do
    erb :show
  end

  get '/auth/github/callback' do
    auth = env['omniauth.auth']
    puts 'DATOS!!!!!!!!!!!!!'

    # puts env['omniauth.auth'].name
    puts "EL PROVIDER ES #{auth.provider}"
    puts "EL UID ES #{auth.uid}"
    puts "EL NOMBRE ES #{auth.info.name}"
  end
end
