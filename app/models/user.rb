class User < ActiveRecord::Base
  has_secure_password
  has_many :resultados
  validates_presence_of :name, :email, :password
end