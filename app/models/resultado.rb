class Resultado < ActiveRecord::Base
  has_one :users 
  #has_one :cuestionarios
  belongs_to :users
  validates_presence_of :idcuestionario, :name, :nota
end