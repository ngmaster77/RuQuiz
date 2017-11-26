ENV["SINATRA_ENV"] ||= "development"

require 'sinatra/activerecord/rake'
require_relative './config/environment'


desc "acceptance"
task :acceptance do
  exec 'rspec test/acceptance/app_test.rb'
end

desc "models"
task :models do
  exec 'ruby test/models/user_test.rb'
end
# Type `rake -T` on your command line to see the available rake tasks.