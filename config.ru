$:.unshift '.'
require 'config/environment'


if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

use StatsController
use CuestionarioController
run ApplicationController