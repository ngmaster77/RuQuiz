class User < ActiveRecord::Base
  has_secure_password
  has_many :resultados
  has_one :estadisticas 
  validates_presence_of :name, :email, :password
end