ENV["SINATRA_ENV"] ||= "development"

require 'sinatra/activerecord/rake'
require_relative './config/environment'


desc "Ejecutar tests"
task :test do
  exec 'rspec test/app_test.rb'
end
# Type `rake -T` on your command line to see the available rake tasks.