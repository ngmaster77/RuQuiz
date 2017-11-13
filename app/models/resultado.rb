class Resultado < ActiveRecord::Base
  belongs_to :user
  belongs_to :cuestionario
  validates_presence_of :idcuestionario, :name, :nota
end