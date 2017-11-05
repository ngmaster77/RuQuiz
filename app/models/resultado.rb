class Resultado < ActiveRecord::Base
  has_one :users 
  has_one :cuestionarios
  belongs_to :name: "User"
  validates_presence_of :idcuestionario, :name, :nota
end